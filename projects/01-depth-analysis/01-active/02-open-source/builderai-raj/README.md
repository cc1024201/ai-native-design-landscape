# BuilderAI (Raj Patel)

BuilderAI treats an app as a multi-file project that a visible multi-agent pipeline assembles, and "design" is just one stage of that assembly rather than a privileged act. Frontend work is produced by a frontend agent like any other artifact — architecture, backend, integration, QA and packaging are peers, all advancing one shared graph state.

## One LangGraph state is the shared nervous system

[`agent-service/graph/state.py`](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/agent-service/graph/state.py) is the single state object carrying requirements, plans, generated files, validation findings, repair state, logs and packaged output across every stage. [`agent-service/graph/pipeline.py`](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/agent-service/graph/pipeline.py) wires architect, frontend, backend, integrator, QA, repair and packager as graph nodes — including a conditional repair loop rather than trusting first generation. The mutation model is therefore graph orchestration over a running file bundle, not artboard editing.

## Source is what preview and delivery consume

[`app/api/projects/[id]/generate/route.ts`](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/app/api/projects/%5Bid%5D/generate/route.ts) connects the pipeline to a durable project, and the browser's [`WebContainerPreview.tsx`](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/components/preview/WebContainerPreview.tsx) boots that real source bundle in WebContainer — preview is the code executing, not a rendered approximation of it.

## Versions and delivery keep identity in the files

Supabase migrations introduce project version history and deployment/share fields; the version-restore route swaps the project's active files for a saved state, and ZIP download, GitHub push, sharing and deployment all read from that same project. Design persists here as versionable source where every downstream output — preview, share, deploy — is just another origin of the file tree.

**Evidence** and location

- [Canonical repository](https://github.com/rajpatel9595/BuilderAI)
- [Inspected tree](https://github.com/rajpatel9595/BuilderAI/tree/a81848c9707135038c04ccfa5b1a2d83e7c8526d)
- [Version restore route](https://github.com/rajpatel9595/BuilderAI/blob/a81848c9707135038c04ccfa5b1a2d83e7c8526d/app/api/projects/%5Bid%5D/versions/%5BvId%5D/restore/route.ts)
- Commit: `a81848c9707135038c04ccfa5b1a2d83e7c8526d`

No reliable public location was found for the maintainer; team region remains unknown.
