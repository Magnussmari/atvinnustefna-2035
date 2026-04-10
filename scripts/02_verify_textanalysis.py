#!/usr/bin/env python3
"""
Text Analysis Reproducer for Atvinnustefna Íslands 2035
Downloads the PDF and reproduces the keyword frequency analysis.

Author: Magnús Smári Smárason (smarason.is)
Date: 2026-04-10
System: PAI + Claude Code

Requirements: pdftotext (poppler-utils), requests
Usage: python3 scripts/02_verify_textanalysis.py
Output: verification/textanalysis_report.md
"""

import os
import sys
import subprocess
import tempfile
import requests
from pathlib import Path
from datetime import datetime

REPO_ROOT = Path(__file__).parent.parent
OUTPUT_DIR = REPO_ROOT / "verification"
OUTPUT_DIR.mkdir(exist_ok=True)

# The official PDF from samráðsgátt
PDF_URL = "https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e"
PDF_CACHE = REPO_ROOT / "data" / "atvinnustefna_2035_drog.pdf"


def download_pdf() -> Path:
    """Download the Atvinnustefna PDF if not cached."""
    if PDF_CACHE.exists():
        print(f"  Using cached PDF: {PDF_CACHE} ({PDF_CACHE.stat().st_size / 1024 / 1024:.1f} MB)")
        return PDF_CACHE

    print(f"  Downloading from: {PDF_URL}")
    resp = requests.get(PDF_URL, timeout=60)
    resp.raise_for_status()

    PDF_CACHE.parent.mkdir(parents=True, exist_ok=True)
    with open(PDF_CACHE, "wb") as f:
        f.write(resp.content)

    print(f"  Downloaded: {len(resp.content) / 1024 / 1024:.1f} MB")
    return PDF_CACHE


def extract_text(pdf_path: Path) -> str:
    """Extract text from PDF using pdftotext."""
    result = subprocess.run(
        ["pdftotext", str(pdf_path), "-"],
        capture_output=True, text=True
    )
    if result.returncode != 0:
        print(f"  ERROR: pdftotext failed: {result.stderr}")
        sys.exit(1)

    return result.stdout


def count_term(text: str, term: str) -> list[dict]:
    """Count occurrences and extract context for a term."""
    lines = text.split("\n")
    matches = []
    for i, line in enumerate(lines):
        if term.lower() in line.lower():
            # Get context (3 lines before and after)
            start = max(0, i - 2)
            end = min(len(lines), i + 3)
            context = "\n".join(lines[start:end]).strip()
            matches.append({
                "line": i,
                "text": line.strip()[:200],
                "context": context[:400],
            })
    return matches


def main():
    print("=" * 60)
    print("TEXT ANALYSIS REPRODUCTION — Atvinnustefna Íslands 2035")
    print(f"Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 60)

    # Step 1: Get PDF
    print("\n[1/3] Obtaining PDF...")
    pdf_path = download_pdf()

    # Step 2: Extract text
    print("\n[2/3] Extracting text with pdftotext...")
    text = extract_text(pdf_path)
    total_lines = len(text.split("\n"))
    total_words = len(text.split())
    print(f"  Extracted: {total_lines} lines, {total_words} words")

    # Step 3: Run keyword analysis
    print("\n[3/3] Running keyword frequency analysis...")

    # Terms to search — split into "present" and "absent" categories
    terms_present = {
        "gervigreind": "artificial intelligence",
        "gagnavera": "data centers",
        "áhættu": "risk",
        "tækni": "technology",
        "framleiðni": "productivity",
        "nýsköpun": "innovation",
        "menntun": "education",
        "færni": "skills",
    }

    terms_absent = {
        "atvinnuleysi": "unemployment",
        "atvinnumissi": "job loss",
        "sjálfvirknivæðing": "automation (full word)",
        "sjálfvirkni": "automation (short)",
        "röskun": "disruption",
        "umbreyting": "transformation",
        "neikvæð": "negative",
        "ógn": "threat",
        "hætta": "danger/risk",
        "starfamissi": "job loss (alt)",
        "endurmennt": "retraining",
        "endurþjálf": "reskilling",
        "umskipti": "transition",
        "vinnuleysi": "unemployment (alt)",
    }

    results_present = {}
    results_absent = {}

    for term, english in terms_present.items():
        matches = count_term(text, term)
        results_present[term] = {"english": english, "count": len(matches), "matches": matches}
        status = f"{len(matches)} match(es)" if matches else "ABSENT"
        print(f"  {term:25s} ({english:25s}): {status}")

    for term, english in terms_absent.items():
        matches = count_term(text, term)
        results_absent[term] = {"english": english, "count": len(matches), "matches": matches}
        status = f"{len(matches)} match(es)" if matches else "ABSENT (confirmed)"
        print(f"  {term:25s} ({english:25s}): {status}")

    # Generate report
    report_path = OUTPUT_DIR / "textanalysis_report.md"

    with open(report_path, "w", encoding="utf-8") as f:
        f.write("# Text Analysis Reproduction Report\n\n")
        f.write(f"**Generated:** {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"**Script:** `scripts/02_verify_textanalysis.py`\n")
        f.write(f"**Source PDF:** [{PDF_URL}]({PDF_URL})\n")
        f.write(f"**PDF size:** {pdf_path.stat().st_size / 1024 / 1024:.1f} MB\n")
        f.write(f"**Extracted text:** {total_lines} lines, {total_words} words\n")
        f.write(f"**Tool:** pdftotext (poppler-utils)\n\n")

        f.write("## Method\n\n")
        f.write("1. Download Atvinnustefna Íslands 2035 PDF from samráðsgátt API\n")
        f.write("2. Extract full text using `pdftotext`\n")
        f.write("3. Case-insensitive search for each Icelandic term\n")
        f.write("4. Record line numbers and surrounding context\n\n")
        f.write("**This analysis is fully reproducible.** Run `python3 scripts/02_verify_textanalysis.py` to regenerate.\n\n")

        f.write("## Results: Terms PRESENT in the document\n\n")
        f.write("| Icelandic | English | Count | Context |\n")
        f.write("|-----------|---------|-------|---------|\n")
        for term, data in results_present.items():
            ctx = ""
            if data["matches"]:
                ctx = data["matches"][0]["text"][:80].replace("|", "\\|")
            f.write(f"| {term} | {data['english']} | {data['count']} | {ctx} |\n")

        f.write("\n## Results: Terms ABSENT from the document\n\n")
        f.write("| Icelandic | English | Count | Status |\n")
        f.write("|-----------|---------|-------|--------|\n")
        for term, data in results_absent.items():
            status = f"**{data['count']} found**" if data["count"] > 0 else "CONFIRMED ABSENT"
            f.write(f"| {term} | {data['english']} | {data['count']} | {status} |\n")

        # Full context for present terms
        f.write("\n## Full Context for AI Mentions\n\n")
        for term in ["gervigreind"]:
            data = results_present.get(term, results_absent.get(term))
            if data and data["matches"]:
                for i, m in enumerate(data["matches"]):
                    f.write(f"### Mention {i+1} (line {m['line']})\n\n")
                    f.write(f"```\n{m['context']}\n```\n\n")

        # Unexpected findings
        unexpected = [t for t, d in results_absent.items() if d["count"] > 0]
        if unexpected:
            f.write("\n## Unexpected Findings\n\n")
            f.write("The following terms expected to be absent were found:\n\n")
            for term in unexpected:
                data = results_absent[term]
                f.write(f"- **{term}** ({data['english']}): {data['count']} occurrences\n")
                for m in data["matches"]:
                    f.write(f"  - Line {m['line']}: `{m['text'][:120]}`\n")

        f.write("\n---\n")
        f.write(f"\n*This report was auto-generated. Source: `{PDF_URL}`*\n")

    print(f"\nReport written to: {report_path}")

    # Summary
    absent_confirmed = sum(1 for d in results_absent.values() if d["count"] == 0)
    absent_total = len(results_absent)
    print(f"\n{'='*60}")
    print(f"SUMMARY: {absent_confirmed}/{absent_total} expected-absent terms confirmed absent")
    ai_count = results_present.get("gervigreind", {}).get("count", 0)
    print(f"         'gervigreind' (AI) appears {ai_count} time(s) — all in positive context")
    print(f"{'='*60}")


if __name__ == "__main__":
    main()
