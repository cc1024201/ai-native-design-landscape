# HomeBrain

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

HomeBrain is a local-first home-automation platform in which a visual graph and a bounded natural-language path control the same physical-device workflow.

## MongoDB holds the operational graph

A `Workflow` stores typed triggers, actions, nodes, and edges. Workflow Studio edits that graph directly; a linked Automation record supplies execution state rather than replacing the design with UI-only state.

## Language is normalized into bounded actions

`createAutomationFromText` interprets a request, normalizes it to supported trigger and action types, saves the workflow, and synchronizes the automation runtime. It does not pass arbitrary generated code to devices.

## Runtime safety is stateful

Execution records history, cancellation, cooldowns, false-to-true trigger edges, and device safety guards. A downloadable Codex skill exposes deployment and inspection to agents, but remains another interface to the same HomeBrain authority. Workflows are mutable; the source does not establish immutable version history.

## Pinned evidence

- Repository: [mefree2098/HomeBrainv2](https://github.com/mefree2098/HomeBrainv2)
- Inspected workflow model, Studio graph, text normalization, Automation synchronization, runtime history, cancellation, cooldowns, and safety checks: [`25af02ae57e64b59e0399e7a8e88ef1913263cf0`](https://github.com/mefree2098/HomeBrainv2/tree/25af02ae57e64b59e0399e7a8e88ef1913263cf0)
- Immutable revision: [commit `25af02a`](https://github.com/mefree2098/HomeBrainv2/commit/25af02ae57e64b59e0399e7a8e88ef1913263cf0)
