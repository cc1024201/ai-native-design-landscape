# Local Visual Agent Workflow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Local Visual Agent Workflow began as a browser-local folder-aware canvas and now also contains a runnable workflow-engine subproject. Those surfaces share a workflow shape but have different trust and persistence boundaries.

## Folder context stays on the user's machine

The standalone builder requests browser directory access, derives candidate agents from local file metadata and lets the user accept, rearrange or simulate the suggested graph. File contents are not uploaded by that surface.

## The engine turns connections into dataflow

[executor.js](https://github.com/Amiteshkch/Local-visual-agent-workflow/blob/e60a891b2914f6639d9f4b7c0cc5fcf19f32be5b/Workflow_builder/workflow-engine/engine/executor.js) topologically orders nodes, passes a parent result into its child and accumulates structured logs. Node adapters provide model, tool and integration behavior rather than asking one model to impersonate the whole diagram.

## Local persistence changes the authority ceiling

[sqlite.js](https://github.com/Amiteshkch/Local-visual-agent-workflow/blob/e60a891b2914f6639d9f4b7c0cc5fcf19f32be5b/Workflow_builder/workflow-engine/storage/sqlite.js) stores workflows, credentials and execution logs beneath a local application directory. It is a single-machine authority with no collaborative version graph.

## Pinned evidence

- [Repository](https://github.com/Amiteshkch/Local-visual-agent-workflow)
- [Inspected tree](https://github.com/Amiteshkch/Local-visual-agent-workflow/tree/e60a891b2914f6639d9f4b7c0cc5fcf19f32be5b)
- [Node catalogue](https://github.com/Amiteshkch/Local-visual-agent-workflow/blob/e60a891b2914f6639d9f4b7c0cc5fcf19f32be5b/Workflow_builder/workflow-engine/engine/nodes/index.js)
