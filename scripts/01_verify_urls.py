#!/usr/bin/env python3
"""
URL Verification Script for Atvinnustefna Research Repository
Checks all URLs in BibTeX bibliography files for accessibility.

Author: Magnús Smári Smárason (smarason.is)
Date: 2026-04-10
System: PAI + Claude Code

Usage: python3 scripts/01_verify_urls.py
Output: verification/url_health_report.md
"""

import re
import os
import sys
import time
import requests
from pathlib import Path
from datetime import datetime

# Config
REPO_ROOT = Path(__file__).parent.parent
BIB_DIR = REPO_ROOT / "bibliography"
# Note: master.bib is the consolidated file. archive/ contains the originals.
OUTPUT_DIR = REPO_ROOT / "verification"
OUTPUT_DIR.mkdir(exist_ok=True)

TIMEOUT = 15
USER_AGENT = "Mozilla/5.0 (Atvinnustefna-Research-Verifier/1.0; +https://smarason.is)"
HEADERS = {"User-Agent": USER_AGENT}

# Rate limit: 1 request per second
RATE_LIMIT = 1.0


def extract_urls_from_bib(bib_path: Path) -> list[dict]:
    """Extract all URLs and their context from a .bib file."""
    entries = []
    current_key = None
    current_title = None

    with open(bib_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Find all entries
    entry_pattern = re.compile(
        r"@\w+\{(\w+),\s*(.*?)(?=\n@|\Z)", re.DOTALL
    )

    for match in entry_pattern.finditer(content):
        key = match.group(1)
        body = match.group(2)

        # Extract title
        title_match = re.search(r"title\s*=\s*\{(.+?)\}", body, re.DOTALL)
        title = title_match.group(1).strip() if title_match else "Unknown"
        title = re.sub(r"\s+", " ", title)  # Normalize whitespace

        # Extract URL
        url_match = re.search(r"url\s*=\s*\{(.+?)\}", body)
        if url_match:
            url = url_match.group(1).strip()
            # Clean LaTeX escapes
            url = url.replace("\\%", "%").replace("\\_", "_")
            entries.append({
                "key": key,
                "title": title[:100],
                "url": url,
                "file": bib_path.name,
            })

    return entries


def check_url(url: str) -> dict:
    """Check if a URL is accessible. Returns status info."""
    try:
        resp = requests.head(
            url,
            headers=HEADERS,
            timeout=TIMEOUT,
            allow_redirects=True,
        )
        if resp.status_code == 405:
            # HEAD not allowed, try GET
            resp = requests.get(
                url,
                headers=HEADERS,
                timeout=TIMEOUT,
                allow_redirects=True,
                stream=True,
            )
            resp.close()

        return {
            "status_code": resp.status_code,
            "ok": resp.status_code < 400,
            "final_url": str(resp.url) if resp.url != url else None,
            "error": None,
        }
    except requests.exceptions.Timeout:
        return {"status_code": None, "ok": False, "error": "TIMEOUT", "final_url": None}
    except requests.exceptions.SSLError as e:
        return {"status_code": None, "ok": False, "error": f"SSL_ERROR: {str(e)[:80]}", "final_url": None}
    except requests.exceptions.ConnectionError as e:
        return {"status_code": None, "ok": False, "error": f"CONNECTION_ERROR: {str(e)[:80]}", "final_url": None}
    except Exception as e:
        return {"status_code": None, "ok": False, "error": f"ERROR: {str(e)[:80]}", "final_url": None}


def main():
    print("=" * 60)
    print("URL VERIFICATION — Atvinnustefna Research Repository")
    print(f"Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 60)

    # Collect all URLs
    all_entries = []
    bib_files = sorted(BIB_DIR.glob("*.bib"))

    for bib_file in bib_files:
        entries = extract_urls_from_bib(bib_file)
        all_entries.extend(entries)
        print(f"\n  {bib_file.name}: {len(entries)} URLs found")

    print(f"\nTotal URLs to verify: {len(all_entries)}")
    print("-" * 60)

    # Check each URL
    results = {"green": [], "amber": [], "red": []}

    for i, entry in enumerate(all_entries):
        url = entry["url"]
        print(f"  [{i+1}/{len(all_entries)}] {entry['key'][:30]}... ", end="", flush=True)

        result = check_url(url)
        entry.update(result)

        if result["ok"]:
            status = "GREEN"
            results["green"].append(entry)
        elif result["error"] and ("TIMEOUT" in result["error"] or "SSL" in result["error"]):
            status = "AMBER"
            results["amber"].append(entry)
        else:
            status = "RED"
            results["red"].append(entry)

        code = result["status_code"] or result["error"]
        print(f"{status} ({code})")

        time.sleep(RATE_LIMIT)

    # Generate report
    report_path = OUTPUT_DIR / "url_health_report.md"
    total = len(all_entries)
    green = len(results["green"])
    amber = len(results["amber"])
    red = len(results["red"])

    with open(report_path, "w", encoding="utf-8") as f:
        f.write("# URL Health Report\n\n")
        f.write(f"**Generated:** {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"**Script:** `scripts/01_verify_urls.py`\n\n")
        f.write("## Summary\n\n")
        f.write(f"| Status | Count | Percentage |\n")
        f.write(f"|--------|-------|------------|\n")
        f.write(f"| GREEN (verified) | {green} | {green/total*100:.1f}% |\n")
        f.write(f"| AMBER (timeout/SSL) | {amber} | {amber/total*100:.1f}% |\n")
        f.write(f"| RED (broken/404) | {red} | {red/total*100:.1f}% |\n")
        f.write(f"| **Total** | **{total}** | **100%** |\n\n")

        if results["red"]:
            f.write("## RED — Broken URLs (Require Fix)\n\n")
            for e in results["red"]:
                f.write(f"- **{e['key']}** ({e['file']})\n")
                f.write(f"  - Title: {e['title']}\n")
                f.write(f"  - URL: {e['url']}\n")
                f.write(f"  - Error: {e.get('status_code') or e.get('error')}\n\n")

        if results["amber"]:
            f.write("## AMBER — Needs Manual Check\n\n")
            for e in results["amber"]:
                f.write(f"- **{e['key']}** ({e['file']})\n")
                f.write(f"  - Title: {e['title']}\n")
                f.write(f"  - URL: {e['url']}\n")
                f.write(f"  - Issue: {e.get('error')}\n\n")

        f.write("## GREEN — All Verified URLs\n\n")
        for e in results["green"]:
            redirect = f" → {e['final_url']}" if e.get("final_url") else ""
            f.write(f"- [{e['key']}]({e['url']}) ({e['status_code']}{redirect})\n")

    print("\n" + "=" * 60)
    print(f"RESULTS: {green} GREEN / {amber} AMBER / {red} RED out of {total}")
    print(f"Report: {report_path}")
    print("=" * 60)


if __name__ == "__main__":
    main()
