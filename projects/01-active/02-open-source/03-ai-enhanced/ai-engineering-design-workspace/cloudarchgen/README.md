# CloudArchGen

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CloudArchGen is a full-stack cloud architecture workspace. It combines natural-language generation, a React Flow topology editor, analysis suggestions, Terraform import, and persisted user diagrams.

## A provider-neutral graph is the work surface

The backend turns prompts into structured cloud components and relationships for AWS, Azure, or GCP. The frontend materializes them as editable nodes and edges. Dragging or changing the graph therefore remains possible after generation; the first model response is not the final artifact.

## Import and advice run in opposite directions

Terraform import can seed a design from infrastructure description, while AI analysis can propose improvements to the current graph. These are different evidence paths: import grounds the model in declared infrastructure; suggestions remain hypotheses that the user must assess for cost, security, and operability.

## Persistence is not deployment

FastAPI, SQLAlchemy, PostgreSQL, authentication, and diagram management establish durable projects. Exported diagrams and suggested architecture do not apply cloud changes. The source demonstrates a design system boundary, not an infrastructure execution engine.

## Pinned evidence

- Repository: [jaideepp247/CloudArch](https://github.com/jaideepp247/CloudArch)
- Inspected full-stack source: [`6b51cadfa16e044379bf08a5b4c6be49f737c47a`](https://github.com/jaideepp247/CloudArch/tree/6b51cadfa16e044379bf08a5b4c6be49f737c47a)
- Immutable revision: [commit `6b51cad`](https://github.com/jaideepp247/CloudArch/commit/6b51cadfa16e044379bf08a5b4c6be49f737c47a)
