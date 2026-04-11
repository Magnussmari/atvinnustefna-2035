# Atvinnustefna Íslands 2035: Kerfisbundin blinda

### An open-source, computationally verified analysis of Iceland's Employment Policy 2035

> **Status: Work in Progress** — Core analysis and evidence are complete. Documentation is being refined. Contributions, corrections, and challenges are welcome.

---

> *A government employment policy that does not mention "unemployment" is not an employment policy.*

---

## Hvað er þetta? / What is this?

**Á íslensku:** Gagnadrifin greining á *Atvinnustefnu Íslands — vaxtarplani til 2035* og meðfylgjandi *Aðgerðaáætlun 2026-2027*. Stefnan inniheldur enga greiningu á áhættu tengdri sjálfvirknivæðingu og gervigreind. Greiningin er opin til skoðunar, gagnrýni og endurgerðar.

**In English:** A data-driven critical analysis of Iceland's Employment Policy 2035. The policy treats AI exclusively as an economic opportunity while containing zero risk assessment regarding structural unemployment — despite Iceland's own ICT sector already showing measurable displacement signals. Open for scrutiny, challenge, and reproduction.

---

## Objective and Intent

**This is not fear-mongering. This is not a political attack. This is not anti-technology.**

The Atvinnustefna Íslands 2035 contains genuine strengths. Its productivity diagnosis is empirically sound. The STEM investment (ISK 2.3 billion) addresses a real gap. The energy and data center strategy leverages a legitimate competitive advantage. The export diversification agenda is overdue and well-framed.

The critique is specific and narrow: **the strategy does not engage with the risks of AI-driven workforce disruption.** What is missing is the measurement infrastructure, risk assessment, and transition planning that would make the strategy's optimistic assumptions verifiable — and, if they prove wrong, correctable. This analysis is a **supplement to the strategy, not a replacement for it.**

---

## The Five Key Findings

The following five findings are the core of this analysis. Each is independently verifiable. Every claim includes the data, the source, and the method to check it. You can paste this entire section into any AI assistant (Claude, ChatGPT, Gemini, Perplexity) and ask it to verify each claim against the linked sources.

---

### Finding 1: The Textual Silence

**Claim:** Iceland's Employment Policy 2035 does not contain the words "unemployment", "automation", "retraining", "disruption", or "threat" — not once. AI is mentioned three times, all in positive/opportunity framing.

**Data:**

| Term (Icelandic) | English | Occurrences |
|-------------------|---------|-------------|
| gervigreind | artificial intelligence | 3 (all positive) |
| **atvinnuleysi** | **unemployment** | **0** |
| **sjálfvirknivæðing** | **automation** | **0** |
| **endurmenntun** | **retraining** | **0** |
| **endurþjálfun** | **reskilling** | **0** |
| **röskun** | **disruption** | **0** |
| **umbreyting** | **transformation** | **0** |
| **ógn** | **threat** | **0** |
| **hætta** | **danger/risk** | **0** |

14 risk-related terms tested. All 14 confirmed absent.

**Source:** Official PDF from government consultation portal:
https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e

**How to verify:**
```bash
python3 scripts/02_verify_textanalysis.py
# Downloads the PDF from the official URL and reproduces the keyword analysis
```

---

### Finding 2: The ICT Trifecta — Displacement Already Happening

**Claim:** Iceland's ICT sector (NACE J) shows a pattern consistent with productivity displacement: revenue surging while employment falls and vacancies collapse to near zero. No Icelandic institution assembled these three signals into a finding before this analysis.

**Data (2022-2025):**

| Signal | Change | Hagstofa Table |
|--------|--------|----------------|
| Revenue (J62 Computer Services) | **+72%** | FYR04101 |
| Employment | **-1,300 jobs (-11.4%)** | VIN01110 |
| Vacancy rate | **5.4% → 0.3% (-94%)** | JVS00001 |
| Labour productivity | **+10.5%** (highest of any sector) | THJ11011 |

**Why this matters:** If revenue is rising, this is not a downturn. If vacancies are near zero, firms are not seeking replacements — they don't need them. If productivity is at a sector high, firms are producing more with fewer workers. The three signals together are consistent with one explanation: productivity displacement.

**Source:** Hagstofa Íslands (Statistics Iceland) PxWeb API. Raw CSV data included in this repository at `data/iceland-ai-governance-audit/data/raw/`.

**How to verify:** Query tables VIN01110, JVS00001, FYR04101, THJ11011 at https://px.hagstofa.is

---

### Finding 3: The Knowledge-Occupation Collapse

**Claim:** Between 2024 and 2025, Iceland lost 9,300 knowledge-intensive jobs (ISCO groups 1-4: -6.9%) while gaining 6,900 physical and service jobs (ISCO groups 5-9: +7.4%). The economy did not contract — the composition shifted.

**Data (Hagstofa VIN01100, 2024→2025):**

| Occupation Group | 2024 | 2025 | Change |
|-----------------|------|------|--------|
| Managers | 30,000 | 28,000 | -2,000 (-6.7%) |
| Professionals | 58,700 | 54,200 | -4,500 (-7.7%) |
| Associate professionals | 36,000 | 33,800 | -2,200 (-6.1%) |
| Clerical support | 9,600 | 9,000 | -600 (-6.3%) |
| **Total knowledge-intensive** | **134,300** | **125,000** | **-9,300 (-6.9%)** |
| Service and sales | 44,500 | 50,000 | +5,500 (+12.4%) |
| Craft and trades | 20,900 | 21,300 | +400 |
| Machine operators | 9,400 | 9,800 | +400 |
| Elementary occupations | 12,200 | 12,600 | +400 |
| **Total non-knowledge** | **93,000** | **99,900** | **+6,900 (+7.4%)** |

**Why this matters:** The strategy prescribes more STEM education and knowledge-sector investment for an economy where knowledge work is contracting. The prescriptions are inverted relative to the signal.

**Source:** Hagstofa Íslands VIN01100 — Employment by occupation (ISCO), annual.

**How to verify:** Query table VIN01100 at https://px.hagstofa.is. Raw data in `data/iceland-ai-governance-audit/data/raw/employment_by_occupation_annual.csv`.

---

### Finding 4: Iceland Is Flying Blind — The Nordic Measurement Gap

**Claim:** Iceland is the only Nordic country excluded from every key European AI and labour measurement instrument. It has no enterprise AI adoption survey, no worker conditions survey, no linked administrative data, and no union AI agreement.

**Data:**

| Dimension | Denmark | Sweden | Norway | Finland | **Iceland** |
|-----------|---------|--------|--------|---------|-------------|
| Eurostat enterprise AI adoption (isoc_eb_ai) | 42.0% | 35.0% | 28.9% | 37.8% | **Not surveyed** |
| EWCS 2024 worker conditions survey | Yes | Yes | Yes | Yes | **Excluded** |
| Linked administrative data for AI-labour research | DREAM+IDA | LISA | FD-Trygd | Findata | **None** |
| Union AI framework or collective agreement | Hilfr2 + tripartite accord | Teknikföretagen-IF Metall | LO-NHO Basic Agreement | Sector agreements | **None** |
| Occupation-level welfare data | Yes | Yes | Yes | Yes | **No** |
| National AI governance body with labour representation | Yes | Yes | Yes | Yes | **No** |

Additionally, Iceland's own unemployment measurement has a 17% discrepancy between its two official sources (Hagstofa: 5.2% vs. VMST: 3.3% for September 2024), as flagged by Ríkisendurskoðun.

**Sources:**
- Eurostat AI survey: https://ec.europa.eu/eurostat/databrowser/view/isoc_eb_ai/default/table?lang=en
- EWCS 2024: https://www.eurofound.europa.eu/en/surveys-and-data/surveys/european-working-conditions-survey/ewcs-2024
- Ríkisendurskoðun audit: https://www.althingi.is/altext/156/s/0350.html
- Hilfr2 agreement: https://apps.eurofound.europa.eu/platformeconomydb/collective-agreement-on-use-of-ai-and-algorithms-signed-110187
- Norway algorithmic governance: https://feps-europe.eu/wp-content/uploads/2024/11/Algorithmic-governance-in-Norway.pdf

---

### Finding 5: The Institutional Silence — Nobody Is Watching

**Claim:** When Iceland's government published its AI Action Plan for consultation — a document projecting that 130,000 workers (55%) will be "greatly affected" by AI — not a single major labour union submitted a response. Iceland's largest union congress produced zero resolutions on AI.

**Data:**

| Event | Labour Union Participation |
|-------|--------------------------|
| AI Action Plan consultation (Nov 2024, 14-day window) | 12 responses total. **Zero from ASÍ, VR, Efling, BSRB, SFR, or KÍ.** Only BHM (university graduates' union) responded — a 2-page general statement. |
| ASÍ 46th Congress (October 2024) | **Zero AI resolutions** |
| VR annual workplace survey | **Zero AI criteria measured** |
| Icelandic collective agreements | **Zero AI provisions** |

Meanwhile, 25,000 Icelandic workers surveyed by Varða (2026) report: 23% affected by technology change, 36% fear job loss, 45% feel undertrained, 44% report increased work pressure (56% among immigrants).

**Sources:**
- AI Action Plan consultation record: https://island.is/samradsgatt/mal/3862
- Minister's admission of no formal analysis: https://www.althingi.is/altext/154/s/2212.html
- Iceland AI Action Plan (English): https://www.stjornarradid.is/library/04-Raduneytin/Menningar---nyskopunar--og-haskolaraduneytid/Iceland's%20AI%20Action%20Plan%20electronic%20version.pdf
- Varða 2026 survey: https://vinnan.is/ny-skyrsla-vordu-synir-olika-stodu-launafolks-til-ad-maeta-breytingum-a-vinnumarkadi-vegna-ahrifa-taekni-og-loftslagsbreytinga/
- EPRS algorithmic management study (42.3% EU workers exposed): https://www.europarl.europa.eu/RegData/etudes/STUD/2025/774670/EPRS_STU(2025)774670_EN.pdf

---

## Verification Prompt

You can copy the text below and paste it into any AI assistant to independently verify the five findings above:

```
I need you to verify the following five claims about Iceland's Employment 
Policy 2035 ("Atvinnustefna Íslands"). For each claim, check the linked 
source and tell me whether the claim is supported, unsupported, or 
partially supported.

CLAIM 1: The Atvinnustefna Íslands 2035 PDF does not contain the Icelandic 
words "atvinnuleysi" (unemployment), "sjálfvirknivæðing" (automation), 
"endurmenntun" (retraining), or "röskun" (disruption). AI ("gervigreind") 
is mentioned 3 times, all in positive framing.
Source PDF: https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e

CLAIM 2: Iceland's ICT sector (NACE J) revenue grew 72% from 2022-2025 
while employment fell 11.4% (-1,300 jobs) and the vacancy rate collapsed 
from 5.4% to 0.3%.
Source: Hagstofa Íslands tables VIN01110, JVS00001, FYR04101 at https://px.hagstofa.is

CLAIM 3: Between 2024 and 2025, Iceland lost 9,300 knowledge-intensive 
jobs (ISCO groups 1-4) while gaining 6,900 service and physical jobs 
(ISCO groups 5-9).
Source: Hagstofa Íslands table VIN01100 at https://px.hagstofa.is

CLAIM 4: Iceland is excluded from the Eurostat enterprise AI adoption 
survey (isoc_eb_ai) and the Eurofound EWCS 2024 worker conditions survey.
Sources: https://ec.europa.eu/eurostat/databrowser/view/isoc_eb_ai/default/table?lang=en
         https://www.eurofound.europa.eu/en/surveys-and-data/surveys/european-working-conditions-survey/ewcs-2024

CLAIM 5: Iceland's government AI Action Plan consultation (November 2024) 
received zero submissions from major labour unions (ASÍ, VR, Efling, BSRB).
Source: https://island.is/samradsgatt/mal/3862

For each claim, state: SUPPORTED / UNSUPPORTED / PARTIALLY SUPPORTED / 
UNABLE TO VERIFY, and explain your reasoning.
```

---

## International Context

These are the global reference points against which Iceland's omission should be measured:

| Institution | Key Finding | Source |
|-------------|-------------|--------|
| **IMF** (2024) | 40% of global employment exposed to AI; **60% in advanced economies** | [imf.org](https://www.imf.org/en/blogs/articles/2024/01/14/ai-will-transform-the-global-economy-lets-make-sure-it-benefits-humanity) |
| **WEF** (2025) | 92M jobs displaced, 170M created by 2030; **39% of skills obsolete** | [weforum.org](https://www.weforum.org/publications/the-future-of-jobs-report-2025/) |
| **OECD** (2025) | **27% of OECD jobs** at highest automation risk | [oecd.org](https://www.oecd.org/en/publications/oecd-employment-outlook-2025_194a947b-en.html) |
| **ILO** (2025) | 25% of global employment exposed to GenAI; **34% in high-income countries**; women 9.6% vs men 3.5% at highest risk | [ilo.org](https://www.ilo.org/publications/generative-ai-and-jobs-2025-update) |
| **Goldman Sachs** (2023) | **300M full-time jobs** exposed globally; 18% of work automatable | [goldmansachs.com](https://www.goldmansachs.com/insights/articles/generative-ai-could-raise-global-gdp-by-7-percent) |
| **McKinsey** (2023) | 60-70% of employee work activities automatable; **$6.1-7.9T** annual value | [mckinsey.com](https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/the-economic-potential-of-generative-ai-the-next-productivity-frontier) |
| **Challenger** (Mar 2026) | AI led all US layoff reasons: **15,341 cuts (25%)** in one month | [challengergray.com](https://www.challengergray.com/blog/challenger-report-march-cuts-rise-25-from-february-ai-leads-reasons/) |
| **NBER/Duke CFO Survey** (2026) | 750 CFOs project **502,000 AI job cuts** in 2026 (9x increase from 2025) | [fortune.com](https://fortune.com/2026/03/24/cfo-survey-ai-job-cuts-productivity-paradox-2026/) |
| **IMF Denmark Study** (2025) | Country-specific AI labor market analysis — **exactly what Iceland lacks** | [imf.org](https://www.imf.org/en/publications/selected-issues-papers/issues/2025/08/25/the-impact-of-artificial-intelligence-on-denmarks-labor-market-569930) |

### Key Academic Papers

| Paper | Finding | Source |
|-------|---------|--------|
| Humlum & Vestergaard (2025) | Danish admin data: **null effects** on earnings/hours from LLM adoption (important counter-evidence) | [NBER w33777](https://www.nber.org/papers/w33777) |
| Acemoglu (2024) | Task-based model: only 23% of AI-exposed tasks profitably automatable; **inequality will widen** | [MIT PDF](https://economics.mit.edu/sites/default/files/2024-04/The%20Simple%20Macroeconomics%20of%20AI.pdf) |
| Eloundou et al. (2024) | **80%** of US workforce has 10%+ tasks exposed to LLMs | [Science](https://www.science.org/doi/10.1126/science.adj0998) |
| Autor (2024) | AI could **rebuild middle-class jobs** if used as decision support (important optimistic case) | [NBER w32140](https://www.nber.org/system/files/working_papers/w32140/w32140.pdf) |

---

## Project Status

| Component | Status |
|-----------|--------|
| MEGA_REPORT (full analysis, ~1,800 lines) | Complete |
| BLOG_FINAL (Icelandic blog) | Complete — under review |
| Evidence base (10 files) | Complete |
| Bibliography (98 sources with URLs) | Complete — verified |
| Hagstofa data (150,346 rows, 10 CSV files) | Complete |
| Panopticon research (15+ reports) | Complete |
| Python verification scripts (2) | Complete — tested |
| Samráðsgátt submission | Pending |
| Peer review | Open — contributions welcome |

---

## Repository Structure

```
.
├── README.md                    ← You are here
├── METHODOLOGY.md               ← Research protocol and thesis context
├── VERIFICATION_REPORT.md       ← Automated verification results
│
├── MEGA_REPORT.md               ← Full analytical report (English, ~1,800 lines)
├── BLOG_FINAL.md                ← Public blog version (Icelandic)
│
├── evidence/                    ← 10 supporting evidence files
├── bibliography/master.bib      ← 98 BibTeX entries with URLs
├── scripts/                     ← 2 Python verification scripts
├── verification/                ← Auto-generated reports
├── data/iceland-ai-governance-audit/  ← Panopticon project + Hagstofa CSVs
└── archive/                     ← Superseded files
```

**Read the analysis:** Start with [`MEGA_REPORT.md`](MEGA_REPORT.md). For the Icelandic blog version: [`BLOG_FINAL.md`](BLOG_FINAL.md). For counterarguments: [`evidence/07-adversarial-oracle.md`](evidence/07-adversarial-oracle.md).

**Reproduce the findings:**
```bash
pip install requests && brew install poppler   # requirements
python3 scripts/02_verify_textanalysis.py      # reproduces Finding 1
python3 scripts/01_verify_urls.py              # verifies all 94 source URLs
```

---

## Methodology

The research methodology is an evolving AI-assisted framework developed through the author's [MA thesis work](https://www.smarason.is/en/projects/beyond-fragmentation) at the University of Akureyri and ongoing development. It integrates parallel multi-agent research, adversarial review, computational verification, and structured anti-sycophancy protocols. See [`METHODOLOGY.md`](METHODOLOGY.md) for the full protocol.

**Verification status:**

| Check | Result |
|-------|--------|
| Text analysis (14 absent terms) | **14/14 confirmed** |
| URL health (94 sources) | **71 green, 19 bot-blocked (valid in browser), 1 timeout, 3 fixed** |
| Reproducibility | **Full** — 2 Python scripts |
| Adversarial review | **Complete** — 9 counterarguments addressed |
| Falsification standard | **Stated** — Part IX of MEGA_REPORT |

---

## Contributing

This analysis is a contribution to Iceland's employment policy discourse, not a replacement for it. Counterarguments are welcomed — the strongest known ones are already documented.

- **A broken source** — open an issue with the BibTeX key and the correct URL
- **A factual error** — open an issue with the specific claim, the evidence against it, and a source
- **A stronger counterargument** — especially valuable. See `evidence/07-adversarial-oracle.md`
- **Missing context** — open a PR with additional evidence, properly sourced

---

## Author

**Magnús Smári Smárason, MA**
[smarason.is](https://smarason.is) | Akureyri, Iceland

MA in Social Sciences, University of Akureyri (UNAK), defended January 2026. Thesis: [*Beyond Fragmentation: A Life-Value Alternative for AI Governance*](https://www.smarason.is/en/projects/beyond-fragmentation) — examines how AI governance fails through two structural mechanisms: *Responsibility Fog* (the systematic diffusion of accountability across fragmented institutions) and *Cognitive Debt* (the compounding erosion of human judgment through algorithmic dependence). The concepts of Responsibility Fog and measurement blindness that appear in the MEGA_REPORT are direct applications of this thesis work to Icelandic employment policy.

## License

Open source. All data, analysis, and bibliography are freely available for verification, citation, and reuse.

---

*This repository exists because evidence-based policy requires evidence — and because the absence of measurement infrastructure is itself a governance failure, not a neutral gap. The analysis is verifiable, the methodology is documented, the counterarguments are addressed, and the scripts are reproducible. Judge it on its sources.*
