# AI Workflow Builder by Upinder Kaur

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This is an ordered governed workflow product rather than a free-position canvas. Users compose typed steps and triggers then observe persistent run and approval state.

## The artifact is relational and ordered

[The workflow composer](https://github.com/upinder28/ai-workflow-builder/blob/919f0aeb30373e1ea0e3f0757bdf3fbd923f4643/src/app/workflows/new/page.tsx) creates drag-reorderable LLM HTTP conditional approval notification and database steps. GraphQL mutations persist workflows steps and triggers in Hasura tables with organization-scoped permissions.

## Execution consumes the same records

[The trigger route](https://github.com/upinder28/ai-workflow-builder/blob/919f0aeb30373e1ea0e3f0757bdf3fbd923f4643/src/app/api/trigger/route.ts) reloads ordered steps creates workflow and step-run records and makes real Groq or HTTP calls. An approval gate pauses the run; [the approval route](https://github.com/upinder28/ai-workflow-builder/blob/919f0aeb30373e1ea0e3f0757bdf3fbd923f4643/src/app/api/approve/route.ts) resumes from the following saved step.

## Governance is part of the design

Organization roles constrain editing triggers and high-impact step types. Quotas and per-step status make the governed sequence visible rather than treating execution as a single opaque request.

## Semantic limits

Conditions can skip later steps marked for the true branch but there is no arbitrary branching graph. Notification and database-write steps record synthetic success objects rather than producing the advertised external effects. Administrative server routes also rely on an admin secret and must be deployed behind the intended Hasura action boundary.

## Pinned evidence

- [Repository](https://github.com/upinder28/ai-workflow-builder)
- [Inspected tree](https://github.com/upinder28/ai-workflow-builder/tree/919f0aeb30373e1ea0e3f0757bdf3fbd923f4643)
- [Database migration](https://github.com/upinder28/ai-workflow-builder/blob/919f0aeb30373e1ea0e3f0757bdf3fbd923f4643/hasura/migrations/default/1_init/up.sql)
