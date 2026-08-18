# sandboxd

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

sandboxd defines AI app building as an agent working inside an isolated, inspectable source workspace. The console exposes files and a live routed service; snapshots freeze that workspace so it can be reused or forked without turning a screenshot into the artifact.

## The workspace, not the chat, owns the app

[`control-plane/internal/agentprompt/prompt.md`](https://github.com/tastyeffectco/sandboxd/blob/afa75bc43617c76251acc1e26bae721602c3cc6f/control-plane/internal/agentprompt/prompt.md) tells the agent to create and run the application in the sandbox and bind it for the platform's public preview routing. [`console/src/CodeEditor.tsx`](https://github.com/tastyeffectco/sandboxd/blob/afa75bc43617c76251acc1e26bae721602c3cc6f/console/src/CodeEditor.tsx) gives the user direct source inspection and editing rather than a prompt-only correction channel.

## Snapshots preserve reusable source state

[`control-plane/internal/store/snapshots.go`](https://github.com/tastyeffectco/sandboxd/blob/afa75bc43617c76251acc1e26bae721602c3cc6f/control-plane/internal/store/snapshots.go) persists tenant-scoped snapshot records captured from apps. The surrounding snapshot path freezes workspace images for later reuse and forks. This is environment-level lineage: a snapshot represents a source/runtime workspace, not merely a named UI revision.

## Publication boundary

The console contains [`DeployModal.tsx`](https://github.com/tastyeffectco/sandboxd/blob/afa75bc43617c76251acc1e26bae721602c3cc6f/console/src/DeployModal.tsx), but that component explicitly says the deployment backend is not wired and presents one-click deployment as forthcoming. The current repository proves public preview routing, editable source, and snapshots; it does **not** prove a completed production-publish workflow.

## Evidence and location

- [Canonical repository](https://github.com/tastyeffectco/sandboxd)
- [Inspected tree](https://github.com/tastyeffectco/sandboxd/tree/afa75bc43617c76251acc1e26bae721602c3cc6f)
- Commit: `afa75bc43617c76251acc1e26bae721602c3cc6f`

The maintainer organization's [GitHub profile](https://github.com/tastyeffectco) states Switzerland; team region is recorded as Switzerland.
