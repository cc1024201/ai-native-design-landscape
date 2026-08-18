# AI Builder by Nishant Chaudhary

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Builder defines a dashboard as typed JSON rather than a chat transcript or screenshot. The model proposes that graph; the user can arrange it on a canvas or edit the JSON directly; rendering and export consume the same accepted schema.

## A typed dashboard graph is authoritative

[`src/ai/aiClient.ts`](https://github.com/Nishant-Chaudhary5338/ai-builder/blob/a64bff01ac57589e25310556986f94e81cfc440f/src/ai/aiClient.ts) asks the provider for an `AIDashboardSchema` and can request a schema diff for later prompts. [`src/stores/builderStore.ts`](https://github.com/Nishant-Chaudhary5338/ai-builder/blob/a64bff01ac57589e25310556986f94e81cfc440f/src/stores/builderStore.ts) holds the current schema together with prompt history active version and saved versions in browser storage.

The renderer in [`DashboardFromSchema.tsx`](https://github.com/Nishant-Chaudhary5338/ai-builder/blob/a64bff01ac57589e25310556986f94e81cfc440f/src/components/canvas/DashboardFromSchema.tsx) maps that graph to draggable and resizable dashboard widgets. This is direct graph correction rather than a screenshot overlay.

## Manual correction and promotion

[`JSONPanel.tsx`](https://github.com/Nishant-Chaudhary5338/ai-builder/blob/a64bff01ac57589e25310556986f94e81cfc440f/src/components/panels/JSONPanel.tsx) exposes the authority in Monaco. [`codeGen.ts`](https://github.com/Nishant-Chaudhary5338/ai-builder/blob/a64bff01ac57589e25310556986f94e81cfc440f/src/lib/codeGen.ts) projects the adopted graph to React or JSON for export. Versions remain browser-local; the source does not establish a hosted collaboration or deployment backend.

## Evidence and location

- [Canonical repository](https://github.com/Nishant-Chaudhary5338/ai-builder)
- [Inspected tree](https://github.com/Nishant-Chaudhary5338/ai-builder/tree/a64bff01ac57589e25310556986f94e81cfc440f)
- Commit: `a64bff01ac57589e25310556986f94e81cfc440f`

The maintainer profile states New Delhi; team region is recorded as India.
