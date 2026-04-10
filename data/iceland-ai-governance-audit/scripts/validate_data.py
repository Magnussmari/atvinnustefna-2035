#!/usr/bin/env python3
"""
PANOPTICON REVERSE — Data Validation
Checks extracted CSV files for completeness, consistency, and plausibility.

Usage:
    python validate_data.py          # Validate all CSVs in data/raw/
    python validate_data.py --strict  # Fail on warnings too

Exit codes:
    0 = all checks passed
    1 = errors found
    2 = warnings only (pass in normal mode, fail in --strict)
"""

import argparse
import csv
import sys
from pathlib import Path

DATA_DIR = Path(__file__).parent.parent / "data" / "raw"

# Expected tables with minimum row counts and sanity checks
EXPECTED_TABLES = {
    "unemployment_quarterly.csv": {
        "min_rows": 500,
        "required_columns": ["Ársfjórðungur", "Kyn", "Aldur", "Eining", "value"],
        "value_checks": [
            ("Eining", "Unemployment rate, % (Ratio of labour force)", "value", 0, 40,
             "Unemployment rate should be 0-40%"),
        ],
    },
    "employment_by_sector_annual.csv": {
        "min_rows": 200,
        "required_columns": ["value"],
    },
    "employment_by_occupation_annual.csv": {
        "min_rows": 100,
        "required_columns": ["value"],
    },
    "vacancies_quarterly.csv": {
        "min_rows": 100,
        "required_columns": ["Ársfjórðungur", "Atvinnugrein", "Eining", "value"],
        "value_checks": [
            ("Eining", "Job vacancy rate", "value", 0, 30,
             "Vacancy rate should be 0-30%"),
        ],
    },
    "vat_turnover_monthly.csv": {
        "min_rows": 1000,
        "required_columns": ["value"],
    },
    "wages_by_sector_occupation_annual.csv": {
        "min_rows": 5000,
        "required_columns": ["value"],
    },
    "wage_index_quarterly.csv": {
        "min_rows": 200,
        "required_columns": ["value"],
    },
    "register_employment_monthly.csv": {
        "min_rows": 1000,
        "required_columns": ["Mánuður", "Atvinnugrein (Bálkar)", "value"],
    },
    "labour_productivity_annual.csv": {
        "min_rows": 50,
        "required_columns": ["value"],
    },
    "ict_structural_stats_annual.csv": {
        "min_rows": 1000,
        "required_columns": ["value"],
    },
}


def validate_file(filepath: Path, spec: dict) -> tuple[list, list]:
    """Validate a single CSV file. Returns (errors, warnings)."""
    errors = []
    warnings = []

    if not filepath.exists():
        errors.append(f"MISSING: {filepath.name}")
        return errors, warnings

    try:
        with open(filepath, newline="") as f:
            reader = csv.DictReader(f)
            rows = list(reader)
    except Exception as e:
        errors.append(f"PARSE ERROR: {filepath.name}: {e}")
        return errors, warnings

    # Row count check
    if len(rows) < spec["min_rows"]:
        errors.append(
            f"ROW COUNT: {filepath.name} has {len(rows)} rows "
            f"(expected >= {spec['min_rows']})"
        )

    # Required columns
    if rows:
        actual_cols = set(rows[0].keys())
        for col in spec.get("required_columns", []):
            if col not in actual_cols:
                errors.append(f"MISSING COLUMN: {filepath.name} missing '{col}'")

    # Null/empty value check
    null_count = sum(1 for r in rows if r.get("value") in (None, "", "None"))
    null_pct = (null_count / len(rows) * 100) if rows else 0
    if null_pct > 20:
        warnings.append(
            f"NULL VALUES: {filepath.name} has {null_count} nulls "
            f"({null_pct:.1f}%)"
        )

    # Value plausibility checks
    for check in spec.get("value_checks", []):
        filter_col, filter_val, val_col, lo, hi, msg = check
        for r in rows:
            if r.get(filter_col) == filter_val:
                try:
                    v = float(r[val_col])
                    if v < lo or v > hi:
                        warnings.append(
                            f"PLAUSIBILITY: {filepath.name}: {msg} "
                            f"(got {v} in {r.get('Ársfjórðungur', '?')})"
                        )
                        break  # one warning per check is enough
                except (ValueError, TypeError):
                    pass

    return errors, warnings


def main():
    parser = argparse.ArgumentParser(description="Validate Panopticon data files")
    parser.add_argument("--strict", action="store_true", help="Fail on warnings too")
    args = parser.parse_args()

    print("PANOPTICON DATA VALIDATION")
    print("=" * 50)
    print(f"Data directory: {DATA_DIR}")
    print()

    all_errors = []
    all_warnings = []

    for filename, spec in EXPECTED_TABLES.items():
        filepath = DATA_DIR / filename
        errors, warnings = validate_file(filepath, spec)
        all_errors.extend(errors)
        all_warnings.extend(warnings)

        status = "PASS" if not errors else "FAIL"
        if not errors and warnings:
            status = "WARN"

        row_count = 0
        if filepath.exists():
            with open(filepath) as f:
                row_count = sum(1 for _ in f) - 1

        icon = {"PASS": "+", "WARN": "~", "FAIL": "!"}[status]
        print(f"  [{icon}] {filename:45s} {row_count:>8,} rows  {status}")
        for e in errors:
            print(f"      ERROR: {e}")
        for w in warnings:
            print(f"      WARN:  {w}")

    # Check for unexpected files
    expected = set(EXPECTED_TABLES.keys())
    actual = {f.name for f in DATA_DIR.glob("*.csv")}
    unexpected = actual - expected
    if unexpected:
        for f in sorted(unexpected):
            all_warnings.append(f"UNEXPECTED FILE: {f}")
            print(f"  [?] {f:45s} (unexpected)")

    missing = expected - actual
    # Already reported above as errors

    print()
    print(f"{'='*50}")
    print(f"Results: {len(EXPECTED_TABLES)} tables checked")
    print(f"  Errors:   {len(all_errors)}")
    print(f"  Warnings: {len(all_warnings)}")

    if all_errors:
        print("\nVALIDATION FAILED")
        sys.exit(1)
    elif all_warnings and args.strict:
        print("\nVALIDATION FAILED (strict mode)")
        sys.exit(2)
    else:
        print("\nVALIDATION PASSED")
        sys.exit(0)


if __name__ == "__main__":
    main()
