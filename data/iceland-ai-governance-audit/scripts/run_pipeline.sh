#!/bin/bash
# PANOPTICON REVERSE — Master Data Pipeline
# Extracts all data from public APIs, validates, and reports.
#
# Usage:
#   ./run_pipeline.sh              # Full pipeline (extract + validate)
#   ./run_pipeline.sh --extract    # Extract only (skip validation)
#   ./run_pipeline.sh --validate   # Validate only (skip extraction)
#   ./run_pipeline.sh --strict     # Fail on warnings too
#
# Prerequisites:
#   - Python 3.8+ (stdlib only — no pip install needed)
#   - Internet access (Hagstofa PxWeb API, TED API)
#
# Exit codes:
#   0 = success
#   1 = extraction or validation error

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
DATA_DIR="$PROJECT_DIR/data/raw"

# Parse arguments
DO_EXTRACT=true
DO_VALIDATE=true
STRICT=""

for arg in "$@"; do
    case "$arg" in
        --extract)  DO_VALIDATE=false ;;
        --validate) DO_EXTRACT=false ;;
        --strict)   STRICT="--strict" ;;
        --help|-h)
            echo "Usage: $0 [--extract|--validate] [--strict]"
            echo ""
            echo "Options:"
            echo "  --extract   Extract data only (skip validation)"
            echo "  --validate  Validate data only (skip extraction)"
            echo "  --strict    Fail on warnings during validation"
            echo ""
            echo "Default: run full pipeline (extract + validate)"
            exit 0
            ;;
        *)
            echo "Unknown argument: $arg"
            exit 1
            ;;
    esac
done

echo "╔══════════════════════════════════════════════════════════╗"
echo "║  PANOPTICON REVERSE — Data Pipeline                     ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "  Project:  $PROJECT_DIR"
echo "  Data dir: $DATA_DIR"
echo "  Date:     $(date -u '+%Y-%m-%d %H:%M UTC')"
echo ""

FAILED=0

# ── Step 1: Hagstofa PxWeb Extraction ──
if [ "$DO_EXTRACT" = true ]; then
    echo "━━━ Step 1/3: Hagstofa PxWeb API ━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    if python3 "$SCRIPT_DIR/hagstofa_pxweb.py" --all; then
        echo ""
        echo "  [OK] Hagstofa extraction complete"
    else
        echo ""
        echo "  [!!] Hagstofa extraction had errors (continuing...)"
        FAILED=1
    fi
    echo ""

    # ── Step 2: TED Procurement ──
    echo "━━━ Step 2/3: TED Procurement API ━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    if python3 "$SCRIPT_DIR/ted_procurement.py" 2>&1; then
        echo ""
        echo "  [OK] TED extraction complete"
    else
        echo ""
        echo "  [~~] TED extraction failed (non-critical — manual fallback available)"
    fi
    echo ""
fi

# ── Step 3: Validation ──
if [ "$DO_VALIDATE" = true ]; then
    echo "━━━ Step 3/3: Data Validation ━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    if python3 "$SCRIPT_DIR/validate_data.py" $STRICT; then
        echo ""
        echo "  [OK] All validation checks passed"
    else
        echo ""
        echo "  [!!] Validation found issues"
        FAILED=1
    fi
    echo ""
fi

# ── Summary ──
echo "━━━ Summary ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
if [ -d "$DATA_DIR" ]; then
    CSV_COUNT=$(find "$DATA_DIR" -name "*.csv" | wc -l | tr -d ' ')
    TOTAL_ROWS=$(cat "$DATA_DIR"/*.csv 2>/dev/null | wc -l | tr -d ' ')
    echo "  CSV files: $CSV_COUNT"
    echo "  Total rows: $TOTAL_ROWS (including headers)"
fi
echo ""

if [ "$FAILED" -eq 0 ]; then
    echo "  Result: PIPELINE PASSED"
    exit 0
else
    echo "  Result: PIPELINE HAD ERRORS (see above)"
    exit 1
fi
