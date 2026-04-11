# Verification Report: Finding 4 – Iceland Is Flying Blind

**System:** Claude Code (Sonnet 4.6) — internal agent with web search
**Date:** 13. apríl 2026

---

## Executive Summary

**2 fully confirmed, 2 partially confirmed, 1 partially confirmed with correction needed.**

Core finding stands: Iceland is excluded from every key European measurement and governance instrument. One claim (Hilfr2 "world's first") overstates the evidence.

| Claim | Status |
|-------|--------|
| 4a: Eurostat isoc_eb_ai exclusion | ✅ CONFIRMED |
| 4b: EWCS 2024 exclusion | ✅ CONFIRMED |
| 4c: Nordic linked admin data systems | ✅ CONFIRMED (systems) / ⚠️ PARTIALLY (Iceland gap) |
| 4d: Collective agreements + Iceland none | ⚠️ PARTIALLY CONFIRMED — "world's first" overclaim |
| 4e: 17% measurement discrepancy | ⚠️ PARTIALLY CONFIRMED — correct figure, source attribution needs precision |

---

## Claim 4a: Eurostat isoc_eb_ai Exclusion

**Status:** ✅ CONFIRMED

**Evidence:** Eurostat "Use of artificial intelligence in enterprises" article lists all participating countries: 27 EU member states + Norway, Switzerland, Liechtenstein, candidate countries. Iceland does not appear. Exact figures for claimed countries:

| Country | Claimed | Verified |
|---------|---------|----------|
| Denmark | 42.0% | 42.03% |
| Finland | 37.8% | 37.82% |
| Sweden | 35.0% | 35.04% |
| Norway | 28.9% | 28.89% |
| **Iceland** | **N/A** | **Not in survey** |

**Source:** https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Use_of_artificial_intelligence_in_enterprises

**Caveat:** Confirmation comes from Statistics Explained article (the interactive databrowser returned JavaScript only). Percentages match claimed figures to 4 significant figures.

---

## Claim 4b: EWCS 2024 Exclusion

**Status:** ✅ CONFIRMED

**Evidence:** Eurofound EWCS 2024 page explicitly states 35 countries surveyed: *"27 EU Member States, Albania, Bosnia and Herzegovina, Kosovo, Montenegro, North Macedonia, Norway, Serbia and Switzerland."* Iceland is not listed. Norway and Switzerland are included; Iceland is not.

**Source:** https://www.eurofound.europa.eu/en/surveys-and-data/surveys/european-working-conditions-survey/ewcs-2024

**Caveat:** Previous-wave Iceland participation (claimed as 2015) was not independently confirmed from this fetch — though absence from 2024 is unambiguous.

---

## Claim 4c: Nordic Linked Admin Data Systems

**Status:** ✅ CONFIRMED (systems exist as described) / ⚠️ PARTIALLY CONFIRMED (Iceland gap)

**Evidence:**

| System | Country | Confirmed |
|--------|---------|-----------|
| DREAM+IDA | Denmark | ✅ — links employment, wages, transfers at individual level since 1991 |
| LISA | Sweden | ✅ — ~500 variables, full adult population since 1990 |
| FD-Trygd | Norway | ✅ — employment, sickness, welfare, disability since 1992 |
| Findata | Finland | ✅ — permit-gated linked health/social registers, legislation 2019 |
| Iceland equivalent | — | No named system found in any source |

**Sources:** IDA — https://ncrr.au.dk/danish-registers/the-integrated-database-for-labour-market-research-ida; LISA — https://www.scb.se/en/services/ordering-data-and-statistics/register/longitudinal-integrated-database-for-health-insurance-and-labour-market-studies-lisa/; Findata — https://findata.fi/en/

**Caveat:** Iceland's absence is based on negative evidence — no named equivalent system found. Cannot rule out an unnamed or less-publicised system. The claim is plausible and consistent with known Icelandic research infrastructure, but strictly this is "not found" rather than "confirmed absent."

---

## Claim 4d: Collective Agreements — ⚠️ "WORLD'S FIRST" OVERCLAIM

**Status:** PARTIALLY CONFIRMED — Hilfr2 exists and is significant; "world's first" is not supported

**Evidence:**
- **Hilfr2 (Denmark, 2024):** Confirmed as real, covers AI/algorithmic management, transparency requirements, disclosure of AI decision rationale, digital union presence. Eurofound describes it as "one of the first collective agreements in Europe with longer text on AI and algorithmic management" — NOT "the world's first AI-specific collective agreement."
- **Norway LO-NHO Basic Agreement:** The 2022-2025 Hovedavtalen exists. AI/algorithmic governance is discussed in Norwegian industrial relations context. Specific AI clauses in the agreement text were not retrieved.
- **Sweden Teknikföretagen-IF Metall:** The Teknikavtal 2025-2027 exists. Industriall Europe confirms AI in Swedish collective bargaining. A discrete "AI framework" document was not found.
- **Iceland:** No collective agreement mentioning AI, gervigreind, or algorithmic management found.

**Sources:** https://apps.eurofound.europa.eu/platformeconomydb/collective-agreement-on-use-of-ai-and-algorithms-signed-110187; https://www.eurofound.europa.eu/en/publications/all/collective-bargaining-on-artificial-intelligence-at-work

**⚠️ Correction needed:** Replace "world's first AI-specific collective agreement" with "one of the first collective agreements in Europe to explicitly address AI and algorithmic management." The underlying point (pioneering agreement; Iceland has nothing comparable) remains valid.

---

## Claim 4e: 17% Measurement Discrepancy

**Status:** ⚠️ PARTIALLY CONFIRMED — figure is correct, source attribution needs precision

**Evidence:**
- The 17% discrepancy figure is confirmed: Ríkisendurskoðun audit found the gap between Hagstofa and VMST grew from 6% (2019) to 17% (2024).
- The Althingi document cited (https://www.althingi.is/altext/156/s/0350.html) confirms the methodological divergence and recommends coordination — but does **not** contain the specific percentage figures (5.2%/3.3%) or the "17%" calculation.
- The specific monthly figures (Hagstofa 5.2% vs VMST 3.3% for September 2024) were not independently verified from any retrieved source.

**Sources:** Althingi document confirmed for institutional context; quantified 17% figure sourced from Ríkisendurskoðun audit report: https://www.rikisend.is/reskjol/files/Skyrslur/2025_atvinnuleysi_og_vinnumarkadsurraedi.pdf

**⚠️ Precision note:** The citation in MEGA_REPORT points to the Althingi document for the 17% figure, but the figure comes from the Ríkisendurskoðun audit report itself. Update the source reference to the correct document.

---

## Items Requiring Action in MEGA_REPORT

1. **Claim 4d:** Change "world's first AI-specific collective agreement" → "one of the first collective agreements in Europe to explicitly address AI and algorithmic management"
2. **Claim 4e:** Update source citation for the 17% figure to the Ríkisendurskoðun audit report, not the Althingi document
3. **Claim 4e:** The specific monthly figures (5.2%/3.3%) remain unverified — consider citing as illustrative rather than exact
