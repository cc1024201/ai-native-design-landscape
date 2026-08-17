# FIGS

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FIGS is a pre-alpha workspace for turning source material into a governed knowledge schema, inspecting that schema as a graph, and testing it through retrieval and Cypher queries.

## Provenance precedes visualization

Ingested sources are tracked before entities and relations become graph material. The editor therefore represents an ontology and its evidence lineage—not merely boxes copied from an LLM answer. Users can alter schema structure while retaining a route back to source-bearing content.

## The graph has two interrogation paths

GraphRAG lets a user explore knowledge through model-assisted retrieval, while the Cypher playground exposes direct graph queries. The visual schema, stored graph, and query results provide different views on the same modeled domain. That combination makes FIGS closer to a schema laboratory than a general whiteboard.

## Pre-alpha claims are separated from code

The inspected Next.js and graph-database source includes OpenAI AI SDK integration and the current graph surfaces. MCP support is described as a future direction and is not counted as an implemented agent interface. Production hardening, migration stability, and collaborative governance also remain unproven at this stage.

## Pinned evidence

- Repository: [zhileiz/figs](https://github.com/zhileiz/figs)
- Inspected application source: [`f6470c39db1c8a35352cc047f1acb66de75d6d61`](https://github.com/zhileiz/figs/tree/f6470c39db1c8a35352cc047f1acb66de75d6d61)
- Immutable revision: [commit `f6470c3`](https://github.com/zhileiz/figs/commit/f6470c39db1c8a35352cc047f1acb66de75d6d61)
