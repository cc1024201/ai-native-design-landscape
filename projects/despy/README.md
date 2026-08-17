# Despy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Despy is an agentic-coding evaluation platform rather than a general app builder. Its distinctive Design definition is governed collaboration: a professor defines the editable project, locked source, model, prompt policy, quotas, hidden tests and rubric; a student uses AI inside that boundary and submits both the artifact and the collaboration trail for assessment.

## AI edits share the student's source authority

Pinned revision: `46419c9191480f26a25271f067c2a231c20a5c8f`.

When direct editing is enabled, the server adds a SEARCH/REPLACE output contract to Gemini. The client applies a patch only when the search text matches exactly once, then writes the resulting file through the same `writeFile` path used by Monaco. That path updates the editor buffer, schedules a WebContainer filesystem write and triggers Vite HMR. AI and manual work therefore converge on one source map instead of maintaining parallel generated and edited copies.

The running projection is more than an iframe: Despy forwards browser-console messages, can exercise an embedded backend API, runs tests inside WebContainer and exposes database state. The visual surface is evidence for whether the student's interactive artifact works, while the file map remains authoritative.

## Governance is part of the artifact contract

Challenge records carry template files, locked and editable paths, setup/dev/test commands, AI policy and grading rubric. The AI proxy enforces a per-response output cap, while cumulative question and token quotas remain client-enforced in this revision. The student-facing DTO also still carries the professor's system prompt, a source-noted boundary scheduled for later server-side injection.

## Persistence separates work-in-progress from assessed history

Per-challenge file deltas and AI usage are saved in IndexedDB and merged back over the original template after reload. This is durable browser recovery, not a version graph: there are no named source snapshots or branch/restore operations. Submission creates a separate MongoDB record containing final files, grading result, prompt turns, per-prompt file snapshots, AI usage and integrity logs. Those records support review and comparison, but they do not become editable project versions.

## Pinned evidence

- [Repository](https://github.com/Johncakes/Despy)
- [Governed Gemini proxy and edit contract](https://github.com/Johncakes/Despy/blob/46419c9191480f26a25271f067c2a231c20a5c8f/src/app/api/agent/route.ts)
- [AI patch parsing and application handoff](https://github.com/Johncakes/Despy/blob/46419c9191480f26a25271f067c2a231c20a5c8f/src/features/solve/components/AiChatPanel.tsx)
- [Shared editor, filesystem and preview state](https://github.com/Johncakes/Despy/blob/46419c9191480f26a25271f067c2a231c20a5c8f/src/features/solve/useWorkspace.ts)
- [IndexedDB delta persistence](https://github.com/Johncakes/Despy/blob/46419c9191480f26a25271f067c2a231c20a5c8f/src/shared/core/stores/workspaceStore.ts)
- [Challenge and governance artifact model](https://github.com/Johncakes/Despy/blob/46419c9191480f26a25271f067c2a231c20a5c8f/src/shared/core/types/index.ts)
- [Submission evidence persistence](https://github.com/Johncakes/Despy/blob/46419c9191480f26a25271f067c2a231c20a5c8f/src/shared/lib/db/submissions.ts)
