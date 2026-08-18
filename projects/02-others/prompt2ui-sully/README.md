# Prompt2UI by Sully Omar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Prompt2UI is a compact conversational React-component studio. Claude streams a tagged artifact into a split workspace where the resulting source can be edited directly and immediately re-evaluated as a visual component.

## Artifact tags are the agent interface

The pinned [`system prompt`](https://github.com/sullyo/prompt2ui/blob/333875ebfc68212e9d55d9ac430c8254dc75b5fd/src/app/api/chat/prompt.ts) defines an artifact identity title type and full-content replacement contract. [`chat.tsx`](https://github.com/sullyo/prompt2ui/blob/333875ebfc68212e9d55d9ac430c8254dc75b5fd/src/components/artifacts/chat.tsx) incrementally strips reasoning tags detects the streamed artifact boundary and promotes complete artifact content into the workspace.

## React source is the live authority

[`playground.tsx`](https://github.com/sullyo/prompt2ui/blob/333875ebfc68212e9d55d9ac430c8254dc75b5fd/src/components/artifacts/playground.tsx) keeps the current component source in React state. The code editor mutates that same string; [`preview-screen.tsx`](https://github.com/sullyo/prompt2ui/blob/333875ebfc68212e9d55d9ac430c8254dc75b5fd/src/components/artifacts/preview-screen.tsx) transpiles it with Babel maps approved imports into an in-memory scope and evaluates the default export behind an error boundary.

## Runtime and persistence limits

The preview allows immediate manual correction but runs through `new Function` inside the page rather than an isolated process or durable project. The source contains no database file export version graph or reopen path. Its authority is therefore real but session-scoped.

## Pinned evidence

- [Repository](https://github.com/sullyo/prompt2ui)
- [Inspected tree](https://github.com/sullyo/prompt2ui/tree/333875ebfc68212e9d55d9ac430c8254dc75b5fd)
- [Maintainer profile locating the lineage in Canada](https://github.com/sullyo)
- Commit: `333875ebfc68212e9d55d9ac430c8254dc75b5fd`
