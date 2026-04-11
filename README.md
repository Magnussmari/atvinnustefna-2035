# Atvinnustefna Íslands 2035: Kerfisbundin blinda

### An open-source, computationally verified analysis of Iceland's Employment Policy 2035

> **Status: Work in Progress** — This repository is under active development. The core analysis (MEGA_REPORT) and all evidence are complete. Source verification, bibliography, and documentation are being refined. Contributions, corrections, and challenges are welcome.

---

> *A government employment policy that does not mention "unemployment" is not an employment policy.*

---

## Hvað er þetta? / What is this?

**Á íslensku:** Þetta er gagnadrifin greining á *Atvinnustefnu Íslands — vaxtarplani til 2035* og meðfylgjandi *Aðgerðaáætlun 2026-2027*. Greiningin sýnir að stefnan inniheldur enga greiningu á áhættu tengdri sjálfvirknivæðingu og gervigreind — þrátt fyrir að íslenski tæknigeirinn sé þegar að sýna merki um framleiðnitilfærslu, og þrátt fyrir að allar helstu alþjóðlegar stofnanir hafi birt áhættumat. Greiningin er opin til skoðunar, gagnrýni og endurgerðar.

**In English:** This is a data-driven critical analysis of Iceland's Employment Policy 2035 and its accompanying Action Plan 2026-2027. It demonstrates that the policy treats AI exclusively as an economic opportunity while containing zero risk assessment regarding structural unemployment — despite Iceland's own ICT sector already showing measurable displacement signals, and despite every major international institution having published employment risk frameworks. The analysis is open for scrutiny, challenge, and reproduction.

---

## Objective and Intent

**This is not fear-mongering. This is not a political attack. This is not anti-technology.**

The Atvinnustefna Íslands 2035 contains genuine strengths. Its productivity diagnosis is empirically sound. The STEM investment (ISK 2.3 billion) addresses a real gap. The energy and data center strategy leverages a legitimate competitive advantage. The export diversification agenda is overdue and well-framed.

The critique in this repository is specific and narrow: **the strategy does not engage with the risks of AI-driven workforce disruption.** It mentions AI three times — all as opportunity. It does not mention unemployment, automation, retraining, or disruption even once. Every major international institution (IMF, OECD, WEF, ILO) has published AI employment risk assessments. Iceland has none.

This analysis positions itself as a **supplement to the strategy, not a replacement for it.** The strategy is good. The data foundation it rests on is incomplete. What is missing is the measurement infrastructure, risk assessment, and transition planning that would make the strategy's optimistic assumptions verifiable — and, if they prove wrong, correctable.

The author invites all economists, policymakers, unions, and technology practitioners to test the data, challenge the findings, and propose better interpretations. The strongest known counterarguments are already documented in this repository ([evidence/07-adversarial-oracle.md](evidence/07-adversarial-oracle.md)).

---

## The Three Key Findings

### 1. The Document Says Nothing About Risk

Automated text extraction of the [policy PDF](https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e) reveals:

| Term (Icelandic) | English | Occurrences |
|-------------------|---------|-------------|
| gervigreind | artificial intelligence | 3 (all positive) |
| **atvinnuleysi** | **unemployment** | **0** |
| **sjálfvirknivæðing** | **automation** | **0** |
| **endurmenntun** | **retraining** | **0** |
| **röskun** | **disruption** | **0** |
| **ógn** | **threat** | **0** |

Reproduce this yourself: `python3 scripts/02_verify_textanalysis.py`

### 2. Iceland's ICT Sector Is Already Displacing Workers

Hagstofa Íslands data (2022-2025) assembled from three separate statistical tables:

| Signal | Change | Source |
|--------|--------|--------|
| Revenue (J62) | **+72%** | Hagstofa FYR04101 |
| Employment | **-11.4%** (-1,300 jobs) | Hagstofa VIN01110 |
| Vacancy rate | **-94%** (5.4% → 0.3%) | Hagstofa JVS00001 |
| Productivity | **+10.5%** (sector high) | Hagstofa THJ11011 |

No Icelandic institution assembled these three signals into a finding before this analysis.

### 3. Iceland Is the Only Nordic Country Flying Blind

| Dimension | DK | SE | NO | FI | **IS** |
|-----------|----|----|----|----|--------|
| Eurostat AI survey | 42% | 35% | 29% | 38% | **N/A** |
| EWCS worker survey | Yes | Yes | Yes | Yes | **No** |
| Linked admin data | DREAM | LISA | FD-Trygd | Findata | **None** |
| Union AI agreement | Yes | Yes | Yes | Yes | **None** |

---

## Project Status

| Component | Status |
|-----------|--------|
| MEGA_REPORT (full analysis) | Complete |
| BLOG_FINAL (Icelandic blog) | Complete — under review |
| Evidence base (10 files) | Complete |
| Bibliography (98 sources) | Complete — URLs verified |
| Hagstofa data (150,346 rows) | Complete |
| Panopticon research (15+ reports) | Complete |
| Python verification scripts | Complete — tested |
| Samráðsgátt submission | Pending |
| Peer review | Open — contributions welcome |
| GitHub publication | In progress |

---

## Repository Structure

```
.
├── README.md                    ← You are here
├── METHODOLOGY.md               ← How the research was conducted
├── VERIFICATION_REPORT.md       ← Automated verification results
├── .gitignore
│
├── MEGA_REPORT.md               ← Full analytical report (English, ~1,800 lines)
│                                   10 parts + 9 appendices with Hagstofa data
├── BLOG_FINAL.md                ← Public blog version (Icelandic)
│
├── evidence/                    ← Supporting evidence (10 files)
│   ├── 01-ai-layoffs-data.md        Company-specific layoff data 2024-2026
│   ├── 02-document-textanalysis.md  PDF text extraction results
│   ├── 03-institutional-reports.md  WEF, IMF, OECD, ILO, Goldman, McKinsey
│   ├── 04-iceland-vulnerability.md  Iceland economic exposure analysis
│   ├── 06-synthesis.md              Cross-sector synthesis
│   ├── 07-adversarial-oracle.md     Counterarguments ranked by strength
│   ├── 07-gap-analysis.md           What remains unverified
│   ├── 08-data-extraction.md        Raw data from 3 government documents
│   ├── 09-international-evidence.md International AI displacement data
│   └── 10-panopticon-gaps.md        47 specific gaps identified in report
│
├── bibliography/
│   └── master.bib               ← 98 BibTeX entries with URLs
│
├── scripts/
│   ├── 01_verify_urls.py         ← Checks all URLs in bibliography
│   └── 02_verify_textanalysis.py ← Downloads PDF, reproduces keyword analysis
│
├── verification/                 ← Auto-generated by scripts above
│   ├── url_health_report.md
│   └── textanalysis_report.md
│
├── data/
│   └── iceland-ai-governance-audit/  ← Panopticon research project
│       ├── data/raw/                    10 Hagstofa CSV files (150,346 rows)
│       ├── reports/                     15+ analytical reports
│       ├── data-requests/               Hagstofa data request templates
│       ├── scripts/                     PxWeb extraction scripts
│       ├── graph/                       Neo4j knowledge graph (Cypher)
│       └── docs/                        Mission plans, data dictionary, samráð
│
└── archive/                      ← Superseded and auxiliary files
```

---

## Quick Start

### Read the analysis
1. **Start here:** [`MEGA_REPORT.md`](MEGA_REPORT.md) — the full clinical deconstruction
2. **Icelandic blog:** [`BLOG_FINAL.md`](BLOG_FINAL.md)
3. **Counterarguments:** [`evidence/07-adversarial-oracle.md`](evidence/07-adversarial-oracle.md)

### Reproduce the key findings
```bash
# Requirements
pip install requests
brew install poppler          # macOS, for pdftotext

# Reproduce the text analysis (downloads PDF from official government URL)
python3 scripts/02_verify_textanalysis.py

# Verify all 94 bibliography URLs
python3 scripts/01_verify_urls.py
```

### Verify the Hagstofa data
The raw CSV data is in `data/iceland-ai-governance-audit/data/raw/`. The extraction scripts are in `data/iceland-ai-governance-audit/scripts/`. You can independently verify any figure by querying [px.hagstofa.is](https://px.hagstofa.is) (tables VIN01110, VIN01100, JVS00001, FYR04101, THJ11011).

---

## Primary Sources

### Icelandic Government
| Document | Link |
|----------|------|
| Atvinnustefna 2035 (samráðsgátt) | [island.is/samradsgatt/mal/4111](https://island.is/samradsgatt/mal/4111) |
| Atvinnustefna PDF | [samradapi.island.is](https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e) |
| AI Action Plan 2025-2027 (English) | [stjornarradid.is](https://www.stjornarradid.is/library/04-Raduneytin/Menningar---nyskopunar--og-haskolaraduneytid/Iceland's%20AI%20Action%20Plan%20electronic%20version.pdf) |
| Minister's admission (Þingskjal 2212/154) | [althingi.is](https://www.althingi.is/altext/154/s/2212.html) |
| Ríkisendurskoðun unemployment audit | [althingi.is](https://www.althingi.is/altext/156/s/0350.html) |

### International Institutions
| Report | Link |
|--------|------|
| WEF Future of Jobs 2025 | [weforum.org](https://www.weforum.org/publications/the-future-of-jobs-report-2025/) |
| IMF: AI and the Global Economy (2024) | [imf.org](https://www.imf.org/en/blogs/articles/2024/01/14/ai-will-transform-the-global-economy-lets-make-sure-it-benefits-humanity) |
| IMF: AI Impact on Denmark's Labor Market | [imf.org](https://www.imf.org/en/publications/selected-issues-papers/issues/2025/08/25/the-impact-of-artificial-intelligence-on-denmarks-labor-market-569930) |
| OECD Employment Outlook 2025 | [oecd.org](https://www.oecd.org/en/publications/oecd-employment-outlook-2025_194a947b-en.html) |
| ILO: Generative AI and Jobs (2025) | [ilo.org](https://www.ilo.org/publications/generative-ai-and-jobs-2025-update) |
| Challenger March 2026 Report | [challengergray.com](https://www.challengergray.com/blog/challenger-report-march-cuts-rise-25-from-february-ai-leads-reasons/) |
| NBER/Duke CFO Survey (w34984) | [fortune.com](https://fortune.com/2026/03/24/cfo-survey-ai-job-cuts-productivity-paradox-2026/) |
| EPRS: Algorithmic Management (PE 774.670) | [europarl.europa.eu](https://www.europarl.europa.eu/RegData/etudes/STUD/2025/774670/EPRS_STU(2025)774670_EN.pdf) |

### Academic
| Paper | Link |
|-------|------|
| Humlum & Vestergaard 2025 — Danish null result | [NBER w33777](https://www.nber.org/papers/w33777) |
| Acemoglu 2024 — Simple Macroeconomics of AI | [MIT](https://economics.mit.edu/sites/default/files/2024-04/The%20Simple%20Macroeconomics%20of%20AI.pdf) |
| Eloundou et al. 2024 — GPTs are GPTs | [Science](https://www.science.org/doi/10.1126/science.adj0998) |
| Autor 2024 — Applying AI to Rebuild Middle Class Jobs | [NBER w32140](https://www.nber.org/system/files/working_papers/w32140/w32140.pdf) |

### Icelandic Labour Research
| Source | Link |
|--------|------|
| Varða 2026 worker survey (n=25,000) | [vinnan.is](https://vinnan.is/ny-skyrsla-vordu-synir-olika-stodu-launafolks-til-ad-maeta-breytingum-a-vinnumarkadi-vegna-ahrifa-taekni-og-loftslagsbreytinga/) |
| Landsbankinn Annual Report 2024 | [arsskyrsla.landsbankinn.is](https://arsskyrsla.landsbankinn.is/en) |
| Hagstofa Íslands PxWeb | [px.hagstofa.is](https://px.hagstofa.is) |

Full bibliography: [`bibliography/master.bib`](bibliography/master.bib) (98 entries)

---

## Methodology

The research methodology used here is an evolving AI-assisted research framework developed through the author's [MA thesis work](https://www.smarason.is/en/projects/beyond-fragmentation) at the University of Akureyri and ongoing development. The method integrates parallel multi-agent research, adversarial review, computational verification, and structured anti-sycophancy protocols.

See [`METHODOLOGY.md`](METHODOLOGY.md) for the full research protocol, including:
- Anti-sycophancy protocol
- Adversarial Oracle design
- Falsification standard (what would disprove the thesis)
- Verification pipeline

---

## Verification

| Check | Result |
|-------|--------|
| Text analysis (14 absent terms) | **14/14 confirmed** |
| URL health (94 sources) | **71 green, 19 bot-blocked (valid in browser), 1 timeout, 3 fixed** |
| Reproducibility | **Full** — 2 Python scripts |
| Adversarial review | **Complete** — 9 counterarguments addressed |
| Falsification standard | **Stated** — Part IX of MEGA_REPORT |

See [`VERIFICATION_REPORT.md`](VERIFICATION_REPORT.md) for details.

---

## Contributing

This analysis positions itself as a contribution to Iceland's employment policy discourse, not a replacement for it. Counterarguments are welcomed — the strongest known ones are already documented.

If you find:
- **A broken source** — open an issue with the BibTeX key and the correct URL
- **A factual error** — open an issue with the specific claim, the evidence against it, and a source
- **Missing context** — open a PR with additional evidence, properly sourced
- **A stronger counterargument** — this is especially valuable. See `evidence/07-adversarial-oracle.md` for the current set.

---

## Author

**Magnús Smári Smárason, MA**
[smarason.is](https://smarason.is) | Akureyri, Iceland

MA in Social Sciences, University of Akureyri (UNAK), defended January 2026. Thesis: [*Beyond Fragmentation: A Life-Value Alternative for AI Governance*](https://www.smarason.is/en/projects/beyond-fragmentation) — examines how AI governance fails not through regulatory gaps but through two structural mechanisms: *Responsibility Fog* (the systematic diffusion of accountability across fragmented institutions) and *Cognitive Debt* (the compounding erosion of human judgment through algorithmic dependence). The concepts of Responsibility Fog and measurement blindness that appear in the MEGA_REPORT are direct applications of this thesis work to Icelandic employment policy.

## License

Open source. All data, analysis, and bibliography are freely available for verification, citation, and reuse.

---

*This repository exists because evidence-based policy requires evidence — and because the absence of measurement infrastructure is itself a governance failure, not a neutral gap. The analysis is verifiable, the methodology is documented, the counterarguments are addressed, and the scripts are reproducible. Judge it on its sources.*
