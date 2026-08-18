# Ideaship

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Ideaship is a managed app builder whose most consequential loop joins agent-authored virtual files with direct edits on the running page. The selected runtime element is mapped back into source rather than retained as a detached annotation.

## VFS and database split authority

[`generate-code/route.ts`](https://github.com/nathannlu/ideaship/blob/91068d34a28340cbfdf8d43b986e2458325552ac/src/app/api/generate-code/route.ts) mediates model generation. [`manager.tsx`](https://github.com/nathannlu/ideaship/blob/91068d34a28340cbfdf8d43b986e2458325552ac/src/vfs/manager.tsx) owns the working file set used by bundling and editing. [`schema.prisma`](https://github.com/nathannlu/ideaship/blob/91068d34a28340cbfdf8d43b986e2458325552ac/prisma/schema.prisma) separately retains users, chats and site records.

## Runtime selection returns to source

[`IframePreview.tsx`](https://github.com/nathannlu/ideaship/blob/91068d34a28340cbfdf8d43b986e2458325552ac/src/features/preview/IframePreview.tsx) hosts the running bundle and selection bridge. Editor transformers patch the corresponding files for text, image, layout, icon, link and deletion operations. [`deploy/route.ts`](https://github.com/nathannlu/ideaship/blob/91068d34a28340cbfdf8d43b986e2458325552ac/src/app/api/deploy/route.ts) materializes the accepted project into delivery state.

## Evidence lock

- [Canonical repository](https://github.com/nathannlu/ideaship)
- [Inspected tree](https://github.com/nathannlu/ideaship/tree/91068d34a28340cbfdf8d43b986e2458325552ac)
- [Maintainer region evidence](https://github.com/nathannlu)
- Commit: `91068d34a28340cbfdf8d43b986e2458325552ac`
