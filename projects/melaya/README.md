# Melaya

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Melaya presents Agent Builder as a hosted visual surface for composing model-backed pipelines with scoped tools, knowledge, evaluations, schedules, cost ceilings and approvals. The public repository contains official documentation and nine SDKs, but explicitly excludes the proprietary visual application and runtime; this dossier therefore records contractual architecture, not inspected implementation internals.

## Public artifact model

[the Agent Builder contract](https://github.com/melaya-labs/melaya/blob/0c3cce40e5eec4e35eb5cddc142037eee14b5265/docs/agent-builder.md) defines a pipeline by tenant-scoped identity, agents, model selection, tools, sequential/parallel/conditional/loop steps, memory, execution target and cost limits. `humanApprovalTools` turns consequential actions into review gates rather than prompt conventions.

## Creation can begin with delegation

The SDK exposes `buildWithAI()` for drafting a pipeline from a natural-language brief and `instantiateTemplate()` for controlled reuse. The documented workflow requires reviewing the returned configuration, reducing tool scope, selecting connectors, applying limits and testing before save—AI proposes the artifact while the user retains authority over it.

## Runtime and observability are API-visible

[pipelines.ts](https://github.com/melaya-labs/melaya/blob/0c3cce40e5eec4e35eb5cddc142037eee14b5265/packages/sdk/src/pipelines.ts) exposes CRUD, cloud or local-runner execution, run IDs, status, cancellation, outputs, traces, schedules and cost views. Credentials are references resolved through Connectors and are rejected when embedded inline in pipeline configuration.

## Evidence ceiling

The SDK establishes a coherent artifact lifecycle, but cannot prove the internal visual graph model, scheduler, persistence schema or claimed production behavior. Those remain architecture-level claims until first-party runtime source or directly inspectable product evidence is available.

## Pinned evidence

- [Repository](https://github.com/melaya-labs/melaya)
- [Inspected tree](https://github.com/melaya-labs/melaya/tree/0c3cce40e5eec4e35eb5cddc142037eee14b5265)
- [Human-in-the-loop SDK](https://github.com/melaya-labs/melaya/blob/0c3cce40e5eec4e35eb5cddc142037eee14b5265/packages/sdk/src/hitl.ts)
