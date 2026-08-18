# AI App Builder by Doratiotto67

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This Portuguese-language builder turns a product brief into a React application, then keeps prompts, source files and a WebContainer preview inside a Supabase-backed project. Its important distinction is not the chat UI but the attempt to keep generated source addressable during later visual refinement.

## The saved project, not the preview, is the center

Pinned revision: `f3d0ab1a2069a12648bbe62c0432610dceb802bd`.

`projects`, `project_files`, chat threads and messages are tenant-scoped Supabase records protected by row-level policies. A project file carries path, text or storage location, hash metadata, language, size and an integer version. The browser mounts those records into a WebContainer, so the iframe is a disposable projection of database-backed source rather than the artifact of record.

Manual editor writes and model-produced files converge through the same `save-file` edge function. Batch saving therefore changes durable project rows before the next runtime projection is treated as current.

## Generation changes mode when files already exist

The streaming chat function first loads the current file paths and selected contents. An empty project receives a creation-oriented architecture prompt; an existing project receives maintenance rules that tell the model to edit existing components rather than manufacture `V2` copies. Optional target paths narrow the context for a surgical change.

The response remains model-authored text rather than a typed tool transaction. The client must interpret the generated file payload and call the save service. A successful model stream alone is therefore not a file receipt.

## Source-to-preview mapping is deliberately planted in JSX

Generated or edited component roots are instructed to carry `data-source-file` with the exact project path. That marker gives the runtime a potential source-return identity stronger than a screenshot or DOM description: a selected rendered component can name a file directly. Public source establishes marker production, but not a revision guard, instance identity or atomic selection-to-write protocol.

## The version column overstates recovery

On an update, `save-file` inserts the *incoming new content* into `file_versions` under the old version number and then writes the same content to `project_files` while incrementing the counter. It does not first capture the replaced content. The implementation even comments on this ambiguity.

Consequently the schema proves an edit ledger and numbered snapshots, but this revision does not prove reliable undo to the pre-edit file. The dossier does not treat the visible version integer as a working recovery system.

## Delivery is source extraction, not synchronized release state

The project exposes source download and supports persistent project reopening. No inspected source binds a downloaded bundle, WebContainer server, database row set and deployment into one release transaction. Acceptance still has to follow the extracted source into an independently run or deployed artifact.

## Pinned evidence

- [Repository](https://github.com/Doratiotto67/ai-app-builder)
- [Tenant project and file schemas](https://github.com/Doratiotto67/ai-app-builder/tree/f3d0ab1a2069a12648bbe62c0432610dceb802bd/supabase/schema)
- [Creation versus maintenance context and source markers](https://github.com/Doratiotto67/ai-app-builder/blob/f3d0ab1a2069a12648bbe62c0432610dceb802bd/supabase/functions/chat-stream/index.ts)
- [Durable file write and version behavior](https://github.com/Doratiotto67/ai-app-builder/blob/f3d0ab1a2069a12648bbe62c0432610dceb802bd/supabase/functions/save-file/index.ts)
- [WebContainer projection](https://github.com/Doratiotto67/ai-app-builder/blob/f3d0ab1a2069a12648bbe62c0432610dceb802bd/src/lib/webcontainer/webcontainer.ts)
