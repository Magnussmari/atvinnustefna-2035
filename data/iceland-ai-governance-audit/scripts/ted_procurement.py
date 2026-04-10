#!/usr/bin/env python3
"""
PANOPTICON REVERSE — TED Public Procurement Extraction
Queries the EU Tenders Electronic Daily (TED) API for Icelandic
IT/AI-related public procurement contracts.

Usage:
    python ted_procurement.py                    # Default: IT services 2023-2026
    python ted_procurement.py --cpv 72000000     # Custom CPV code
    python ted_procurement.py --since 2022-01-01 # Custom start date

Output: CSV + JSON in ../data/raw/
"""

import argparse
import json
import sys
from datetime import datetime
from pathlib import Path
from urllib.request import Request, urlopen
from urllib.error import URLError

# TED API v3 (public, no auth required for search)
TED_SEARCH_URL = "https://ted.europa.eu/api/v3.0/notices/search"
OUTPUT_DIR = Path(__file__).parent.parent / "data" / "raw"

# CPV codes relevant to AI/IT procurement
CPV_CODES = {
    "72000000": "IT services: consulting, software development, Internet and support",
    "72200000": "Software programming and consultancy services",
    "72210000": "Programming services of packaged software products",
    "72220000": "Systems and technical consultancy services",
    "72230000": "Custom software development services",
    "72240000": "Systems analysis and programming services",
    "72260000": "Software-related services",
    "72300000": "Data services",
    "72310000": "Data-processing services",
    "72320000": "Database services",
    "48000000": "Software package and information systems",
    "48800000": "Information systems and servers",
    "48900000": "Miscellaneous software packages and computer systems",
}


def search_ted(cpv_prefix: str, since: str, page: int = 1, page_size: int = 50) -> dict:
    """Search TED for Icelandic contracts matching CPV codes."""
    # TED API uses a query language
    query = {
        "q": f"TD=[contract notice OR contract award notice] AND CY=[IS] AND PC=[{cpv_prefix}*]",
        "fields": [
            "ND", "TI", "CY", "TW", "DD", "DT", "PC",
            "AC", "TY", "OL", "RC"
        ],
        "pageNum": page,
        "pageSize": page_size,
        "sortField": "DD",
        "sortOrder": "desc"
    }

    # Add date filter
    if since:
        query["q"] += f" AND DD>=[{since}]"

    data = json.dumps(query).encode("utf-8")
    req = Request(
        TED_SEARCH_URL,
        data=data,
        headers={
            "Content-Type": "application/json",
            "Accept": "application/json"
        }
    )

    try:
        with urlopen(req, timeout=30) as resp:
            return json.loads(resp.read().decode("utf-8"))
    except URLError as e:
        print(f"WARNING: TED API query failed: {e}", file=sys.stderr)
        print("The TED API may require different query format or authentication.", file=sys.stderr)
        print("Falling back to manual search instructions.", file=sys.stderr)
        return None


def search_ted_v2(cpv_prefix: str, since: str) -> dict:
    """Alternative: TED search via the older REST endpoint."""
    # TED also exposes a simpler search endpoint
    params = (
        f"?q=cpv%3D{cpv_prefix}*"
        f"&country=IS"
        f"&dateFrom={since}"
        f"&sortField=DATE_PUB"
        f"&sortOrder=DESC"
    )
    url = f"https://ted.europa.eu/api/v3.0/notices/search{params}"

    req = Request(url, headers={"Accept": "application/json"})
    try:
        with urlopen(req, timeout=30) as resp:
            return json.loads(resp.read().decode("utf-8"))
    except URLError as e:
        print(f"WARNING: TED v2 search also failed: {e}", file=sys.stderr)
        return None


def write_results(results: list, filename_base: str):
    """Write results to CSV and JSON."""
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    # JSON (full data)
    json_path = OUTPUT_DIR / f"{filename_base}.json"
    with open(json_path, "w") as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    print(f"  JSON: {json_path}")

    # CSV (flattened)
    csv_path = OUTPUT_DIR / f"{filename_base}.csv"
    if results:
        keys = ["notice_id", "title", "cpv", "publication_date", "country", "type", "url"]
        with open(csv_path, "w") as f:
            f.write(",".join(keys) + "\n")
            for r in results:
                row = [str(r.get(k, "")).replace(",", ";") for k in keys]
                f.write(",".join(row) + "\n")
        print(f"  CSV:  {csv_path}")

    print(f"  Total notices found: {len(results)}")


def generate_manual_instructions(cpv_prefix: str, since: str):
    """If API fails, generate manual search instructions."""
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    instructions_path = OUTPUT_DIR / "ted_manual_search_instructions.txt"

    instructions = f"""TED Manual Search Instructions
==============================
The TED API returned errors. Search manually at:

URL: https://ted.europa.eu/en/search/result

Filters to apply:
  - Country: Iceland (IS)
  - CPV codes: {cpv_prefix} (and sub-codes)
  - Publication date: from {since}
  - Notice type: Contract award notices + Contract notices

Alternative search URLs to try:
  1. https://ted.europa.eu/en/search/result?q=CY%3D%5BIS%5D+AND+PC%3D%5B{cpv_prefix}%5D
  2. https://ted.europa.eu/en/search/result?country=IS&cpv={cpv_prefix}

CPV codes of interest:
"""
    for code, desc in CPV_CODES.items():
        instructions += f"  {code}: {desc}\n"

    instructions += f"""
Specific searches to run:
  1. All IT services (72000000) from Iceland since {since}
  2. Software packages (48000000) from Iceland since {since}
  3. AI-specific: search free text "artificial intelligence" OR "machine learning" + country IS

Export results as CSV from the TED interface and save to:
  {OUTPUT_DIR}/ted_procurement_manual.csv
"""

    with open(instructions_path, "w") as f:
        f.write(instructions)
    print(f"Manual instructions written to: {instructions_path}")


def main():
    parser = argparse.ArgumentParser(description="Extract Iceland IT/AI procurement from TED")
    parser.add_argument("--cpv", default="72000000", help="CPV code prefix (default: 72000000 IT services)")
    parser.add_argument("--since", default="2023-01-01", help="Start date (default: 2023-01-01)")
    args = parser.parse_args()

    print(f"Searching TED for Iceland (IS) contracts...")
    print(f"  CPV prefix: {args.cpv}")
    print(f"  Since: {args.since}")
    print()

    # Try API v3
    results = search_ted(args.cpv, args.since)

    if results is None:
        # Try alternative endpoint
        results = search_ted_v2(args.cpv, args.since)

    if results is None:
        print("\nTED API not accessible programmatically. Generating manual search instructions.")
        generate_manual_instructions(args.cpv, args.since)
        return

    # Parse results depending on API response format
    notices = []
    if isinstance(results, dict):
        raw_notices = results.get("notices", results.get("results", []))
        for n in raw_notices:
            notices.append({
                "notice_id": n.get("ND", n.get("id", "")),
                "title": n.get("TI", n.get("title", "")),
                "cpv": n.get("PC", n.get("cpv", "")),
                "publication_date": n.get("DD", n.get("publicationDate", "")),
                "country": "IS",
                "type": n.get("TY", n.get("type", "")),
                "url": f"https://ted.europa.eu/en/notice/-/detail/{n.get('ND', n.get('id', ''))}"
            })

    write_results(notices, "ted_iceland_it_procurement")


if __name__ == "__main__":
    main()
