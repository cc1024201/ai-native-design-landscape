# Froglips

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Froglips is a native macOS local-LLM workstation whose Flows surface combines visual multi-agent authoring with in-process inference. Its decisive distinction is that the graph, scheduler, run history and model backend ship inside one Tauri application.

## Cards are typed operational units

[WorkflowCanvas.tsx](https://github.com/Jeritano/FrogLips/blob/9cf21b7c848c6c35b1654f085ea38b1ef37b835b/src/components/workflows/WorkflowCanvas.tsx) lets users place and connect agent cards. Each card carries model, role, prompt, tool allowlist and unattended-approval policy; specialized handlers add routing, parallel, critic, mixture and shared-blackboard semantics beyond a linear chain.

## The runner uses the authored graph

[runner.ts](https://github.com/Jeritano/FrogLips/blob/9cf21b7c848c6c35b1654f085ea38b1ef37b835b/src/lib/workflow/runner.ts) resolves graph order and dispatches card handlers into the same agent loop used elsewhere in the app. The embedded [mistralrs backend](https://github.com/Jeritano/FrogLips/blob/9cf21b7c848c6c35b1654f085ea38b1ef37b835b/src-tauri/src/native_inference/mistralrs_backend.rs) keeps local model execution in process rather than requiring an external daemon.

## SQLite holds workflows and bounded history

[workflows.rs](https://github.com/Jeritano/FrogLips/blob/9cf21b7c848c6c35b1654f085ea38b1ef37b835b/src-tauri/src/workflows.rs) validates and saves graph JSON, records and prunes run results, caches schedules and drives an app-lifetime scheduler. Manual and unattended runs therefore share one recoverable machine-local authority.

## Product boundary

Chat, Table, Knowledge and model management are adjacent Froglips surfaces. This record focuses on Flows because that is where visual coordination becomes executable and persisted.

## Pinned evidence

- [Repository](https://github.com/Jeritano/FrogLips)
- [Inspected tree](https://github.com/Jeritano/FrogLips/tree/9cf21b7c848c6c35b1654f085ea38b1ef37b835b)
- [Graph helpers](https://github.com/Jeritano/FrogLips/blob/9cf21b7c848c6c35b1654f085ea38b1ef37b835b/src/lib/workflow/graph.ts)
