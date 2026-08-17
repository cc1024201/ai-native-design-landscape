# UIGen by Arshan Nawaz

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UIGen represents the artifact as a generated React project tree rather than a single opaque screenshot. Its unusual limitation is equally important: the saved source can contain React behavior that the built-in preview intentionally removes.

## Conversation rewrites the current project

[`generate/route.ts`](https://github.com/arshan-01/next-gen-ui-builder/blob/a17a93d1e0136851d870a565dfee03d8bcc0b3a3/app/api/generate/route.ts) asks Gemini for React and TypeScript source. [`chat/route.ts`](https://github.com/arshan-01/next-gen-ui-builder/blob/a17a93d1e0136851d870a565dfee03d8bcc0b3a3/app/api/chat/route.ts) distinguishes a modification request from a fresh request and supplies the current main component plus conversation history, so follow-up intent returns to the source-bearing project rather than merely annotating a preview.

## The preview is a lossy projection

[`preview-frame.tsx`](https://github.com/arshan-01/next-gen-ui-builder/blob/a17a93d1e0136851d870a565dfee03d8bcc0b3a3/components/preview-frame.tsx) extracts JSX heuristically, removes event handlers and unresolved expressions, converts attributes and places the remaining HTML in a Tailwind iframe. [`page.tsx`](https://github.com/arshan-01/next-gen-ui-builder/blob/a17a93d1e0136851d870a565dfee03d8bcc0b3a3/app/page.tsx) keeps project and chat state in the browser and downloads the full project tree as JSON. The portable tree is therefore more authoritative than the static preview, and no durable server-side project history is evidenced.

## Evidence

- [Canonical repository](https://github.com/arshan-01/next-gen-ui-builder)
- [Inspected tree](https://github.com/arshan-01/next-gen-ui-builder/tree/a17a93d1e0136851d870a565dfee03d8bcc0b3a3)
- Commit: `a17a93d1e0136851d870a565dfee03d8bcc0b3a3`
