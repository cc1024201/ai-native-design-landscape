# AI Website Builder by Vardhan V

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Vardhan's project is a conversational single-document builder. Full HTML is replaced on model turns while the browser owns the immediately editable working copy.

## Groq receives the accumulated conversation

[route.ts](https://github.com/vardhanv7/ai-website-builder/blob/d7f82aa7f1758dc324d5e9ca1a4398cc5dbe7165/app/api/generate/route.ts) streams Groq output under a system contract for complete HTML. Earlier messages are supplied again so a correction can be grounded in the conversation rather than treated as an unrelated one-shot generation.

## The page holds source and projection together

[page.tsx](https://github.com/vardhanv7/ai-website-builder/blob/d7f82aa7f1758dc324d5e9ca1a4398cc5dbe7165/app/page.tsx) keeps the current HTML in browser state and projects it through an iframe. Code editing copy and download all act on that same string.

## Authentication does not imply artifact durability

Supabase supports user authentication but the inspected source does not show a server-side project or version schema for generated HTML. Reload-safe history must therefore not be inferred from the presence of login infrastructure.

## Evidence

- [Canonical repository](https://github.com/vardhanv7/ai-website-builder)
- [Inspected tree](https://github.com/vardhanv7/ai-website-builder/tree/d7f82aa7f1758dc324d5e9ca1a4398cc5dbe7165)
- Commit: d7f82aa7f1758dc324d5e9ca1a4398cc5dbe7165
