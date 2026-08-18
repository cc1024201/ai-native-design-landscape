# AI-Powered UI Builder by kiryuchi10

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project is broader than a component prompt box: it models generation, validation, history, testing and export as services around persisted component records.

## Orchestration feeds a component record

[`ai_orchestrator.py`](https://github.com/kiryuchi10/ai-ui-builder/blob/4a7b76f10abfa97b76f96deaadf90be4d28b542b/backend/services/ai_orchestrator.py) chooses a model path and normalizes generated UI output. [`main.py`](https://github.com/kiryuchi10/ai-ui-builder/blob/4a7b76f10abfa97b76f96deaadf90be4d28b542b/backend/main.py) exposes generation beside history, validation, testing and export routes.

## Preview is one consumer among several

[`PreviewPanel.jsx`](https://github.com/kiryuchi10/ai-ui-builder/blob/4a7b76f10abfa97b76f96deaadf90be4d28b542b/frontend/src/components/PreviewPanel.jsx) renders the current code for ordinary-user inspection. [`history_service.py`](https://github.com/kiryuchi10/ai-ui-builder/blob/4a7b76f10abfa97b76f96deaadf90be4d28b542b/backend/services/history_service.py) retains prior records separately from the runtime projection.

Several advanced documents describe later ambitions; this dossier counts only the committed generation-to-preview and persistence paths. The lineage is active-transition because its last pinned implementation activity is from 2025.

## Source record

- [Canonical repository](https://github.com/kiryuchi10/ai-ui-builder)
- [Inspected commit](https://github.com/kiryuchi10/ai-ui-builder/commit/4a7b76f10abfa97b76f96deaadf90be4d28b542b)
- [Maintainer region evidence](https://github.com/kiryuchi10)
- Commit: `4a7b76f10abfa97b76f96deaadf90be4d28b542b`
