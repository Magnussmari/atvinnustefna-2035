# Microsoft Stakeholder Map (JSONL)

This repository includes a machine‑readable stakeholder map of Microsoft’s role in Icelandic public IT (with focus on Menntaský and UNAK). The map is stored as JSON Lines so it can be loaded by graph tools, scripts, or data pipelines.

## Files
- `Report/microsoft_stakeholder_map.jsonl` – the stakeholder graph (nodes + edges). Each line is a JSON object.
- `Report/Stada_stafraenna_innvida_UNAK.md` – status summary of UNAK’s digital infrastructure (Icelandic).

## JSONL Schema
Each line is either a node or an edge.

### Node
```json
{"kind":"node","id":"org:unak","label":"Háskólinn á Akureyri (UNAK)","type":"org","sources":["https://www.unak.is/is/nemandinn/nynemar/nynemi-101"],"notes":"optional"}
```

Fields:
- `kind`: `node`
- `id`: unique identifier
- `label`: human‑readable name
- `type`: category such as `org`, `program`, `service`, `contract`, `document`, `group`, `concept`
- `sources`: list of supporting sources (URLs or local file paths)
- `notes`: optional free‑text context

### Edge
```json
{"kind":"edge","source":"org:unak","target":"service:office365","relation":"uses_service","evidence":"UNAK veitir aðgang að Office 365.","sources":["https://www.unak.is/is/nemandinn/nynemar/nynemi-101"]}
```

Fields:
- `kind`: `edge`
- `source`: source node id
- `target`: target node id
- `relation`: relationship type
- `evidence`: short description of the relationship
- `sources`: list of supporting sources

## Notes on Sources
- The map is sourced from public material and local project documents.
- Local PDF citation used: `docs/2025_innkaup_rikisadila_a_upplysingataekni.pdf`

## Quick Use

### Load with Python
```python
import json

nodes = []
edges = []
with open("Report/microsoft_stakeholder_map.jsonl", encoding="utf-8") as f:
    for line in f:
        item = json.loads(line)
        if item["kind"] == "node":
            nodes.append(item)
        else:
            edges.append(item)

print(len(nodes), len(edges))
```

### Convert to Graphviz (basic)
```python
import json

print("digraph G {")
with open("Report/microsoft_stakeholder_map.jsonl", encoding="utf-8") as f:
    for line in f:
        item = json.loads(line)
        if item["kind"] == "edge":
            print(f'  "{item["source"]}" -> "{item["target"]}" [label="{item["relation"]}"];')
print("}")
```

## Maintenance
- Add new nodes/edges by appending JSON objects as lines.
- Keep `sources` tight and verifiable; prefer primary sources.
- Use stable IDs (e.g., `org:`, `service:`, `contract:`).
