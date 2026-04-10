# PANOPTICON MISSION PLAN
## Phase 1 — Pre-Execution Assessment
**Date:** 2026-03-06 | **Classification:** Research Infrastructure | **Status:** AWAITING GO

---

## 1. EXECUTIVE SUMMARY

This investigation can proceed, but not as originally scoped. The causal chain — AI adoption -> sectoral job loss -> welfare system entry by the same demographic cohort — **cannot be fully closed using publicly available data**. The critical missing link is prior occupation of disability/rehabilitation claimants, which is not published anywhere. The strongest comparable empirical study (Humlum & Vestergaard 2025, Denmark) found **null employment effects** from LLM adoption using gold-standard administrative data.

**What IS achievable:** A correlational temporal analysis with explicitly documented gaps, falsification tests on the available data, and a graph structure that maps what we can establish while flagging what we cannot. This is honest research infrastructure, not a predetermined conclusion.

**Recommendation: QUALIFIED GO** — with scope adjustments documented in Section 7.

---

## 2. WORKSTREAM EXECUTION SEQUENCE AND RATIONALE

### Execution Order: A -> B (parallel with A) -> C -> D

| Phase | Workstream | Rationale | Dependencies |
|-------|-----------|-----------|--------------|
| 1 | **A: Macro-Economic** | Contains the falsification gate. If job losses concentrate in physical sectors (construction, fisheries, hospitality), the AI displacement hypothesis weakens and Workstream C/D scope changes. Must run first. | None |
| 2 | **B: Welfare Audit** | Independent data sources from A. Can run in parallel. Establishes whether psychiatric disability claims are rising anomalously and provides the welfare-side temporal baseline. | None (parallel with A) |
| 3 | **C: Corporate** | Must be guided by A's findings — which sectors are losing jobs determines where to look for corporate AI adoption evidence. Also needs B's timeline to overlay corporate announcements against welfare entry patterns. | A (which sectors), B (temporal baseline) |
| 4 | **D: Epistemic** | Most data-starved workstream. Benefits from all prior findings to target interview/survey design. Functions as qualitative triangulation of quantitative findings from A-C. | A, B, C (for targeting) |

**Rationale for this sequence:** The falsification gate in Workstream A is the most important decision point. If the gate triggers (physical sector concentration), Workstreams C and D must be rescoped around non-AI explanations (post-pandemic tourism normalization, construction cycle, etc.). Running A first prevents wasted effort on a falsified hypothesis.

---

## 3. DATA SOURCE ACCESS ASSESSMENT

### 3.1 Workstream A — Macro-Economic Deconstruction

| Source | Access | Granularity | Most Recent | API | Rating |
|--------|--------|-------------|-------------|-----|--------|
| **Hagstofa PxWeb — Quarterly unemployment (VIN00920)** | Public, free | Age (6 groups), sex, region. NO sector. | Q4 2025 | Yes (REST, no auth) | HIGH |
| **Hagstofa PxWeb — Annual employment by NACE sector (VIN01105/VIN01110)** | Public, free | 37 NACE sectors, sex, region. ANNUAL only. | 2025 | Yes | MEDIUM |
| **Hagstofa PxWeb — Employed by occupation group (VIN01100)** | Public, free | 9 broad ISCO groups x ISCED education. ANNUAL. | 2025 | Yes | MEDIUM |
| **Vinnumalastofnun — Monthly registered unemployment** | Public, free | Sector filtering via Power BI; monthly. Age/education in PDF reports. | Jan 2026 | No (Power BI only; .xlsm download) | HIGH |
| **Vinnumalastofnun — Annual report 2024** | Public PDF | Sectoral narrative + aggregate tables | 2024 | No | MEDIUM |
| **Eurostat — LFS Iceland** | Public | EU-harmonized quarterly | Varies | Yes | SUPPLEMENTARY |

**Critical gap:** No source provides quarterly unemployment by sector. Hagstofa has sector data annually (for employment, not unemployment). Vinnumalastofnun has monthly registered unemployment with sector filtering via Power BI dashboard but no API and unclear machine-readability of historical data in .xlsm downloads.

**Mitigation:** Download all 25 monthly Vinnumalastofnun .xlsm files (Jan 2024-Jan 2026) and inspect structure. If historical series are present in each file, build a monthly sector-unemployment panel manually. If single-month only, file a consolidated data request to VMST.

**API endpoint confirmed:** `http://px.hagstofa.is/pxis/api/v1/is/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__2_arsfjordungstolur/VIN00920.px`

### 3.2 Workstream B — Welfare State Audit

| Source | Access | Granularity | Most Recent | API | Rating |
|--------|--------|-------------|-------------|-----|--------|
| **TR PowerBI Dashboard** | Public, no login | Monthly recipients by age, gender, residence. NO diagnosis. NO occupation. | Monthly, current 2026 | No (embedded PowerBI) | MEDIUM |
| **Hagstofa PxWeb — Pension beneficiaries** | Public, free | Disability/rehab recipients by age, gender, residence, financer. NO diagnosis. | 2022 | Yes | LOW (stale) |
| **Laeknabladid 2021 — Diagnosis trends 2000-2019** | Public (journal) | ICD diagnosis groups for new rehab/disability entrants by period | 2019 | No | HIGH (historical) |
| **Laeknabladid Feb 2026 — Diagnosis trends update** | Public (journal) | Likely extends 2021 paper to more recent data | TBD (must read) | No | POTENTIALLY HIGH |
| **Landlaeknir Talnabrunnur — Mental health well-being** | Public | Population-level well-being surveys (NOT clinical diagnoses) | 2024 data | No | LOW (wrong type) |
| **Sjukratryggingar — Sick leave data** | NOT PUBLIC | Diagnosis-coded sick leave (the pipeline before disability) | N/A | N/A | CRITICAL GAP |
| **Nordic Health/Welfare Stats (nhwstat.org)** | Public | Comparative disability rates across Nordic countries | 2022 (stock) | No | SUPPLEMENTARY |

**Critical gaps:**
1. **Diagnosis-level breakdown of new entrants 2020-2026** — not in any public portal. Exists internally at TR; published only via academic papers by TR staff (Laeknabladid).
2. **Prior occupation of claimants** — does not exist in any public form. Would require linking TR admin records to tax/labour registry, which is a research-grade data linkage project requiring formal approval.
3. **New-entrant flows** — TR publishes stock (total recipients) not flows (new entrants per period). The Laeknabladid papers are the only public source for new-entrant diagnosis distributions.
4. **Sick leave pipeline** — Sjukratryggingar data on sick leave by diagnosis (the early warning signal) is entirely non-public.

**Key statistics already established from public sources:**
- ~2/3 of pension recipients have psychiatric diagnoses (Jan 2025)
- 9.4% of Iceland's labour market on disability/rehabilitation (2024, up from 6.3% in 2000)
- Women: 61% of all recipients (2025)
- Psychiatric disorders rose from ~35% to >50% of disability recipients 2000-2019 (Laeknabladid 2021)
- September 2025: major reform replacing old disability pension with new medical/rehabilitation allowance

**Mitigation:** The February 2026 Laeknabladid article must be read immediately — it likely extends the diagnosis trend data to 2023-2024. Combined with TR PowerBI aggregate counts and the known psychiatric proportion, we can construct a plausible (but not granular) welfare-side timeline.

### 3.3 Workstream C — Corporate Accountability

| Source | Access | Granularity | Most Recent | API | Rating |
|--------|--------|-------------|-------------|-----|--------|
| **Skatturinn Arsreikningaskra** | Public, free download | Revenue, staff costs, profit/loss per company. NO IT spend isolation. | Varies by filing | No (manual per-company) | LOW for AI spend |
| **Skatturinn Fyrirtaekjaskra** | Public, free search | Name, kennitala, ISAT code, address, legal form. NO revenue, NO employees. | Current | No | LOW |
| **TED (Tenders Electronic Daily)** | Public, REST API | Above-threshold procurement awards; CPV codes filterable for IT/AI. Includes Iceland (EEA). | Current | Yes | HIGH |
| **Utbodsvefur.is** | Public | Procurement notices (not awards); 91 active notices. Limited filters. | Current | No | LOW |
| **Eurostat isoc_eb_ai** | Public | Enterprise AI adoption rates — Iceland included in survey universe. | 2025 (20% EU average) | Yes | HIGH |
| **mbl.is/vidskipti** | Public | AI adoption news, executive statements, restructuring announcements | Current | No (manual search) | MEDIUM (soft) |
| **Iceland AI Action Plan 2025-2027** | Public PDF | Government AI strategy, 55% jobs figure, 30% time saving projection | 2024 published | No | CONTEXTUAL |

**Critical gaps:**
1. **AI spend isolation from annual accounts: IMPOSSIBLE.** Icelandic accounting standards do not require technology expense disaggregation. Rating: 1/10 for AI spend.
2. **Employee count by company: NOT in any public database.** Approximate via staff costs line in annual accounts.
3. **Below-threshold government IT contracts: NOT public.** Upplysningalog (Information Act) request to FMA required.
4. **Contract texts: NOT on utbodsvefur.is** — only tender notices, not awarded contract documents.

**Key structural change:** Rikiskaup (Central Public Procurement) was dissolved and absorbed into FMA (Financial Management Authority) on August 1, 2024. Old rikiskaup.is redirects to island.is.

**Confirmed corporate AI adoption evidence (from news sources):**
- Islandsbanki: "Sam" internal AI assistant; Microsoft Copilot integration
- Landsbankinn: Chatbot deployment; new digital platform
- Arion banki: AI/automation "efficiency" statements (vague)
- Eimskip: "Using AI to increase efficiency" (executive quote, no specifics)

**Mitigation:** TED API with CPV 72000000 series (IT services) + country:IS is the highest-value immediate action. Eurostat isoc_eb_ai for official adoption rates. News-sourced evidence is qualitative triangulation only.

### 3.4 Workstream D — Epistemic/Cognitive Atrophy

| Source | Access | Granularity | Most Recent | API | Rating |
|--------|--------|-------------|-------------|-----|--------|
| **VR Vinnustadarannsokn (workplace survey)** | Summaries only | Annual survey by Gallup; unknown if AI/digitization module exists | 2024 results | No | UNKNOWN (contact needed) |
| **Efling publications** | Summaries only | 2022 psychosocial analysis (48 interviews); no AI content | 2022 | No | LOW |
| **ASI/BHM publications** | Limited | Wage statistics; no AI position papers | Current | No | LOW |
| **Eurofound EWCS 2024** | Public database | 36,644 interviews across 35 countries including Iceland. Covers algorithmic management, digital monitoring, work intensity, mental health. | 2024 data | Yes (data portal) | HIGH |
| **Prosent burnout survey** | Summary only | Longitudinal 2020-2025 (~900/year). Does NOT ask about AI. | 2025 | No | MEDIUM (contact needed) |
| **Gallup ChatGPT poll (Oct 2024)** | Public (via Iceland Review) | 11% weekly+ use; 75% never; highest in 18-24 | Oct 2024 | No | MEDIUM |
| **Skemman.is thesis — AI in HRM** | Open PDF | 10 HR manager interviews, Icelandic context | 2023 | No | MEDIUM |
| **EU Parliament comparative study 2025** | Public PDF | 12-country review; Iceland has NO technology-specific employment law | 2025 | No | HIGH (legal context) |

**Critical gaps:**
1. **No Icelandic union has published anything AI-specific.** Zero position papers, zero member surveys, zero grievance data on algorithmic management, deskilling, or AI workplace effects.
2. **"Reikniritsstjornun" (algorithmic management) yields zero results in Icelandic discourse.** The concept is linguistically absent — either the phenomenon doesn't exist in Iceland's labor market, or it's invisible due to vocabulary gap.
3. **Shadow AI evidence: global proxies only.** No Iceland-specific survey on unauthorized workplace AI use.
4. **Prosent burnout survey doesn't ask about AI** as a causal factor. Collaboration request needed.

**Best available source:** Eurofound EWCS 2024 — Iceland is one of 35 countries surveyed, with explicit modules on algorithmic management and digital monitoring. Country-level microdata query is the single highest-leverage action for this workstream.

**Mitigation:** (1) Query Eurofound EWCS 2024 data portal for Iceland subset. (2) Contact VR for survey instrument. (3) Contact Prosent for collaboration. (4) Check samradsgatt.is for union consultation submissions on the AI Action Plan.

---

## 4. FALSIFICATION CRITERIA

Each workstream has explicit criteria that, if triggered, weaken or falsify the displacement hypothesis. The data decides.

### Workstream A — Macro-Economic

| ID | Falsification Criterion | Data Source | Test |
|----|------------------------|-------------|------|
| FA-1 | Job losses concentrate in physical sectors (construction, fisheries, hospitality, manufacturing) rather than knowledge/clerical/administrative sectors | VMST monthly sector data; Hagstofa annual NACE | If >60% of unemployment increase (Jan 2024-Jan 2026) is in NACE sections B-F (industry, construction) rather than J-N (information, finance, professional/admin services) -> **HYPOTHESIS WEAKENS SIGNIFICANTLY** |
| FA-2 | Unemployment rise correlates primarily with tourism seasonality or post-pandemic normalization rather than structural displacement | VMST monthly time series; tourist arrival data | If unemployment peaks align with known seasonal patterns and the 2024-2026 level is within 1 standard deviation of 2015-2019 seasonal norms -> **ALTERNATIVE EXPLANATION STRONGER** |
| FA-3 | Age distribution of unemployment does not skew toward knowledge-worker cohorts (25-54, higher education) | Hagstofa VIN00920 quarterly by age | If unemployment increase is concentrated in 16-24 (entry-level) and 55-74 (retirement-adjacent) rather than 25-54 prime-age knowledge workers -> **HYPOTHESIS WEAKENS** |

### Workstream B — Welfare Audit

| ID | Falsification Criterion | Data Source | Test |
|----|------------------------|-------------|------|
| FB-1 | Psychiatric diagnoses are NOT rising faster than musculoskeletal/other diagnoses among new disability entrants | Laeknabladid 2021 + 2026 papers | If psychiatric share of new entrants is stable or declining 2019-2024 -> **STRESS/BURNOUT VECTOR FALSIFIED** |
| FB-2 | Disability/rehabilitation growth is explained by demographic aging rather than working-age cohort inflows | TR PowerBI age breakdown; Hagstofa population pyramid | If new recipient growth is concentrated in 60-67 age band rather than 30-55 -> **DEMOGRAPHIC EXPLANATION DOMINATES** |
| FB-3 | The September 2025 system reform (new medical/rehabilitation allowance) explains recipient count changes rather than genuine increase in claims | TR PowerBI pre/post Sept 2025 | If recipient counts show a discontinuous jump at reform date without corresponding pre-reform trend -> **MEASUREMENT ARTIFACT** |

### Workstream C — Corporate Accountability

| ID | Falsification Criterion | Data Source | Test |
|----|------------------------|-------------|------|
| FC-1 | AI adoption announcements do NOT temporally precede restructuring, layoffs, or hiring freezes at the same companies | News sources + VMST mass layoff notifications | If no temporal sequence AI announcement -> subsequent headcount reduction can be established for any major employer -> **CAUSAL CHAIN BREAKS** |
| FC-2 | Government IT procurement is NOT increasing in AI/cloud categories 2024-2026 | TED API (CPV 72xxx, country:IS) | If above-threshold IT procurement is flat or declining -> **PUBLIC SECTOR AI ADOPTION CLAIM UNSUPPORTED** |
| FC-3 | Eurostat enterprise AI adoption rate for Iceland is below EU average or flat | Eurostat isoc_eb_ai | If Iceland adoption rate is significantly below comparators -> **ADOPTION PREMISE WEAKENS** |

### Workstream D — Epistemic/Cognitive Atrophy

| ID | Falsification Criterion | Data Source | Test |
|----|------------------------|-------------|------|
| FD-1 | Eurofound EWCS 2024 shows Iceland BELOW Nordic average on algorithmic management and digital monitoring indicators | Eurofound data portal | If Icelandic workers report less algorithmic management than Danish/Swedish/Norwegian workers -> **ICELAND EXCEPTIONALISM — AI MANAGEMENT NOT YET DEPLOYED** |
| FD-2 | No evidence of increased workload, pace, or stress attributable to digital tools in any Icelandic survey data | EWCS 2024; Prosent; VR survey | If work intensity indicators are flat 2020-2024 for knowledge workers -> **COGNITIVE PRESSURE CLAIM UNSUPPORTED** |

### Global Falsification Gate

**IF Workstream A falsification criteria FA-1 AND FA-2 both trigger** (job losses in physical sectors AND explained by seasonality), the investigation pauses. The AI displacement hypothesis is effectively dead for the Jan 2025-Jan 2026 window in Iceland. Report this finding clearly and proceed to synthesis as a null result — which is still a publishable and valuable finding.

---

## 5. GRAPH SCHEMA DRAFT

### 5.1 Node Labels

Compatible with BeyondGraph / BORG_UNAK_MAP architecture.

```
// Primary investigation nodes
(:MacroMetric)           // Economic indicators: unemployment rates, employment counts, sectoral data
(:CorporateAction)       // Company decisions: AI adoption, layoffs, restructuring, hiring freezes
(:PolicyChange)          // Government/institutional changes: legislation, reforms, AI strategy
(:UnionGrievance)        // Union publications, surveys, position statements, grievances
(:WelfareStatistic)      // Disability/rehabilitation claims, sick leave, diagnosis distributions
(:AcademicEvidence)      // Peer-reviewed findings relevant to causal claims

// Supporting nodes
(:DataSource)            // Metadata about where evidence came from
(:TemporalMarker)        // Specific dates/periods for temporal sequencing
(:DemographicCohort)     // Age/education/sector groups for cohort tracking
(:FalsificationTest)     // Explicit tests of the hypothesis with results
```

### 5.2 Node Properties (Mandatory)

All nodes carry:

```
{
  source_url: STRING,          // URL or document reference
  extraction_date: DATE,       // When data was extracted
  confidence: STRING,          // 'High' | 'Medium' | 'Low' | 'Unverified'
  original_language: STRING,   // 'is' | 'en' | 'da' etc.
  original_text: STRING,       // Preserved original (especially for Icelandic sources)
  translated_text: STRING,     // English translation if original is non-English
  temporal_reference: STRING,  // Time period the data describes (e.g., 'Q4 2025', 'Jan 2026')
  notes: STRING                // Analyst notes including [VERIFY] flags
}
```

### 5.3 Edge Types

```
// Temporal/causal edges
[:PRECEDED {months_gap: INT, mechanism: STRING}]      // A occurred before B within specified window
[:CORRELATES_WITH {r_value: FLOAT, method: STRING}]   // Statistical or temporal correlation (NOT causation)
[:EXPLAINS {mechanism: STRING, evidence_strength: STRING}]  // Causal mechanism with evidence
[:CONTRADICTS {basis: STRING}]                         // Evidence that undermines a claim

// Structural edges
[:SOURCED_FROM]           // Node -> DataSource
[:DESCRIBES_PERIOD]       // Node -> TemporalMarker
[:AFFECTS_COHORT]         // Node -> DemographicCohort
[:TESTED_BY]              // Hypothesis claim -> FalsificationTest
[:PART_OF_WORKSTREAM]     // Node -> workstream identifier
```

### 5.4 Example Cypher — Node Creation

```cypher
// MacroMetric: Unemployment rate January 2026
CREATE (m:MacroMetric {
  id: 'MACRO_UNEMP_2026_01',
  name: 'Registered unemployment rate Iceland',
  value: 4.9,
  unit: 'percent',
  temporal_reference: '2026-01',
  source_url: 'https://island.is/s/vinnumalastofnun/maelabord-og-toelulegar-upplysingar',
  extraction_date: date('2026-03-06'),
  confidence: 'High',
  original_language: 'is',
  original_text: 'Skradsett atvinnuleysi i januar 2026 var 4,9%',
  translated_text: 'Registered unemployment in January 2026 was 4.9%',
  notes: 'From VMST Power BI dashboard. Includes sectoral filtering.'
})

// WelfareStatistic: Psychiatric diagnosis share
CREATE (w:WelfareStatistic {
  id: 'WELFARE_PSYCH_SHARE_2025_01',
  name: 'Psychiatric diagnosis share of disability/rehabilitation recipients',
  value: 66.7,
  unit: 'percent_approximate',
  temporal_reference: '2025-01',
  source_url: 'https://www.icelandreview.com/news/disability-pensions-rise-sharply-in-iceland/',
  extraction_date: date('2026-03-06'),
  confidence: 'Medium',
  original_language: 'en',
  original_text: 'approximately two-thirds of pension recipients have psychiatric diagnoses',
  translated_text: null,
  notes: 'Approximate figure from news reporting. [VERIFY] against Laeknabladid 2026 article for exact figures.'
})

// CorporateAction: Islandsbanki AI adoption
CREATE (c:CorporateAction {
  id: 'CORP_ISLANDSBANKI_AI_2024',
  name: 'Islandsbanki deploys Sam internal AI assistant',
  action_type: 'AI_Integration',
  company: 'Islandsbanki',
  sector_nace: 'K64',
  temporal_reference: '2024',
  source_url: 'https://www.mbl.is/vidskipti/',
  extraction_date: date('2026-03-06'),
  confidence: 'Medium',
  original_language: 'is',
  original_text: 'Islandsbanki hefur tekid i notkun Sam, innri gervigeindaradhgjafa',
  translated_text: 'Islandsbanki has adopted Sam, an internal AI assistant',
  notes: 'Also integrating Microsoft Copilot. No headcount impact disclosed.'
})

// PolicyChange: Iceland AI Action Plan
CREATE (p:PolicyChange {
  id: 'POLICY_AI_ACTION_PLAN_2024',
  name: 'Iceland AI Action Plan 2025-2027',
  policy_type: 'National_Strategy',
  temporal_reference: '2024-11',
  source_url: 'https://www.stjornarradid.is/library/04-Raduneytin/Menningar---nyskopunar--og-haskolaraduneytid/Iceland%27s%20AI%20Action%20Plan%20electronic%20version.pdf',
  extraction_date: date('2026-03-06'),
  confidence: 'High',
  original_language: 'en',
  original_text: 'AI could affect up to 55% of jobs in Iceland',
  translated_text: null,
  notes: 'Published November 2024. Claims 30% time saving potential. 8% feel adequately trained.'
})
```

### 5.5 Example Cypher — Edge Creation

```cypher
// Temporal precedence (with caution)
MATCH (c:CorporateAction {id: 'CORP_ISLANDSBANKI_AI_2024'})
MATCH (m:MacroMetric {id: 'MACRO_UNEMP_2026_01'})
CREATE (c)-[:PRECEDED {
  months_gap: 14,
  mechanism: 'AI integration may reduce operational headcount in financial services'
}]->(m)

// Correlation (not causation)
MATCH (m:MacroMetric {id: 'MACRO_UNEMP_2026_01'})
MATCH (w:WelfareStatistic {id: 'WELFARE_PSYCH_SHARE_2025_01'})
CREATE (m)-[:CORRELATES_WITH {
  r_value: null,
  method: 'Temporal co-occurrence; no statistical test performed'
}]->(w)
```

### 5.6 Terminal Query (as specified in mission brief)

```cypher
// Find all AI Integration actions followed within 6-12 months by
// sector job loss + psychological disability claim from same demographic cohort
MATCH (corp:CorporateAction {action_type: 'AI_Integration'})-[:PRECEDED {months_gap: mg}]->(job:MacroMetric)
WHERE 6 <= mg <= 12
  AND job.name CONTAINS 'unemployment' OR job.name CONTAINS 'job loss'
MATCH (job)-[:CORRELATES_WITH]->(welfare:WelfareStatistic)
WHERE welfare.name CONTAINS 'psychiatric' OR welfare.name CONTAINS 'psychological'
MATCH (corp)-[:AFFECTS_COHORT]->(cohort:DemographicCohort)
MATCH (job)-[:AFFECTS_COHORT]->(cohort)
MATCH (welfare)-[:AFFECTS_COHORT]->(cohort)
RETURN corp.name AS ai_action,
       corp.company AS company,
       corp.temporal_reference AS ai_date,
       job.name AS job_metric,
       job.temporal_reference AS job_date,
       mg AS months_between,
       welfare.name AS welfare_indicator,
       welfare.temporal_reference AS welfare_date,
       cohort.description AS affected_cohort
ORDER BY mg ASC
```

**Honest note on the terminal query:** Given current data availability, this query is likely to return **zero results** that close the full causal chain. The missing link is cohort identity — we cannot currently prove that the same demographic group (by occupation) entered unemployment AND then entered the disability system. The query is structurally correct and will work if the data is populated, but populating the `AFFECTS_COHORT` edges between welfare statistics and corporate actions requires the occupation-level data that is not publicly available.

---

## 6. RISK REGISTER

### Risks That Could Make This Investigation Inconclusive

| ID | Risk | Severity | Likelihood | Impact | Mitigation |
|----|------|----------|-----------|--------|------------|
| R1 | **Quarterly sector x unemployment data does not exist** | CRITICAL | CONFIRMED | Cannot do fine-grained temporal analysis of which sectors lost jobs by quarter. Forced to use annual employment data (Hagstofa) or monthly registered unemployment (VMST) with uncertain sector granularity in downloads. | Download VMST .xlsm files and reverse-engineer sector data. Fall back to annual NACE employment changes from Hagstofa. |
| R2 | **Prior occupation of disability claimants is not public** | CRITICAL | CONFIRMED | Cannot close the causal chain: AI adoption -> job loss in sector X -> same workers enter disability system. The "same demographic cohort" requirement in the terminal query is unprovable from public data. | Use indirect evidence: age/gender distribution matching between unemployment and disability cohorts. Flag the gap explicitly. Consider formal data request to TR (weeks-to-months lead time). |
| R3 | **The strongest comparable empirical study (Denmark) found null effects** | HIGH | CONFIRMED | Humlum & Vestergaard (2025): null effects on earnings and hours in Denmark using admin registers and DiD. This is the most methodologically rigorous study and the most comparable country. If Iceland follows the Danish pattern, the displacement hypothesis is false for the current time window. | Frame this as a known empirical constraint. Test whether Iceland differs from Denmark on key parameters (adoption rate, sectoral mix, welfare system design). The null result is itself a finding. |
| R4 | **AI spend cannot be isolated from corporate accounts** | HIGH | CONFIRMED | Icelandic accounting standards do not require technology expense disaggregation. Cannot quantify AI investment at firm level from public filings. | Use proxy measures: TED procurement data for public sector; Eurostat enterprise survey for adoption rates; news-sourced announcements for qualitative evidence. Accept this as an inherent limitation. |
| R5 | **Iceland's small size limits statistical power** | HIGH | INHERENT | Population ~380,000; labour force ~210,000. Standard econometric techniques (DiD, shift-share IV) may lack power for sector-level analysis. Small N means individual large employers can dominate sector-level statistics. | Use this as a feature, not a bug: Iceland's small size enables qualitative triangulation and exhaustive firm-level analysis that is impossible in larger economies. Combine quantitative trends with case-study depth. |
| R6 | **No Icelandic union has published anything AI-specific** | HIGH | CONFIRMED | Workstream D has almost no primary data. The "epistemic atrophy" hypothesis cannot be tested with existing public evidence. | Eurofound EWCS 2024 (Iceland included) is the rescue source. Contact VR/Prosent for collaboration. Acknowledge the absence as itself a finding (the discourse vacuum). |
| R7 | **Hagstofa welfare tables stop at 2022** | MEDIUM | CONFIRMED | The PxWeb disability/rehabilitation tables have not been updated since 2022. The 2023-2025 period — the critical window — is not in the API-accessible database. | Use TR PowerBI for 2023-2026 aggregate counts. Use Laeknabladid papers for diagnosis distribution. Accept the two-source mismatch as a limitation. |
| R8 | **Laeknabladid Feb 2026 article may not extend data to 2024+** | MEDIUM | UNKNOWN | If the 2026 paper is a review of the 2021 paper's findings without new data, the diagnosis trend stops at 2019. The 2020-2025 gap would be unfillable from public sources. | Read the article immediately upon GO. If it doesn't extend the data, escalate: this means the entire psychiatric diagnosis trend for the AI era (2023+) is evidenced only by one approximate media figure (~2/3). |
| R9 | **The September 2025 disability system reform creates a measurement discontinuity** | MEDIUM | CONFIRMED | Replacement of old disability pension with new medical/rehabilitation allowance may cause artificial jumps in recipient counts, confounding genuine trend analysis. | Treat Sept 2025 as a structural break. Analyze pre-reform trend (2020-Aug 2025) and post-reform (Sept 2025+) separately. Document the reform as a confound. |
| R10 | **Correlation-causation conflation in graph edges** | MEDIUM | DESIGN RISK | Small-N temporal co-occurrence is easily mistaken for causal evidence, especially in a graph structure that visually implies connection. | Strict edge discipline: CORRELATES_WITH is default. PRECEDED + EXPLAINS only when mechanism AND temporal sequence AND evidence quality all support it. Include CONTRADICTS edges aggressively. |

---

## 7. SCOPE ADJUSTMENTS (Required for GO)

Given the confirmed data gaps, the original mission scope must be adjusted:

### What the investigation CAN deliver:
1. **Temporal overlay:** AI adoption announcements (corporate + government) mapped against unemployment trends by sector (monthly) and disability recipient trends (monthly aggregate). This is correlational, not causal.
2. **Falsification testing:** Rigorous application of falsification criteria from Section 4. If job losses are in physical sectors and explained by seasonality, the hypothesis is reported as weakened/falsified.
3. **Welfare trend characterization:** Aggregate disability/rehabilitation recipient trends 2020-2026 with psychiatric diagnosis proportion from academic sources (2000-2019 confirmed, possibly extended to 2024).
4. **Corporate AI adoption evidence:** Qualitative firm-level evidence from news + Eurostat adoption rates + TED procurement data. Not quantified AI spend.
5. **Epistemic baseline:** Eurofound EWCS 2024 Iceland data on algorithmic management + the discourse vacuum finding.
6. **Knowledge graph:** Fully populated and Cypher-importable, with honest confidence ratings and edge types that distinguish correlation from causation.

### What the investigation CANNOT deliver (from public data alone):
1. **Closed causal chain:** AI adoption -> specific-sector job loss -> same workers enter disability. The occupation link is missing.
2. **Quantified AI spend** at firm level.
3. **Monthly diagnosis-level disability entrant data** for 2020-2026.
4. **Worker-level evidence** of cognitive atrophy or deskilling in Icelandic workplaces (beyond Eurofound survey).
5. **Statistical causal identification** (DiD, IV) comparable to the Danish study — Iceland lacks the linked admin data infrastructure for external researchers.

### Escalation triggers during execution:
- **FLAG 1:** If FA-1 + FA-2 both trigger (physical sector + seasonality explanation), pause and report null finding before proceeding.
- **FLAG 2:** If Laeknabladid 2026 article does not extend diagnosis data beyond 2019, escalate — the psychiatric trend claim for the AI era becomes unsupportable.
- **FLAG 3:** If Eurostat isoc_eb_ai shows Iceland below EU average on AI adoption, the entire adoption premise weakens.

---

## 8. GO/NO-GO RECOMMENDATION

### RECOMMENDATION: QUALIFIED GO

**The honest assessment:**

This investigation is worth conducting, but it will produce a **qualified** verdict, not a definitive one. The displacement hypothesis cannot be proven from public data — the occupation-level link between job loss and welfare entry does not exist publicly. The strongest comparable study (Denmark) found null effects.

What this investigation CAN do is:
1. **Map what IS publicly knowable** about the AI-adoption/labor/welfare nexus in Iceland into a rigorous, sourced, graph-structured evidence base.
2. **Apply falsification tests** honestly and report which parts of the hypothesis survive contact with data and which don't.
3. **Document the evidence gaps** as findings in themselves — the fact that Iceland has no linked admin data, no union AI publications, and no public occupation-diagnosis linkage for welfare claimants IS the finding about institutional preparedness.
4. **Produce a thesis-grade research infrastructure** (the Neo4j graph + workstream reports) that positions the commander's research ahead of the existing literature, which has precisely zero studies using Icelandic data.

**The investigation's value does not depend on confirming the hypothesis.** A well-documented null or qualified result is as valuable — arguably more valuable — than a confirmed positive. The graph structure, the falsification framework, and the data gap inventory are the durable outputs regardless of which way the evidence points.

**Conditions for GO:**
- Accept the scope adjustments in Section 7
- Accept that the terminal query may return zero closed-chain results
- Accept that the verdict will likely be "Qualified" rather than "Sustained" or "Falsified"
- First action on GO: read the Laeknabladid February 2026 article to determine if the psychiatric diagnosis trend extends to the AI era

---

## APPENDIX A: Key Source URLs

### Workstream A
- Hagstofa PxWeb quarterly unemployment: https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__2_arsfjordungstolur/VIN00920.px
- Hagstofa annual NACE employment: https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01110.px
- Hagstofa occupation x education: https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01100.px
- Vinnumalastofnun dashboard: https://island.is/s/vinnumalastofnun/maelabord-og-toelulegar-upplysingar
- Vinnumalastofnun publications: https://island.is/s/vinnumalastofnun/utgefid-efni
- VMST 2024 annual report PDF: https://assets.ctfassets.net/8k0h54kbe6bj/3bHHriU7sQ095nMSuYXczj/d7c085ebd4c3c6fc7ff819de0750634c/VMST-Vinnumarkadur-2024-skyrsla-050225.pdf
- Rikisendurskodun audit 2025: https://www.rikisendurskodun.is/reskjol/files/Skyrslur/2025_atvinnuleysi_og_vinnumarkadsurraedi.pdf

### Workstream B
- TR Interactive Statistics (PowerBI): https://island.is/en/o/social-insurance-administration/interactive-statistics
- TR Annual Reports: https://island.is/en/o/social-insurance-administration/yearlyreports-financialstatements
- Hagstofa pension beneficiaries: https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__felagsmal__lifeyristhegar/
- Laeknabladid 2021 — Diagnoses 2000-2019: https://www.laeknabladid.is/tolublod/2021/12/nr/7886
- Laeknabladid 2026 — Diagnosis trends update: https://www.laeknabladid.is/tolublod/2026/02/yfirlitsgrein.-throun-sjukdomsgreininga-i-laeknisvottordum-vegna-endurhaefingar-og-ororku
- Landlaeknir Talnabrunnur mental health: https://island.is/en/gedheilbrigdi-tolur/talnabrunnur-gedheilbrigdi
- Nordic Health/Welfare Stats: https://nhwstat.org/welfare/disability/disability-pension-recipients
- Iceland Review — disability pensions rise: https://www.icelandreview.com/news/disability-pensions-rise-sharply-in-iceland/
- Disability/welfare overview (OBI): https://www.obi.is/static/files/skjol/pdf-skyrslur/disability-and-welfare-in-iceland_so-skyrsla.pdf

### Workstream C
- Skatturinn annual accounts: https://www.skatturinn.is/fyrirtaekjaskra/arsreikningaskra/
- Skatturinn company registry: https://www.skatturinn.is/fyrirtaekjaskra/leit/
- TED — Tenders Electronic Daily: https://ted.europa.eu/en/
- TED API docs: https://docs.ted.europa.eu/api/latest/index.html
- Utbodsvefur.is: https://utbodsvefur.is
- FMA/Central Public Procurement: https://island.is/en/o/central-public-procurement
- Eurostat enterprise AI adoption: https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Use_of_artificial_intelligence_in_enterprises
- Iceland AI Action Plan PDF: https://www.stjornarradid.is/library/04-Raduneytin/Menningar---nyskopunar--og-haskolaraduneytid/Iceland%27s%20AI%20Action%20Plan%20electronic%20version.pdf
- AI Action Plan public consultation: https://island.is/samradsgatt/mal/3862

### Workstream D
- VR (union): https://www.vr.is/en/
- Efling: https://efling.is/en/
- ASI: https://asi.is
- Eurofound EWCS 2024: https://www.eurofound.europa.eu/en/publications/2025/european-working-conditions-survey-2024-first-findings
- Prosent burnout survey: https://prosent.is/fyrirlestur-um-kulnun-islendinga-a-vinnumarkadi-2025/
- Gallup ChatGPT poll: https://www.icelandreview.com/news/poll-who-in-iceland-uses-chatgpt/
- Skemman thesis — AI in HRM: https://skemman.is/handle/1946/45903?locale=en
- EU Parliament — AI and employment law, 12-country review: https://www.europarl.europa.eu/RegData/etudes/STUD/2025/774670/EPRS_STU(2025)774670_EN.pdf
- OECD AI dashboard Iceland: https://oecd.ai/en/dashboards/countries/Iceland
- Mannvaen.is AI plan critique: https://mannvaen.is/umsogn-vid-adgerdaaaetlun-stjornvalda-i-gervigreind-2024-2026/

### Academic Literature (Key Papers)
- Humlum & Vestergaard (2025) — Denmark null result: https://www.nber.org/papers/w33777
- Brynjolfsson et al. (2023/2025) — Generative AI at Work: https://doi.org/10.1093/qje/qjae044
- Frank, Ahn & Moro (2025) — AI exposure predicts unemployment: https://doi.org/10.1093/pnasnexus/pgaf107
- Acemoglu (2024-25) — Simple Macroeconomics of AI: https://doi.org/10.1093/epolic/eiae042
- IMF (2025) — AI impact on Denmark: https://www.imf.org/en/Publications/selected-issues-papers/Issues/2025/08/25/The-Impact-of-Artificial-Intelligence-on-Denmarks-Labor-Market-569930
- Dauth et al. (2021) — Robot adjustment, Germany: https://doi.org/10.1093/jeea/jvab012
- BIS (2025-26) — EU firm-level AI adoption: https://www.bis.org/publ/work1325.htm
- Eloundou et al. (2024) — GPTs are GPTs exposure index: https://doi.org/10.1126/science.adj0998

---

## APPENDIX B: ACADEMIC LITERATURE MATRIX (22 Papers)

| # | Authors | Year | Category | Method | Key Finding | Contradicts Hypothesis? |
|---|---------|------|----------|--------|-------------|------------------------|
| P1 | Humlum & Vestergaard | 2025 | Empirical/Nordic | DiD + Danish admin registers | Null effects on earnings/hours | YES |
| P2 | Brynjolfsson, Li & Raymond | 2023/25 | Empirical | RCT (staggered rollout) | 14% productivity gain; 34% for novices | Neutral (productivity, not employment) |
| P3 | Hartley, Jolevski, Melo & Moore | 2024-25 | Empirical | Survey + OLS | Small wage effects, null job quantity | YES |
| P4 | Bick, Blandin & Deming | 2024 | Adoption | Survey (RPS, 10K+) | 40% US adults use GenAI; 1.4% work hours | Neutral |
| P5 | Frank, Ahn & Moro | 2025 | Empirical | Ensemble exposure model | AI exposure predicts unemployment (r=0.57) | NO |
| P6 | Chen, Srinivasan & Zakerinia | 2024 | Empirical | DiD on job postings | 24% skill demand drop in automation jobs | NO |
| P7 | Demirer et al. | 2024 | Empirical | 3x RCT (4,867 devs) | 26% task completion gain | Neutral |
| P8 | Acemoglu | 2024-25 | Theory/Macro | Structural model | TFP gains modest (0.53-0.66% over 10yr) | YES (to alarmism) |
| P9 | = P1 | — | Nordic | — | — | — |
| P10 | IMF Staff | 2025 | Nordic | Exposure index + admin | 1/5 Danish workforce at risk | NO |
| P11 | Anonymous | 2025 | Nordic | Job postings panel (Sweden) | AI postings trend in Swedish PES data | Neutral |
| P12 | IMF Staff | 2024 | Causal/Regional | Bartik IV (US) | AI adoption reduces emp/pop ratio | NO |
| P13 | Egana-delSol et al. | 2024 | Small Economy | Exposure index (LAC) | 2-5% fully automatable | NO |
| P14 | Nordregio | 2024 | Welfare State | Comparative admin (Nordic) | Nordic flexicurity maintains resilience | Partial |
| P15 | Dauth, Findeisen, Suedekum & Woessner | 2021 | Welfare/Causal | Shift-share IV (Germany) | Robot displacement offset by service jobs | YES (to net displacement) |
| P16 | Acemoglu & Restrepo | 2019 | Theory | Task decomposition | Displacement vs. reinstatement framework | Framework |
| P17 | Acemoglu & Restrepo | 2022 | Causal | Multiple IV | 50-70% wage inequality from automation | NO (wages, not employment) |
| P18 | Marguerit | 2025 | Causal | Country-level IV | Automation AI displaces low-skill; augmentation AI helps high-skill | NO |
| P19 | Acemoglu, Autor, Hazell & Restrepo | 2022 | Causal/Adoption | Shift-share + SML index | AI firms reduce non-AI hiring | NO |
| P20 | BIS/EIB | 2025-26 | Adoption | IV (US peer rates) | 4% productivity gain; null firm employment | Partial |
| P21 | Eloundou, Manning, Mishkin & Rock | 2024 | Adoption | Rubric + GPT-4 | 46-56% tasks exposed (EXPOSURE ONLY) | Neutral/Projection |
| P22 | Eurostat | 2023-25 | Adoption | Enterprise survey | AI adoption 8->20% EU; Iceland tracked | Neutral/Data |

**Literature verdict:** The 2023-2026 empirical evidence base shows real productivity gains from AI but predominantly null or modest aggregate employment effects. The strongest Nordic study (Denmark) found zero employment displacement. Papers supporting the displacement thesis rely on exposure indices (predictions) or occupation-level vulnerability measures, not observed job loss. The central tension — task restructuring vs. displacement — remains unresolved, with the balance of evidence currently favoring restructuring.

---

*Generated 2026-03-06 by PAI / PANOPTICON REVERSE Phase 1*
*Assessment based on five parallel research agents with live source verification*
*All source URLs verified accessible as of assessment date unless otherwise noted*
