# VMST Unemployment Data — Manifest

**Generated:** 2026-04-20 13:53 UTC
**Ingest script:** `scripts/vmst_ingest.py`

## Source

- Dashboard: <https://island.is/s/vinnumalastofnun/maelabord-og-toelulegar-upplysingar>
- Power BI (G5 page): <https://app.powerbi.com/view?r=eyJrIjoiZTc0NTIxYmItZTUwMS00YjAyLThhYTItMDhhOGJiODRkMDg3IiwidCI6Ijc2NGEzMDZkLTBhNjgtNDVhZC05ZjA3LTZmMTgwNDQ0N2NkNCIsImMiOjh9&pageName=ReportSection7e7dca64570c18a74eb9>
- XLSM file: <https://assets.ctfassets.net/8k0h54kbe6bj/688FRtXuoA4qkPXerKcuMT/e6b9794d1bdfcf5cb5747a46b9b3d836/Talnagogn_atvinnuleysi.xlsm>

## Provenance

FOIA reply #05 — VMST (Ásta Ásgeirsdóttir, deildarstjóri Greiningardeildar) 20. apríl 2026.
Request 02_VMST_SECTOR_UNEMPLOYMENT (sent 14. apríl 2026) was answered by
referring to the public dashboard (self-service — no bespoke query).

## Files

| File | Rows | SHA-256 |
|------|-----:|---------|
| `vmst_Talnagogn_atvinnuleysi_2026-03.xlsm` | — | `bd6ea781ccf69cef4c890c0796a5c9068a65ef9968ac86ef1b0a6d2cc23a70a7` |
| `vmst_G1_unemployment_annual.csv` | 26 | `6e51bd13fa43f1d968453a4e2b27d058027c38020e60e1f61e8679cf7d8b1c8a` |
| `vmst_G2_unemployment_monthly_rate.csv` | 19,570 | `0b19b7b9c6a291c28f1d98742a68c6cc6736cbf7c2c3eecf79d0bc65095f15ad` |
| `vmst_G3_register_by_region.csv` | 18,839 | `ca15e2c97411c165ed15ec05d80153d419149b4ecf5203c872c0d00a5b38c2a7` |
| `vmst_G4_register_by_age.csv` | 15,700 | `2107b51dbbd6f0b5ded6fc2d469e5cbdc5bac66415373248b23d693abbe388b4` |
| `vmst_G5_register_by_sector.csv` | 16,596 | `f2cd92d9761e901a61827ba32b956e9a945e78f414c97ff580d27fd755dea85f` |

## Sheet descriptions

| Sheet | Content | Coverage | Columns |
|-------|---------|----------|---------|
| G1 | Árlegt atvinnuleysi (%) | 2000–2025 | ar, atvinnuleysi_hlutfall |
| G2 | Mánaðarlegt atvinnuleysi (% og meðalfjöldi) eftir landshluta, kyni, ríkisfangi | 2000-02 → 2026-03 | manudur, maeling, flokkur, gildi |
| G3 | Fjöldi á skrá eftir svæði/sveitarfélagi × kyni/ríkisfangi | 2000-02 → 2026-03 | manudur, svaedi, kyn_eda_rikisfang, fjoldi |
| G4 | Fjöldi á skrá eftir aldurshópum og lengd á skrá × ríkisfangi | 2000-02 → 2026-03 | manudur, rikisfang, flokkur, fjoldi |
| G5 | Fjöldi á skrá eftir **atvinnugreinum** × ríkisfangi | 2000-02 → 2026-03 | manudur, rikisfang, atvinnugrein, fjoldi |

## Known limitations (G5 sector breakdown)

- **Not ÍSAT-compliant.** VMST uses 18 bespoke categories. Primary correspondence:
  - ÍSAT J = 'Upplýsingar og fjarskipti' (1:1) ✅
  - ÍSAT K = 'Fjármála- og vátryggingastarfsemi' (1:1) ✅
  - ÍSAT M = 'Sérfræðileg, vísindaleg og tæknileg starfsemi' (1:1) ✅
  - ÍSAT F = 'Byggingastarfsemi og mannvirkjagerð' (1:1) ✅
  - ÍSAT I = 'Gistiþjónusta' + 'Veitingaþjónusta' + 'Ferðaþjónusta ýmis' (3:1) ⚠️
  - ÍSAT O–Q = 'Opinber þjónusta, fræðsla, heilbrigðis- og félagsþjónusta' (many:1) ⚠️
  - **ÍSAT N (administrative & support services) has no mapping — absorbed in 'Ýmis þjónustustarfsemi'** ❌
- **Head counts only** — no labour-force denominators by sector → no sector-level unemployment rate computable from G5 alone.
- **VBA macros stripped** (`keep_vba=False`) — parsed values are static snapshots (as of file publication date).

## Reproducibility

```
cd data/iceland-ai-governance-audit
python scripts/vmst_ingest.py --all
```

Expected SHA-256 of `vmst_Talnagogn_atvinnuleysi_2026-03.xlsm`:

    bd6ea781ccf69cef4c890c0796a5c9068a65ef9968ac86ef1b0a6d2cc23a70a7

*If the upstream XLSM is re-published, this hash will change and the manifest must be regenerated. The dashboard does not version historical files.*
