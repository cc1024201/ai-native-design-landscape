# ModelWeave

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

ModelWeave is a document-grounded agent operations workspace developed as a diploma project. Users upload a knowledge base, define agents, arrange them with retrieval, approval, evaluation and export nodes, then retain the run trace and a client-ready report.

## Documents and agents meet in one saved workflow

[The Next.js workspace](https://github.com/serhiiSotskyi/multi-agent-knowledge-platform/blob/c4fd76a59a9fd2eebab4e57a0cfac4f08c920b2e/frontend/app/page.tsx) saves React Flow nodes and edges through workflow CRUD routes. Provider keys are stored per user, documents are indexed for retrieval and run records preserve citations, trace, evaluation, approval proposals and graph snapshots.

## Topology controls order and the run controls evidence

[agents.py](https://github.com/serhiiSotskyi/multi-agent-knowledge-platform/blob/c4fd76a59a9fd2eebab4e57a0cfac4f08c920b2e/backend/app/services/agents.py) topologically orders the saved graph. Retrieval nodes establish source context; real Anthropic calls execute configured agent identities; later nodes queue governed actions, evaluate the result and expose a DOCX download. Current-node events are projected back onto the run graph.

## The academic artifact also establishes team provenance

The pinned thesis identifies Serhii Sotskyi and National University Odesa Polytechnic, providing a public Ukraine team-region anchor as well as extensive design rationale. This is provenance evidence, not a claim that the university operates the product.

## Control-flow ceiling

Edges determine a topological sequence, but each agent receives accumulated global notes rather than edge-specific payloads. Encountering an approval node marks the run as waiting and creates durable approval work, yet the same executor loop continues through subsequent evaluation and export nodes before finalizing the waiting status. Branch-specific suspension and resume-from-node semantics are therefore not established.

## Pinned evidence

- [Repository](https://github.com/serhiiSotskyi/multi-agent-knowledge-platform)
- [Inspected tree](https://github.com/serhiiSotskyi/multi-agent-knowledge-platform/tree/c4fd76a59a9fd2eebab4e57a0cfac4f08c920b2e)
- [Workflow API](https://github.com/serhiiSotskyi/multi-agent-knowledge-platform/blob/c4fd76a59a9fd2eebab4e57a0cfac4f08c920b2e/backend/app/api/routes.py)
- [Pinned thesis text](https://github.com/serhiiSotskyi/multi-agent-knowledge-platform/blob/c4fd76a59a9fd2eebab4e57a0cfac4f08c920b2e/evidence/rendered-thesis-ua-final-2026-06-05/text.txt)
