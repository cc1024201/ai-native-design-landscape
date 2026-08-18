# MedPaper Assistant

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MedPaper Assistant is a medical-research authoring workspace in which manuscripts, evidence libraries, citations, diagrams, and journal-ready documents are coordinated through MCP and gated workflows.

## The tool surface is release-governed

Three MCP servers contribute literature search, manuscript/wiki operations, and creative generation. The core server exposes a compact default subset of a much larger tool catalog; `tool-surface-authority.json` and the extension bundle manifest pin what a release actually exposes. This prevents documentation counts from silently redefining the runtime.

## Visuals live inside an evidence workflow

The dashboard includes a diagram editor, while draw.io integration supports CONSORT and PRISMA figures. Foam-style links, PubMed/Europe PMC search, and citation sessions connect prose and figures to evidence. Journal Word export is a delivery materialization, not the manuscript's only recoverable state.

## Gates constrain autonomous writing

The auto-paper workflow defines thirteen main checkpoints, a Phase 2.1 sub-gate, quality hooks, and structured review. Those boundaries matter in a medical domain: tool orchestration can assemble and check artifacts, but authors remain responsible for evidence appraisal, claims, ethics, and submission correctness.

## Pinned evidence

- Repository: [u9401066/med-paper-assistant](https://github.com/u9401066/med-paper-assistant)
- Inspected authoring workspace: [`2f873383dabbce28204fbb5d928def13fd9058ae`](https://github.com/u9401066/med-paper-assistant/tree/2f873383dabbce28204fbb5d928def13fd9058ae)
- Immutable revision: [commit `2f87338`](https://github.com/u9401066/med-paper-assistant/commit/2f873383dabbce28204fbb5d928def13fd9058ae)
