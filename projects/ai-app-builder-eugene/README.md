# AI App Builder by Eugene McMillian

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This compact builder makes one `projects.code` value the center of the product. Generation writes it asynchronously, chat refinement replaces it, Monaco can change the client copy, and preview, export and deployment all start from that project.

## The implemented model is a current-state register

Pinned revision: `54d7aae93c6bd82890319644fc7c7ebe490c3da5`.

The Supabase migration contains `projects` and `deployments`; there is no message or version table. Chat messages live in a Zustand session store and a refine request overwrites the saved code. The README's broader collaboration and analytics claims are not counted as implemented artifact authority.

## Preview and delivery branch from the same code

The project page exposes Monaco, a WebContainer preview, ZIP export and deployment actions. Deployment has its own record and URL, so a hosted copy can outlive later edits to the current project even though source history is absent.

## Pinned evidence

- [Repository](https://github.com/eugenemcmillian220-ui/Build-cash-cow)
- [Project and deployment schema](https://github.com/eugenemcmillian220-ui/Build-cash-cow/blob/54d7aae93c6bd82890319644fc7c7ebe490c3da5/supabase/migrations/001_initial_schema.sql)
- [Generation route](https://github.com/eugenemcmillian220-ui/Build-cash-cow/blob/54d7aae93c6bd82890319644fc7c7ebe490c3da5/src/app/api/projects/route.ts)
- [Refinement overwrite](https://github.com/eugenemcmillian220-ui/Build-cash-cow/blob/54d7aae93c6bd82890319644fc7c7ebe490c3da5/src/app/api/projects/%5Bid%5D/refine/route.ts)
- [Project workbench](https://github.com/eugenemcmillian220-ui/Build-cash-cow/blob/54d7aae93c6bd82890319644fc7c7ebe490c3da5/src/app/project/%5Bid%5D/page.tsx)
- [Export route](https://github.com/eugenemcmillian220-ui/Build-cash-cow/blob/54d7aae93c6bd82890319644fc7c7ebe490c3da5/src/app/api/export/route.ts)
