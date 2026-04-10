# Repository Guidelines

## Project Structure & Module Organization
This repository contains research and report documents rather than application source code.

- Top-level Markdown files: standalone notes and drafts (e.g., `Digital Sovereignty Under Platform Dependence_ Ice.md`).
- `Report/`: finalized or in-progress reports (e.g., `Report/IT Infrastructure Risk Report.md`).
- `docs/`: supporting reference materials and assets (e.g., `docs/2025_innkaup_rikisadila_a_upplysingataekni.pdf`).

When adding new documents, prefer descriptive filenames and keep related assets with the document or under `docs/`.

## Build, Test, and Development Commands
No build system, test runner, or local dev server is defined for this repository.

- To view Markdown, open files directly in your editor or a Markdown preview.
- To reference PDFs, keep them in `docs/` and link by relative path.

## Coding Style & Naming Conventions
- Use Markdown (`.md`) for text documents and keep sections organized with headings.
- Use sentence case for headings and concise paragraphs.
- File naming: descriptive, readable names; avoid ambiguous abbreviations.

## Testing Guidelines
There are no automated tests. Validate content by:
- Reviewing for clarity, citations, and formatting.
- Ensuring links and references use correct relative paths.

## Commit & Pull Request Guidelines
No Git history is available in this workspace, so commit message conventions are unspecified. If you initialize version control:
- Use clear, descriptive commit messages (e.g., `Add infrastructure risk report draft`).
- PRs should include a short summary of changes and any related sources or references.

## Security & Configuration Tips
Avoid committing sensitive or private data. If a document contains restricted information, store it outside this repository or redact it before adding.
