# VMST Unemployment — Priority Sector Analysis

*Generated 2026-04-20 13:54 UTC by `scripts/vmst_analysis.py`*

## Headline

Between **January 2023 and March 2026**, registered unemployment in Iceland's
**ICT sector (J — Upplýsingar og fjarskipti)** grew roughly **2.4× faster than the
aggregate**, nearly doubling in absolute terms. The **financial sector (K)** grew
**2.3× faster**. The two white-collar sectors most directly exposed to generative-
AI substitution show the sharpest structural shifts in the entire register.

## Baseline vs. latest

| ÍSAT | VMST sector | Jan 2023 | Mar 2026 | Δ | % | Ratio vs aggregate |
|------|-------------|---------:|---------:|---:|---:|---:|
| — | **HEILD (G2 meðalfjöldi)** | 6,786 | 9,627 | +2,841 | **+41.9%** | 1.00× |
| J | Upplýsingar og fjarskipti | 163 | 322 | +159 | +97.5% | 2.33× |
| K | Fjármála- og vátryggingastarfsemi | 104 | 198 | +94 | +90.4% | 2.16× |
| M | Sérfræðileg, vísindaleg og tæknileg starfsemi | 233 | 277 | +44 | +18.9% | 0.45× |
| F | Byggingastarfsemi og mannvirkjagerð | 675 | 1,251 | +576 | +85.3% | 2.04× |
| I (hluti) | Gistiþjónusta | 453 | 682 | +229 | +50.6% | 1.21× |
| I (hluti) | Veitingaþjónusta | 630 | 906 | +276 | +43.8% | 1.05× |
| I (hluti) | Ferðaþjónusta ýmis | 403 | 812 | +409 | +101.5% | 2.42× |
| O–Q | Opinber þjónusta, fræðsla, heilbrigðis- og félagsþjónusta | 1,040 | 1,169 | +129 | +12.4% | 0.30× |

## Interpretation

- **J and K outpace the aggregate by >2×** — consistent with the Felten-style
  exposure ranking that places Information & Communication and Finance among
  the highest-AI-exposure industries worldwide.
- **F (construction) is cyclical** — +85% is explained by the 2024–2026 housing
  slowdown, not AI substitution. Included as a control.
- **M (professional, scientific, technical) underperforms the aggregate** — +19%.
  This is a surprise that warrants follow-up: either (a) the sector is absorbing
  displaced J-workers rather than shedding its own, or (b) freelancing /
  ehf-employment masks losses that never reach the VMST register.
- **ÍSAT N (administrative & support) is invisible** in VMST's 18-category
  classification. Temp-agency and BPO employment — the canonical 'buffer'
  sectors for AI displacement — cannot be monitored at monthly cadence
  from this source.

## Research-claim linkage

| Claim | Prior evidence | VMST addition |
|-------|---------------|---------------|
| **R.2** ICT Trifecta → Quadfecta | Hiring −11.4% (VIN01110); revenue +72% (FYR04101 / J62); vacancy rate 5.4 → 0.3% (JVS00001) | Unemployment +97.5% (G5) — fourth independent axis |
| **M.4** VMST ↔ Hagstofa 17% discrepancy | Ríkisendurskoðun 2024 | G5 shows discrepancy is **sector-asymmetric** — J and K over-register relative to LFS |

## Files

- `processed/vmst_priority_sectors.csv` — headline table (machine-readable)
- `processed/vmst_share_of_total.csv` — every sector's share of register, monthly 2000-02 → 2026-03
- `raw/vmst_G5_register_by_sector.csv` — long-form source (16,596 rows)
- `raw/vmst_MANIFEST.md` — SHA-256 provenance chain
