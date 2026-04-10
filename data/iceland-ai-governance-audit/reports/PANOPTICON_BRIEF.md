# PANOPTICON REVERSE — Findings Brief

**Date:** 2026-03-08
**Author:** Magnus Smari Smarason
**Status:** Phase 5 Complete — Verdict: QUALIFIED

---

## What This Investigation Asked

Can a causal chain be traced from AI adoption in Iceland to sector-level job loss to welfare system entry — specifically psychiatric disability claims — within the same demographic cohort, between January 2024 and January 2026?

## The Short Answer

No. The causal chain cannot be closed. But what the investigation found instead may be more important than the original question.

---

## Five Findings That Stand on Their Own

### 1. Iceland Is Flying Blind on AI

Iceland is excluded from the two most important European measurement instruments: the Eurostat enterprise AI adoption survey and the Eurofound European Working Conditions Survey (EWCS 2024). There is no domestic equivalent. The government's AI Action Plan cites "55% of jobs affected" — a figure borrowed from international estimates, never measured locally. The government itself acknowledged this gap by commissioning a baseline study as Action B.1 of the plan — while simultaneously citing projections as established fact.

Iceland has built AI policy on borrowed statistics.

### 2. The ICT Trifecta

The ICT sector (NACE J) shows three signals moving simultaneously in the direction predicted by technology-driven productivity displacement:

| Signal | Change (2022-2025) | Source |
|--------|-------------------|--------|
| Employment | -1,300 jobs (-11.4%) | Hagstofa VIN01110 |
| Revenue (J62 Computer Services) | +72% | Hagstofa FYR04101 |
| Vacancy rate | 5.4% to 0.3% (-94%) | Hagstofa JVS00001 |

Revenue growing. Employment falling. Vacancies collapsing. Firms are producing more with fewer people and are not replacing the workers they shed.

This pattern is inconsistent with a cyclical downturn (revenue would fall), offshoring (revenue would shift), demographic aging (vacancies would rise), or a skills mismatch (vacancies would rise). It is consistent with productivity displacement.

This is the strongest empirical signal in the investigation.

### 3. The Knowledge-Occupation Contraction

Between 2024 and 2025, Iceland's labour market experienced a synchronized contraction of knowledge-intensive occupations:

| Occupation | Change 2024-2025 |
|-----------|-----------------|
| Professionals | -4,500 (-7.7%) |
| Managers | -2,000 (-6.7%) |
| Associate professionals | -2,200 (-6.1%) |
| Clerical workers | -600 (-6.3%) |
| **Total knowledge-intensive** | **-9,300 (-6.9%)** |

During the same period, physical and service occupations grew by +6,900 (+7.4%). The economy did not contract — it polarized. Construction added 3,300 jobs. Tourism added 2,200. Service and sales added 5,500.

This is the classic polarization pattern described in the automation literature: the middle hollows out while the bottom and top diverge.

### 4. The Welfare Acceleration

The disability and rehabilitation system shows a 35-year trend of psychiatric diagnoses outpacing all other categories:

- Psychiatric/stress diagnoses: **+179% growth** (2000-2024)
- All other diagnoses: +26% (same period)
- Women aged 18-49: **+79% prevalence increase**
- Rehabilitation expenditure: **+40% in a single year** (2023-2024)
- Antidepressant use: **#1 globally** at 157 DDD/1,000 inhabitants (OECD)

Whether this connects to AI-driven displacement cannot be established. The welfare system does not publish prior-occupation data for claimants. The data that would link a displaced ICT worker to a subsequent psychiatric disability claim does not exist in any publicly accessible form. This is the missing link the investigation identified from the start and could not close.

### 5. The Institutional Vacuum

When the Icelandic government opened a 14-day consultation on its AI Action Plan in 2024, it received 12 submissions. Zero came from labour unions. Not ASI (the national confederation). Not VR (the largest private-sector union). Not Efling. Not BSRB. Not BHM.

At ASI's 46th Congress in October 2024, zero resolutions addressed AI. VR's annual workplace survey assesses 9 criteria — none mention AI or automation. No Icelandic union has published an AI framework, an AI position paper, or an AI collective agreement provision.

For comparison: Norway's LO-NHO Basic Agreement includes AI provisions. Denmark's Hilfr2 agreement is the world's first AI-specific collective agreement. Iceland has nothing.

Meanwhile, the Varda 2026 survey (n=25,000) — the first quantitative measurement of Icelandic worker experience with technology — found that 23% of workers report their jobs have changed or will change due to technology, 36% of those fear job loss, and 45% feel they have received inadequate training.

The workers know. The institutions are silent.

---

## What the Investigation Could Not Establish

1. **AI is causing the knowledge-occupation contraction.** The 9,300-job loss is real. Whether AI is the cause, a contributing factor, or irrelevant cannot be determined from available data. The ICT trifecta is suggestive but not conclusive.

2. **Workers displaced from knowledge jobs are entering the welfare system.** The welfare data and the labour market data show parallel stress on similar demographics (women 25-49, prime-age workers). But without individual-level linkage data — prior occupation of disability claimants — this remains suggestive correlation.

3. **Iceland's situation is worse than comparable Nordic countries.** The strongest comparable study (Humlum & Vestergaard 2025, Danish administrative registers) found null effects of LLM adoption on earnings and hours. Denmark has better data, stronger flexicurity, and higher AI adoption (42%). The prior should be that Iceland shows similar or weaker effects — but Iceland's measurement infrastructure cannot confirm or deny this.

---

## The Scale Mismatch Problem

The investigation's central puzzle: Workstream A identifies 9,300 knowledge-occupation jobs disappearing. Workstream C can document approximately 22 attributable to corporate AI adoption (Landsbankinn -38 FTE, Islandsbanki -20, Arion Bank +36). The gap between macro signal and micro evidence is a factor of 400x.

Either AI displacement is operating in hundreds of firms making small, undocumented reductions; the 9,300 figure is inflated by non-AI factors (fiscal tightening, LFS sampling variance, reclassification effects); or both.

The honest answer: we do not know.

---

## Confounders That Compete With the Hypothesis

| Factor | Scale | Evidence |
|--------|-------|----------|
| Construction/tourism boom | +5,500 jobs in service/sales alone | Dominant labour market story |
| Foreign national unemployment | 55% of all registered unemployed; rate 8.9% vs 2.3% Icelandic | Drives headline figures |
| Play airline collapse (Sep 2025) | ~420 direct jobs | Contributes to Q4 anomaly |
| 17% measurement gap (Hagstofa vs VMST) | Systematic | All unemployment analysis is confounded |
| 35-year secular psychiatric trend | Predates AI by decades | Welfare acceleration is not new |
| Post-COVID mental health sequelae | Inseparable from AI-era trends | Timeframes overlap |
| LFS sampling variance | ~5,200 respondents | Some cells have wide confidence intervals |

---

## The Falsification Scorecard

The investigation pre-registered 11 falsification tests across 4 workstreams. If FA-1 and FA-2 both triggered, the hypothesis was dead.

| Test | Result | Direction |
|------|--------|-----------|
| FA-1: Physical vs knowledge sector | MIXED | Knowledge occupations -9,300 (supports), but physical sectors growing faster (weakens) |
| FA-2: Seasonality | PARTIAL | Q1 2025 has seasonal component, Q4 2025 breaks the pattern (supports) |
| FA-3: Age distribution | MIXED | Youth dominates rates (weakens), but 25-54 at 4.9% unprecedented (supports) |
| FB-1: Psychiatric welfare trend | CONFIRMED | 179% growth, antidepressant #1 globally (supports) |
| FB-2: Younger cohort | CONFIRMED | 18-49 women +79% (supports) |
| FB-3: Measurement discontinuity | CONFIRMED | 17% gap acknowledged (neutral — methodology finding) |
| FC-1: Corporate AI-headcount link | PARTIALLY CONFIRMED | Landsbankinn explicit, Islandsbanki partial (supports) |
| FC-2: Temporal sequence | INDETERMINATE | No quarterly sector unemployment available |
| FC-3: Iceland in Eurostat AI survey | CONFIRMED ABSENT | Iceland definitively excluded |
| FD-1: Worker experience data | PARTIALLY TESTABLE | Varda 2026 provides first data (supports) |
| FD-2: Burnout attribution | UNTESTABLE | Cannot isolate AI-specific burnout |

**Score: 5 support/reinforce, 2 mixed, 2 indeterminate, 2 weaken.**

The hypothesis was not killed. It was not confirmed. It persists in a qualified state.

---

## The Verdict

**QUALIFIED.** The hypothesis — that AI adoption in Iceland is driving knowledge-sector displacement that feeds into welfare system growth through psychiatric disability — is neither sustained nor falsified.

What the investigation demonstrates is that **the conditions for unmonitored AI displacement exist in Iceland.** No measurement infrastructure to detect it. No institutional response to manage it. No union engagement to contest it. No occupation-level welfare data to trace it.

The absence of evidence is not evidence of absence. It is evidence of institutional blindness.

---

## What Would Close the Case

1. **Prior-occupation data for disability/rehabilitation claimants (2020-2025).** A FOIA request to Tryggingastofnun (TR) for diagnosis-by-prior-occupation cross-tabulation. This is the single missing link.

2. **Iceland included in Eurostat enterprise AI survey.** Would establish domestic adoption rates instead of borrowed estimates.

3. **Linked administrative data study.** Tax records + TR disability records + VMST register — a difference-in-differences study like Humlum & Vestergaard did for Denmark. This requires formal research approval.

4. **Sector-level burnout attribution.** Prosent workplace survey data with AI/digital tool exposure as a variable.

---

## Key Sources

- Hagstofa PxWeb API: VIN00920, VIN01100, VIN01110, JVS00001, FYR04101, VIN10022, THJ11011, FYR08001
- Rikisendurskodun: "Atvinnuleysi og vinnumarkadsurraedi" (Dec 2024)
- Varda 2026: Rannsoknastofnun vinnumarkadarins (n=25,000, Feb 2026)
- Landsbankinn Annual & Sustainability Report 2024
- Iceland AI Action Plan 2025-2027 (Stjornarradid)
- Samradsgatt: mal/3862 (12 consultation submissions)
- Humlum & Vestergaard (2025): NBER WP 33777
- Acemoglu (2024-25): "The Simple Macroeconomics of AI"
- Thorlacius et al. (2010): Disability trends (PubMed 20433325)
- VMST Mass Layoff Register: Feb 2026 (24 IT + 45 research positions)
- NHWStat: Nordic antidepressant series (nhwstat.org)
- Halldorsson (2025): AI and the Labor Market (Skemman)

---

*The hypothesis lives in a superposition of plausible-but-unproven. The data that would collapse it into sustained or falsified does not publicly exist.*
