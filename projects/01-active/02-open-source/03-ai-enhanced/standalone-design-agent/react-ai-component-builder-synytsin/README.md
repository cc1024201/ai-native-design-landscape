# React AI Component Builder by Artem Synytsin

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

The product keeps provider credentials server-side while giving the browser a compact source-and-runtime authoring loop.

## Server action returns react-live source

[`generate.ts`](https://github.com/SynytsinA/react-ai-component-builder/blob/127e3e6c784531d6239f31f2b65b18c431f11945/src/app/actions/generate.ts) constrains Gemini to return a named component plus an explicit render call. [`PreviewArea.tsx`](https://github.com/SynytsinA/react-ai-component-builder/blob/127e3e6c784531d6239f31f2b65b18c431f11945/src/components/builder/PreviewArea.tsx) cleans that string and passes it to react-live with error reporting.

[`page.tsx`](https://github.com/SynytsinA/react-ai-component-builder/blob/127e3e6c784531d6239f31f2b65b18c431f11945/src/app/page.tsx) owns the current prompt, source, copy operation and code/preview mode. It does not establish persistent projects or historical variants.

## Source record

- [Canonical repository](https://github.com/SynytsinA/react-ai-component-builder)
- [Inspected commit](https://github.com/SynytsinA/react-ai-component-builder/commit/127e3e6c784531d6239f31f2b65b18c431f11945)
- [Maintainer region evidence](https://github.com/SynytsinA)
- Commit: `127e3e6c784531d6239f31f2b65b18c431f11945`
