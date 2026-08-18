# LaunchLayer AI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

LaunchLayer AI is a SaaS starter whose production integrations remain incomplete but whose artifact core is implemented: generated website JSON is stored in relational project records, rendered into pages and snapshotted after chat-driven edits.

## Versions preserve the structured page

[`generate/route.ts`](https://github.com/lukaswilson707/launchlayer-ai/blob/d758f631401d680f7f5dfd69dd7d73be26c9db6c/app/api/ai/generate/route.ts) asks OpenAI for a bounded pages/sections structure and returns a deterministic fallback when the service is absent or invalid. The builder reads `contentJson`, displays the same sections through [`WebsiteRenderer.tsx`](https://github.com/lukaswilson707/launchlayer-ai/blob/d758f631401d680f7f5dfd69dd7d73be26c9db6c/components/WebsiteRenderer.tsx), and sends current sections plus an edit request back to the model.

```text
brief -> generated/fallback site JSON -> Prisma Website + Page
-> database renderer -> chat edit over current sections
-> Page update + immutable SiteVersion snapshot + message history
```

The [Prisma schema](https://github.com/lukaswilson707/launchlayer-ai/blob/d758f631401d680f7f5dfd69dd7d73be26c9db6c/prisma/schema.prisma) includes pages, versions, messages, domains, leads and analytics. The UI lists versions but does not implement restore, and the README explicitly leaves authentication, billing, DNS and publishing infrastructure for later. This record covers the working JSON/edit/snapshot nucleus only—not a finished hosted business.

No license file or reliable maintainer-region evidence was found.

## Sources

- [Pinned repository](https://github.com/lukaswilson707/launchlayer-ai/tree/d758f631401d680f7f5dfd69dd7d73be26c9db6c)
- [Builder edit action](https://github.com/lukaswilson707/launchlayer-ai/blob/d758f631401d680f7f5dfd69dd7d73be26c9db6c/app/app/builder/page.tsx)
- [Fallback site schema](https://github.com/lukaswilson707/launchlayer-ai/blob/d758f631401d680f7f5dfd69dd7d73be26c9db6c/lib/site-builder.ts)
