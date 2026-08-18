# DraftWalk

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DraftWalk is an early-home Design copilot built around one metric plan that can be edited from a top view, a first-person block builder or natural language and then compiled into a walkable 3D result. Its central architectural choice is to prevent the AI or Blender render from becoming a second source of truth.

## The metric home plan owns geometry

Rooms, walls, openings, finishes and furniture transforms live in a canonical plan. [`planEngine.ts`](https://github.com/Sammsamy02/draftwalk/blob/d14a04b6710d31e03b579f1861feb12130adf343/app/lib/planEngine.ts) applies normalized operations, while [`authoritativeConstraints.ts`](https://github.com/Sammsamy02/draftwalk/blob/d14a04b6710d31e03b579f1861feb12130adf343/app/lib/authoritativeConstraints.ts) protects dimensional and layout invariants. Top-plan and block-mode gestures mutate that same object.

## AI is restricted to schema-constrained operations

The [`design route`](https://github.com/Sammsamy02/draftwalk/blob/d14a04b6710d31e03b579f1861feb12130adf343/app/api/design/route.ts) sends the current plan and selected target to a configured server-side model, parses bounded plan operations and validates them before application. Timeout, malformed output or an unavailable provider invokes a deterministic basic planner; the UI does not claim fallback output was model-authored.

That fallback is part of the evidence boundary. The ordinary project remains usable without an AI credential, but the source also implements a genuine optional model path over the same artifact.

## Reality View compiles and reviews rather than redesigns

[`blender-worker.mjs`](https://github.com/Sammsamy02/draftwalk/blob/d14a04b6710d31e03b579f1861feb12130adf343/scripts/blender-worker.mjs) sends the stored measurements and transforms to the Blender compiler. A supervised path can ask Codex/GPT to preflight the plan and review bounded build evidence, but Blender is instructed to compile the plan rather than infer a different house. Procedural Reality View provides a local derivative when that worker is absent.

## Handoff and professional limits

The project exports concept JSON and a dimensioned SVG plan through [`planSvgExport.ts`](https://github.com/Sammsamy02/draftwalk/blob/d14a04b6710d31e03b579f1861feb12130adf343/app/lib/planSvgExport.ts). Database schema supports saved projects and build records. These remain early concept artifacts: the source explicitly disclaims surveying, structural engineering, permitting and construction-document accuracy.

## Evidence

- [Pinned repository](https://github.com/Sammsamy02/draftwalk/tree/d14a04b6710d31e03b579f1861feb12130adf343)
- [Reality build route](https://github.com/Sammsamy02/draftwalk/blob/d14a04b6710d31e03b579f1861feb12130adf343/app/api/reality/route.ts)
