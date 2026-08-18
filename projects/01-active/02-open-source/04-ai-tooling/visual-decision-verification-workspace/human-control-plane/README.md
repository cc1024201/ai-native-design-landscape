# Human Control Plane

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Human Control Plane is an interactive policy lab for deciding what an AI agent may execute, what requires confirmation and what stays with an accountable owner. It defines governance through executable product states rather than a prose checklist.

## Four inputs select a control pattern

[policies.ts](https://github.com/kevinastuhuaman/human-in-the-loop-patterns/blob/25e6552a7c77e3f9a8e9a3e0e6db1fbd0ed23bd4/src/data/policies.ts) maps consequence, reversibility, uncertainty and intent freshness to undo, confirmation, fresh approval or accountable approval. Users can modify each dimension and inspect why the policy changes.

## Authorization is bound to committed state

[index.astro](https://github.com/kevinastuhuaman/human-in-the-loop-patterns/blob/25e6552a7c77e3f9a8e9a3e0e6db1fbd0ed23bd4/src/pages/index.astro) invalidates an approval when an input changes, supports rejection and real UI undo, and appends visible audit events that name policy and owner. The lab records the decision boundary, not hidden chain-of-thought.

## Prototype boundary

Policy selection and execution are deterministic and browser-local. No external agent action, durable audit database or organizational policy service is connected. The product is included as a visual governance and decision-design workspace, not as enforcement infrastructure.

## Relationship to Agent Workflow Canvas

Both projects share a maintainer and a concern for agent authority, but they expose independent ordinary-user artifacts: one exercises a concrete invoice workflow and trace; this one lets users construct and test a reusable control policy. They remain separate product studies under one maintainer umbrella.

## Pinned evidence

- [Repository](https://github.com/kevinastuhuaman/human-in-the-loop-patterns)
- [Inspected tree](https://github.com/kevinastuhuaman/human-in-the-loop-patterns/tree/25e6552a7c77e3f9a8e9a3e0e6db1fbd0ed23bd4)
- [State-bound approval decision](https://github.com/kevinastuhuaman/human-in-the-loop-patterns/blob/25e6552a7c77e3f9a8e9a3e0e6db1fbd0ed23bd4/DECISIONS/002-approval-belongs-to-state.md)
