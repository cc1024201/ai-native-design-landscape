# Oboto

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Oboto is a general agent whose **UI Surfaces** are a first-class generated artifact system. The agent creates a surface and its React components; the user can edit component source; the runtime compiles it in a constrained environment; revisions preserve recoverable states.

## A Surface is metadata plus component source

[`src/surfaces/surface-manager.mjs`](https://github.com/sschepis/oboto/blob/80a8448a816158ba6a2a7959ea052edae5a4e019/src/surfaces/surface-manager.mjs) persists surface metadata as `.sur` files and each component as JSX under `.surfaces/<id>/`. Before mutations it snapshots metadata and all component sources into numbered revision files; reverting restores both.

[`src/server/ws-handlers/surface-handler.mjs`](https://github.com/sschepis/oboto/blob/80a8448a816158ba6a2a7959ea052edae5a4e019/src/server/ws-handlers/surface-handler.mjs) connects create update delete layout revision and error-repair operations to the UI. The chat can invoke the same typed Surface tools but does not become the artifact.

## Editable source and sandboxed projection converge

[`SurfaceSourceEditor.tsx`](https://github.com/sschepis/oboto/blob/80a8448a816158ba6a2a7959ea052edae5a4e019/ui/src/components/features/SurfaceSourceEditor.tsx) edits one JSX component in Monaco and saves it through the WebSocket update path. [`SurfaceRenderer.tsx`](https://github.com/sschepis/oboto/blob/80a8448a816158ba6a2a7959ea052edae5a4e019/ui/src/components/features/SurfaceRenderer.tsx) renders the resulting surface.

The [Surface guide](https://github.com/sschepis/oboto/blob/80a8448a816158ba6a2a7959ea052edae5a4e019/docs/guides/ui-surfaces.md) distinguishes deterministic direct tool calls from LLM handlers. Strict mode limits component fetches to localhost by default; permissive mode is explicit. This is a runtime governance boundary around generated code rather than a claim that arbitrary JSX is safe.

## Evidence

- [Canonical repository](https://github.com/sschepis/oboto)
- [Inspected tree](https://github.com/sschepis/oboto/tree/80a8448a816158ba6a2a7959ea052edae5a4e019)
- Commit: `80a8448a816158ba6a2a7959ea052edae5a4e019`

No reliable geographic evidence was found; team region remains `unknown`.
