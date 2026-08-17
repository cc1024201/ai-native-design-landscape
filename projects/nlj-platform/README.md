# NLJ Platform

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

NLJ Platform is a nonlinear learning-authoring system where instructional structure, interactions, assessment logic, publishing, and analytics share one visual graph.

## The graph models learning behavior

React Flow nodes cover more than page sequence: the source includes over eighteen interaction and question types. Connections determine how learners move through content, while the WYSIWYG editor exposes the same structure authors later publish.

## Claude assists under governance

Content Studio uses Claude for drafting and extraction from source material. Automated tags and knowledge signals can be reviewed, approved, or overridden instead of silently becoming curriculum truth. Version and approval workflows give organizations a boundary between generated candidates and released learning content.

## Runtime evidence returns to authors

Published experiences emit xAPI-aware events and analytics that show how the graph behaves for learners. PostgreSQL persists projects and event data. This makes authoring, delivery, and feedback one product loop, although pedagogical quality and compliance still require human judgment beyond model output.

## Pinned evidence

- Repository: [kenalba/nlj_viewer](https://github.com/kenalba/nlj_viewer)
- Inspected platform source: [`9109bbf811bf08770e9713e829b47668b1e9fd25`](https://github.com/kenalba/nlj_viewer/tree/9109bbf811bf08770e9713e829b47668b1e9fd25)
- Immutable revision: [commit `9109bbf`](https://github.com/kenalba/nlj_viewer/commit/9109bbf811bf08770e9713e829b47668b1e9fd25)
