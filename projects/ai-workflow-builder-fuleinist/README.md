# ai-workflow-builder (fuleinist)

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project treats a visual DAG as an intermediate representation for generated source code. The decisive architecture is not direct node execution: validate the graph, materialize Python or TypeScript, then run the generated program.

## The editable authority is ephemeral

[dag-store.ts](https://github.com/fuleinist/ai-workflow-builder/blob/3b727e593cfe3cce795fb6f6b241a7ef1be2934a/src/store/dag-store.ts) holds nodes, edges and parameters in a client Zustand store. The inspected source provides export and run operations but no durable project repository; reload persistence and collaboration are therefore absent.

## Validation guards promotion

The shared [DAG schema](https://github.com/fuleinist/ai-workflow-builder/blob/3b727e593cfe3cce795fb6f6b241a7ef1be2934a/src/dag-schema.ts) checks graph shape before promotion. Exporters then translate supported nodes into LangChain/OpenAI Python or AI SDK/OpenAI TypeScript.

## Run means generated code in a child process

The [run route](https://github.com/fuleinist/ai-workflow-builder/blob/3b727e593cfe3cce795fb6f6b241a7ef1be2934a/src/app/api/run/route.ts) validates the submitted DAG, writes generated source to a temporary directory, spawns Python or `tsx`, and streams captured output into an in-memory run record. The [export route](https://github.com/fuleinist/ai-workflow-builder/blob/3b727e593cfe3cce795fb6f6b241a7ef1be2934a/src/app/api/export/route.ts) exposes that materialization boundary directly.

## Product significance

This is a compact example of design-code translation where source is the executable delivery artifact. Its ceiling is durability and isolation, not whether the canvas controls execution.

## Pinned evidence

- [Repository](https://github.com/fuleinist/ai-workflow-builder)
- [Inspected tree](https://github.com/fuleinist/ai-workflow-builder/tree/3b727e593cfe3cce795fb6f6b241a7ef1be2934a)
- [Python exporter](https://github.com/fuleinist/ai-workflow-builder/blob/3b727e593cfe3cce795fb6f6b241a7ef1be2934a/src/core/exporters/python.ts)
