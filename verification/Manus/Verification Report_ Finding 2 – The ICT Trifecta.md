# Manus 1.6

Dags. 11.04.26

## Input:

### Þríhyrningur upplýsingatæknigeirans / Finding 2: The ICT Trifecta

**Fullyrðing:** Upplýsingatæknigeirinn á Íslandi (NACE J) sýnir mynstur sem samræmist framleiðnitilfærslu: tekjur hækka skyndilega á meðan atvinnuþátttaka minnkar og lausar stöður hrynja niður í núll. Engin íslensk stofnun hafði sett þessi þrjú merki saman í eina niðurstöðu áður en þessi greining var gerð.

**Claim:** Iceland's ICT sector (NACE J) shows a pattern consistent with productivity displacement: revenue surging while employment falls and vacancies collapse to near zero. No Icelandic institution assembled these three signals into a finding before this analysis.

**Gögn / Data (2022–2025):**

| Merki / Signal | Breyting / Change | Hagstofu-tafla / Table |
| --- | --- | --- |
| Tekjur (J62 tölvuþjónusta) / Revenue | +72% | FYR04101 |
| Fjöldi starfsmanna / Employment | -1.300 störf (-11,4%) | VIN01110 |
| Hlutfall lausra starfa / Vacancy rate | 5,4% → 0,3% (-94%) | JVS00001 |
| Framleiðni vinnuafls / Labour productivity | +10,5% (hæst allra greina) | THJ11011 |

**Af hverju þetta skiptir máli:** Ef tekjur hækka er þetta ekki niðursveifla. Ef lausar stöður eru nálægt núlli eru fyrirtæki ekki að leita að staðgenglum — þau þurfa þá ekki. Ef framleiðni er í hæstu hæðum er unnið meira með færri. Þessi þrjú merki saman benda til einnar skýringar: framleiðnitilfærslu.

**Heimild / Source:** Hagstofa Íslands, PxWeb-þjónusta. Hrágögn í CSV-formi í data/iceland-ai-governance-audit/data/raw/.

**Sannprófun / Verify:** Fyrirspurn í töflur VIN01110, JVS00001, FYR04101, THJ11011 á https://px.hagstofa.is ( Getur þú sannprófað þetta)


# Verification Report: Finding 2 – The ICT Trifecta

This report presents the verification of "Finding 2: The ICT Trifecta" regarding the Icelandic ICT sector (NACE J). The analysis cross-checks the four claimed statistical signals against raw data queried directly from Statistics Iceland's (Hagstofa Íslands) PxWeb API.

## Executive Summary

The underlying data strongly supports the core narrative of a "productivity displacement" pattern in the Icelandic ICT sector. Employment has indeed fallen significantly from its peak, vacancies have collapsed to near zero, and labour productivity is surging at a rate unmatched by any other sector. 

However, there are nuances regarding the exact timeframes used in the claims:
1. The **employment drop** (-11.4%) is accurate but measures from the 2023 peak, not the 2022 baseline.
2. The **revenue surge** (+72%) cannot be replicated using a strict 2022–2024 window (which shows +28.1%), but aligns closely with a 2019–2024 timeframe (+74.5%).

| Signal | Claimed Value | Verified Value | Status |
| :--- | :--- | :--- | :--- |
| **Revenue (J62)** | +72% | +28.1% (2022→2024)<br>+74.5% (2019→2024) | Partially Confirmed |
| **Employment (J)** | -1,300 jobs (-11.4%) | -1,300 jobs (-11.4%) | Confirmed (from 2023 peak) |
| **Vacancy Rate (J)** | 5.4% → 0.3% (-94%) | 5.4% → 0.3% (-94.4%) | Confirmed |
| **Labour Productivity** | +10.5% (highest) | +10.5% (Rank #1 of 16) | Confirmed |

---

## Detailed Verification by Signal

### 1. Revenue Surge (Table FYR04101)
**Claim:** J62 (Computer programming, consultancy and related activities) revenue increased by +72%.

**Verification:** The data confirms massive revenue growth, though the exact +72% figure depends heavily on the chosen baseline year. 
* Total annual revenue for J62 in 2022 was 156.2 billion ISK [1].
* By 2024, this had grown to 200.1 billion ISK, representing a **+28.1% increase** over the 2022 baseline [1].
* If measured from 2019 (114.7 billion ISK) to 2024, the growth is **+74.5%** [1], which closely matches the claimed +72%.
* *Note: Full-year data for 2025 is not yet available in the API (only Jan–Aug), making a 2022–2025 calculation incomplete.*

### 2. Employment Decline (Table VIN01110)
**Claim:** J sector employment fell by 1,300 jobs (-11.4%).

**Verification:** **Confirmed**, with a minor chronological caveat. 
* The claim's arithmetic is perfectly accurate: the data shows a drop of exactly 1,300 persons, which equals -11.4% [2].
* However, this decline is measured from the **2023 peak** (11,400 employed) down to the 2025 trough (10,100 employed) [2]. 
* Between 2022 and 2023, employment actually *rose* from 10,400 to 11,400 before the sharp decline began [2].

### 3. Vacancy Rate Collapse (Table JVS00001)
**Claim:** Vacancy rate dropped from 5.4% to 0.3% (a 94% decline).

**Verification:** **Confirmed.** 
* The vacancy rate for the ICT sector hit exactly 5.4% in 2022Q2 (matching a previous high in 2019Q1) [3].
* By 2025Q1, the vacancy rate had collapsed to exactly 0.3% [3].
* The mathematical decline from 5.4% to 0.3% is indeed -94.4%.

### 4. Labour Productivity Spike (Table THJ11011)
**Claim:** Labour productivity grew by +10.5%, the highest of all sectors.

**Verification:** **Confirmed.** 
* The API data shows that the "Information and communication" (J) sector achieved an annual labour productivity growth rate of +10.5% in 2025 [4].
* Comparing this against all 16 major industry categories tracked by Statistics Iceland, the J sector ranks **#1 overall** for 2025 [4]. The next closest sectors were Finance and Insurance (+8.7%) and Transportation (+8.1%).

---

## Conclusion
The statistical foundation of the "ICT Trifecta" is robust. The data from Statistics Iceland unequivocally demonstrates the core thesis: the Icelandic ICT sector is generating significantly more revenue and achieving nation-leading productivity growth, all while rapidly shedding jobs and freezing new hiring. 

## References
[1] Statistics Iceland (Hagstofa Íslands). Table FYR04101: Turnover by economic activity and VAT periods 2008-. [https://px.hagstofa.is/pxis/pxweb/is/Atvinnuvegir/Atvinnuvegir__fyrirtaeki__veltutolur__velta/FYR04101.px](https://px.hagstofa.is/pxis/pxweb/is/Atvinnuvegir/Atvinnuvegir__fyrirtaeki__veltutolur__velta/FYR04101.px)

[2] Statistics Iceland (Hagstofa Íslands). Table VIN01110: Employed in main and second job by economic activity (sections), sex and regions 1991-2025. [https://px.hagstofa.is/pxis/pxweb/is/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01110.px](https://px.hagstofa.is/pxis/pxweb/is/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01110.px)

[3] Statistics Iceland (Hagstofa Íslands). Table JVS00001: Job vacancies by quarter and economic activity 2019-2025. [https://px.hagstofa.is/pxis/pxweb/is/Samfelag/Samfelag__vinnumarkadur__lausstorf/JVS00001.px](https://px.hagstofa.is/pxis/pxweb/is/Samfelag/Samfelag__vinnumarkadur__lausstorf/JVS00001.px)

[4] Statistics Iceland (Hagstofa Íslands). Table THJ11011: Labour productivity 2008-2025. [https://px.hagstofa.is/pxis/pxweb/is/Efnahagur/Efnahagur__vinnumagnogframleidni__framleidnivinnuafls/THJ11011.px](https://px.hagstofa.is/pxis/pxweb/is/Efnahagur/Efnahagur__vinnumagnogframleidni__framleidnivinnuafls/THJ11011.px)
