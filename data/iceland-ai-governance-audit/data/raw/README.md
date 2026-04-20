# raw/ — Source data (do not edit by hand)

All files in this directory are produced by scripts in `../../scripts/`. Do not
edit them manually — the scripts are the source of truth and must be re-runnable
end-to-end.

## Regenerate everything

```bash
cd data/iceland-ai-governance-audit
./scripts/run_pipeline.sh          # Hagstofa PxWeb + TED + VMST + validate
```

## File inventory

### Hagstofa PxWeb extracts (`scripts/hagstofa_pxweb.py`)

| File | Source | Cadence | Rows |
|------|--------|--------:|-----:|
| `employment_by_sector_annual.csv` | VIN01110 | annual | — |
| `employment_by_occupation_annual.csv` | VIN01100 | annual | — |
| `unemployment_quarterly.csv` | VIN00920 | quarterly | — |
| `vacancies_quarterly.csv` | JVS00001 | quarterly | — |
| `vat_turnover_monthly.csv` | FYR04101 | monthly | — |
| `register_employment_monthly.csv` | VIN10022 | monthly | — |
| `wages_by_sector_occupation_annual.csv` | VIN02003 | annual | — |
| `wage_index_quarterly.csv` | LAU04109 | quarterly | — |
| `labour_productivity_annual.csv` | THJ11011 | annual | — |
| `ict_structural_stats_annual.csv` | FYR08001 | annual | — |

Schema details: see `../docs/DATA_DICTIONARY.md`.

### VMST unemployment dashboard (`scripts/vmst_ingest.py`)

| File | Content | Rows | Coverage |
|------|---------|-----:|----------|
| `vmst_Talnagogn_atvinnuleysi_2026-03.xlsm` | Original XLSM snapshot (binary) | — | 2000–2026 |
| `vmst_G1_unemployment_annual.csv` | Annual unemployment % | 26 | 2000–2025 |
| `vmst_G2_unemployment_monthly_rate.csv` | Monthly rate + headcount × region/gender/citizenship | 19,570 | 2000-02 → 2026-03 |
| `vmst_G3_register_by_region.csv` | End-of-month register × region × citizenship | 18,839 | 2000-02 → 2026-03 |
| `vmst_G4_register_by_age.csv` | End-of-month register × age × duration | 15,700 | 2000-02 → 2026-03 |
| `vmst_G5_register_by_sector.csv` | End-of-month register × VMST 18-sector × citizenship | 16,596 | 2000-02 → 2026-03 |
| `vmst_MANIFEST.md` | SHA-256 manifest + provenance | — | — |

**Source:** VMST dashboard on island.is (<https://island.is/s/vinnumalastofnun/maelabord-og-toelulegar-upplysingar>). The XLSM is a static companion file refreshed monthly. See `vmst_MANIFEST.md` for the exact upstream URL, SHA-256 hashes, and FOIA provenance (request #02, reply 20. apríl 2026). **Caveat:** the VMST 18-category classification is not ÍSAT-compliant — see `../docs/DATA_DICTIONARY.md#vmst-talnagögn-monthly-xlsm-g1g5-sheets` for the crosswalk.

### TED procurement extracts (`scripts/ted_procurement.py`)

| File | Source | Rows |
|------|--------|-----:|
| `ted_procurement.csv` | TED eTendering API (CPV 72xxx, country:IS) | — |

## Validation

`scripts/validate_data.py` checks schema, required columns, row-count thresholds,
and known-cell spot values. Run `./scripts/run_pipeline.sh --validate` or
`./scripts/run_pipeline.sh --strict` (promotes warnings to errors).
