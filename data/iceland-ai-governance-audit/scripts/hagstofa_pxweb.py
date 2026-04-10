#!/usr/bin/env python3
"""
PANOPTICON REVERSE — Hagstofa PxWeb API Data Extraction
Extracts labour market and economic data from Statistics Iceland's PxWeb API.

Tables:
    VIN00920  - Quarterly unemployment by age and sex
    VIN01110  - Annual employment by NACE sector
    VIN01100  - Annual employment by ISCO occupation
    JVS00001  - Quarterly job vacancies by NACE sector
    FYR04101  - Monthly VAT turnover by NACE sector
    VIN02003  - Annual wages by sector and occupation
    LAU04109  - Quarterly wage index by sector
    VIN10022  - Monthly register-based employment by sector
    THJ11011  - Annual labour productivity by sector
    FYR08001  - Structural business stats (ICT breakdown)

Usage:
    python hagstofa_pxweb.py --all           # Extract all tables
    python hagstofa_pxweb.py --unemployment  # Quarterly unemployment only
    python hagstofa_pxweb.py --sectors       # Annual NACE sector employment
    python hagstofa_pxweb.py --occupations   # Annual ISCO occupation employment
    python hagstofa_pxweb.py --vacancies     # Quarterly job vacancies
    python hagstofa_pxweb.py --turnover      # Monthly VAT turnover
    python hagstofa_pxweb.py --wages         # Annual wages by sector/occupation
    python hagstofa_pxweb.py --wageindex     # Quarterly wage index
    python hagstofa_pxweb.py --register      # Monthly register-based employment
    python hagstofa_pxweb.py --productivity  # Annual labour productivity
    python hagstofa_pxweb.py --ict           # ICT structural business stats

Output: CSV files in ../data/raw/
"""

import argparse
import csv
import io
import json
import sys
from datetime import datetime, timezone
from pathlib import Path
from urllib.request import Request, urlopen
from urllib.error import URLError

BASE_URL = "https://px.hagstofa.is/pxen/api/v1/en"
OUTPUT_DIR = Path(__file__).parent.parent / "data" / "raw"


def query_pxweb(table_path: str, query_body: dict) -> dict:
    """Send a POST query to PxWeb and return JSON-stat response."""
    url = f"{BASE_URL}/{table_path}"
    data = json.dumps(query_body).encode("utf-8")
    req = Request(url, data=data, headers={"Content-Type": "application/json"})
    try:
        with urlopen(req, timeout=60) as resp:
            return json.loads(resp.read().decode("utf-8"))
    except URLError as e:
        print(f"ERROR: Failed to query {url}: {e}", file=sys.stderr)
        # Try with empty query as fallback
        if query_body.get("query"):
            print("  Retrying with empty query (all data)...", file=sys.stderr)
            fallback = {"query": [], "response": {"format": "json-stat2"}}
            data2 = json.dumps(fallback).encode("utf-8")
            req2 = Request(url, data=data2, headers={"Content-Type": "application/json"})
            try:
                with urlopen(req2, timeout=60) as resp2:
                    return json.loads(resp2.read().decode("utf-8"))
            except URLError as e2:
                print(f"ERROR: Fallback also failed: {e2}", file=sys.stderr)
        return None


def jsonstat_to_csv(response: dict, filename: str) -> Path:
    """Convert JSON-stat2 response to CSV.

    JSON-stat2 uses row-major (C-style) ordering: the LAST dimension
    varies fastest.  For dimensions [A, B, C] with sizes [sA, sB, sC]:
        flat_index = iA * (sB * sC) + iB * sC + iC
    To decode:  iC = i % sC;  iB = (i // sC) % sB;  iA = (i // (sC*sB)) % sA
    """
    out = OUTPUT_DIR / filename
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    # Build ordered dimension metadata
    # response["id"] gives canonical dimension order; fall back to dict keys
    columns = response.get("id", list(response.get("dimension", {}).keys()))
    categories = {}
    for col in columns:
        dim = response["dimension"][col]
        cat = dim["category"]
        idx = cat.get("index", {})
        labels = cat.get("label", {})
        if isinstance(idx, dict):
            ordered = sorted(idx.items(), key=lambda x: x[1])
            categories[col] = [labels.get(k, k) for k, _ in ordered]
        else:
            categories[col] = list(labels.values())

    values = response.get("value", [])
    sizes = [len(categories[c]) for c in columns]

    # Row-major decomposition: last dimension varies fastest
    rows = []
    for i, val in enumerate(values):
        indices = []
        remainder = i
        for size in reversed(sizes):
            indices.append(remainder % size)
            remainder //= size
        indices.reverse()

        row = {}
        for j, col in enumerate(columns):
            row[col] = categories[col][indices[j]] if indices[j] < len(categories[col]) else "?"
        row["value"] = val
        rows.append(row)

    # Write with proper CSV quoting (handles commas in category labels)
    header = columns + ["value"]
    with open(out, "w", newline="") as f:
        writer = csv.writer(f, quoting=csv.QUOTE_MINIMAL)
        writer.writerow(header)
        for row in rows:
            writer.writerow([row.get(h, "") for h in header])

    print(f"  Written: {out} ({len(rows)} rows)")
    return out


def extract_unemployment():
    """VIN00920: Quarterly unemployment rate by age and sex."""
    print("Extracting quarterly unemployment (VIN00920)...")

    table_path = "Samfelag/vinnumarkadur/vinnumarkadsrannsokn/2_arsfjordungstolur/VIN00920.px"

    query = {
        "query": [
            {
                "code": "Aldur",
                "selection": {
                    "filter": "item",
                    "values": ["0", "1", "2", "3"]  # Total, 16-24, 25-54, 55-74
                }
            },
            {
                "code": "Kyn",
                "selection": {
                    "filter": "item",
                    "values": ["0", "1", "2"]  # Both, Males, Females
                }
            }
        ],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "unemployment_quarterly.csv")


def extract_sectors():
    """VIN01110: Annual employment by NACE sector."""
    print("Extracting annual sector employment (VIN01110)...")

    table_path = "Samfelag/vinnumarkadur/vinnumarkadsrannsokn/3_arstolur/VIN01110.px"

    query = {
        "query": [
            {
                "code": "Kyn og landsvæði",
                "selection": {
                    "filter": "item",
                    "values": ["0"]  # Total (both sexes, whole country)
                }
            }
        ],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "employment_by_sector_annual.csv")


def extract_occupations():
    """VIN01100: Annual employment by ISCO occupation group."""
    print("Extracting annual occupation employment (VIN01100)...")

    table_path = "Samfelag/vinnumarkadur/vinnumarkadsrannsokn/3_arstolur/VIN01100.px"

    query = {
        "query": [
            {
                "code": "Kyn",
                "selection": {
                    "filter": "item",
                    "values": ["0"]  # Both sexes
                }
            }
        ],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "employment_by_occupation_annual.csv")


def extract_vacancies():
    """JVS00001: Quarterly job vacancies by NACE sector."""
    print("Extracting quarterly job vacancies (JVS00001)...")

    table_path = "Samfelag/vinnumarkadur/lausstorf/JVS00001.px"

    # Request all sectors and all quarters (no selection = all values)
    query = {
        "query": [],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "vacancies_quarterly.csv")


def extract_turnover():
    """FYR04101: Monthly VAT turnover by NACE sector."""
    print("Extracting monthly VAT turnover (FYR04101)...")

    table_path = "Atvinnuvegir/fyrirtaeki/veltutolur/velta/FYR04101.px"

    query = {
        "query": [],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "vat_turnover_monthly.csv")


def extract_wages():
    """VIN02003: Annual wages by sector and occupation."""
    print("Extracting annual wages by sector/occupation (VIN02003)...")

    table_path = "Samfelag/launogtekjur/1_laun/1_laun/VIN02003.px"

    query = {
        "query": [
            {
                "code": "Kyn",
                "selection": {
                    "filter": "item",
                    "values": ["0"]  # Both sexes
                }
            }
        ],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "wages_by_sector_occupation_annual.csv")


def extract_wage_index():
    """LAU04109: Quarterly wage index by sector."""
    print("Extracting quarterly wage index (LAU04109)...")

    table_path = "Samfelag/launogtekjur/2_lvt/2_arsfjordungstolur/LAU04109.px"

    query = {
        "query": [],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "wage_index_quarterly.csv")


def extract_register_employment():
    """VIN10022: Monthly register-based employment by sector, sex, age, origin."""
    print("Extracting monthly register employment (VIN10022)...")

    table_path = "Samfelag/vinnumarkadur/vinnuaflskraargogn/VIN10022.px"

    # Table has ~576K cells total; filter to totals for age/sex/origin/residence
    query = {
        "query": [
            {"code": "Aldur", "selection": {"filter": "item", "values": ["0"]}},
            {"code": "Kyn", "selection": {"filter": "item", "values": ["0"]}},
            {"code": "Bakgrunnur", "selection": {"filter": "item", "values": ["0"]}},
            {"code": "Lögheimili", "selection": {"filter": "item", "values": ["0"]}}
        ],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "register_employment_monthly.csv")


def extract_productivity():
    """THJ11011: Annual labour productivity by sector."""
    print("Extracting annual labour productivity (THJ11011)...")

    table_path = "Efnahagur/vinnumagnogframleidni/framleidnivinnuafls/THJ11011.px"

    query = {
        "query": [],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "labour_productivity_annual.csv")


def extract_ict_structural():
    """FYR08001: Structural business statistics with ICT breakdown."""
    print("Extracting ICT structural business stats (FYR08001)...")

    table_path = "Atvinnuvegir/fyrirtaeki/afkoma/1_afkoma/FYR08001.px"

    query = {
        "query": [],
        "response": {"format": "json-stat2"}
    }

    resp = query_pxweb(table_path, query)
    if resp is not None:
        jsonstat_to_csv(resp, "ict_structural_stats_annual.csv")


def main():
    parser = argparse.ArgumentParser(description="Extract Hagstofa PxWeb labour market data")
    parser.add_argument("--all", action="store_true", help="Extract all tables")
    parser.add_argument("--unemployment", action="store_true", help="Quarterly unemployment")
    parser.add_argument("--sectors", action="store_true", help="Annual sector employment")
    parser.add_argument("--occupations", action="store_true", help="Annual occupation employment")
    parser.add_argument("--vacancies", action="store_true", help="Quarterly job vacancies by sector")
    parser.add_argument("--turnover", action="store_true", help="Monthly VAT turnover by sector")
    parser.add_argument("--wages", action="store_true", help="Annual wages by sector/occupation")
    parser.add_argument("--wageindex", action="store_true", help="Quarterly wage index")
    parser.add_argument("--register", action="store_true", help="Monthly register-based employment")
    parser.add_argument("--productivity", action="store_true", help="Annual labour productivity")
    parser.add_argument("--ict", action="store_true", help="ICT structural business stats")
    args = parser.parse_args()

    flags = [args.all, args.unemployment, args.sectors, args.occupations,
             args.vacancies, args.turnover, args.wages, args.wageindex,
             args.register, args.productivity, args.ict]
    if not any(flags):
        args.all = True

    if args.all or args.unemployment:
        extract_unemployment()
    if args.all or args.sectors:
        extract_sectors()
    if args.all or args.occupations:
        extract_occupations()
    if args.all or args.vacancies:
        extract_vacancies()
    if args.all or args.turnover:
        extract_turnover()
    if args.all or args.wages:
        extract_wages()
    if args.all or args.wageindex:
        extract_wage_index()
    if args.all or args.register:
        extract_register_employment()
    if args.all or args.productivity:
        extract_productivity()
    if args.all or args.ict:
        extract_ict_structural()

    # Summary report
    print(f"\n{'='*60}")
    print(f"Extraction complete — {datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M UTC')}")
    print(f"Output directory: {OUTPUT_DIR}")
    csv_files = sorted(OUTPUT_DIR.glob("*.csv"))
    total_rows = 0
    for f in csv_files:
        n = sum(1 for _ in open(f)) - 1  # subtract header
        total_rows += n
        print(f"  {f.name:45s} {n:>8,} rows")
    print(f"  {'TOTAL':45s} {total_rows:>8,} rows")
    print(f"{'='*60}")


if __name__ == "__main__":
    main()
