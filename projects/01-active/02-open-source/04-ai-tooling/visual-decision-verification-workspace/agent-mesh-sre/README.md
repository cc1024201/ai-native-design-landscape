# Agent Mesh on Streaming World

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agent Mesh on Streaming World is a conference companion product for designing and demonstrating self-healing Kafka agent meshes. Its builder artifact and its live-cluster demonstration are intentionally separated.

## A mesh design is portable client state

[builder-store.ts](https://github.com/aswinayyolath/agent-mesh-sre/blob/42020cc1ec7768f1b12e44ec117ba4b214e10605/src/lib/builder-store.ts) explicitly owns agents, topic edges and metadata in localStorage and exports the design as JSON. [BuilderCanvas.tsx](https://github.com/aswinayyolath/agent-mesh-sre/blob/42020cc1ec7768f1b12e44ec117ba4b214e10605/src/components/builder/BuilderCanvas.tsx) edits that object with React Flow.

## Deployment is a demonstration handoff

The deploy modal and Kubernetes manifests turn selected scenarios into a runnable Kafka demonstration. The source does not establish a general importer that provisions every arbitrary builder JSON. The map therefore treats the canvas as a coordination and explanation artifact, not the cluster's live control authority.

## One product despite two repositories

The later surajcsibm repository repeats the same conference story and derives its smaller source tree from this line. It is merged here rather than counted as a second team.

## Pinned evidence

- [Repository](https://github.com/aswinayyolath/agent-mesh-sre)
- [Inspected tree](https://github.com/aswinayyolath/agent-mesh-sre/tree/42020cc1ec7768f1b12e44ec117ba4b214e10605)
- [Deploy modal](https://github.com/aswinayyolath/agent-mesh-sre/blob/42020cc1ec7768f1b12e44ec117ba4b214e10605/src/components/builder/DeployModal.tsx)
