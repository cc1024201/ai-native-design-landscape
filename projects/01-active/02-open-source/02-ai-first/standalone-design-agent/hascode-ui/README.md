# HasCode UI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

HasCode UI is a persisted component workshop. A generated TSX component is not just displayed once: it acquires revisions, can be forked, and is compiled in the browser into the preview used to inspect it.

## Creation starts a component lineage

[`component.ts`](https://github.com/lutfi-haslab/hascode-ui/blob/da16362f311a42155e5e51f7a91c7b47e2faa6e5/src/server/api/routers/component.ts) selects an OpenAI or Anthropic generation path and creates both the component and its initial revision. [`openai.ts`](https://github.com/lutfi-haslab/hascode-ui/blob/da16362f311a42155e5e51f7a91c7b47e2faa6e5/src/server/openai.ts) extracts TSX from model responses and anchors later changes to the existing code instead of asking for an unrelated replacement.

## Revision and fork are different operations

The chat sends an instruction against a revision and persists the model's result as another revision. [`EditorTabs.tsx`](https://github.com/lutfi-haslab/hascode-ui/blob/da16362f311a42155e5e51f7a91c7b47e2faa6e5/src/components/EditorTabs.tsx) can also fork a selected revision into a new component identity. This is a genuine branch choice rather than an undo stack.

## Projection is compiled from stored source

[`compiler.ts`](https://github.com/lutfi-haslab/hascode-ui/blob/da16362f311a42155e5e51f7a91c7b47e2faa6e5/src/utils/compiler.ts) transforms TSX and generates Tailwind CSS in the browser. The preview therefore remains downstream of persisted source. The code tab is read-only in the pinned UI; correction returns through chat rather than direct source editing.

## Pinned evidence

- [Canonical repository](https://github.com/lutfi-haslab/hascode-ui)
- [Persisted schema](https://github.com/lutfi-haslab/hascode-ui/blob/da16362f311a42155e5e51f7a91c7b47e2faa6e5/prisma/schema.prisma)
- [Inspected tree](https://github.com/lutfi-haslab/hascode-ui/tree/da16362f311a42155e5e51f7a91c7b47e2faa6e5)
- Commit: `da16362f311a42155e5e51f7a91c7b47e2faa6e5`
