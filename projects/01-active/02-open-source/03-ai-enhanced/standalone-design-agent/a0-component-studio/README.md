# a0 AI Component Studio

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

a0's differentiator is documentation-grounded component generation. A user can point the workspace at an API or component-library source; scraped material enters the model context before React is produced.

## Grounding is an explicit service

[`documentation/route.ts`](https://github.com/Lochy2000/ai-component-builder/blob/7eb0b0ce51a832fe7e5e33795b0f42195252b4f9/app/api/documentation/route.ts) retrieves documentation context and [`chat/route.ts`](https://github.com/Lochy2000/ai-component-builder/blob/7eb0b0ce51a832fe7e5e33795b0f42195252b4f9/app/api/chat/route.ts) combines it with the generation conversation through the AI SDK and Gemini.

[`sandboxed-preview.tsx`](https://github.com/Lochy2000/ai-component-builder/blob/7eb0b0ce51a832fe7e5e33795b0f42195252b4f9/components/sandboxed-preview.tsx) projects generated source, while [`chat/page.tsx`](https://github.com/Lochy2000/ai-component-builder/blob/7eb0b0ce51a832fe7e5e33795b0f42195252b4f9/app/chat/page.tsx) coordinates code, preview and documentation state. Public source does not establish a durable multi-project version graph.

## Evidence lock

- [Canonical repository](https://github.com/Lochy2000/ai-component-builder)
- [Inspected tree](https://github.com/Lochy2000/ai-component-builder/tree/7eb0b0ce51a832fe7e5e33795b0f42195252b4f9)
- [Maintainer region evidence](https://github.com/Lochy2000)
- Commit: `7eb0b0ce51a832fe7e5e33795b0f42195252b4f9`
