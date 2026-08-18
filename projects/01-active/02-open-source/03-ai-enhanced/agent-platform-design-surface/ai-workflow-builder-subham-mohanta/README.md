# AI Workflow Builder by Subham Mohanta

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project is a multi-tenant ordered workflow console centered on approval and run monitoring. The visual artifact is a configurable pipeline of typed step cards backed by Hasura records, not a free-positioned graph.

## The pipeline edits durable step records

[useWorkflowEngine.ts](https://github.com/SubhamMohanta/ai-workflow-builder/blob/4f7d693122f5da25c0aa2d2686d1f9446a56272c/frontend/src/lib/useWorkflowEngine.ts) loads organization-scoped workflows and their ordered steps, then creates, updates, runs and polls them through authenticated routes. Configuration panels expose model, prompt, HTTP, approval, notification and database fields.

## A real model participates in the server run

[workflowEngine.ts](https://github.com/SubhamMohanta/ai-workflow-builder/blob/4f7d693122f5da25c0aa2d2686d1f9446a56272c/frontend/src/lib/server/workflowEngine.ts) reloads the saved sequence, calls Gemini for the LLM step, records every step result and pauses at approval gates. Trigger and resume routes check organization membership before invoking that engine.

## Governance is more complete than execution semantics

The source implements tenant checks, role-restricted step types, persistent runs and approval resume. It therefore establishes a real governed workflow artifact even though several action types remain prototypes.

## Prototype ceiling

The Gemini node ignores the user's saved model and prompts and instead sends a hard-coded production-outage classification test. HTTP, notification and database steps return simulated result objects rather than performing their advertised side effects. Conditional handling only skips a fixed set of following step types. These limitations make the current runtime transitional rather than a general automation engine.

## Pinned evidence

- [Repository](https://github.com/SubhamMohanta/ai-workflow-builder)
- [Inspected tree](https://github.com/SubhamMohanta/ai-workflow-builder/tree/4f7d693122f5da25c0aa2d2686d1f9446a56272c)
- [Run trigger](https://github.com/SubhamMohanta/ai-workflow-builder/blob/4f7d693122f5da25c0aa2d2686d1f9446a56272c/frontend/src/app/api/triggerWorkflowRun/route.ts)
