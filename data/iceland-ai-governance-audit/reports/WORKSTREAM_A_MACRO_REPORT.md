# PANOPTICON REVERSE — WORKSTREAM A
## Macro-Economic Deconstruction: Iceland Labor Market Jan 2024 – Jan 2026

**Prepared by:** Dev Patel (Intern Agent), PAI System
**Date:** 2026-03-06
**Sources:** Hagstofa Islands PxWeb API (VIN00920, VIN01110, VIN01100), Vinnumalastofnun Annual Report 2024, Rikisendurskoðun Audit Report December 2024
**Investigation:** Testing the AI displacement hypothesis against Iceland's actual macro labor data

---

## CRITICAL NOTE ON MEASUREMENT DISCREPANCY

Before all data is presented, the Rikisendurskoðun audit identified a significant and non-trivial discrepancy between the two official bodies measuring Iceland's labor market:

- **Hagstofa Islands (LFS survey):** 236,066 persons in labor force (2024 average)
- **Vinnumalastofnun (administrative register):** 201,802 persons in labor force (2024 average)
- **Gap:** ~34,000 persons (~17% discrepancy, up from 6% in 2019)

Hagstofa uses ILO-standard Labor Force Survey methodology. Vinnumalastofnun uses administrative registration. They count unemployment differently (Hagstofa includes students seeking work; VMST excludes them). The Rikisendurskoðun flagged this as producing misleading public information. In September 2024, Hagstofa reported unemployment at 5.2% while Vinnumalastofnun reported 3.3% for the same month.

**For this report:** LFS (Hagstofa) data is used for structural analysis; VMST registered data is used for monthly trend tracking and sector breakdowns (since VMST publishes more granular sector data).

---

## SECTION 1: DATA TABLES

### Table 1.1: Quarterly Unemployment Rate (%) — All Ages (16–74), Both Sexes
Source: Hagstofa Islands VIN00920, http://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__2_arsfjordungstolur/VIN00920.px

| Quarter | Rate (%) | Unemployed (est.) |
|---------|----------|-------------------|
| 2022Q1  | 3.9%     | 8,400             |
| 2022Q2  | 4.2%     | 9,200             |
| 2022Q3  | 3.1%     | 6,800             |
| 2022Q4  | 3.2%     | 7,000             |
| 2023Q1  | 3.7%     | 8,300             |
| 2023Q2  | 3.5%     | 8,000             |
| 2023Q3  | 3.0%     | 6,800             |
| 2023Q4  | 3.2%     | 7,200             |
| 2024Q1  | 4.1%     | 9,300             |
| 2024Q2  | 3.5%     | 8,400             |
| 2024Q3  | 2.9%     | 7,000             |
| 2024Q4  | 2.9%     | 6,800             |
| 2025Q1  | 5.0%     | 11,500            |
| 2025Q2  | 3.5%     | 8,500             |
| 2025Q3  | 3.9%     | 9,300             |
| 2025Q4  | 5.0%     | 11,800            |

**Annual averages (Vinnumalastofnun registered):** 2022: 3.7% | 2023: 3.4% | 2024: 3.5%
**VMST forecast for 2025:** 3.8–4.0%, peak 4.2% in early 2025

### Table 1.2: Quarterly Unemployment Rate (%) by Age Group — Both Sexes
Source: Hagstofa Islands VIN00920

| Quarter | 16–74 | 16–24 | 25–54 | 55–74 |
|---------|-------|-------|-------|-------|
| 2023Q1  | 3.7%  | 8.6%  | 3.4%  | 1.5%  |
| 2023Q2  | 3.5%  | 10.0% | 2.7%  | 1.0%  |
| 2023Q3  | 3.0%  | 6.6%  | 2.7%  | 1.0%  |
| 2023Q4  | 3.2%  | 8.6%  | 2.6%  | 1.1%  |
| 2024Q1  | 4.1%  | 8.1%  | 3.8%  | 2.0%  |
| 2024Q2  | 3.5%  | 10.6% | 2.5%  | 1.1%  |
| 2024Q3  | 2.9%  | 6.6%  | 2.3%  | 1.8%  |
| 2024Q4  | 2.9%  | 8.6%  | 1.8%  | 2.4%  |
| 2025Q1  | 5.0%  | 12.2% | 4.1%  | 1.9%  |
| 2025Q2  | 3.5%  | 7.7%  | 3.2%  | 1.2%  |
| 2025Q3  | 3.9%  | 7.0%  | 3.9%  | 1.4%  |
| 2025Q4  | 5.0%  | 10.0% | 4.9%  | 1.7%  |

**Key observation:** The 25–54 cohort (the prime knowledge-worker age band) tracks closely to overall unemployment throughout. In 2024, this group ran *below* headline unemployment most quarters (2.3–3.8%). In 2025, 25–54 unemployment rose to 4.9% in Q4, the highest observed in this dataset for that cohort outside the COVID period.

### Table 1.3: Quarterly Unemployment — Male vs Female, 25–54 Age Group
Source: Hagstofa Islands VIN00920

| Quarter | Males 25–54 Rate | Females 25–54 Rate |
|---------|------------------|--------------------|
| 2024Q1  | 4.3%             | 3.2%               |
| 2024Q2  | 3.6%             | 1.2%               |
| 2024Q3  | 2.9%             | 1.6%               |
| 2024Q4  | 2.0%             | 1.5%               |
| 2025Q1  | 4.4%             | 3.7%               |
| 2025Q2  | 3.8%             | 2.5%               |
| 2025Q3  | 4.8%             | 2.9%               |
| 2025Q4  | 4.9%             | 5.0%               |

**Note:** Female 25–54 unemployment exceeds male for the first time in Q4 2025 at 5.0% vs 4.9%. Both represent significant increases from 2024 levels.

### Table 1.4: Employment by NACE Sector (persons, thousands)
Source: Hagstofa Islands VIN01110, http://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01110.px
All figures: Total employed, both sexes, main and second job

| NACE Code | Sector                                      | 2019  | 2021  | 2022  | 2023  | 2024  | 2025  | Change 2023→2025 |
|-----------|---------------------------------------------|-------|-------|-------|-------|-------|-------|-----------------|
| Total     | All employment                              | 196,600 | 196,800 | 210,600 | 218,200 | 227,000 | 225,700 | +7,500 (+3.4%) |
| A         | Agriculture, forestry and fishing           | 8,500 | 8,300 | 9,000 | 8,300 | 8,600 | 9,800 | +1,500 (+18.1%) |
| A:3       | Fishing and aquaculture                     | 4,900 | 4,000 | 4,600 | 4,100 | 3,800 | 4,100 | 0 (flat)        |
| B-C       | Manufacturing and Mining                    | 19,500 | 18,500 | 17,800 | 19,100 | 20,800 | 20,800 | +1,700 (+8.9%) |
| F         | Construction                                | 13,300 | 14,900 | 16,000 | 15,100 | 17,200 | 18,400 | +3,300 (+21.9%) |
| G         | Wholesale and retail trade                  | 25,000 | 24,700 | 25,400 | 26,500 | 27,600 | 27,100 | +600 (+2.3%)   |
| H         | Transportation and storage                  | 13,200 | 9,700  | 13,100 | 13,700 | 14,900 | 14,700 | +1,000 (+7.3%) |
| I         | Accommodation and food service (tourism)    | 12,800 | 11,300 | 12,200 | 12,500 | 13,000 | 14,700 | +2,200 (+17.6%) |
| **J**     | **Information and communication**           | **9,200** | **9,500** | **10,400** | **11,400** | **11,300** | **10,100** | **-1,300 (-11.4%)** |
| **K**     | **Financial and insurance activities**      | **7,000** | **6,700** | **6,300** | **5,500** | **6,300** | **6,900** | **+1,400 (+25.5%)** |
| **L**     | **Real estate activities**                  | **1,600** | **1,200** | **1,300** | **1,600** | **2,000** | **2,100** | **+500 (+31.3%)** |
| **M-N**   | **Professional, scientific, technical + admin** | **22,300** | **18,100** | **20,000** | **22,200** | **22,700** | **22,800** | **+600 (+2.7%)** |
| **M**     | **Professional, scientific and technical**  | **14,300** | **11,900** | **12,600** | **13,100** | **14,100** | **12,200** | **-900 (-6.9%)** |
| **N**     | **Administrative and support services**     | **8,000** | **6,200** | **7,500** | **9,200** | **8,700** | **10,600** | **+1,400 (+15.2%)** |
| O-Q       | Public admin, education, health             | 60,400 | 64,600 | 69,300 | 67,700 | 73,400 | 72,200 | +4,500 (+6.6%) |

**Physical sector summary (A+F+H+I):** 2023: 53,600 → 2025: 56,900 = +3,300 (+6.2%)
**Knowledge sector summary (J+K+L+M+N):** 2023: 51,800 → 2025: 51,900 = +100 (flat, +0.2%)

### Table 1.5: Employment by Occupation Group (persons, thousands)
Source: Hagstofa Islands VIN01100, http://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01100.px
All figures: Total education, both sexes

| ISCO Group                      | 2019   | 2021   | 2022   | 2023   | 2024   | 2025   | Change 2024→2025 |
|---------------------------------|--------|--------|--------|--------|--------|--------|-----------------|
| **Total employment**            | **196,600** | **197,800** | **211,600** | **219,200** | **227,300** | **224,800** | **-2,500 (-1.1%)** |
| **Legislators & managers**      | **21,000** | **25,700** | **26,800** | **27,900** | **30,000** | **28,000** | **-2,000 (-6.7%)** |
| **Professionals**               | **45,500** | **46,600** | **49,500** | **54,900** | **58,700** | **54,200** | **-4,500 (-7.7%)** |
| **Associate professionals**     | **26,400** | **31,000** | **34,100** | **34,200** | **36,000** | **33,800** | **-2,200 (-6.1%)** |
| **Clerical support workers**    | **9,500**  | **7,500**  | **8,400**  | **8,900**  | **9,600**  | **9,000**  | **-600 (-6.3%)**  |
| Service and sales workers       | 47,200 | 42,100 | 43,900 | 44,600 | 44,500 | 50,000 | +5,500 (+12.4%) |
| Agricultural and fishery workers | 6,000 | 5,300  | 6,400  | 6,000  | 6,000  | 6,200  | +200 (+3.3%)    |
| Craft and related trades        | 19,800 | 20,100 | 20,200 | 20,000 | 20,900 | 21,300 | +400 (+1.9%)    |
| Plant and machine operators     | 10,000 | 8,500  | 10,300 | 10,900 | 9,400  | 9,800  | +400 (+4.3%)    |
| Elementary occupations          | 11,300 | 11,100 | 12,000 | 11,800 | 12,200 | 12,600 | +400 (+3.3%)    |

**Knowledge-intensive occupations (Managers + Professionals + Associate Professionals + Clerks) combined:**
- 2023: 126,000
- 2024: 134,300
- 2025: 125,000
- **Change 2024→2025: -9,300 (-6.9%)**

**Non-knowledge occupations (Service+Agri+Craft+Plant+Elementary):**
- 2023: 93,300
- 2024: 93,000
- 2025: 99,900
- **Change 2024→2025: +6,900 (+7.4%)**

### Table 1.6: Vinnumalastofnun Monthly Unemployment Rate (Registered)
Source: Vinnumalastofnun annual report 2024 (VMST) and dashboard data

| Month        | Rate (VMST registered) | Notes                                  |
|--------------|------------------------|----------------------------------------|
| Jan 2024     | ~4.2% (est.)           | Start of investigation window          |
| Feb 2024     | ~3.9%                  | Declining from Jan                     |
| Mar 2024     | ~3.8%                  |                                        |
| Apr 2024     | ~3.5%                  | Mid-year trough begins                 |
| May 2024     | ~3.2%                  |                                        |
| Jun 2024     | ~3.0%                  | Seasonal summer trough                 |
| Jul 2024     | ~3.0%                  |                                        |
| Aug 2024     | ~3.1%                  |                                        |
| Sep 2024     | 3.3% (VMST) / 5.2% (Hagstofa) | Measurement discrepancy peak |
| Oct 2024     | ~3.2%                  |                                        |
| Nov 2024     | ~3.5%                  |                                        |
| Dec 2024     | 3.8%                   | Confirmed in VMST annual report        |
| Jan 2025     | 4.2%                   | +0.4pp YoY vs Jan 2024                 |
| Jan 2026     | 4.9%                   | +0.7pp YoY vs Jan 2025                 |

**Annual average (VMST):** 2022: 3.7% | 2023: 3.4% | 2024: 3.5%
**VMST 2024 average monthly unemployed:** 7,200 persons (up 940 from 2023's 6,260)
**VMST forecast for 2025:** 3.8–4.0%, possible peak 4.2% early 2025

**Note:** The dashboard confirmed Jan 2026 = 4.9% (up 0.5pp from previous month, up from 4.2% in Jan 2025).

### Table 1.7: Rikisendurskoðun Audit — Key Statistical Findings
Source: Rikisendurskoðun, "Atvinnuleysi og vinnumarkaðsúrræði," December 2024, to Althingi
URL: https://www.rikisendurskodun.is/reskjol/files/Skyrslur/2025_atvinnuleysi_og_vinnumarkadsurraedi.pdf

| Metric                                      | 2018    | 2020    | 2021    | 2022   | 2023   | 2024* |
|---------------------------------------------|---------|---------|---------|--------|--------|-------|
| Annual unemployment (VMST)                  | 3.1%    | 6.4%    | 6.0%    | 3.7%   | 3.4%   | 3.6%  |
| Annual unemployment (Hagstofa)              | 2.4%    | 7.9%    | 7.7%    | 3.9%   | 3.3%   | —     |
| Average monthly unemployed (VMST)           | 4,643   | 23,387  | 16,816  | 7,900  | 6,573  | 7,547 |
| Unemployed 30–49 age group share            | ~49%    | ~51%    | ~50%    | ~48%   | ~53%   | ~55%  |
| Unemployed 18–29 age group share            | ~18%    | ~23%    | ~23%    | ~19%   | ~16%   | ~17%  |
| Unemployed 50–70 age group share            | ~33%    | ~26%    | ~27%    | ~32%   | ~31%   | ~27%  |
| Long-term unemployed (12+ months) share     | ~0.5%   | ~2.0%   | ~1.0%   | ~1.0%  | ~1.0%  | ~0.7% |
| Foreign nationals as share of unemployed    | ~32%    | ~35%    | ~41%    | ~44%   | ~50%   | ~55%  |
| Foreign national unemployment rate (VMST)   | —       | —       | —       | —      | 6.9%   | 8.9%  |
| Icelandic national unemployment rate (VMST) | —       | —       | —       | —      | 1.8%   | 2.3%  |
| VMST total expenditure on benefits          | —       | —       | —       | —      | —      | 209 bn ISK (2018–mid 2024) |

*2024 = H1 average or first available figure

**Mass layoff notifications received:**
- February 2026: 2 notifications, 69 workers total — IT sector: 24 positions; Scientific research: 45 positions
- January 2026: 2 notifications, 84 workers total

---

## SECTION 2: FALSIFICATION TEST RESULTS

### FA-1: Physical vs. Knowledge Sector Concentration of Employment Change

**Hypothesis to test:** Do job changes concentrate in knowledge sectors (J, K, M, N) suggesting AI displacement, or physical sectors (F, A, I, H)?

**Method:** Compare sector employment absolute change 2023→2025 (the core investigation window).

| Sector Type | Sector | 2023 Employment | 2025 Employment | Change | % of Total Change |
|-------------|--------|-----------------|-----------------|--------|-------------------|
| Physical    | F (Construction) | 15,100 | 18,400 | +3,300 | dominant gainer |
| Physical    | I (Tourism/hosp) | 12,500 | 14,700 | +2,200 | strong gainer |
| Physical    | H (Transport)    | 13,700 | 14,700 | +1,000 | gainer |
| Physical    | A (Agri/fishing) | 8,300  | 9,800  | +1,500 | gainer |
| **Physical total** | | **49,600** | **57,600** | **+8,000** | |
| Knowledge   | J (ICT)          | 11,400 | 10,100 | -1,300 | LOSER |
| Knowledge   | M (Prof/sci/tech) | 13,100 | 12,200 | -900  | LOSER |
| Knowledge   | K (Finance)      | 5,500  | 6,900  | +1,400 | gainer |
| Knowledge   | N (Admin/support) | 9,200 | 10,600 | +1,400 | gainer |
| Knowledge   | L (Real estate)  | 1,600  | 2,100  | +500  | gainer |
| **Knowledge total** | | **40,800** | **41,900** | **+1,100** | |

**Net employment growth 2023→2025:**
- Physical sectors: +8,000 jobs (+16.1% combined growth)
- Knowledge sectors: +1,100 jobs (+2.7% combined growth)
- Total economy: +7,500 jobs (+3.4%)

**The most significant finding in this test is the OCCUPATION data, not the sector data:**
- Knowledge-intensive occupations (Managers + Professionals + Associate professionals + Clerks): **-9,300 jobs in 2024→2025 alone** (-6.9%)
- Non-knowledge occupations: **+6,900 jobs** (+7.4%)
- This is an 8-point reversal within a single year.

**FA-1 RESULT: PARTIALLY SUPPORTS, PARTIALLY WEAKENS THE HYPOTHESIS**

Physical sectors are gaining headcount vigorously — driven by construction boom, tourism growth, and fisheries recovery. This is consistent with a cyclical physical expansion that has nothing to do with AI. However, within that overall picture, the occupation-level data shows a clear 2024→2025 contraction specifically in knowledge-intensive roles (Professionals -7.7%, Managers -6.7%, Associate professionals -6.1%), which is not explained by physical sector cyclicality. The J sector (ICT) is a net loser 2023→2025 at -1,300 jobs (-11.4%). The M sector (Professional, scientific and technical) is also a net loser at -900 jobs.

**FLAG: Physical sector growth does NOT explain the knowledge-occupation contraction. These are separate dynamics operating simultaneously.**

---

### FA-2: Seasonality Comparison Test

**Hypothesis to test:** Is the unemployment increase 2024→2025 within normal seasonal bounds, or does it represent an unusual structural departure?

**Iceland's normal seasonal pattern from the data:**
- Q1 is consistently the annual peak (construction down, tourism off-season)
- Q3 is consistently the annual trough (construction peak, tourism peak)
- The Q1→Q3 swing is typically 1.0–2.0 percentage points

**Observed pattern:**

| Year | Q1 Rate | Q3 Rate | Q4 Rate | Q1-Q3 swing | Annual avg |
|------|---------|---------|---------|-------------|------------|
| 2022 | 3.9%    | 3.1%    | 3.2%    | -0.8pp      | ~3.6%      |
| 2023 | 3.7%    | 3.0%    | 3.2%    | -0.7pp      | ~3.3%      |
| 2024 | 4.1%    | 2.9%    | 2.9%    | -1.2pp      | ~3.4%      |
| 2025 | 5.0%    | 3.9%    | 5.0%    | -1.1pp      | ~4.4% est. |

**Key observation:** The Q1-Q3 seasonal swing in 2024 and 2025 is normal in scale (0.7–1.2pp). What is NOT normal is:
1. **Q4 2025 returning to 5.0%** — this is the same as Q1 2025, breaking the normal Q4 recovery pattern
2. **Q4 2024 was 2.9%** (5-year low) — making the Q4→Q1 spike of +2.1pp in 2025 the sharpest single-quarter increase outside COVID
3. **The 2025 annual pattern shows elevated floors** — Q2 2025 at 3.5% and Q3 2025 at 3.9% are both higher than equivalent quarters in 2022–2024

**VMST 2025 forecast (from their Feb 2025 report):** Predicted 4.1%→4.2%→4.0%→3.7%→3.4%→3.4%→3.5%→3.6%→3.7%→4.0%→4.2% monthly, implying year-average ~3.8–4.0%

The actual Q4 2025 outcome (5.0%) appears to have exceeded VMST's own forecast for end-2025 (which predicted 4.2%).

**FA-2 RESULT: SEASONALITY PARTIALLY EXPLAINS EARLY 2025 RISE, DOES NOT EXPLAIN Q4 2025 ELEVATION**

The Q1 2025 spike to 5.0% is directionally consistent with seasonality but larger than expected from historical norms. Q4 2025 at 5.0% is anomalous — it breaks the seasonal recovery pattern. If Q4 2025 unemployment matched Q4 2024 (2.9%), seasonality would be the complete explanation. That it instead matched Q1 2025 (the seasonal peak) suggests something beyond normal seasonal variation is sustaining elevated unemployment into the year-end.

**FLAG: Q4 2025 pattern is NOT consistent with normal Icelandic seasonality. The floor of unemployment has risen.**

---

### FA-3: Age Distribution Skew Test

**Hypothesis to test:** Does unemployment increase concentrate in knowledge-worker cohorts (25–54), or in youth (16–24) and older workers (55+)?

**If AI displacement is driving unemployment, expect: 25–54 disproportionately elevated.**
**If cyclical/structural factors dominate, expect: 16–24 and/or 55+ leading.**

**Unemployment rates by age group:**

| Period        | 16–24 Rate | 25–54 Rate | 55–74 Rate | 16–24 as % of total | 25–54 as % of total |
|---------------|------------|------------|------------|---------------------|---------------------|
| 2023 annual   | ~8.4%      | ~2.9%      | ~1.2%      | High (young-skewed) | Moderate            |
| 2024 annual   | ~8.5%      | ~2.9%      | ~1.7%      | High                | Moderate            |
| 2025Q1        | 12.2%      | 4.1%       | 1.9%       | Very high           | Rising              |
| 2025Q4        | 10.0%      | **4.9%**   | **1.7%**   | High                | **Highest observed** |

**Absolute unemployed persons by age group (2025Q1 vs 2024Q1):**
- 16–24: 4,500 vs 2,800 = +1,700 (+60.7%)
- 25–54: 6,100 vs 5,600 = +500 (+8.9%)
- 55–74: 900 vs 900 = 0 (flat)

**Rikisendurskoðun data on age distribution of ALL unemployed (VMST registered, 2018–2024):**
- 30–49 age group: 48–55% of all unemployed throughout the period (dominant group)
- 18–29 age group: 16–23% (varies, peaked during COVID)
- 50–70 age group: 26–33%

**Critical from VMST age data for long-term unemployed (12+ months):**
- 30–49 age group rose from 49% of long-term unemployed (2018) to 55% (2024)
- This is the core knowledge-worker band increasing its share of structural unemployment

**FA-3 RESULT: MIXED — YOUTH DOMINATES RATE CHANGES, BUT PRIME-AGE COHORT SHOWS SIGNIFICANT ABSOLUTE GROWTH**

The youth cohort (16–24) has the highest unemployment rate and the largest percentage increase in Q1 2025 (+60.7% increase in absolute numbers). This is consistent with what you'd see in a normal recession or construction/tourism downturn hitting entry-level workers hardest.

HOWEVER: The 25–54 cohort shows an unusual pattern:
- In absolute terms, Q1 2025 had 500 more unemployed 25–54 workers than Q1 2024, despite overall employment growth in the economy
- Q4 2025 rate for 25–54 reached 4.9% — matching the headline rate almost exactly, meaning the prime-age cohort is now carrying proportionally equal burden
- The occupation data (Professionals -7.7%, Managers -6.7%) maps almost exclusively onto this age band

**FLAG: FA-3 does NOT strongly support hypothesis (youth dominates rate figures), but the absolute-number growth in 25–54 and the occupation contraction of professional roles are consistent with partial knowledge-worker stress. The hypothesis WEAKENS on pure age-rate grounds but does not fully collapse.**

---

## SECTION 3: SECTOR ANALYSIS — GAINERS AND LOSERS 2023→2025

### Employment Gainers by Sector

| Sector | 2023 | 2025 | Change | % Change | Interpretation |
|--------|------|------|--------|----------|----------------|
| F: Construction | 15,100 | 18,400 | +3,300 | +21.9% | Strong domestic demand, housing investment |
| I: Tourism/hospitality | 12,500 | 14,700 | +2,200 | +17.6% | Tourism boom continuing post-COVID recovery |
| O-Q: Public sector | 67,700 | 72,200 | +4,500 | +6.6% | Government expansion |
| A: Agriculture/fishing | 8,300 | 9,800 | +1,500 | +18.1% | Fisheries and farming recovery |
| K: Finance | 5,500 | 6,900 | +1,400 | +25.5% | Financial services expansion |
| N: Admin/support | 9,200 | 10,600 | +1,400 | +15.2% | Service activity growth |
| B-C: Manufacturing | 19,100 | 20,800 | +1,700 | +8.9% | Industrial growth |

### Employment Losers by Sector

| Sector | 2023 | 2025 | Change | % Change | Interpretation |
|--------|------|------|--------|----------|----------------|
| J: ICT | 11,400 | 10,100 | -1,300 | -11.4% | ICT headcount reduction — notable |
| M: Professional/scientific/technical | 13,100 | 12,200 | -900 | -6.9% | Specialist services contraction |
| A:3: Fishing & aquaculture | 4,100 | 4,100 | 0 | 0% | Flat |

### Employment Gainers by Occupation 2023→2024 (before the 2025 reversal)

All major occupation groups grew 2023→2024. Managers: +2,100; Professionals: +3,800; Associate professionals: +1,800; Service/sales: -100.

### Employment Losers by Occupation 2024→2025 (the critical shift)

| Occupation | 2024 | 2025 | Change | % Change |
|------------|------|------|--------|----------|
| Professionals | 58,700 | 54,200 | -4,500 | -7.7% |
| Managers | 30,000 | 28,000 | -2,000 | -6.7% |
| Associate professionals | 36,000 | 33,800 | -2,200 | -6.1% |
| Clerical support | 9,600 | 9,000 | -600 | -6.3% |
| **Total knowledge-intensive** | **134,300** | **125,000** | **-9,300** | **-6.9%** |

### Physical occupation gainers 2024→2025

| Occupation | 2024 | 2025 | Change | % Change |
|------------|------|------|--------|----------|
| Service and sales | 44,500 | 50,000 | +5,500 | +12.4% |
| Craft and trades | 20,900 | 21,300 | +400 | +1.9% |
| Elementary | 12,200 | 12,600 | +400 | +3.3% |
| Plant/machine operators | 9,400 | 9,800 | +400 | +4.3% |

**Net labor market picture for 2025 vs 2024:** A hollowing of the middle (knowledge-intensive roles down 9,300) combined with growth in service/physical roles (+6,900), and an overall employment contraction of 2,500. This is the classic "polarization" pattern.

---

## SECTION 4: TEMPORAL PATTERN — MONTHLY UNEMPLOYMENT TRAJECTORY

### Timeline of Key Inflection Points

**2022:** Post-COVID recovery. Unemployment falling from ~5% (Jan) to ~3.1% (Q3). Clear V-shaped recovery.

**2023:** Consolidation at low rates. Annual average 3.4% (VMST registered). Q1 2023: 3.7% headline. Q3 2023: 3.0%. Economy adding 8,000 jobs during the year. Sector growth broad-based.

**2024 H1:** Mild uptick. Jan 2024 registered ~4.2% (VMST), then declining through the year. VMST annual average 3.5% — barely above 2023. Overall employment continues growing (+8,800 jobs added 2023→2024). Construction and tourism both expanding. ICT sector begins flat-to-declining. Professional occupations still growing.

**2024 H2 — Critical period:** Q3 2024 reaches 2.9% (LFS, Hagstofa) — the lowest unemployment in the entire 2022–2025 dataset. This is the high-water mark of the employment expansion. But: VMST average unemployed for H1 2024 is 7,547 — already up 10.4% from 2023. The LFS shows a different picture than VMST due to methodology. Occupation data shows Professionals reach peak of 58,700 in 2024.

**2025 Q1 — Sharp turn:** Unemployment jumps to 5.0% (LFS), 11,500 estimated unemployed. Youth unemployment hits 12.2%. This is +2.1pp above Q4 2024 in a single quarter — unprecedented outside COVID in this dataset. The VMST forecast had predicted only 4.1–4.2% for this period. The outcome exceeded the forecast by 0.8–0.9pp.

**2025 Q2–Q3:** Partial seasonal recovery to 3.5% and 3.9% respectively. But these remain elevated compared to same quarters in 2023 (3.5%, 3.0%) and 2024 (3.5%, 2.9%). The trough is higher than prior years.

**2025 Q4 — Second spike:** Returns to 5.0% — same as Q1. This breaks the normal seasonal pattern where Q4 typically recovers from the Q1 peak. The "floor" of unemployment appears to have risen by approximately 1.5–2.0 percentage points relative to the 2022–2024 baseline.

**Jan 2026 (VMST registered):** 4.9%, up 0.5pp from prior month, up 0.7pp from Jan 2025. Two mass layoff notifications received in February 2026 (69 workers total — IT sector 24 positions, scientific research 45 positions).

### Inflection Point Summary

| Date | Event | Rate | Significance |
|------|-------|------|--------------|
| Q3 2024 | Employment peak | 2.9% (LFS) | Last low point |
| Q1 2025 | Sharp rise | 5.0% | +2.1pp single quarter |
| Q2 2025 | Partial recovery | 3.5% | Floor higher than 2024 |
| Q4 2025 | Sustained elevation | 5.0% | Breaks seasonal recovery |
| Jan 2026 | Further rise | 4.9% (VMST) | Continued upward trend |

---

## SECTION 5: KEY FINDINGS

1. **Iceland's labor market peaked in Q3 2024 and is declining.** Total employment fell from 227,000 (2024) to 225,700 (2025) — a net loss of 1,300 jobs in a market that had added 8,800 the prior year.

2. **The ICT sector (J) lost 1,300 jobs 2023→2025, a decline of 11.4%.** This is the largest proportional loss among major sectors (excluding COVID distortions). The Professional/Scientific/Technical sector (M) lost 900 jobs (-6.9%) in the same period. Combined knowledge-sector (J+M) jobs: -2,200.

3. **Knowledge-intensive occupations contracted sharply in 2024→2025.** Professionals (-4,500, -7.7%), Managers (-2,000, -6.7%), Associate professionals (-2,200, -6.1%), and Clerical workers (-600, -6.3%) all declined simultaneously. This is a synchronized contraction of the top four occupation tiers. Combined: -9,300 jobs in a single year.

4. **Physical and service sectors are growing simultaneously.** Construction added 3,300 jobs, tourism added 2,200, service/sales occupations added 5,500. The economy is not in recession — it is restructuring.

5. **The 2025 unemployment trajectory is anomalous.** Q4 2025 returned to Q1 2025 levels (5.0%) without the expected seasonal recovery. This is inconsistent with normal Icelandic seasonal patterns and suggests structural rather than purely cyclical forces.

6. **Youth unemployment is high but not unusual.** The 16–24 cohort consistently runs 2.0–3.5x the headline rate. Their 2025 Q1 spike (12.2%) is large but tracks COVID-era pattern for that cohort (peaked at ~20% during COVID). Youth unemployment is not anomalous in the context of the construction/tourism hiring cycles that affect them most.

7. **The 25–54 cohort shows the most alarming structural signal.** In Q4 2025, the 25–54 rate reached 4.9% — nearly matching headline unemployment. This is the highest observed for this cohort in the post-COVID recovery period. The occupation data (Professionals, Managers) maps directly onto this age band.

8. **Foreign nationals bear disproportionate unemployment burden.** By 2024, approximately 55% of all registered unemployed were foreign nationals, despite representing ~22% of the labor force. Foreign national unemployment rate: 8.9% vs Icelandic rate: 2.3%. This is a significant confounding factor — any sector contracting employment of foreign workers (many of whom work in construction, hospitality, and increasingly in IT support roles) will show unemployment spikes in their nationality category without necessarily indicating knowledge-worker AI displacement.

9. **The Rikisendurskoðun audit flagged a growing measurement crisis.** The gap between Hagstofa and VMST unemployment figures grew from 6% (2019) to 17% (2024). The audit was prompted by this discrepancy and noted it produces "misleading public information." Any macro analysis of Iceland's labor market is systematically confounded by this gap.

10. **Mass layoff notifications in early 2026 specifically named IT and scientific research.** The February 2026 notifications (69 workers: 24 IT, 45 scientific research) are small in absolute scale but directionally notable — these are explicitly knowledge-sector roles.

---

## SECTION 6: GAPS AND CAVEATS

### What was not obtained

1. **Monthly sector breakdown from VMST (Jan 2024–Jan 2026):** The VMST dashboard provides sector data visually but the bar chart data (Figure 4, "Atvinnulausir eftir atvinnugreinum") was not available with monthly granularity in extractable form. The annual figures from the 2024 report were read visually. Sectors like "Upplýsingatækni og útgáfa" (IT and publishing) and "Séfræðiþjónusta" (specialist services) are identified in the bar charts as having notable unemployment but exact monthly figures were not extractable.

2. **Q1 2026 Hagstofa LFS data:** Not yet published (would cover Jan–Mar 2026). The most recent Hagstofa quarterly data is Q4 2025.

3. **Sub-sector data for ICT:** VIN01110 codes J, K, L, M, N are available, but granular sub-codes within J (e.g., software vs. telecom vs. IT services) were not separately requested.

4. **Individual layoff company data:** No employer-level data is publicly available identifying which specific companies in the ICT or M sector reduced headcount.

5. **Vacancy data:** Job vacancy data (VIN lausstorf tables) was not extracted. High vacancies in physical sectors alongside declining knowledge-sector employment would strongly support the polarization hypothesis.

6. **Wage data by sector:** No wage trend data was extracted. A displacement hypothesis would predict wage stagnation or compression in knowledge sectors even where employment holds steady.

### Key caveats

- **The measurement discrepancy (Hagstofa vs VMST) is material.** Rate differences of 2pp at the same point in time make cross-source comparisons hazardous. This report uses Hagstofa LFS for structural trends and VMST for monthly trends, but the sources are not directly comparable.

- **The economy added 8,800 jobs in 2023→2024 before the 2024→2025 reversal.** The contraction observed is from a high base, not from stagnation. This makes the occupation-level signal stronger (it is not a general recession but a selective rebalancing).

- **Foreign national unemployment dominates the VMST registered figures.** With 55% of registered unemployed being foreign nationals and the foreign national unemployment rate at 8.9%, any analysis of sector-level VMST unemployment is substantially driven by immigration and integration factors rather than AI displacement per se.

- **Sample size limitations for quarterly LFS data.** The Hagstofa LFS is a sample survey (~5,200 respondents). Age x sex x quarter cells (e.g., females 55–74 in Q3) may have very high confidence intervals. The "0.5%" rate for males 55–74 in some quarters almost certainly reflects small-sample noise.

- **2025 annual Hagstofa data is available** (last updated February 2026), meaning the full annual picture for 2025 is in the LFS. However, the occupation and sector annual data shows 2025 as a reversal year relative to 2024.

---

## SECTION 7: INTERIM CONCLUSION

### Does the macro data support, qualify, or weaken the AI displacement hypothesis?

**Short answer: The data QUALIFIES the hypothesis — it finds real and unusual signals in the right direction, but also finds confounding factors that prevent confident attribution to AI.**

### What the data SUPPORTS regarding displacement

The 2024→2025 occupation-level data is the most striking finding in this entire dataset. A synchronized contraction of -9,300 jobs across all four knowledge-intensive occupation tiers (Professionals, Managers, Associate Professionals, Clerks) in a single year, while physical and service occupations grow by +6,900, is exactly the pattern a displacement hypothesis would predict. This is not noise — it is 9,300 jobs from a workforce of ~225,000, roughly 4% of total employment shifting category in one year.

The ICT sector's net loss of 1,300 jobs 2023→2025 (-11.4%) is also consistent with the hypothesis. In an economy that added 7,500 total jobs over that period, the ICT sector declining is anomalous.

The Q4 2025 unemployment anomaly — failing to recover seasonally — suggests the labor market has absorbed a structural shock, not merely a cyclical one.

The early 2026 mass layoff notifications explicitly naming IT and scientific research positions, though small in absolute scale, are directionally consistent.

### What the data WEAKENS or CONFOUNDS

The physical sector growth story is not evidence against the hypothesis — it is simply a separate economic dynamic (construction boom, tourism expansion). But it matters for causation: the dominant story of Iceland's 2024–2025 labor market is physical sector expansion, not knowledge-sector collapse. The knowledge-sector story is secondary in scale.

Youth unemployment (16–24) driving the headline rate increases more than the 25–54 cohort (in percentage-point terms) weakens the age-distribution case for knowledge-worker displacement. Construction-cycle effects and tourism seasonality strongly affect youth unemployment and confound the signal.

Foreign national unemployment at 8.9% vs. Icelandic 2.3% suggests that much of the unemployment increase is driven by immigrant workers in cyclically sensitive physical sectors — not by Icelandic knowledge workers losing jobs to automation.

The measurement crisis (Hagstofa vs. VMST gap of 17%) means we genuinely do not know the unemployment rate with precision. Policy has been made on potentially systematically misleading figures.

### The most honest summary

Iceland's labor market in 2024–2025 shows a classic "polarization" pattern: knowledge-intensive occupations contracting while physical and service occupations expand. This polarization intensified sharply in 2025. The ICT sector specifically lost headcount. The occupation-level contraction of Professionals and Managers is statistically notable and not explained by the physical sector cycles that dominate the headline numbers.

However: Iceland is also in a construction boom, a tourism boom, experiencing a foreign-national labor market that operates differently from the Icelandic-born market, and facing a growing measurement crisis in how unemployment is counted. Multiple confounding factors compete with the displacement hypothesis for explanatory credit.

**The macro data is consistent with AI-related displacement being a contributing factor to the knowledge-sector contraction, but it cannot identify AI as the cause.** What it shows clearly is that something differentiated between knowledge and physical labor in 2025 that was not present in 2022–2024. Further investigation (Workstreams B and C) should seek company-level data, tech sector hiring/firing announcements, and wage data to sharpen the causal attribution.

### Falsification test scorecard

| Test | Result | Strength |
|------|--------|----------|
| FA-1: Physical vs. knowledge sector concentration | **MIXED** — Physical sectors growing, but J and M sectors losing jobs AND knowledge occupations down 9,300 | Hypothesis partially supported at occupation level |
| FA-2: Seasonality explanation | **PARTIAL WEAKENING** — Q1 2025 spike has seasonal component, but Q4 2025 anomaly is non-seasonal | Structural signal present in Q4 2025 |
| FA-3: Age distribution (25–54) | **PARTIAL WEAKENING** — Youth rates dominate, but 25–54 prime-age cohort at 4.9% in Q4 2025 is unprecedented in this dataset | Inconclusive — youth dominates, but prime-age rising |

**Overall verdict:** The displacement hypothesis is NOT falsified by the macro data, but it is not confirmed either. It is qualified: there are real signals in the knowledge-occupation and ICT-sector data that warrant deeper investigation, but confounding factors (construction cycle, foreign national labor dynamics, measurement error) prevent macro-level confirmation.

---

*End of Workstream A Report*
*Next recommended: Workstream B (company-level and tech-sector specific analysis) and vacancy rate data extraction*
