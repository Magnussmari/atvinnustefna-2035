# MCP Server Spec — Atvinnustefna Íslands 2035

**`is.smarason/atvinnustefna-2035`**

**Version:** 1.0.0
**MCP Spec:** 2025-11-25
**Transport:** Streamable HTTP (cloud) + stdio (local)
**Author:** Magnus Smari Smarason · smarason.is
**Date:** April 2026

---

## What This Is

An MCP server that exposes the full Atvinnustefna Íslands 2035 research corpus — 830,000 words of verified policy analysis, 150,346 rows of Hagstofa labor market data, 94 structured stakeholder consultation responses, 98 bibliography entries, and the complete policy proposals of the Lausnakafli — as a queryable knowledge base for any MCP-compatible agent.

Any agent that connects gets:
- The 5 verified empirical findings with evidence chains and falsification conditions
- Direct access to Iceland's labor market data (employment, vacancies, wages, productivity)
- The full consultation record (94 responses, structured metadata)
- The policy framework (automation levy, accountability mandate, offensive strategy)
- Nordic comparative benchmarks
- Icelandic/English bilingual glossary of policy terms

**Use case:** Research agents, policy analysts, journalists, parliamentarians, union researchers, and academic agents who need rigorous, verified, queryable access to this analysis.

---

## Server Identity

```json
{
  "serverInfo": {
    "name": "atvinnustefna-2035",
    "namespace": "is.smarason/atvinnustefna-2035",
    "version": "1.0.0",
    "description": "Verified AI-labor research corpus for Iceland's Employment Strategy 2035 — 5 empirical findings, 150k rows Hagstofa data, 94 stakeholder responses, policy framework",
    "homepage": "https://github.com/Magnussmari/atvinnustefna-2035",
    "contact": "magnus@smarason.is"
  }
}
```

**Server Card** (`.well-known/mcp/server-card.json`):

```json
{
  "schema_version": "1.0",
  "name": "Atvinnustefna Íslands 2035",
  "namespace": "is.smarason/atvinnustefna-2035",
  "version": "1.0.0",
  "description": "Verified policy research corpus: Iceland AI-labor analysis, 5 findings, 150k rows, 94 stakeholder responses",
  "capabilities": ["tools", "resources", "prompts"],
  "transport": "streamable-http",
  "endpoint": "https://mcp.smarason.is/atvinnustefna",
  "auth": "api-key",
  "language": ["is", "en"],
  "tags": ["iceland", "ai-governance", "labor-policy", "research", "nordic"],
  "license": "CC-BY-4.0"
}
```

---

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                  MCP Client (agent)                      │
│   Claude / GPT / Gemini / Custom                         │
└────────────────────┬────────────────────────────────────┘
                     │ Streamable HTTP POST /mcp
                     │ Authorization: Bearer <api-key>
┌────────────────────▼────────────────────────────────────┐
│                MCP Server (this spec)                    │
│                                                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐              │
│  │  Tools   │  │Resources │  │ Prompts  │              │
│  │ (10 ops) │  │ (8 URIs) │  │  (5)     │              │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘              │
│       │              │              │                    │
│  ┌────▼──────────────▼──────────────▼─────┐             │
│  │           Data Layer                    │             │
│  │  ┌──────────────┐ ┌───────────────┐    │             │
│  │  │ Markdown     │ │ CSV / JSON    │    │             │
│  │  │ corpus       │ │ (Hagstofa     │    │             │
│  │  │ (830k words) │ │  150k rows)   │    │             │
│  │  └──────────────┘ └───────────────┘    │             │
│  │  ┌──────────────┐ ┌───────────────┐    │             │
│  │  │ Vector index │ │ BibTeX store  │    │             │
│  │  │ (semantic    │ │ (98 entries)  │    │             │
│  │  │  search)     │ └───────────────┘    │             │
│  │  └──────────────┘                      │             │
│  └────────────────────────────────────────┘             │
└─────────────────────────────────────────────────────────┘
```

---

## Transport

### Cloud (primary): Streamable HTTP

```
POST https://mcp.smarason.is/atvinnustefna
Content-Type: application/json
Authorization: Bearer <api-key>

→ 200 OK
   Content-Type: text/event-stream
   (SSE stream of JSON-RPC responses)
```

### Local (dev/offline): stdio

```bash
npx atvinnustefna-mcp --stdio --data-path ./
```

### Connection (Claude Desktop `claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "atvinnustefna": {
      "type": "streamable-http",
      "url": "https://mcp.smarason.is/atvinnustefna",
      "headers": {
        "Authorization": "Bearer YOUR_API_KEY"
      }
    }
  }
}
```

---

## Authentication

**Production:** API key via `Authorization: Bearer` header.
**Enterprise:** OAuth 2.1 with PKCE (Client ID Metadata Document at `/.well-known/oauth-client`).

API keys issued at `https://mcp.smarason.is/keys` — free tier available for researchers.

---

## Tools

All tools are model-controlled. Input schemas use Zod (Standard Schema compatible).

---

### `search_corpus`

Full-text hybrid search (keyword + semantic vector) across all 830,000 words of research documentation.

```typescript
{
  name: "search_corpus",
  description: "Search the full Atvinnustefna research corpus. Returns ranked results with source, excerpt, and confidence. Covers MEGA_REPORT, evidence files, lausnakafli policy proposals, verification reports, and Panopticon investigation. Bilingual IS/EN.",
  inputSchema: z.object({
    query: z.string().describe("Natural language query in Icelandic or English"),
    scope: z.enum([
      "all",
      "mega_report",
      "lausnakafli",
      "evidence",
      "verification",
      "panopticon"
    ]).default("all").describe("Limit search to a specific document set"),
    top_k: z.number().int().min(1).max(20).default(5),
    language: z.enum(["is", "en", "both"]).default("both")
  }),
  outputSchema: z.object({
    results: z.array(z.object({
      source: z.string(),
      section: z.string(),
      excerpt: z.string(),
      relevance_score: z.number(),
      language: z.enum(["is", "en"])
    })),
    total_matches: z.number(),
    query_interpreted_as: z.string()
  })
}
```

**Example call:**
```json
{
  "name": "search_corpus",
  "arguments": {
    "query": "ICT sector employment decline 2022",
    "scope": "mega_report",
    "top_k": 3
  }
}
```

---

### `query_labor_data`

Query Iceland's Hagstofa (Statistics Iceland) labor market data. 150,346 rows across 10 tables.

```typescript
{
  name: "query_labor_data",
  description: "Query Iceland's official labor market data (Hagstofa Íslands). Returns timeseries, comparisons, or point-in-time values. Available: employment by occupation (ISCO), employment by sector (NACE), ICT structural stats (J62), productivity, unemployment, vacancies, wages, VAT turnover, and monthly register.",
  inputSchema: z.object({
    table: z.enum([
      "employment_occupation",   // VIN01100: by ISCO 1991-2025
      "employment_sector",       // VIN01110: by NACE monthly
      "ict_structural",          // J62: ICT sector deep dive
      "productivity",            // THJ11011: labour productivity
      "unemployment",            // VIN00920: quarterly, by age/gender
      "vacancies",               // JVS00001: by NACE quarterly
      "wages",                   // LAU04109: by sector × occupation
      "vat_turnover",            // FYR04101: monthly business turnover
      "register_employment"      // FYR08001: monthly register detail
    ]),
    filters: z.object({
      year_from: z.number().int().optional(),
      year_to: z.number().int().optional(),
      nace_code: z.string().optional().describe("e.g. 'J' for ICT, 'I' for hospitality"),
      isco_group: z.enum(["1", "2", "3", "4", "5", "6", "7", "8", "9"]).optional(),
      gender: z.enum(["male", "female", "all"]).default("all"),
      metric: z.string().optional().describe("Specific metric name within the table")
    }).optional(),
    format: z.enum(["timeseries", "summary", "raw"]).default("summary"),
    compare_to: z.string().optional().describe("Another sector/period to compare against")
  }),
  outputSchema: z.object({
    table: z.string(),
    query_description: z.string(),
    data: z.array(z.record(z.unknown())),
    key_finding: z.string().describe("One-sentence interpretation of the result"),
    source: z.literal("Hagstofa Íslands / PxWeb API"),
    last_updated: z.string()
  })
}
```

**Example — reproduce the ICT Trifecta:**
```json
{
  "name": "query_labor_data",
  "arguments": {
    "table": "ict_structural",
    "filters": { "year_from": 2022, "year_to": 2025 },
    "format": "timeseries",
    "compare_to": "revenue"
  }
}
```

---

### `get_finding`

Get a specific empirical finding with full evidence chain, evidence level, and falsification conditions.

```typescript
{
  name: "get_finding",
  description: "Retrieve one of the 5 verified empirical findings from the research. Returns the claim, evidence chain, evidence level (VERIFIED / STRONG PATTERN / PLAUSIBLE SIGNAL), and the specific conditions under which the finding would be falsified. All findings are independently verified by two systems.",
  inputSchema: z.object({
    finding: z.enum([
      "F1_textual_silence",        // 14 terms absent from strategy
      "F2_ict_trifecta",           // Revenue +72%, employment -11.4%, vacancies -94%
      "F3_knowledge_collapse",     // ISCO 1-4 down, ISCO 5-9 up
      "F4_flying_blind",           // Iceland excluded from all EU measurement
      "F5_institutional_silence",  // Zero union AI agreements
      "all"
    ]),
    include_raw_data: z.boolean().default(false).describe("Include the actual CSV rows / PDF passages supporting the finding"),
    include_adversarial: z.boolean().default(false).describe("Include strongest counterarguments from the adversarial oracle review")
  }),
  outputSchema: z.object({
    finding_id: z.string(),
    title_en: z.string(),
    title_is: z.string(),
    claim: z.string(),
    evidence_level: z.enum(["VERIFIED", "STRONG_PATTERN", "PLAUSIBLE_SIGNAL"]),
    evidence_chain: z.array(z.object({
      source: z.string(),
      data_point: z.string(),
      verification_status: z.string()
    })),
    causality_note: z.string().describe("Explicit statement about what is/isn't proven"),
    falsification_conditions: z.array(z.string()),
    verified_by: z.array(z.string()),
    adversarial_challenges: z.array(z.string()).optional()
  })
}
```

---

### `get_policy_proposal`

Get a specific proposal from the Lausnakafli (Solutions Chapter).

```typescript
{
  name: "get_policy_proposal",
  description: "Get a specific policy proposal from the Lausnakafli (Solutions Chapter). Returns the full proposal text, design principles, adversarial responses, and Icelandic terminology. These are normative proposals — clearly distinguished from empirical findings.",
  inputSchema: z.object({
    proposal: z.enum([
      "framing",                  // 00: Why normative proposals are legitimate sequel
      "productivity_levy",        // 01: framleiðnitilfærslugjald
      "accountability_mandate",   // 02: mannleg ábyrgðarskylda
      "offensive_strategy",       // 03: sóknarstefna (5 sectors)
      "synthesis"                 // 04: How the 3 instruments form 1 framework
    ]),
    section: z.string().optional().describe("Specific section within the proposal, e.g. 'design_principles', 'adversarial_responses', 'sector_map'"),
    format: z.enum(["full", "summary", "key_points"]).default("summary")
  }),
  outputSchema: z.object({
    proposal_id: z.string(),
    title_en: z.string(),
    title_is: z.string(),
    epistemic_status: z.literal("NORMATIVE_PROPOSAL"),
    summary: z.string(),
    full_text: z.string().optional(),
    key_icelandic_terms: z.record(z.string()),
    adversarial_responses: z.array(z.object({
      objection: z.string(),
      response: z.string()
    })).optional(),
    related_findings: z.array(z.string())
  })
}
```

---

### `get_stakeholder_response`

Query the 94 official consultation responses from samráðsgátt S-226/2025.

```typescript
{
  name: "get_stakeholder_response",
  description: "Query the 94 official stakeholder consultation responses on Atvinnustefna S-226/2025. Filter by institution type, sector, submission date. Returns structured metadata and key positions. The full consultation archive with 94 PDFs is the primary source — this tool surfaces who said what.",
  inputSchema: z.object({
    filter: z.object({
      institution_type: z.enum([
        "labor_union",
        "employer_association",
        "municipality",
        "academic",
        "tech_company",
        "energy_company",
        "government_agency",
        "ngo",
        "individual",
        "all"
      ]).default("all"),
      mentions_ai: z.boolean().optional().describe("Only responses that mention gervigreind/AI"),
      mentions_automation: z.boolean().optional(),
      submitted_after: z.string().optional().describe("ISO date"),
    }).optional(),
    response_id: z.number().int().min(1).max(94).optional().describe("Specific submission number"),
    summary_only: z.boolean().default(true)
  }),
  outputSchema: z.object({
    total_matching: z.number(),
    responses: z.array(z.object({
      id: z.number(),
      institution: z.string(),
      institution_type: z.string(),
      submitted: z.string(),
      key_positions: z.array(z.string()),
      mentions_ai: z.boolean(),
      pdf_available: z.boolean()
    })),
    pattern_summary: z.string().describe("Overall pattern across matching responses")
  })
}
```

---

### `lookup_bibliography`

Search the 98-entry verified bibliography.

```typescript
{
  name: "lookup_bibliography",
  description: "Search the 98 verified bibliography entries. Covers international AI labor studies, Iceland-specific data, Nordic comparisons, institutional reports (WEF, IMF, OECD, ILO), company-level evidence (Klarna, IBM, etc.), and government documents. URL health verified April 2026.",
  inputSchema: z.object({
    query: z.string().optional().describe("Search by topic, author, institution, or keyword"),
    category: z.enum([
      "government_documents",
      "institutional_reports",
      "academic_research",
      "company_layoffs",
      "iceland_specific",
      "nordic_comparison",
      "welfare_health",
      "all"
    ]).default("all"),
    year_from: z.number().int().optional(),
    verified_url_only: z.boolean().default(false)
  }),
  outputSchema: z.object({
    entries: z.array(z.object({
      key: z.string(),
      type: z.string(),
      authors: z.string(),
      title: z.string(),
      year: z.number(),
      url: z.string().optional(),
      url_status: z.enum(["green", "bot_blocked", "timeout", "broken"]).optional(),
      bibtex: z.string()
    })),
    total: z.number()
  })
}
```

---

### `compare_nordic`

Compare Iceland's labor market metrics against Denmark, Norway, Sweden, Finland.

```typescript
{
  name: "compare_nordic",
  description: "Compare Iceland's AI adoption, labor market metrics, measurement capacity, or policy framework against Nordic peers. Uses data from Stöðugreining 2026, OECD, Eurostat, and the Panopticon Nordic investigation. Returns the comparison table and interpretive note.",
  inputSchema: z.object({
    metric: z.enum([
      "gdp_per_capita",
      "tfp_index",
      "capital_per_worker",
      "ai_enterprise_adoption",
      "eu_measurement_participation",
      "union_ai_agreements",
      "labor_market_flexibility",
      "welfare_dependency",
      "ict_sector_dynamics"
    ]),
    countries: z.array(z.enum(["IS", "DK", "NO", "SE", "FI"])).default(["IS", "DK", "NO", "SE", "FI"]),
    year: z.number().int().optional().default(2025)
  }),
  outputSchema: z.object({
    metric: z.string(),
    comparison_table: z.array(z.object({
      country: z.string(),
      value: z.union([z.number(), z.string()]),
      rank: z.number().int(),
      source: z.string()
    })),
    iceland_position: z.string().describe("Where Iceland stands relative to peers"),
    policy_implication: z.string()
  })
}
```

---

### `get_icelandic_glossary`

Look up Icelandic policy terms, their definitions, and usage in the research.

```typescript
{
  name: "get_icelandic_glossary",
  description: "Look up Icelandic policy and economic terms used in the research. Returns definition in Icelandic and English, grammatical notes, and how the term is used in this research corpus. Covers everything from institutional names (Tryggingastofnun) to coined terms (ábyrgðarþoka) to technical concepts (framleiðnitilfærslugjald).",
  inputSchema: z.object({
    term: z.string().describe("Icelandic or English term to look up"),
    include_usage_examples: z.boolean().default(true),
    include_related_terms: z.boolean().default(true)
  }),
  outputSchema: z.object({
    term_is: z.string(),
    term_en: z.string(),
    definition_is: z.string(),
    definition_en: z.string(),
    grammatical_notes: z.string().optional().describe("Gender, case notes for Icelandic learners"),
    coined_by: z.string().optional(),
    usage_count: z.number(),
    usage_examples: z.array(z.object({
      source: z.string(),
      excerpt: z.string()
    })).optional(),
    related_terms: z.array(z.string()).optional()
  })
}
```

---

### `reproduce_verification`

Reproduce the verification of a specific finding step by step.

```typescript
{
  name: "reproduce_verification",
  description: "Reproduce the independent verification of any of the 5 empirical findings. Returns the verification prompt used, the verification result from Claude Code, the result from Manus 1.6, and whether they agreed. Includes the specific data operations or text analyses that can be run to replicate the result.",
  inputSchema: z.object({
    finding: z.enum([
      "F1_textual_silence",
      "F2_ict_trifecta",
      "F3_knowledge_collapse",
      "F4_flying_blind",
      "F5_institutional_silence"
    ]),
    include_raw_prompt: z.boolean().default(false),
    include_reproduction_steps: z.boolean().default(true)
  }),
  outputSchema: z.object({
    finding_id: z.string(),
    verification_method: z.string(),
    claude_code_result: z.string(),
    manus_result: z.string(),
    agreement: z.enum(["FULL_AGREEMENT", "PARTIAL_AGREEMENT", "DISAGREEMENT"]),
    corrections_applied: z.array(z.string()),
    reproduction_steps: z.array(z.object({
      step: z.number(),
      action: z.string(),
      expected_output: z.string(),
      script: z.string().optional()
    })).optional()
  })
}
```

---

### `get_data_gap`

Query the institutional accountability map — what data should exist, what does exist, and who holds it.

```typescript
{
  name: "get_data_gap",
  description: "Query Iceland's AI-era data governance gaps. Returns what data should exist for each institution, what actually exists, what's missing, and which FOI requests have been filed. Based on the AGENCY_MAP.md and 8 pending FOI requests.",
  inputSchema: z.object({
    institution: z.enum([
      "Hagstofa",          // Statistics Iceland
      "Tryggingastofnun",  // Social Insurance (TR)
      "Vinnumálastofnun",  // Employment Directorate (VMST)
      "Sjúkratryggingar",  // Health Insurance
      "Ríkisendurskoðun",  // National Audit Office
      "Forsætisráðuneyti", // Prime Minister's Office
      "HVIN",              // Human Sciences Institute
      "all"
    ]).default("all")
  }),
  outputSchema: z.object({
    institutions: z.array(z.object({
      name: z.string(),
      should_hold: z.array(z.string()),
      actually_holds: z.array(z.string()),
      gaps: z.array(z.string()),
      foi_request_status: z.enum(["filed", "pending", "not_filed", "responded"]).optional(),
      foi_request_text: z.string().optional()
    }))
  })
}
```

---

## Resources

App-controlled. Clients subscribe to these; the server sends updates when content changes.

```typescript
// Resource URI scheme: atvinnustefna://{type}/{path}

const resources = [
  {
    uri: "atvinnustefna://findings",
    name: "Five Key Findings",
    description: "Summary of all 5 empirical findings with evidence levels",
    mimeType: "text/markdown"
  },
  {
    uri: "atvinnustefna://mega-report",
    name: "MEGA_REPORT — Full Analysis",
    description: "Complete clinical deconstruction of Atvinnustefna Íslands 2035 (30,000 words)",
    mimeType: "text/markdown"
  },
  {
    uri: "atvinnustefna://lausnakafli/{chapter}",
    name: "Policy Proposals",
    description: "Lausnakafli chapters: framing | levy | accountability | offensive | synthesis",
    mimeType: "text/markdown"
    // chapter: framing | levy | accountability | offensive | synthesis
  },
  {
    uri: "atvinnustefna://data/ict-trifecta",
    name: "ICT Trifecta Dataset",
    description: "The J62 data series showing revenue +72%, employment -11.4%, vacancies -94%",
    mimeType: "application/json"
  },
  {
    uri: "atvinnustefna://bibliography",
    name: "Full Bibliography",
    description: "98 verified sources in BibTeX format with URL health status",
    mimeType: "application/x-bibtex"
  },
  {
    uri: "atvinnustefna://methodology",
    name: "Research Methodology",
    description: "How this research was conducted, verified, and structured",
    mimeType: "text/markdown"
  },
  {
    uri: "atvinnustefna://consultation/metadata",
    name: "Consultation S-226 Metadata",
    description: "Structured metadata for all 94 stakeholder responses (JSON)",
    mimeType: "application/json"
  },
  {
    uri: "atvinnustefna://glossary",
    name: "Icelandic/English Glossary",
    description: "All policy terms defined in both languages",
    mimeType: "application/json"
  }
]
```

---

## Prompts

User-controlled. Pre-built for the most common agent workflows.

---

### `analyze_policy_document`

```typescript
{
  name: "analyze_policy_document",
  description: "Analyze any Icelandic or Nordic policy document against the 5 empirical findings. Returns a structured assessment: which findings the document addresses, which it ignores, and what governance gaps remain.",
  arguments: [
    {
      name: "document_text",
      description: "The policy document text to analyze",
      required: true
    },
    {
      name: "focus",
      description: "Specific aspect to focus on: measurement_capacity | accountability | distribution | all",
      required: false
    }
  ]
}
```

Template:
```
You are analyzing a policy document against the verified empirical findings of the 
Atvinnustefna Íslands 2035 research project.

The 5 findings are:
{{get_finding("all")}}

Document to analyze:
{{document_text}}

Focus: {{focus}}

Assess:
1. Which findings does this document address (explicitly or implicitly)?
2. Which findings does it remain silent on?
3. What governance mechanisms does it contain or lack?
4. What are the three strongest improvements it would need to meet the standard 
   set by the Lausnakafli framework?

Maintain the epistemic discipline of the original research: 
distinguish what is proven from what is a strong pattern from what is proposed.
```

---

### `draft_consultation_response`

```typescript
{
  name: "draft_consultation_response",
  description: "Draft a formal samráðsgátt consultation response for any Icelandic policy consultation, using the research findings as evidence base.",
  arguments: [
    {
      name: "consultation_topic",
      description: "What the consultation is about",
      required: true
    },
    {
      name: "submitter_type",
      description: "labor_union | employer | academic | individual | municipality",
      required: true
    },
    {
      name: "primary_concern",
      description: "The main concern to foreground",
      required: false
    }
  ]
}
```

---

### `explain_finding`

```typescript
{
  name: "explain_finding",
  description: "Explain a specific finding for a non-specialist audience — journalist, parliamentarian, or interested citizen. Chooses the right level of detail and avoids statistical jargon.",
  arguments: [
    {
      name: "finding_id",
      description: "F1 | F2 | F3 | F4 | F5",
      required: true
    },
    {
      name: "audience",
      description: "journalist | parliamentarian | citizen | union_member | academic",
      required: true
    },
    {
      name: "language",
      description: "is | en",
      required: false
    }
  ]
}
```

---

### `adversarial_challenge`

```typescript
{
  name: "adversarial_challenge",
  description: "Generate the strongest possible adversarial challenge to any finding or proposal. Uses the Honest Oracle methodology: attacks unsupported claims, identifies circular reasoning, surfaces strongest counterevidence. Does not debate — attacks.",
  arguments: [
    {
      name: "target",
      description: "Finding ID (F1-F5) or proposal name to attack",
      required: true
    },
    {
      name: "attack_mode",
      description: "methodology | data_quality | causal_claims | political_feasibility | all",
      required: false
    }
  ]
}
```

---

### `nordic_policy_brief`

```typescript
{
  name: "nordic_policy_brief",
  description: "Generate a structured comparison of how Iceland's current approach compares to Nordic best practice on a specific governance dimension. Returns a 400-word brief suitable for a minister or senior official.",
  arguments: [
    {
      name: "dimension",
      description: "measurement | accountability | transition_support | ai_adoption | all",
      required: true
    }
  ]
}
```

---

## Implementation

### Stack

```
Runtime:        Node.js 22+ / Bun 1.x
Language:       TypeScript 5.x strict
MCP SDK:        @modelcontextprotocol/sdk v1.29.0
Schema:         Zod v4 (Standard Schema)
Search:         LanceDB (local vector store) + Fuse.js (keyword fallback)
Embeddings:     text-embedding-3-small (OpenAI) or nomic-embed-text (local)
Data:           csv-parse, papaparse for Hagstofa CSVs
Serving:        Hono (edge-compatible HTTP framework)
Deployment:     Docker container → Railway / Fly.io
```

### Project Structure

```
atvinnustefna-mcp/
├── src/
│   ├── server.ts           # MCP server init, transport registration
│   ├── tools/
│   │   ├── search.ts       # search_corpus — vector + keyword hybrid
│   │   ├── labor_data.ts   # query_labor_data — CSV query engine
│   │   ├── findings.ts     # get_finding — structured finding retrieval
│   │   ├── proposals.ts    # get_policy_proposal — lausnakafli
│   │   ├── stakeholders.ts # get_stakeholder_response — S-226 JSON
│   │   ├── bibliography.ts # lookup_bibliography — BibTeX search
│   │   ├── nordic.ts       # compare_nordic — benchmark tables
│   │   ├── glossary.ts     # get_icelandic_glossary — term lookup
│   │   ├── verification.ts # reproduce_verification — evidence chain
│   │   └── gaps.ts         # get_data_gap — AGENCY_MAP query
│   ├── resources/
│   │   └── registry.ts     # Resource URI handlers
│   ├── prompts/
│   │   └── templates.ts    # Prompt template definitions
│   ├── data/
│   │   ├── indexer.ts      # Build vector index from corpus
│   │   ├── csv_engine.ts   # Hagstofa CSV query layer
│   │   └── bibtex.ts       # Bibliography parser
│   └── auth/
│       └── api_key.ts      # Bearer token validation
├── data/                   # Symlink or copy of research corpus
├── index/                  # Built vector index (gitignored)
├── Dockerfile
├── docker-compose.yml
├── package.json
└── .env.example
```

### Core Server Bootstrap

```typescript
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StreamableHTTPServerTransport } from "@modelcontextprotocol/sdk/server/streamableHttp.js";
import { Hono } from "hono";
import { registerTools } from "./tools/index.js";
import { registerResources } from "./resources/registry.js";
import { registerPrompts } from "./prompts/templates.js";

const server = new McpServer({
  name: "atvinnustefna-2035",
  version: "1.0.0",
  capabilities: {
    tools: { listChanged: false },
    resources: { subscribe: false, listChanged: false },
    prompts: { listChanged: false }
  }
});

registerTools(server);
registerResources(server);
registerPrompts(server);

// Streamable HTTP via Hono
const app = new Hono();

app.post("/mcp", async (c) => {
  const apiKey = c.req.header("Authorization")?.replace("Bearer ", "");
  if (!validateApiKey(apiKey)) return c.json({ error: "Unauthorized" }, 401);

  const transport = new StreamableHTTPServerTransport({
    sessionIdGenerator: () => crypto.randomUUID()
  });
  await server.connect(transport);
  return transport.handleRequest(c.req.raw, c.res);
});

// Server Card for auto-discovery
app.get("/.well-known/mcp/server-card.json", (c) =>
  c.json(SERVER_CARD)
);

export default app;
```

### Search Tool (hybrid)

```typescript
// tools/search.ts
import { LanceDB } from "@lancedb/lancedb";
import Fuse from "fuse.js";

server.tool("search_corpus", SEARCH_SCHEMA, async (args) => {
  const { query, scope, top_k, language } = args;

  // 1. Semantic search via vector store
  const db = await LanceDB.connect("./index");
  const table = await db.openTable("corpus");
  const embedding = await embedText(query);
  const vectorResults = await table
    .search(embedding)
    .where(scope !== "all" ? `scope = '${scope}'` : undefined)
    .limit(top_k * 2)
    .toArray();

  // 2. Keyword search via Fuse.js
  const fuse = new Fuse(corpusChunks, {
    keys: ["text", "section", "source"],
    threshold: 0.3
  });
  const fuseResults = fuse.search(query, { limit: top_k * 2 });

  // 3. Merge and rerank by combined score
  const merged = mergeAndRerank(vectorResults, fuseResults, top_k);

  return {
    content: [{
      type: "text",
      text: JSON.stringify({
        results: merged,
        total_matches: merged.length,
        query_interpreted_as: query
      })
    }]
  };
});
```

---

## Deployment

### Docker

```dockerfile
FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --production
COPY . .
RUN npm run build
RUN npm run index:build   # Pre-build vector index from corpus
EXPOSE 3000
CMD ["node", "dist/server.js"]
```

### Railway (one command)

```bash
railway login
railway new atvinnustefna-mcp
railway up
railway domain add mcp.smarason.is
```

### Environment Variables

```bash
PORT=3000
API_KEY_SECRET=<32-char random>
DATA_PATH=/app/data
INDEX_PATH=/app/index
OPENAI_API_KEY=<for embeddings, optional if using local>
NODE_ENV=production
```

---

## Registry Submission

```json
// registry.modelcontextprotocol.io submission
{
  "namespace": "is.smarason/atvinnustefna-2035",
  "version": "1.0.0",
  "type": "streamable-http",
  "url": "https://mcp.smarason.is/atvinnustefna",
  "auth": "api-key",
  "categories": ["research", "government", "labor-policy", "nordic"],
  "languages": ["is", "en"],
  "license": "CC-BY-4.0",
  "repository": "https://github.com/Magnussmari/atvinnustefna-2035",
  "server_card": "https://mcp.smarason.is/.well-known/mcp/server-card.json"
}
```

---

## Estimated Build Time

| Phase | Task | Time |
|-------|------|------|
| 1 | Project scaffold, dependencies, server bootstrap | 2h |
| 2 | `search_corpus` tool + vector indexer | 4h |
| 3 | `query_labor_data` tool (CSV query engine) | 3h |
| 4 | `get_finding`, `get_policy_proposal`, `reproduce_verification` | 3h |
| 5 | `get_stakeholder_response`, `lookup_bibliography` | 2h |
| 6 | `compare_nordic`, `get_icelandic_glossary`, `get_data_gap` | 2h |
| 7 | Resources + Prompts | 2h |
| 8 | Docker + Railway deployment + Server Card | 1h |
| 9 | Registry submission + API key portal | 1h |
| **Total** | | **~20h** |

---

## Open Questions Before Build

1. **Hosting:** smarason.is VPS or Railway? (Railway is simpler; smarason.is gives better domain alignment)
2. **Embeddings:** OpenAI `text-embedding-3-small` (best quality, costs ~$0.02/1M tokens) or `nomic-embed-text` via Ollama (free, local, slightly lower quality)?
3. **Free tier policy:** Open access with rate limiting, or API key required for all?
4. **Language model for PDF extraction:** The 94 consultation PDFs need text extraction — run once with `pdf-parse` on build, or on-demand?
5. **Update cadence:** Static corpus (version-tagged) or live-sync with repo?

---

*Magnus Smari Smarason · smarason.is · April 2026*
*MCP Spec 2025-11-25 · SDK v1.29.0 · Streamable HTTP*
