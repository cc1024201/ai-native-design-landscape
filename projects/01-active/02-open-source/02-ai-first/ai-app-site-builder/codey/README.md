# Codey

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Codey is a multi-model conversational site builder whose agent edits a running Next.js project inside an E2B sandbox. The durable application record stores prompts assistant responses file snapshots and the sandbox preview endpoint.

## An agent network owns mutation

[`functions.ts`](https://github.com/HamzaAmir97/saas_ai_website_builder/blob/e9adfabba45b1552ba0775b2993280b82a886287/src/inngest/functions.ts) creates typed terminal file-write and file-read tools and exposes them to an Inngest Agent Kit network. OpenAI Anthropic and Gemini agents are defined but the active router selects the Gemini code agent in the pinned revision. A task ends only after the model emits the prescribed summary and the state contains generated files.

## The sandbox is execution authority; the database is recovery authority

Each run starts an E2B sandbox from a known template. Tool calls write its filesystem and the live server becomes an iframe URL. The final [`Fragment` record](https://github.com/HamzaAmir97/saas_ai_website_builder/blob/e9adfabba45b1552ba0775b2993280b82a886287/prisma/schema.prisma) stores that URL and a JSON file snapshot alongside the assistant message. Subsequent prompts load project history but start a new sandbox so the persisted fragment is the durable handoff between executions.

## Preview is explicit but not target-mapped

[`fragmentweb.tsx`](https://github.com/HamzaAmir97/saas_ai_website_builder/blob/e9adfabba45b1552ba0775b2993280b82a886287/src/modules/projects/server/ui/components/fragmentweb.tsx) renders the current sandbox in an isolated iframe and exposes refresh copy-link and open-in-new-tab actions. Correction returns through conversation; the source contains no element picker or DOM-to-file mapping.

## Persistence has a linear revision shape

Projects own ordered messages and each successful assistant message may own one fragment. This preserves generated file snapshots across the conversation but does not expose branches rollback or Git history.

## Pinned evidence

- [Repository](https://github.com/HamzaAmir97/saas_ai_website_builder)
- [Inspected tree](https://github.com/HamzaAmir97/saas_ai_website_builder/tree/e9adfabba45b1552ba0775b2993280b82a886287)
- [Maintainer profile locating the lineage in Yemen](https://github.com/HamzaAmir97)
- Commit: `e9adfabba45b1552ba0775b2993280b82a886287`
