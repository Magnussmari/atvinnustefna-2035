# DATA DICTIONARY — Panopticon Reverse
## Hagstofa PxWeb Extracts

**Project:** Panopticon Reverse — AI Adoption / Labour Market / Welfare State Nexus (Iceland)
**Maintainer:** Scripts: `scripts/hagstofa_pxweb.py`
**Last Updated:** 2026-03-07
**Document Type:** Technical Reference

---

## Table of Contents

1. [API Overview](#api-overview)
2. [Data Freshness](#data-freshness)
3. [JSON-stat2 Format and Dimension Ordering](#json-stat2-format-and-dimension-ordering)
4. [Table Reference](#table-reference)
   - [VIN00920 — unemployment_quarterly.csv](#vin00920--unemployment_quarterlycsv)
   - [VIN01110 — employment_by_sector_annual.csv](#vin01110--employment_by_sector_annualcsv)
   - [VIN01100 — employment_by_occupation_annual.csv](#vin01100--employment_by_occupation_annualcsv)
   - [JVS00001 — vacancies_quarterly.csv](#jvs00001--vacancies_quarterlycsv)
   - [FYR04101 — vat_turnover_monthly.csv](#fyr04101--vat_turnover_monthlycsv)
   - [VIN02003 — wages_by_sector_occupation_annual.csv](#vin02003--wages_by_sector_occupation_annualcsv)
   - [LAU04109 — wage_index_quarterly.csv](#lau04109--wage_index_quarterlycsv)
   - [VIN10022 — register_employment_monthly.csv](#vin10022--register_employment_monthlycsv)
   - [THJ11011 — labour_productivity_annual.csv](#thj11011--labour_productivity_annualcsv)
   - [FYR08001 — ict_structural_stats_annual.csv](#fyr08001--ict_structural_stats_annualcsv)
5. [Adding New Tables](#adding-new-tables)
6. [Known Limitations and Caveats](#known-limitations-and-caveats)

---

## API Overview

**Base URL:**
```
https://px.hagstofa.is/pxen/api/v1/en
```

**Authentication:** None required. The Hagstofa PxWeb API is publicly accessible without credentials.

**Request method:** `POST`

**Content-Type:** `application/json`

**Endpoint pattern:**
```
POST https://px.hagstofa.is/pxen/api/v1/en/{table_path}
```

Note: The script uses the English endpoint (`pxen`). The Icelandic endpoint (`pxis`) also works but returns Icelandic column headers.

Where `{table_path}` is the full path to the `.px` file, e.g.:
```
Samfelag/vinnumarkadur/vinnumarkadsrannsokn/2_arsfjordungstolur/VIN00920.px
```

**Request body format (JSON):**
```json
{
  "query": [
    {
      "code": "DimensionCode",
      "selection": {
        "filter": "item",
        "values": ["0", "1", "2"]
      }
    }
  ],
  "response": {
    "format": "json-stat2"
  }
}
```

- `filter: "item"` selects specific values by their index codes.
- `filter: "all"` with `values: ["*"]` selects all available values for a dimension.
- Omitting a dimension from the query body selects all values for that dimension (default behaviour).

**Response format:** JSON-stat2 (see section below)

**Rate limits:** No documented rate limit. Be respectful — no concurrent requests.

---

## Data Freshness

Hagstofa updates its PxWeb tables on variable schedules depending on source survey:

| Source Type | Typical Update Frequency | Lag |
|---|---|---|
| Labour Force Survey (vinnumarkaðsrannsókn) | Quarterly | ~8-10 weeks after reference quarter ends |
| Job Vacancy Survey (lausstörf) | Quarterly | ~6 weeks after reference quarter ends |
| VAT register (veltutölur) | Monthly | ~2-3 months lag |
| Wage register (laun) | Annual/Quarterly | Annual: ~6 months; Quarterly index: ~6 weeks |
| Administrative register (vinnuaflsskrá) | Monthly | ~4-6 weeks |
| National Accounts productivity | Annual | ~12-18 months lag (provisional then revised) |
| ICT structural statistics | Annual | ~12-18 months lag |

**Practical guidance:** Re-run `hagstofa_pxweb.py` at the start of each new analysis phase to capture the latest available data. The quarterly unemployment table (VIN00920) is the most time-sensitive for this project.

**Coverage note:** Hagstofa welfare tables (not captured here) stop at 2022 as of the mission plan date. This project does not have a welfare extract via PxWeb — welfare data is sourced separately from TR PowerBI.

---

## JSON-stat2 Format and Dimension Ordering

### Background

The Hagstofa API returns data in **JSON-stat2** format. In this format, the response contains:

- `id` — ordered list of dimension names
- `size` — number of values in each dimension, in the same order as `id`
- `dimension` — metadata for each dimension (labels, category maps)
- `value` — flat array of all data values in **row-major order** (C order)

### Row-Major Dimension Ordering (Critical)

The `value` array is laid out such that the **last dimension in `id` varies fastest**. This means to correctly index into the flat array, dimensions must be iterated in the order they appear in `id`, with the rightmost dimension changing most rapidly.

**Example:** If `id = ["Quarter", "Region", "Sex", "Age", "Unit"]` and `size = [90, 3, 3, 4, 2]`, then:

```
value index = Age_idx * (3 * 2)
            + Region_idx * (3 * 4 * 2)
            + Quarter_idx * (3 * 3 * 4 * 2)
            + Sex_idx * (4 * 2)
            + Unit_idx * 1
```

### Bug That Was Fixed

An earlier version of `hagstofa_pxweb.py` incorrectly treated the first dimension as fastest-varying (column-major / Fortran order) when unpacking the `value` array. This produced silently wrong data: values parsed successfully but mapped to wrong dimension combinations. The fix (2026-03-07) reverses the decomposition order so the last dimension varies fastest.

**Verification check:** After any change to the extraction logic, cross-check a known cell (e.g., 2003Q1 total unemployment rate for both sexes, all Iceland, age 16-74 should be ~4%) against the Hagstofa web table browser at `https://px.hagstofa.is/pxen/pxweb/en/`.

### Converting JSON-stat2 to CSV

The extraction script converts JSON-stat2 to CSV by:

1. Reading dimension order from `response["id"]` (canonical ordering)
2. For each flat index, decomposing into per-dimension indices using reversed modular arithmetic
3. Mapping dimension index codes to human-readable labels via `response["dimension"][dim]["category"]["label"]`
4. Writing to CSV with Python's `csv` module (proper quoting for commas in labels)

No pandas or external dependencies required — stdlib only.

---

## Table Reference

---

### VIN00920 — unemployment_quarterly.csv

| Field | Value |
|---|---|
| Table ID | VIN00920 |
| CSV filename | `data/unemployment_quarterly.csv` |
| PxWeb path | `Samfelag/vinnumarkadur/vinnumarkadsrannsokn/2_arsfjordungstolur/VIN00920.px` |
| Frequency | Quarterly |
| Time coverage | 2003Q1 to present |
| Row count | 6,624 |
| Workstream | A (FA-1, FA-2, FA-3) |

**Description:**
Unemployment statistics from the Icelandic Labour Force Survey (vinnumarkaðsrannsókn), aggregated to quarterly frequency. Covers unemployment rates and estimated headcounts broken down by region, sex, and age group. This is the primary time-series table for tracking pre- and post-AI-adoption unemployment dynamics.

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `quarter` | Ársfjórðungur | Reference quarter in ISO format | `2003Q1`, `2024Q4` |
| `region` | Landsvæði | Geographic region of Iceland | `Allt landið` (All Iceland), `Höfuðborgarsvæðið` (Capital Region), `Landsbyggðin` (Rural) |
| `sex` | Kyn | Sex | `Alls` (Both), `Karlar` (Male), `Konur` (Female) |
| `age_group` | Aldur | Age group | `16-74 ára`, `16-24 ára`, `25-54 ára`, `55-74 ára` |
| `unit` | Eining | Whether value is a rate or headcount | `Atvinnuleysi (%)` (rate), `Fjöldi á vinnumarkaði (þús.)` (estimated thousands) |
| `value` | — | Numeric observation | `3.6`, `12.4` |

**Filter applied:**
```json
[
  {"code": "Aldur", "selection": {"filter": "item", "values": ["0","1","2","3"]}},
  {"code": "Kyn",   "selection": {"filter": "item", "values": ["0","1","2"]}}
]
```
All four age groups (16-74, 16-24, 25-54, 55-74) and all three sex categories (both, male, female) are included. This enables youth unemployment analysis (16-24), prime-age analysis (25-54), and total comparisons.

**Key use cases:**
- FA-1: Establish baseline unemployment trend 2003-2019
- FA-2: Identify structural break post-2020 (COVID confound) and post-2022 (AI adoption phase)
- FA-3: Disaggregate by age to test whether youth or prime-age workers show differential effects

**Caveats:**
- Labour Force Survey is sample-based; small regions and sub-groups have higher sampling error.
- Quarterly figures are not seasonally adjusted in the raw extract; seasonal adjustment must be applied analytically.
- COVID-19 (2020Q1-2021Q4) creates a structural break that must be controlled for in any regression.
- The survey definition of unemployment follows ILO standards (actively seeking work), which may undercount discouraged workers who exit the labour force.

---

### VIN01110 — employment_by_sector_annual.csv

| Field | Value |
|---|---|
| Table ID | VIN01110 |
| CSV filename | `data/employment_by_sector_annual.csv` |
| PxWeb path | `Samfelag/vinnumarkadur/vinnumarkadsrannsokn/3_arstolur/VIN01110.px` |
| Frequency | Annual |
| Time coverage | Available from early 2000s to latest survey year |
| Row count | 2,590 |
| Workstream | A (sector-level analysis) |

**Description:**
Annual employment counts by NACE economic sector from the Labour Force Survey. Used for sector-level decomposition of employment change — identifying which industries gained or shed workers during the AI adoption window.

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `year` | Ár | Reference year | `2010`, `2023` |
| `nace_sector` | Atvinnugrein | NACE Rev. 2 sector classification | `Sjávarútvegur` (Fishing), `Upplýsing og fjarskipti` (ICT), `Fjármálastarfsemi` (Finance) |
| `sex_region` | Kyn og landsvæði | Combined sex and region dimension | `Alls` (Total), various combinations |
| `value` | — | Employed persons (thousands) | `18.4`, `42.1` |

**Filter applied:**
```json
[
  {"code": "Kyn og landsvæði", "selection": {"filter": "item", "values": ["0"]}}
]
```
Only the total (all sexes, all regions) row is extracted to keep the dataset manageable. Sex-disaggregated sector data can be extracted separately if needed.

**Key use cases:**
- Map employment levels by sector across the full time series
- Calculate year-on-year sector employment change
- Identify sectors contracting in absolute terms during AI adoption period (2022-2025)
- Cross-reference against VIN10022 (monthly register) for higher-frequency confirmation

**Caveats:**
- NACE sector coding may shift between survey years; verify that sector labels are consistent across the full time series before computing changes.
- Annual frequency means a 12-month lag between event and confirmed data; use VIN10022 for more recent signals.
- Sample-based estimates; small sectors (e.g., mining) have wide confidence intervals.

---

### VIN01100 — employment_by_occupation_annual.csv

| Field | Value |
|---|---|
| Table ID | VIN01100 |
| CSV filename | `data/employment_by_occupation_annual.csv` |
| PxWeb path | `Samfelag/vinnumarkadur/vinnumarkadsrannsokn/3_arstolur/VIN01100.px` |
| Frequency | Annual |
| Time coverage | Available from early 2000s to latest survey year |
| Row count | 1,400 |
| Workstream | A (occupation polarization analysis) |

**Description:**
Annual employment counts by ISCO occupation group from the Labour Force Survey. Critical for testing the occupation polarization hypothesis — whether routine-cognitive and routine-manual occupations are contracting relative to non-routine cognitive (managerial, professional) and non-routine manual (care, trades) occupations, consistent with AI-driven task displacement.

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `year` | Ár | Reference year | `2010`, `2023` |
| `isco_group` | Starfsgrein | ISCO-08 major or sub-major group | `Stjórnendur` (Managers, ISCO 1), `Sérfræðingar` (Professionals, ISCO 2), `Þjónustufólk` (Service workers, ISCO 5), `Skrifstofufólk` (Clerks, ISCO 4) |
| `sex` | Kyn | Sex | `Alls` (Both), `Karlar` (Male), `Konur` (Female) |
| `value` | — | Employed persons (thousands) | `8.2`, `23.7` |

**Filter applied:**
```json
[
  {"code": "Kyn", "selection": {"filter": "item", "values": ["0"]}}
]
```
Both sexes total only. Sex disaggregation can be added if the gender dimension of occupation change is needed.

**Key use cases:**
- Test occupation polarization: are ISCO 3 (technicians) and ISCO 4 (clerks) contracting relative to ISCO 2 (professionals)?
- Map occupational exposure to AI tools against employment change
- Cross-reference with Acemoglu/Autor task-content frameworks adapted to Icelandic occupational mix
- Track whether ISCO 4 (clerical) employment has declined post-LLM adoption (2022+)

**Caveats:**
- ISCO-08 mapping to AI exposure is an analytical overlay, not in the raw data. Exposure scores (e.g., from Felten et al. or Eloundou et al.) must be merged in analytically.
- Sample sizes for individual ISCO groups in Iceland are small; confidence intervals are wide for minor groups.
- No sub-major group breakdown is guaranteed; available granularity depends on what Hagstofa publishes in this table.

---

### JVS00001 — vacancies_quarterly.csv

| Field | Value |
|---|---|
| Table ID | JVS00001 |
| CSV filename | `data/vacancies_quarterly.csv` |
| PxWeb path | `Samfelag/vinnumarkadur/lausstorf/JVS00001.px` |
| Frequency | Quarterly |
| Time coverage | 2019Q1 to present |
| Row count | 1,176 |
| Workstream | Intelligence sweep — ICT trifecta |

**Description:**
Job vacancy counts, positions, and vacancy rates by NACE sector from the Job Vacancy Survey (lausstörf). Key evidence table for the "ICT trifecta" finding: ICT sector vacancies fell approximately 94% while revenue rose and employment was maintained, suggesting firms substituted AI/automation for new hires rather than growing headcount.

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `quarter` | Ársfjórðungur | Reference quarter | `2019Q1`, `2024Q4` |
| `nace_sector` | Atvinnugrein | NACE sector of the reporting firm | `Upplýsing og fjarskipti` (ICT), `Fjármálastarfsemi` (Finance), `Heilbrigðisþjónusta` (Health) |
| `unit` | Eining | What is being counted | `Stöður` (Positions/headcount), `Lausar stöður` (Vacancies), `Hlutfall lausra starfa (%)` (Vacancy rate %) |
| `value` | — | Numeric observation | `1240`, `14`, `1.1` |

**Filter applied:** None. All sectors and all unit types are extracted.

**Key use cases:**
- Track ICT sector vacancy collapse: compare 2019-2021 baseline to 2022-2025 post-adoption period
- Calculate vacancy-to-employment ratio to assess hiring freeze vs workforce reduction
- Identify whether vacancy decline is ICT-specific or economy-wide (control sectors: health, construction)
- Combine with FYR04101 (VAT revenue) and VIN10022 (register employment) to complete the ICT trifecta

**Caveats:**
- Survey coverage starts only in 2019Q1, providing a limited pre-COVID baseline (four quarters before the March 2020 shock).
- The Job Vacancy Survey samples firms, not all firms respond; ICT sector sample size in Iceland is small (approximately 200-400 firms).
- Vacancy data reflects open, advertised positions — informal hiring through networks is not captured.
- A sharp one-quarter drop in vacancies may reflect seasonality rather than structural change; use four-quarter moving averages.

---

### FYR04101 — vat_turnover_monthly.csv

| Field | Value |
|---|---|
| Table ID | FYR04101 |
| CSV filename | `data/vat_turnover_monthly.csv` |
| PxWeb path | `Atvinnuvegir/fyrirtaeki/veltutolur/velta/FYR04101.px` |
| Frequency | Monthly |
| Time coverage | Available from mid-2000s to approximately 2-3 months prior to extraction date |
| Row count | 26,784 |
| Workstream | Intelligence sweep — ICT trifecta (revenue +72%) |

**Description:**
Monthly VAT turnover (velta) by NACE sector, derived from tax authority returns submitted to RSK. This is a near-complete census of formal Icelandic business revenue (all VAT-registered entities). The ICT sector revenue signal here — rising sharply while hiring stalled — is a core piece of evidence for productivity substitution.

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `month` | Mánuður | Reference month | `2020M01`, `2024M11` |
| `nace_sector` | Atvinnugrein | NACE sector of the business | `Upplýsing og fjarskipti` (ICT), `Verslun` (Retail), `Ferðaþjónusta` (Tourism) |
| `unit` | Eining | Type of revenue measure | `Velta í milljónum króna` (Turnover in ISK millions), index variants |
| `value` | — | Numeric observation | `4521.3`, `18904.0` |

**Filter applied:** None. Full table extracted.

**Key use cases:**
- Measure ICT sector revenue trajectory 2019-2025 in real terms (deflate with CPI)
- Construct the ICT trifecta: revenue up, vacancies down, employment flat = AI substitution signal
- Control for tourism-driven aggregate revenue growth (tourism is the confounding sector in Iceland)
- Monthly frequency allows pre/post event-study design around AI product launches (e.g., ChatGPT Nov 2022, Copilot GA Oct 2023)

**Caveats:**
- VAT turnover includes inter-company transactions and does not equal value added; it is not comparable to GDP.
- Revenue figures are in current ISK and must be deflated for real comparisons. Use the producer price index or CPI from Hagstofa.
- Tourism revenue (ferðaþjónusta) is a major confounder for aggregate signals; always separate ICT from tourism in analysis.
- 2-3 month reporting lag means the most recent months in the extract are incomplete or provisional.
- Sector classifications may change at NACE revision boundaries; check for coding discontinuities at known revision dates.

---

### VIN02003 — wages_by_sector_occupation_annual.csv

| Field | Value |
|---|---|
| Table ID | VIN02003 |
| CSV filename | `data/wages_by_sector_occupation_annual.csv` |
| PxWeb path | `Samfelag/launogtekjur/1_laun/1_laun/VIN02003.px` |
| Frequency | Annual |
| Time coverage | Available from early 2000s to latest wage survey year |
| Row count | 84,942 |
| Workstream | Wage analysis across sectors |

**Description:**
Annual wage statistics from the Hagstofa wage survey, disaggregated by economic sector, ISCO occupation group, and wage type. The largest table in the extract by row count due to the sector-by-occupation cross-dimension. Used to test whether AI-exposed occupations show wage suppression (consistent with task displacement) or wage growth (consistent with complementarity).

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `year` | Ár | Reference year | `2015`, `2023` |
| `sector` | Atvinnugrein | NACE economic sector | `Fjármálastarfsemi` (Finance), `Upplýsing og fjarskipti` (ICT) |
| `occupation` | Starfsgrein | ISCO occupation group | `Sérfræðingar` (Professionals), `Skrifstofufólk` (Clerks) |
| `sex` | Kyn | Sex | `Alls` (Both), `Karlar` (Male), `Konur` (Female) |
| `wage_type` | Launategund | Type of wage measure | `Meðallaun` (Mean wage), `Miðgildi launa` (Median wage), `Heildarlaun` (Total earnings including bonuses) |
| `value` | — | Wage in ISK (monthly or hourly depending on measure) | `650000`, `812000` |

**Filter applied:**
```json
[
  {"code": "Kyn", "selection": {"filter": "item", "values": ["0"]}}
]
```
Both sexes total only. Sex disaggregation can be retrieved separately for gender wage gap analysis.

**Key use cases:**
- Test AI complementarity vs displacement: do professional occupations (ISCO 2) in ICT show wage growth?
- Identify wage suppression in clerical occupations (ISCO 4) relative to manual occupations (ISCO 7-9)
- Sector-occupation cross-tab enables granular targeting: e.g., ICT clerks vs finance clerks vs all clerks
- Baseline for comparison with Humlum and Vestergaard (2025) Danish null-effect findings

**Caveats:**
- The sector-by-occupation cross makes some cells sparse or suppressed for confidentiality (Hagstofa suppresses cells with fewer than 5 workers).
- Wage types vary in definition across years; ensure like-for-like comparison (e.g., do not mix mean hourly with mean monthly).
- Wages are nominal ISK; real wage analysis requires CPI deflation.
- Annual frequency means the earliest signal of AI-driven wage effects will appear in 2023 or 2024 data at the earliest.

---

### LAU04109 — wage_index_quarterly.csv

| Field | Value |
|---|---|
| Table ID | LAU04109 |
| CSV filename | `data/wage_index_quarterly.csv` |
| PxWeb path | `Samfelag/launogtekjur/2_lvt/2_arsfjordungstolur/LAU04109.px` |
| Frequency | Quarterly |
| Time coverage | Available from early 2000s to latest quarter |
| Row count | 3,408 |
| Workstream | Wage growth tracking |

**Description:**
Quarterly wage index (launavísitala) by sector, published by Hagstofa from the wage statistics register. Provides higher-frequency wage growth signals than VIN02003, enabling event-study designs around AI product releases. The index is rebased to a reference year (typically 2015=100 or similar).

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `quarter` | Ársfjórðungur | Reference quarter | `2020Q1`, `2024Q3` |
| `sector` | Atvinnugrein | NACE economic sector | `Upplýsing og fjarskipti`, `Heilbrigðisþjónusta` |
| `index_type` | Tegund | What the index measures | `Laun` (wages), `Heildarlaun` (total earnings), `Kaupmáttur` (purchasing power) |
| `value` | — | Index value (base year = 100) | `112.4`, `138.7` |

**Filter applied:** None. Full table extracted.

**Key use cases:**
- Quarter-on-quarter wage growth by sector — higher frequency than VIN02003
- Test whether ICT sector wages decelerated post-2022 relative to pre-AI baseline
- Compare wage index growth to CPI to assess real wage change
- Identify divergence between ICT and non-ICT sectors

**Caveats:**
- The index base year should be identified from the dimension metadata before computing growth rates; do not assume a fixed base year.
- Sector coverage in the quarterly index may be less granular than in VIN02003.
- Index values are not comparable across sectors — only the growth rate (quarterly or annual change) is meaningful for cross-sector comparison.

---

### VIN10022 — register_employment_monthly.csv

| Field | Value |
|---|---|
| Table ID | VIN10022 |
| CSV filename | `data/register_employment_monthly.csv` |
| PxWeb path | `Samfelag/vinnumarkadur/vinnuaflsskraargogn/VIN10022.px` |
| Frequency | Monthly |
| Time coverage | 2008M01 to present |
| Row count | 7,128 |
| Workstream | Monthly employment by sector (high-frequency confirmation of VIN01110) |

**Description:**
Monthly employment counts from the administrative employment register (vinnuaflsskrá), covering all individuals registered as employed in Iceland. Unlike the Labour Force Survey tables (VIN01110, VIN01100), this is a near-census administrative source, not a sample survey. The full table has approximately 576,000 cells across all dimension combinations; this extract takes totals only.

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `month` | Mánuður | Reference month | `2022M01`, `2025M06` |
| `age` | Aldur | Age group | `Alls` (All ages, index 0) |
| `nace_sector` | Atvinnugrein | NACE section (33 sections A-S) | `Upplýsing og fjarskipti`, `Fjármálastarfsemi`, `Heilbrigðisþjónusta` |
| `sex` | Kyn | Sex | `Alls` (Both, index 0) |
| `origin` | Bakgrunnur | Country of origin / migration background | `Alls` (All, index 0) |
| `legal_residence` | Lögheimili | Legal residence status | `Alls` (All, index 0) |
| `value` | — | Number of employed persons | `4821`, `31204` |

**Filter applied:**
```json
[
  {"code": "Aldur",      "selection": {"filter": "item", "values": ["0"]}},
  {"code": "Kyn",        "selection": {"filter": "item", "values": ["0"]}},
  {"code": "Bakgrunnur", "selection": {"filter": "item", "values": ["0"]}},
  {"code": "Lögheimili", "selection": {"filter": "item", "values": ["0"]}}
]
```
All four demographic dimensions are set to their "all totals" index (0). This reduces the approximately 576,000-cell full table to 7,128 rows (month × sector) — the aggregates sufficient for sector-level monthly analysis.

**Key use cases:**
- Monthly employment by sector — 4-8x higher frequency than VIN01110
- Identify month-to-month employment changes in ICT sector in near real-time
- Detect sharp drops in specific NACE sections that annual surveys would miss or report with 12-month lag
- Cross-validate VIN01110 annual totals (register vs survey should be comparable at year-end)

**Caveats:**
- The register counts employed persons at a point in time; seasonal fluctuations are significant (especially in tourism, construction, agriculture).
- Definition of "employed" in the register (having any active employment contract) differs from the LFS definition (worked at least 1 hour in reference week). Numbers will differ from VIN01110.
- Origin and legal residence dimensions are available but filtered out in this extract. If the hypothesis about migrant worker displacement is developed, re-run with `Bakgrunnur` disaggregated.
- September 2025 disability system reform created a measurement discontinuity in welfare counts (TR data), not in this employment register — but workers transitioned off disability onto employment registers may create a step-change in some sector counts post-reform.

---

### THJ11011 — labour_productivity_annual.csv

| Field | Value |
|---|---|
| Table ID | THJ11011 |
| CSV filename | `data/labour_productivity_annual.csv` |
| PxWeb path | `Efnahagur/vinnumagnogframleidni/framleidnivinnuafls/THJ11011.px` |
| Frequency | Annual |
| Time coverage | Available from 1990s to approximately 2 years prior to extraction date |
| Row count | 576 |
| Workstream | Productivity analysis — does AI boost productivity without creating jobs? |

**Description:**
Annual labour productivity statistics by sector, derived from National Accounts. Measures output per worker or output per hour worked. This table tests the central hypothesis of the project: if AI is driving productivity gains, we expect rising output per worker in exposed sectors even as employment stagnates or declines.

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `year` | Ár | Reference year | `2010`, `2022` |
| `sector` | Atvinnugrein | NACE sector (National Accounts grouping) | `Upplýsing og fjarskipti`, `Fjármálastarfsemi og tryggingar` |
| `measure` | Mælikvarði | Productivity measure type | `Framleiðni á starfsmann` (Output per worker), `Framleiðni á vinnustund` (Output per hour), `Vísitala` (Index) |
| `value` | — | Productivity measure value | `8.4`, `112.3` |

**Filter applied:** None. Full table extracted.

**Key use cases:**
- Test the decoupling hypothesis: sectors with AI adoption show productivity growth without employment growth
- Calculate productivity growth rate 2019-2024 for ICT vs economy-wide average
- Combine with VIN10022 (employment) and FYR04101 (revenue) for a three-variable decomposition
- Compare Iceland productivity trajectory to Eurostat sectoral productivity data

**Caveats:**
- National Accounts productivity data has a publication lag of 12-18 months and undergoes benchmark revisions. The most recent year in the extract is typically preliminary.
- Sector aggregation in National Accounts is coarser than in some other tables; ICT (NACE J) may be grouped with other information services.
- Output per worker and output per hour can diverge if average hours worked is changing; prefer output per hour for AI substitution analysis (AI replaces hours, not necessarily workers in official counts).
- The productivity index base year must be identified from metadata before computing growth rates.

---

### FYR08001 — ict_structural_stats_annual.csv

| Field | Value |
|---|---|
| Table ID | FYR08001 |
| CSV filename | `data/ict_structural_stats_annual.csv` |
| PxWeb path | `Atvinnuvegir/fyrirtaeki/afkoma/1_afkoma/FYR08001.px` |
| Frequency | Annual |
| Time coverage | Available from early 2000s to approximately 2 years prior to extraction date |
| Row count | 15,708 |
| Workstream | ICT sector structural analysis |

**Description:**
Annual structural business statistics (SBS) for the ICT sector and related NACE divisions with more detailed breakdowns than the general economy tables. Covers revenue, costs, employment, and derived ratios at a finer NACE granularity within and around the ICT sector. This table enables analysis within NACE J (ICT) at the division level (J58-J63) rather than just the section aggregate.

**Dimensions and Columns:**

| Column Name | Icelandic Code | Description | Example Values |
|---|---|---|---|
| `year` | Ár | Reference year | `2018`, `2022` |
| `nace_sector` | Atvinnugrein | NACE section or division, with ICT breakdown | `J58 Útgáfustarfsemi` (Publishing), `J62 Tölvuforritun` (Computer programming), `J63 Upplýsingaþjónusta` (Information service activities) |
| `employee_count_band` | Fjöldi starfsmanna | Firm size band by employee count | `1-9`, `10-49`, `50-249`, `250+` |
| `variable` | Breyta | Financial or structural variable | `Velta` (Turnover), `Virðisauki` (Value added), `Launakostnaður` (Labour costs), `Fjöldi fyrirtækja` (Number of firms) |
| `value` | — | Numeric observation (ISK millions or count) | `2341.4`, `847`, `124` |

**Filter applied:** None. Full table extracted.

**Key use cases:**
- Decompose the ICT revenue surge (FYR04101) by NACE division: is it J62 (software development) or J63 (cloud/data services)?
- Analyse the firm size dimension: are large ICT firms (250+) the primary beneficiaries of AI-driven revenue growth?
- Calculate labour cost as share of turnover over time: declining share = productivity substitution
- Identify which ICT sub-sectors are contracting in firm count despite rising sector revenue

**Caveats:**
- Structural business statistics have a longer publication lag (12-18 months) than VAT data; the most recent year available may be 2 years behind the extraction date.
- Eurostat requires Hagstofa to suppress cells where fewer than 3 firms exist in a size band × NACE division combination. Small NACE divisions in Iceland will have many suppressed cells.
- Value added (virðisauki) here is the SBS definition (output minus material inputs), not the National Accounts definition; they are similar but not identical.
- Firm size bands are determined at a point in time; firms that cross size thresholds between years create apparent discontinuities.

---

## Adding New Tables

To add a new Hagstofa PxWeb table to the extraction pipeline:

### Step 1: Discover the table path

Browse the Hagstofa PxWeb API catalogue:
```
GET https://px.hagstofa.is/pxen/api/v1/en/
```
Navigate the directory structure to find the `.px` file path for the target table.

### Step 2: Inspect the table metadata

```
GET https://px.hagstofa.is/pxen/api/v1/en/{table_path}
```
This returns the table's dimension codes, value labels, and available filters without downloading data.

### Step 3: Design the filter

Determine which dimension values to include:
- Use `filter: "all"` with `values: ["*"]` for dimensions where all values are needed.
- Use `filter: "item"` with specific index codes for targeted subsets.
- Check the metadata response to map human-readable labels to numeric index codes.

### Step 4: Estimate row count before extraction

Multiply the size of each dimension after filtering:
```
estimated_rows = product(len(selected_values) for each dimension)
```
If the estimate exceeds 100,000 rows, consider filtering further or splitting into multiple requests.

### Step 5: Add to hagstofa_pxweb.py

Add an entry to the table configuration dictionary in the script:
```python
{
    "table_id": "XXXNNNNN",
    "path": "Category/subcategory/.../XXXNNNNN.px",
    "output_file": "data/descriptive_name.csv",
    "query": [
        {
            "code": "DimensionCode",
            "selection": {"filter": "item", "values": ["0", "1"]}
        }
    ]
}
```

### Step 6: Validate the output

After extraction:
1. Check that row count matches the pre-extraction estimate.
2. Cross-verify at least one known cell value against the Hagstofa web browser (`https://px.hagstofa.is/pxen/pxweb/en/`).
3. Verify that dimension labels (not just codes) are correctly mapped in the output CSV.
4. Add an entry to this data dictionary before committing.

---

## Known Limitations and Caveats

### Cross-Cutting Limitations

**Occupation data gap:** The prior occupation of disability claimants is not available anywhere in public Icelandic data. This prevents direct analysis of whether workers displaced from specific occupations are appearing in welfare statistics. VIN01100 and VIN02003 are the closest proxies but do not link to welfare outcomes.

**No AI spend isolation:** Corporate accounts in Iceland do not separately disclose AI-related expenditure under current accounting standards. There is no Icelandic equivalent to the Eurostat enterprise AI investment survey at the firm level. The AI adoption signal must be inferred from indirect indicators (ICT revenue, vacancy patterns, productivity).

**Hagstofa welfare tables stop at 2022:** The Hagstofa PxWeb welfare tables are outdated. Current welfare data must be sourced from TR PowerBI (monthly disability and rehabilitation counts) which has no API. The September 2025 disability system reform creates a measurement discontinuity in those TR series.

**Rikiskaup dissolution (August 2024):** The central procurement agency was dissolved and absorbed into FMA (Fjármála- og efnahagsráðuneytið). Historical procurement data held by Rikiskaup may have moved or changed format. TED API (above-threshold IT/AI procurement, CPV 72xxx, country:IS) is the recommended source for public sector AI procurement signals.

**No quarterly unemployment by sector:** Hagstofa publishes quarterly unemployment for the total economy (VIN00920) but not by NACE sector. Sector-level unemployment is annual only (Labour Force Survey, VIN01110). VMST publishes monthly registered unemployment via a Power BI dashboard on island.is but provides no API access.

**Humlum and Vestergaard (2025) null-effect baseline:** The strongest comparable study (Danish LLM adoption, n=25,000+ workers, 2022-2024) finds null effects on earnings and hours. Any positive finding from this project must account for why Iceland would differ from Denmark. Possible explanations: Iceland's smaller economy concentrates AI adoption in fewer, more visible firms; Iceland's Labour Force Survey may lag adoption; the Danish study used firm-level matched data unavailable in Iceland.

### Data Vintage

All extracts reflect the state of the Hagstofa database at the time `hagstofa_pxweb.py` was last run. Extraction dates are not currently embedded in the CSV files. It is recommended to add an extraction timestamp column or a companion metadata JSON file when running for formal analysis.

### Icelandic Language in Column Values

Column values for dimension labels (sector names, occupation names, region names) are in Icelandic. Any merge with English-language datasets (Eurostat, Eurofound, TED API) requires a crosswalk table mapping Icelandic labels to standard codes (NACE codes, ISCO codes, NUTS region codes).

---

*End of Data Dictionary*
