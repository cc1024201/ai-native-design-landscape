# Aniya Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Aniya Studio is a self-hosted HTML presentation editor with two modes over the same deck: GrapesJS direct manipulation and an agent mode that revises a selected DOM element through natural language.

## Compatibility is enforced without making GrapesJS the source

Agent-written HTML often breaks when an editor reparses it. Aniya addresses this with three layers: a project skill teaches generation constraints; a hook enforces the skill-before-write sequence; and [`editorApi.ts`](https://github.com/yizhian/Aniya-Studio/blob/06e3e3ccadd649a1bfa8b057b3f9cd76e7e78244/htmlslide/frontend/src/services/editorApi.ts) adapts styles, scripts and linked assets at import time.

The editor model is intentionally not the durable authority. GrapesJS supports drag, inline text, properties, layers, undo and redo, but preview and export use the agent's original HTML. Manual save serializes corrections back into that source. In Design mode, selected tag, text, styles and CSS path travel with the instruction so the agent can patch a bounded target.

```text
document/topic -> AgentGo HTML deck -> compatibility adapter -> GrapesJS canvas
-> direct edit or selected-DOM prompt -> save version -> original HTML
-> preview / PDF / PPTX -> restore earlier version if needed
```

[`versionApi.ts`](https://github.com/yizhian/Aniya-Studio/blob/06e3e3ccadd649a1bfa8b057b3f9cd76e7e78244/htmlslide/frontend/src/services/editor/versionApi.ts) connects named saves and restores to the backend. End-to-end tests cover selected-DOM agent edits and version recovery. PPTX is a conversion projection and cannot be assumed to retain the HTML's full structure or interactivity.

The project is Apache-2.0 licensed. No reliable maintainer-region evidence was found.

## Decisive evidence

- [Pinned repository](https://github.com/yizhian/Aniya-Studio/tree/06e3e3ccadd649a1bfa8b057b3f9cd76e7e78244)
- [Editor canvas](https://github.com/yizhian/Aniya-Studio/blob/06e3e3ccadd649a1bfa8b057b3f9cd76e7e78244/htmlslide/frontend/src/components/editor/EditorCanvas.tsx)
- [Selected-DOM chat contract](https://github.com/yizhian/Aniya-Studio/blob/06e3e3ccadd649a1bfa8b057b3f9cd76e7e78244/htmlslide/backend/src/utils/chat_utils.py)
- [Version/restore test](https://github.com/yizhian/Aniya-Studio/blob/06e3e3ccadd649a1bfa8b057b3f9cd76e7e78244/htmlslide/backend/tests/e2e/test_version_restore.py)
- [Apache-2.0 license](https://github.com/yizhian/Aniya-Studio/blob/06e3e3ccadd649a1bfa8b057b3f9cd76e7e78244/LICENSE)
