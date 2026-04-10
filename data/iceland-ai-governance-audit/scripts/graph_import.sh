#!/bin/bash
# PANOPTICON REVERSE — Neo4j Graph Import
# Imports the knowledge graph into a running Neo4j instance.
#
# Prerequisites:
#   - Neo4j 5.x running (local or remote)
#   - cypher-shell installed (comes with Neo4j)
#   - APOC plugin installed (for apoc.cypher.runFile)
#
# Usage:
#   ./graph_import.sh                           # localhost:7687, default creds
#   ./graph_import.sh bolt://host:7687 user pw  # custom connection

set -euo pipefail

GRAPH_FILE="$(dirname "$0")/../graph/PANOPTICON_GRAPH.cypher"
NEO4J_URI="${1:-bolt://localhost:7687}"
NEO4J_USER="${2:-neo4j}"
NEO4J_PASS="${3:-}"

if [ ! -f "$GRAPH_FILE" ]; then
    echo "ERROR: Graph file not found: $GRAPH_FILE"
    exit 1
fi

echo "PANOPTICON REVERSE — Graph Import"
echo "================================="
echo "Target:     $NEO4J_URI"
echo "User:       $NEO4J_USER"
echo "Graph file: $GRAPH_FILE"
echo ""

# Check if cypher-shell is available
if ! command -v cypher-shell &> /dev/null; then
    echo "cypher-shell not found. Alternatives:"
    echo ""
    echo "  Option 1: Install Neo4j Desktop (includes cypher-shell)"
    echo "  Option 2: Use Neo4j Browser at http://localhost:7474"
    echo "            Copy-paste the contents of $GRAPH_FILE"
    echo "  Option 3: Use APOC from Neo4j Browser:"
    echo "            CALL apoc.cypher.runFile('$GRAPH_FILE')"
    echo ""
    echo "  Option 4: Docker one-liner:"
    echo "    docker run --rm -v \$(pwd)/../graph:/import neo4j:5 \\"
    echo "      cypher-shell -u neo4j -p password \\"
    echo "      -f /import/PANOPTICON_GRAPH.cypher"
    exit 1
fi

# Build auth flag
AUTH_FLAG=""
if [ -n "$NEO4J_PASS" ]; then
    AUTH_FLAG="-u $NEO4J_USER -p $NEO4J_PASS"
else
    echo "No password provided. If Neo4j requires auth, run:"
    echo "  $0 $NEO4J_URI $NEO4J_USER <password>"
    echo ""
    AUTH_FLAG="-u $NEO4J_USER"
fi

echo "Importing graph..."
# shellcheck disable=SC2086
cypher-shell -a "$NEO4J_URI" $AUTH_FLAG -f "$GRAPH_FILE"

echo ""
echo "Import complete. Verify with:"
echo "  MATCH (n) RETURN labels(n), count(n);"
echo "  MATCH ()-[r]->() RETURN type(r), count(r);"
