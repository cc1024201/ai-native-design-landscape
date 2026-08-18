# CODEUI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CODEUI treats an application as a durable multi-file project. Model generation and follow-up prompts can change that project; checkpoints preserve candidates; code editing and visual design mode both return to the same source authority.

## Project files and checkpoints are distinct records

[`lib/models/Project.ts`](https://github.com/Paurakh4/CODEUI/blob/235c68d03ce21a1df90652d72c7077d33deb3b03/lib/models/Project.ts) persists project source and product state in MongoDB. [`lib/models/Checkpoint.ts`](https://github.com/Paurakh4/CODEUI/blob/235c68d03ce21a1df90652d72c7077d33deb3b03/lib/models/Checkpoint.ts) stores recoverable versions rather than treating every chat turn as current.

[`app/api/ai/route.ts`](https://github.com/Paurakh4/CODEUI/blob/235c68d03ce21a1df90652d72c7077d33deb3b03/app/api/ai/route.ts) routes generation across providers and preserves project context. The editor shell in [`editor-layout.tsx`](https://github.com/Paurakh4/CODEUI/blob/235c68d03ce21a1df90652d72c7077d33deb3b03/components/editor-layout.tsx) coordinates prompts files preview and history.

## Two correction surfaces converge on source

[`canvas.tsx`](https://github.com/Paurakh4/CODEUI/blob/235c68d03ce21a1df90652d72c7077d33deb3b03/components/canvas.tsx) supports live and visual inspection while [`code-editor.tsx`](https://github.com/Paurakh4/CODEUI/blob/235c68d03ce21a1df90652d72c7077d33deb3b03/components/code-editor.tsx) exposes source directly. [`version-history.tsx`](https://github.com/Paurakh4/CODEUI/blob/235c68d03ce21a1df90652d72c7077d33deb3b03/components/version-history.tsx) restores a selected checkpoint. [`lib/utils/export.ts`](https://github.com/Paurakh4/CODEUI/blob/235c68d03ce21a1df90652d72c7077d33deb3b03/lib/utils/export.ts) exports the adopted files; export is not silently coupled to generation.

## Evidence and location

- [Canonical repository](https://github.com/Paurakh4/CODEUI)
- [Inspected tree](https://github.com/Paurakh4/CODEUI/tree/235c68d03ce21a1df90652d72c7077d33deb3b03)
- Commit: `235c68d03ce21a1df90652d72c7077d33deb3b03`

The maintainer profile states Kathmandu Nepal; team region is recorded as Nepal.
