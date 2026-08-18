# WAM Diagram Editor

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WAM Studio is a team-built WebComposition Architecture Model editor. It uses AI to move from a web-system description into a native React Flow graph and then lets the user continue by direct manipulation.

## The domain is web composition

The node and connection vocabulary is aimed at web-service architecture rather than arbitrary flowcharts. Generation returns topology that can be positioned and edited on the canvas. Explanation is a second AI operation over the current diagram, separating creation from interpretation.

## Full-stack persistence makes diagrams projects

The Next.js/TypeScript frontend talks to an Express API, with MongoDB holding diagrams and Google OAuth identifying users. This turns the graph into a returnable product object rather than a transient chat result.

## What the source does and does not show

The repository demonstrates generation, visual editing, explanation, authentication, and cloud persistence. “Collaborative” does not by itself prove operation-level real-time multiplayer; the inspected code should not be read as evidence of CRDT or conflict-free concurrent graph mutation.

## Pinned evidence

- Repository: [jxuho/wam-diagram-editor](https://github.com/jxuho/wam-diagram-editor)
- Inspected full-stack tree: [`cbf48bbca5f897273c6974267dcdf4749e5a5777`](https://github.com/jxuho/wam-diagram-editor/tree/cbf48bbca5f897273c6974267dcdf4749e5a5777)
- Immutable revision: [commit `cbf48bb`](https://github.com/jxuho/wam-diagram-editor/commit/cbf48bbca5f897273c6974267dcdf4749e5a5777)
