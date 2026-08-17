# AI Diagram Hub / AI Draw Nexus

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Diagram Hub is a multi-engine diagram project system: Mermaid source, Excalidraw elements and Draw.io XML are distinct artifact authorities behind one library and conversation surface. This dossier uses the earliest verifiable source lineage rather than counting five later disconnected copies as products.

## Three engines do not collapse into one schema

At commit [`a20b15c9`](https://github.com/hkxiaoyao/ai-draw-nexus/tree/a20b15c9491c9482dd9d4d736f7b05bfc4566b3b) [`editorStore`](https://github.com/hkxiaoyao/ai-draw-nexus/blob/a20b15c9491c9482dd9d4d736f7b05bfc4566b3b/src/stores/editorStore.ts) keeps the active engine and its payload. [`useAIGenerate`](https://github.com/hkxiaoyao/ai-draw-nexus/blob/a20b15c9491c9482dd9d4d736f7b05bfc4566b3b/src/hooks/useAIGenerate.ts) supplies current project context to streaming provider calls and routes results into the appropriate engine instead of rasterizing them.

Projects and versions are explicit IndexedDB records via [`projectRepository`](https://github.com/hkxiaoyao/ai-draw-nexus/blob/a20b15c9491c9482dd9d4d736f7b05bfc4566b3b/src/services/projectRepository.ts) and [`versionRepository`](https://github.com/hkxiaoyao/ai-draw-nexus/blob/a20b15c9491c9482dd9d4d736f7b05bfc4566b3b/src/services/versionRepository.ts). This supports restore and contextual follow-up prompts.

## Copy cluster decision

The `fxdm41202425` and `itbuff666` repositories have the same full tree as this source; `duo-ge`, `Doraemon-code/AI-Flowchart` and `DHL0301/NexusDraw` retain its product language and three-engine architecture with modifications. GitHub does not mark most as forks, but commit/tree evidence makes six counts indefensible. They resolve to this one product lineage.

The maintainer region is not published.

## Decisive evidence

- [Pinned README](https://github.com/hkxiaoyao/ai-draw-nexus/blob/a20b15c9491c9482dd9d4d736f7b05bfc4566b3b/README.md)
- [Provider implementation](https://github.com/hkxiaoyao/ai-draw-nexus/blob/a20b15c9491c9482dd9d4d736f7b05bfc4566b3b/src/services/aiService.ts)
- [Local database schema](https://github.com/hkxiaoyao/ai-draw-nexus/blob/a20b15c9491c9482dd9d4d736f7b05bfc4566b3b/src/lib/db.ts)
