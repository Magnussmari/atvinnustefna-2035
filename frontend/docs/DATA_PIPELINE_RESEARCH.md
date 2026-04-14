# Data Pipeline Research for Sentinel Dashboard

## Question

Should we preprocess data before ingesting into the dashboard frontend?

## Short answer

Yes. For Sentinel, preprocessing is the correct default.

## Why

### 1) Frontend payload and startup cost

Authoritative web performance guidance stresses reducing JavaScript/network payloads and deferring non-critical work. Shipping raw CSV into the client increases parse/compile work and main-thread cost.

- web.dev: Reduce JavaScript payloads with code splitting  
  <https://web.dev/articles/reduce-javascript-payloads-with-code-splitting>
- web.dev: Avoid enormous network payloads  
  <https://web.dev/total-byte-weight/>

### 2) Large text/CSV parsing in browser is expensive

MDN guidance on Fetch/Streams shows chunked processing for large payloads because full in-memory parsing is costly.

- MDN Streams API  
  <https://developer.mozilla.org/en-US/docs/Web/API/Streams_API/Using_readable_streams>
- MDN Fetch API  
  <https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch>

### 3) Analytical workloads benefit from columnar/pre-aggregated data

For broader scale, Arrow/columnar approaches and pre-aggregation reduce serialization overhead and improve analytic throughput.

- Apache Arrow FAQ  
  <https://arrow.apache.org/faq>
- Apache Arrow JS docs  
  <https://arrow.apache.org/docs/5.0/js/index.html>

## Recommendation for this project

### Immediate (implemented now)

- Preprocess raw CSV files at build/dev time.
- Emit compact, module-scoped JSON snapshots (`public/data/wiring/modules/<page-id>/<module-id>.json`) plus index manifest.
- Emit page bundle JSON snapshots (`public/data/wiring/bundles/<page-id>.json`) for request batching.
- Load only module data for visible panels in frontend runtime, with preload for upcoming page modules.
- Generate source hashes + fingerprint for auditability and staleness checks.
- Cache wiring payloads offline via Service Worker for resilient briefing-mode use.

### Next stage (if data volume keeps growing)

1. **Tiered aggregates**  
   Maintain yearly/monthly/quarterly slices for drill-down.
2. **Incremental refresh**  
   Rebuild only affected aggregates when source files update.
3. **Optional columnar path**  
   Evaluate Arrow/Parquet + worker-based query for heavier exploratory views.
4. **Hybrid online/offline freshness policy**  
   Add scheduled regeneration and freshness alerts if raw files change unexpectedly.

## Sentinel-specific ingestion policy

- Never ingest raw archive-scale datasets directly into UI.
- Precompute only fields/charts needed by visible views.
- Keep explicit metadata: source, method note, caveat, freshness.
- Track generated timestamp and source files for auditability.

## Practical decision rule

- If dataset is small and static: compact JSON snapshot.
- If medium and multi-page: module-split snapshots + visibility-triggered lazy loading.
- If large and exploratory: worker + columnar engine (Arrow/Parquet), still with pre-aggregated views for default paths.
