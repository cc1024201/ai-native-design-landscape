# Adeu

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Adeu is a DOCX-to-LLM translation layer for non-destructive review and redlining. It projects Word content into token-efficient Markdown, validates targeted edits and writes accepted changes back as native Track Changes while preserving the underlying OOXML layout and comments.

## A Word virtual DOM bounds agent edits

Read, search and batch-edit operations address document structure without exposing the model to raw XML. Ambiguous matches or invalid changes are blocked before mutation. Finalization can scrub metadata, preserve or resolve markup and lock the outgoing document; a visual diff makes versions reviewable.

Python and Node engines, MCP, skills, desktop and n8n integrations share one product identity. Word remains authoritative, and the system's strict focus on redlining does not make it a general document-layout generator.

- [Pinned repository](https://github.com/dealfluence/adeu/tree/0db3cc23936954f1acf6428c8cc74e9c94c9c40a)
- [Python engine](https://github.com/dealfluence/adeu/tree/0db3cc23936954f1acf6428c8cc74e9c94c9c40a/python)
- [Node engine](https://github.com/dealfluence/adeu/tree/0db3cc23936954f1acf6428c8cc74e9c94c9c40a/node)
- [Organization profile checked; no location published](https://github.com/dealfluence)
