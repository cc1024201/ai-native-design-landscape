# Brand Manual App

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Brand Manual App is a structured brand-system workspace, not a one-shot brand-book generator. It organizes fifty-five editable modules into seven gated phases, generates module content with specialized flows, and retains the resulting system for revision, sharing and export.

## Modules and phase gates define the artifact

[`modules-definition.ts`](https://github.com/admin-blip7/brand-manual-app/blob/7d5cd6bab84e2873f16dea6342baa248fbd894d8/src/lib/data/modules-definition.ts) is the product grammar. BAML module flows produce typed content, [`generate-module.ts`](https://github.com/admin-blip7/brand-manual-app/blob/7d5cd6bab84e2873f16dea6342baa248fbd894d8/src/actions/generate-module.ts) persists it, and [`update-module-content.ts`](https://github.com/admin-blip7/brand-manual-app/blob/7d5cd6bab84e2873f16dea6342baa248fbd894d8/src/actions/update-module-content.ts) keeps human edits first-class.

Phase unlock gates make completion state part of the model, while the Supabase persistence migration preserves generation status and content across sessions. PDF, HTML and Markdown are outputs of the module graph rather than its authority.

## Evidence

- [Pinned repository](https://github.com/admin-blip7/brand-manual-app/tree/7d5cd6bab84e2873f16dea6342baa248fbd894d8)
- [Phase unlock gate](https://github.com/admin-blip7/brand-manual-app/blob/7d5cd6bab84e2873f16dea6342baa248fbd894d8/src/components/dashboard/PhaseUnlockGate.tsx)
- [Persistence migration](https://github.com/admin-blip7/brand-manual-app/blob/7d5cd6bab84e2873f16dea6342baa248fbd894d8/supabase/migrations/20260210032000_brand_generation_persistence.sql)
- [PDF exporter](https://github.com/admin-blip7/brand-manual-app/blob/7d5cd6bab84e2873f16dea6342baa248fbd894d8/src/lib/exporters/pdf-generator.ts)
