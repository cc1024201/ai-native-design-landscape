# inLUMEN

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

inLUMEN is a visual data-pipeline editor in which an agent can inspect and modify the same graph visible on the canvas. Its strongest design decision is a post-agent guardrail that verifies a claimed change actually persisted into graph state.

## Visible canvas and backend graph are reconciled

At commit [`e39aae5`](https://github.com/DATAPACT/inLUMEN/tree/e39aae5fddc69891214d5489a920f9452d8e4e5a) the React flow model is persisted through a backend graph service and exposed to the agent as both the current visible snapshot and backend snapshot. If a mutation-like request returns without a graph delta the runtime can issue a repair task and recheck persistence.

[`analytics_api.py`](https://github.com/DATAPACT/inLUMEN/blob/e39aae5fddc69891214d5489a920f9452d8e4e5a/backend/analytics_api.py) also generates Dockerfiles YAML Dagster assets and deployment bundles. Artifact contracts provenance reports and a separate validation service keep generated deployment material tied to its pipeline version.

```text
canvas snapshot -> agent team -> graph mutations -> Neo4j/version save
       |                                  |
       +------- post-run sync guard ------+
                         -> deployment artifacts + provenance
```

This is not a generic AI workflow canvas: the durable design is a deployable data pipeline. Public first-party material did not establish the distributed DATAPACT team's region so it remains unknown.

## Evidence

- [Flow graph model](https://github.com/DATAPACT/inLUMEN/blob/e39aae5fddc69891214d5489a920f9452d8e4e5a/frontend/src/features/flow/flowGraph.ts)
- [Artifact contract](https://github.com/DATAPACT/inLUMEN/blob/e39aae5fddc69891214d5489a920f9452d8e4e5a/backend/artifact_contract.py)
- [Versions panel](https://github.com/DATAPACT/inLUMEN/blob/e39aae5fddc69891214d5489a920f9452d8e4e5a/frontend/src/components/versions/VersionsPanel.tsx)
