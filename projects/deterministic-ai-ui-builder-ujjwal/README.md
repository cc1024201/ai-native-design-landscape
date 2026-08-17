# Deterministic AI UI Builder by ujjwal1541

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This builder restricts model output to a fixed component vocabulary. The schema—not emitted JSX—is the canonical UI artifact, so validation and rendering can reject unsupported structures before execution.

## Edge generation targets a bounded graph

[`generate-ui/index.ts`](https://github.com/ujjwal1541/AI-UI-Builder/blob/797e8d771d8a026ccbe29a281f8fd7a30c081a6f/supabase/functions/generate-ui/index.ts) runs the multi-stage generation request. [`componentSchema.ts`](https://github.com/ujjwal1541/AI-UI-Builder/blob/797e8d771d8a026ccbe29a281f8fd7a30c081a6f/src/lib/componentSchema.ts) defines the component and property envelope accepted by the client.

## Renderer and versions protect different boundaries

[`PreviewPanel.tsx`](https://github.com/ujjwal1541/AI-UI-Builder/blob/797e8d771d8a026ccbe29a281f8fd7a30c081a6f/src/components/PreviewPanel.tsx) maps validated nodes to the fixed component library. The [`Supabase migration`](https://github.com/ujjwal1541/AI-UI-Builder/blob/797e8d771d8a026ccbe29a281f8fd7a30c081a6f/supabase/migrations/20260211105127_create_ui_generator_schema.sql) persists sessions, messages and versions. Runtime safety therefore comes from the bounded interpreter while recovery comes from stored version records.

## Pinned evidence

- [Canonical repository](https://github.com/ujjwal1541/AI-UI-Builder)
- [Inspected tree](https://github.com/ujjwal1541/AI-UI-Builder/tree/797e8d771d8a026ccbe29a281f8fd7a30c081a6f)
- Commit: `797e8d771d8a026ccbe29a281f8fd7a30c081a6f`
