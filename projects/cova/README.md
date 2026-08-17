# Cova

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Cova is a deliberately narrow AI cover generator. It does not attempt to invent an unrestricted layer graph: the editable artifact is a constrained cover-configuration object shared by manual controls, AI suggestions, preview and export.

## AI proposes a bounded partial configuration

[`ai.ts`](https://github.com/Guizimo/cova/blob/06b1852f739366942ea382c5edaa03caa06a5f68/src/utils/ai.ts) calls an OpenAI-compatible chat-completions endpoint with the current configuration as context. It extracts JSON, sanitizes fields and clamps numeric values before returning a partial update. The model is therefore asked to operate inside the product's typography, color, texture and layout vocabulary rather than emit arbitrary HTML or image pixels.

[`AIAssistant.tsx`](https://github.com/Guizimo/cova/blob/06b1852f739366942ea382c5edaa03caa06a5f68/src/components/generator/ConfigPanel/AIAssistant.tsx) merges that partial result into the same Zustand state used by direct controls. It snapshots the prior configuration for one-click undo, making the AI action a reversible state transition rather than a separate generated artifact.

## One parameter object drives preview and delivery

[`generator.ts`](https://github.com/Guizimo/cova/blob/06b1852f739366942ea382c5edaa03caa06a5f68/src/store/generator.ts) persists the current configuration locally under `cova-storage`. The preview renders that state as DOM; the export utility captures the same result to PNG, JPEG or WebP and provides an AVIF fallback path. Raster files are deliveries, while the configuration remains the editable source.

## Persistence boundary

Cova provides current-state browser persistence and a transient pre-AI undo snapshot. It does not expose durable named versions, branching, collaboration or a hosted project authority. Its contribution to the landscape is the small but complete convergence pattern: manual edits and model output meet in a validated domain object from which both preview and export are derived.

## Evidence

- [Pinned repository](https://github.com/Guizimo/cova/tree/06b1852f739366942ea382c5edaa03caa06a5f68)
- [Preview component](https://github.com/Guizimo/cova/blob/06b1852f739366942ea382c5edaa03caa06a5f68/src/components/generator/Preview.tsx)
- [Image export](https://github.com/Guizimo/cova/blob/06b1852f739366942ea382c5edaa03caa06a5f68/src/utils/generator.ts)
