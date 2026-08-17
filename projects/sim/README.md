# Sim

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Sim is a collaborative agent and workflow workspace in which the editable block graph remains the same object across visual authoring, conversational modification, execution, deployment and monitoring. This dossier follows that authority boundary rather than treating the large integration catalogue as the product.

## One graph crosses several authoring surfaces

The workspace UI includes React Flow-backed workflow components and stores block, connection and subflow state for a workflow. The public product contract also exposes visual, conversational and code-oriented construction. That makes the graph working product state rather than a diagram laid over a separate script.

[schema.ts](https://github.com/simstudioai/sim/blob/ce2dff3cbabc65bd034aff117a2adbf03f86fde3/packages/db/schema.ts) defines workflows and their persisted state alongside deployment, execution and collaboration records. [state/route.ts](https://github.com/simstudioai/sim/blob/ce2dff3cbabc65bd034aff117a2adbf03f86fde3/apps/sim/app/api/workflows/%5Bid%5D/state/route.ts) is the server boundary used to retrieve and update that state.

## Execution interprets the graph rather than prompting from a screenshot

The interactive run hook submits the current workflow to the execution API. [workflow-execution.ts](https://github.com/simstudioai/sim/blob/ce2dff3cbabc65bd034aff117a2adbf03f86fde3/apps/sim/background/workflow-execution.ts) reconstructs an execution in the background service, while the executor package operates blocks and connections. Scheduled, webhook and column executions enter the same workflow machinery through separate triggers.

This is graph-native runtime authority: connection and block semantics determine dispatch. It is not the weaker pattern in which a model merely receives a textual description of a canvas.

## Deployment freezes a recoverable version

The deploy route validates the current state and creates deployment-version records. Version APIs, rollback and revert routes distinguish editable head state from an activated deployment. Monitoring and logs attach to executions of those versions, so deployment is not only a share-link flag.

## Identity correction

The search result at aiaugments-collab/ai-workflow-builder contains Sim's monorepo structure, package names and implementation while relabeling its README. It is recorded as a copied mirror, not a second product or team.

## Pinned evidence

- [Canonical repository](https://github.com/simstudioai/sim)
- [Inspected tree](https://github.com/simstudioai/sim/tree/ce2dff3cbabc65bd034aff117a2adbf03f86fde3)
- [Workflow execution API](https://github.com/simstudioai/sim/blob/ce2dff3cbabc65bd034aff117a2adbf03f86fde3/apps/sim/app/api/workflows/%5Bid%5D/execute/route.ts)
