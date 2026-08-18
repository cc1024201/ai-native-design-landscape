# NextFlow AI Workflow Builder by Aman Kaliramna

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This NextFlow implementation is a React Flow and Gemini prototype with a more explicit persistence and run history model than its similar name suggests.

## Undo state and saved state are different

[useWorkflowStore.ts](https://github.com/ak-jaat-007/Nextflow-AI-Workflow_builder/blob/3a7b3102e09b7515bbc964e2cf2909891752c9ed/src/store/useWorkflowStore.ts) keeps nodes, edges and past/future snapshots for interactive undo and redo. Those browser snapshots are editing affordances, not durable versions.

## A run first commits the graph

[run-workflow/route.ts](https://github.com/ak-jaat-007/Nextflow-AI-Workflow_builder/blob/3a7b3102e09b7515bbc964e2cf2909891752c9ed/src/app/api/run-workflow/route.ts) scopes a workflow to the authenticated user, creates or updates its graph and then executes supported nodes. [schema.prisma](https://github.com/ak-jaat-007/Nextflow-AI-Workflow_builder/blob/3a7b3102e09b7515bbc964e2cf2909891752c9ed/prisma/schema.prisma) separates Workflow, Run and NodeRun records.

## Technical ceiling

The implemented runtime supports the small supplied palette and Gemini node, with stored per-node inputs and outputs. Trigger.dev is part of the stated stack, but the inspected authority is the application route and Prisma records rather than a general external scheduler.

## Pinned evidence

- [Repository](https://github.com/ak-jaat-007/Nextflow-AI-Workflow_builder)
- [Inspected tree](https://github.com/ak-jaat-007/Nextflow-AI-Workflow_builder/tree/3a7b3102e09b7515bbc964e2cf2909891752c9ed)
- [Canvas](https://github.com/ak-jaat-007/Nextflow-AI-Workflow_builder/blob/3a7b3102e09b7515bbc964e2cf2909891752c9ed/src/components/canvas/FlowCanvas.tsx)
