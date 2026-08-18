# BuilderAI (Raj Patel)

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BuilderAI defines an app as a multi-file project assembled by a visible multi-agent software pipeline. Architecture, frontend, backend, integration, QA, repair, and packaging stages operate on one LangGraph state; the accepted files are then persisted, previewed, versioned, and delivered.

## A graph coordinates specialized mutations

[`agent-service/graph/state.py`](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/agent-service/graph/state.py) defines shared requirements, plans, generated files, validation findings, repair state, logs, and packaged output. [`agent-service/graph/pipeline.py`](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/agent-service/graph/pipeline.py) wires the architect, frontend, backend, integrator, QA, repair, and packager nodes, including conditional repair rather than assuming the first generation is valid.

[`app/api/projects/[id]/generate/route.ts`](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/app/api/projects/%5Bid%5D/generate/route.ts) connects that pipeline to a durable project. The browser's [`WebContainerPreview.tsx`](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/components/preview/WebContainerPreview.tsx) boots the generated files in WebContainer, so preview consumes the source bundle rather than a detached mock.

## Versions and delivery preserve project identity

Supabase migrations introduce project version history and deployment/share fields. The version restore route replaces the project's active files with a selected saved state. ZIP download, GitHub push, sharing, and deployment routes all originate from that same project, making source files the delivery authority.

## Evidence and location

- [Canonical repository](https://github.com/rajpatel9595/BuilderAI)
- [Inspected tree](https://github.com/rajpatel9595/BuilderAI/tree/a81848c9707135038c04ccfa5b1a2d83e7c8526d)
- [Version restore route](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/app/api/projects/%5Bid%5D/versions/%5BvId%5D/restore/route.ts)
- Commit: `a81848c9707135038c04ccfa5b1a2d83e7c8526d`

No reliable public location was found for the maintainer; team region remains unknown.
