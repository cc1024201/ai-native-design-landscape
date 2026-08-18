# Opsiforce

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Opsiforce is a self-hosted, Kubernetes-native AI app-building control plane. Each project is a durable shell around isolated development and publication environments; an embedded agent mutates real source under `/workspace/app`, while the platform supplies preview routing, code and database surfaces, persistence, observability, and environment promotion.

## Agent and user share an environment-owned source tree

[`agent-config/agents/app-builder/agent.md`](https://github.com/SimaDevelopment/opsiforce/blob/eecd19ebe2b5ea7df56b94abd5be659115ab8c82/agent-config/agents/app-builder/agent.md) is the operative build contract. It tells the agent to install and edit in `/workspace/app`, use a Vite frontend and NestJS backend, persist application data in SQLite, type-check, boot the services, and walk the real user flow with a browser before declaring the app ready.

The project volume preserves source, Git history, agent session state, application databases, uploads, and IDE settings across pod replacement. A separate read-only SQLite observability database records requests, process output, and lifecycle events; it diagnoses the app but is not part of the generated app's data authority.

## Preview and production are distinct environments

Development hot-runs the app behind environment-specific runtime proxies. Publication uses Git to copy tracked source into Production or another target while retaining that environment's database and configuration. [`agent-config/agents/app-builder/migrations/20260608_production_publish_support/migrate.mjs`](https://github.com/SimaDevelopment/opsiforce/blob/eecd19ebe2b5ea7df56b94abd5be659115ab8c82/agent-config/agents/app-builder/migrations/20260608_production_publish_support/migrate.mjs) converts generated projects to production build/start scripts and a Vite preview binding; it is an idempotent migration of the generated app workspace.

## Platform scope

The open repository includes the NestJS control plane, Go runtime proxies, agent and skill configuration, Helm charts, migrations, and operational documentation. This permits source-level tracing across generation, runtime, persistence, and publication—not merely inference from a hosted UI.

## Evidence and location

- [Canonical repository](https://github.com/SimaDevelopment/opsiforce)
- [Inspected tree](https://github.com/SimaDevelopment/opsiforce/tree/eecd19ebe2b5ea7df56b94abd5be659115ab8c82)
- [Project/runtime contract](https://github.com/SimaDevelopment/opsiforce/blob/eecd19ebe2b5ea7df56b94abd5be659115ab8c82/README.md)
- [Runtime proxy values](https://github.com/SimaDevelopment/opsiforce/blob/eecd19ebe2b5ea7df56b94abd5be659115ab8c82/helm/opsiforce-runtime-proxies/values.yaml)
- Commit: `eecd19ebe2b5ea7df56b94abd5be659115ab8c82`

No reliable public location was found for the maintainer organization; team region remains unknown.
