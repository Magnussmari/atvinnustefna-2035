# Research Methodology

## The Smarason Method Applied to Policy Analysis

This research was conducted using the [Smarason Method](https://smarason.is) — a systematic AI-assisted research methodology developed by the author. The method adapts cognitive patterns from emergency services (situational awareness, triage, parallel sector execution, adversarial debriefing) to research at scale.

This project was executed at **Tier C (Production)** — the highest rigour level, with full verification, adversarial review, and reproducible artifacts.

---

## Research Timeline

| Phase | Time | Activity |
|-------|------|----------|
| Phase 1 | Jan–Mar 2026 | Panopticon investigation: 6-pillar audit of Iceland's AI governance, 10 Hagstofa tables, ~150,000 data rows extracted via PxWeb API |
| Phase 2 | Apr 10 2026 | Government publishes Atvinnustefna results on samráðsgátt |
| Phase 3 | Apr 10 2026 | 7-sector parallel research swarm deployed: AI layoffs, institutional reports, Iceland vulnerability, international policy, reskilling, academic literature, adversarial review |
| Phase 4 | Apr 10 2026 | PDF text extraction and keyword frequency analysis of Atvinnustefna document |
| Phase 5 | Apr 10 2026 | Synthesis, bibliography consolidation, Python verification pipeline |
| Phase 6 | Apr 10 2026 | URL verification (94 sources), text analysis reproduction, final report |

---

## Data Sources and Collection Methods

### Icelandic Administrative Data (Hagstofa Íslands)
- **Method:** PxWeb API queries to px.hagstofa.is
- **Tables used:** VIN01110 (employment by sector), VIN01100 (employment by occupation), VIN00920 (unemployment), JVS00001 (vacancies), FYR04101 (VAT turnover), THJ11011 (labour productivity), FYR08001 (ICT structural stats), LAU04109 (wages)
- **Total rows:** ~150,000
- **Coverage:** 2019–2025

### Government Documents
- **Method:** Downloaded from samráðsgátt (island.is), stjórnarráðið, and Althingi records
- **Documents:** Vaxtarplan 2035, Aðgerðaáætlun 2026-2027, Stöðugreining, AI Action Plan 2024-2026
- **Text analysis:** pdftotext extraction + automated keyword search (see `scripts/02_verify_textanalysis.py`)

### International Institutional Reports
- **Method:** WebSearch + WebFetch via Claude Code, verified against source documents
- **Institutions:** WEF, IMF, OECD, ILO, Goldman Sachs, McKinsey, Challenger Gray & Christmas, NBER
- **Coverage:** 2023–2026

### Corporate Evidence
- **Method:** Annual reports (Landsbankinn, Íslandsbanki, Arion Bank), news coverage, CEO statements
- **Companies analysed:** IBM, Klarna, Amazon, Microsoft, Salesforce, Google, Chegg, Duolingo, Advania

---

## Anti-Sycophancy Protocol

Every research sector received the instruction:

> *"Identify any evidence encountered during research that undermines, contradicts, or complicates the research objective. Do not omit findings because they are inconvenient. Report disconfirming evidence in a dedicated section, clearly labelled."*

The synthesis explicitly includes a section on what the evidence says **against** the thesis.

## Adversarial Oracle

A dedicated adversarial agent attacked the thesis from 9 angles:

1. The Luddite Fallacy (strongest counterargument)
2. Small Economy Advantage
3. WEF Net Positive Projection
4. "AI Washing" / Overstated Attribution
5. Vision Document Flexibility
6. Iceland's Prior Automation Survival
7. Tourism Physical Presence
8. Data Center Strategy
9. Technology Too Fast for Policy

Each counterargument was rated by strength and the response documented. See `evidence/07-adversarial-oracle.md`.

## Falsification Standard

The MEGA_REPORT explicitly states what evidence would disprove the thesis (Part IX, Section 9.3):

1. If Iceland's enterprise AI adoption is measurably below EU average
2. If the knowledge-occupation contraction is explained by non-AI factors with evidence
3. If the ICT trifecta reflects non-displacement factors with evidence
4. If the welfare expansion is driven by factors disconnected from labor disruption

None of these can be verified with existing Icelandic data — which is itself a finding.

---

## Verification Pipeline

### Automated Verification
| Script | Purpose | Command |
|--------|---------|---------|
| `01_verify_urls.py` | Check all 94 bibliography URLs | `python3 scripts/01_verify_urls.py` |
| `02_verify_textanalysis.py` | Download PDF, reproduce keyword analysis | `python3 scripts/02_verify_textanalysis.py` |

### Requirements
```
Python 3.10+
pip install requests
brew install poppler    # for pdftotext (macOS)
```

### Results
- **URL verification:** 71/94 GREEN, 19 bot-blocked (valid in browser), 1 timeout, 3 fixed
- **Text analysis:** 14/14 absent terms confirmed. 3 AI mentions confirmed positive-only.

---

## System

- **Platform:** PAI (Personal AI Infrastructure) v2.4
- **Engine:** Claude Code with Claude Opus 4.6 (1M context)
- **Research agents:** 7 parallel sectors + adversarial oracle
- **Web searches:** ~100+ across all sectors
- **Total bibliography:** 98 verified entries with URLs

---

*Magnús Smári Smárason, MA | [smarason.is](https://smarason.is) | April 2026*
