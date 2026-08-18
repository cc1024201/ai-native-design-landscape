# comfyui-mcp

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

comfyui-mcp is a local-first control plane rather than a prompt relay. Its agent can inspect the node vocabulary of a running ComfyUI installation, author and edit a workflow graph, execute it, diagnose failures and continue the same session from the sidebar. The live ComfyUI workflow remains the visual authority.

## The target guard is part of the artifact model

[`workflow-target-store.ts`](https://github.com/artokun/comfyui-mcp/blob/ed774fbe8788045c3005a6ed5927ce2727021655/src/services/workflow-target-store.ts) records a workflow target per panel tab and injects the pinned path into graph mutations. If the user changes the active canvas, the bridge fails closed instead of editing whichever graph happens to be visible. This is a material distinction from MCP servers that only submit an opaque prompt.

[`workflow-executor.ts`](https://github.com/artokun/comfyui-mcp/blob/ed774fbe8788045c3005a6ed5927ce2727021655/src/services/workflow-executor.ts) validates and queues structured workflow JSON, preserves explicit seeds, embeds a UI-format graph in output metadata and hands the exact post-randomization graph to the job watcher. [`node-snapshots.ts`](https://github.com/artokun/comfyui-mcp/blob/ed774fbe8788045c3005a6ed5927ce2727021655/src/services/node-snapshots.ts) separately snapshots the installed node environment for recoverable infrastructure changes.

## Agent and human share one visible graph

The bundled panel orchestrator binds long-lived agent sessions to workflow identity and correlates completion events with the exact run that queued them. Saving remains explicit: [`save-warning.mjs`](https://github.com/artokun/comfyui-mcp/blob/ed774fbe8788045c3005a6ed5927ce2727021655/plugin/hooks/save-warning.mjs) warns before a restart can discard unsaved canvas changes. Generated media is evidence of a run; the editable graph and its saved workflow file are the reusable design artifact.

## Evidence

- [Pinned repository](https://github.com/artokun/comfyui-mcp/tree/ed774fbe8788045c3005a6ed5927ce2727021655)
- [Workflow authoring service](https://github.com/artokun/comfyui-mcp/blob/ed774fbe8788045c3005a6ed5927ce2727021655/src/services/workflow-composer.ts)
- [Panel agent implementation](https://github.com/artokun/comfyui-mcp/blob/ed774fbe8788045c3005a6ed5927ce2727021655/src/orchestrator/panel-agent.ts)
