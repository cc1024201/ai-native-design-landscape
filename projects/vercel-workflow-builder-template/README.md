# Vercel AI Workflow Builder Template

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Vercel's workflow-builder template is a deployable reference product in which a React Flow graph can be generated from natural language, edited directly, executed through Workflow DevKit, and materialized as TypeScript.

## One graph has three useful projections

The browser canvas stores triggers, actions, conditions, edges, schemas, and credentials. A code generator renders the same design with the `use workflow` directive. The Workflow DevKit executor then interprets the definition with durable step semantics. Visual, code, and runtime views are related but remain explicit.

## Natural language creates a draft

An OpenAI route converts a request into allowed node and edge structures. The result appears on the editable canvas, where issues can be inspected and parameters changed before execution. Generation does not bypass the workflow schema.

## Deployment is part of the template

PostgreSQL persists workflows and execution records; run logs expose step progress and failures. A downloadable definition and generated code let the owner leave the hosted UI, while provider plugins separate AI Gateway, fal, and external integrations from the core graph.

## Pinned evidence

- Repository: [vercel-labs/workflow-builder-template](https://github.com/vercel-labs/workflow-builder-template)
- Inspected canvas, schema, natural-language generation, codegen, Workflow DevKit, persistence, and logs tree: [`24fb0fd4524ee10491ea6b73f6df94137ecbf9e1`](https://github.com/vercel-labs/workflow-builder-template/tree/24fb0fd4524ee10491ea6b73f6df94137ecbf9e1)
- Immutable revision: [commit `24fb0fd`](https://github.com/vercel-labs/workflow-builder-template/commit/24fb0fd4524ee10491ea6b73f6df94137ecbf9e1)
