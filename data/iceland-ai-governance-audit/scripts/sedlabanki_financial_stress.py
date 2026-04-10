#!/usr/bin/env python3
"""
PANOPTICON REVERSE — Seðlabanki Financial Stress Indicators
Extracts household financial stress data from the Central Bank of Iceland
as a supplementary proxy for labour market distress in the 25-54 cohort.

The Central Bank publishes:
  - Financial Stability reports (PDF, semi-annual)
  - Statistical database (sedlabanki.is/hagtolur)
  - Household debt and arrears data

Usage:
    python sedlabanki_financial_stress.py

Output: Instructions + any extractable data to ../data/raw/
"""

import json
import sys
from pathlib import Path
from urllib.request import Request, urlopen
from urllib.error import URLError

OUTPUT_DIR = Path(__file__).parent.parent / "data" / "raw"

# Known Seðlabanki statistical endpoints
ENDPOINTS = {
    "financial_stability": "https://www.sedlabanki.is/library/Skraarsafn/Fjarmalastoduleiki/",
    "statistics_portal": "https://www.sedlabanki.is/hagtolur/",
    "household_debt_api": "https://www.sedlabanki.is/xmltolur/",
}

# Key indicators to track
INDICATORS = [
    {
        "name": "Household debt to disposable income ratio",
        "source": "Financial Stability Report",
        "frequency": "Semi-annual",
        "relevance": "Rising ratio in 25-54 cohort indicates financial stress"
    },
    {
        "name": "Mortgage arrears (30+ days)",
        "source": "Financial Stability Report / CBI statistics",
        "frequency": "Quarterly",
        "relevance": "Leading indicator of household financial distress"
    },
    {
        "name": "Consumer loan default rate",
        "source": "Financial Supervisory Authority (FME) via CBI",
        "frequency": "Quarterly",
        "relevance": "General financial stress indicator"
    },
    {
        "name": "Non-performing loans (household)",
        "source": "CBI Financial Stability Report",
        "frequency": "Semi-annual",
        "relevance": "Lagging indicator of severe financial distress"
    },
    {
        "name": "Early pension fund withdrawals",
        "source": "Pension fund annual reports / Hagstofa",
        "frequency": "Annual",
        "relevance": "Desperation indicator — accessing retirement savings early"
    }
]


def try_fetch_xml_statistics():
    """Attempt to fetch from Seðlabanki XML statistics service."""
    # The CBI has an XML-based statistics service
    url = "https://www.sedlabanki.is/xmltolur/Default.aspx"
    req = Request(url, headers={"Accept": "text/html"})
    try:
        with urlopen(req, timeout=15) as resp:
            content_type = resp.headers.get("Content-Type", "")
            size = len(resp.read())
            return True, f"Accessible ({size} bytes, {content_type})"
    except URLError as e:
        return False, str(e)


def generate_extraction_guide():
    """Generate a guide for manual data extraction from CBI sources."""
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    guide = {
        "title": "Seðlabanki Financial Stress Data — Extraction Guide",
        "generated": "2026-03-06",
        "purpose": "Supplementary proxy indicators for PANOPTICON REVERSE",
        "caveat": "Financial stress indicators are NOT evidence of AI displacement. "
                  "They are supplementary context showing household financial health "
                  "in the 25-54 cohort during the investigation window.",
        "indicators": INDICATORS,
        "data_sources": [
            {
                "name": "Financial Stability Report (Fjármálastöðugleiki)",
                "url": "https://www.sedlabanki.is/utgefid-efni/rit-og-skyrslur/fjarmalastoduleiki/",
                "format": "PDF",
                "frequency": "Semi-annual (spring + autumn)",
                "key_tables": [
                    "Household debt/GDP ratio",
                    "Mortgage arrears by age of borrower (if available)",
                    "Consumer credit arrears",
                    "Debt service ratio by income quintile"
                ],
                "extraction_method": "Manual from PDF. Look for Chapter on 'Household finances' / 'Fjármál heimilanna'"
            },
            {
                "name": "CBI Statistics Portal",
                "url": "https://www.sedlabanki.is/hagtolur/",
                "format": "Web / Excel download",
                "key_tables": [
                    "Interest rates on household loans",
                    "Credit growth",
                    "Housing prices (Vísitala íbúðaverðs)"
                ],
                "extraction_method": "Navigate to relevant table, download Excel/CSV"
            },
            {
                "name": "FME (Fjármálaeftirlitið) Reports",
                "url": "https://www.fme.is/utgefid-efni/skyrslur/",
                "format": "PDF",
                "key_tables": [
                    "Bank asset quality reports",
                    "Non-performing loan ratios",
                    "Consumer lending volumes"
                ],
                "extraction_method": "Manual from annual/quarterly supervisory reports"
            },
            {
                "name": "Hagstofa — Household Finance Survey",
                "url": "https://px.hagstofa.is/pxen/pxweb/en/Samfelag/",
                "format": "PxWeb API",
                "key_tables": [
                    "Debt by age group (if available in PxWeb)",
                    "Income distribution"
                ],
                "extraction_method": "PxWeb API query (same as hagstofa_pxweb.py)"
            }
        ],
        "analysis_notes": [
            "Compare Q1 2023 baseline with Q4 2025 for all indicators",
            "If age-disaggregated data exists, isolate 25-54 cohort",
            "Cross-reference with Workstream A unemployment timeline",
            "DO NOT claim causal link to AI — these are context indicators only",
            "Iceland inflation was 7-8% in 2023-2024 — this alone explains some financial stress"
        ]
    }

    out_path = OUTPUT_DIR / "sedlabanki_extraction_guide.json"
    with open(out_path, "w") as f:
        json.dump(guide, f, indent=2, ensure_ascii=False)
    print(f"Extraction guide written to: {out_path}")

    return guide


def main():
    print("Seðlabanki Financial Stress Indicator Extraction")
    print("=" * 50)
    print()

    # Test accessibility
    print("Testing CBI XML statistics service...")
    accessible, detail = try_fetch_xml_statistics()
    print(f"  Result: {'Accessible' if accessible else 'Not accessible'} — {detail}")
    print()

    # Generate extraction guide
    print("Generating extraction guide...")
    guide = generate_extraction_guide()

    print()
    print("Key indicators to track:")
    for ind in INDICATORS:
        print(f"  - {ind['name']} ({ind['frequency']})")
        print(f"    Source: {ind['source']}")
        print(f"    Relevance: {ind['relevance']}")
        print()

    print("NOTE: Most CBI data requires manual PDF extraction.")
    print("The extraction guide has been saved with source URLs and table references.")
    print(f"Output: {OUTPUT_DIR / 'sedlabanki_extraction_guide.json'}")


if __name__ == "__main__":
    main()
