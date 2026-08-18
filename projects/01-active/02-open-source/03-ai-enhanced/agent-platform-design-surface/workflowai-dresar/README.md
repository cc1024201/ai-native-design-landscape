# WorkflowAI by Dresar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WorkflowAI is an Indonesian planning workspace that turns a software idea into a coordinated implementation specification for a downstream coding agent.

## The canvas is a specification system

A guided interview and PRD feed generated flowcharts, user journeys, database models, technology choices, and task structures. These canvases coordinate product intent; they are not an automation graph that this application itself executes.

## The final artifact is an agent handoff

The workspace assembles the retained structures into a large JSON and Markdown implementation prompt. That package is designed for another coding agent, making delivery a filesystem specification rather than a deployed application.

## Persistence preserves planning context

Projects, canvas structures, generated documents, and provider settings are stored in the application database. Gemini and Groq can be selected and rotated, but the model does not become the durable source of truth after generation.

## Pinned evidence

- Repository: [dresar/workflowai](https://github.com/dresar/workflowai)
- Inspected interview and PRD flow, canvas structures, document generation, provider registry, database persistence, and final agent prompt: [`3e937f2cc97dea8128a72e88a9efa58c7c243a79`](https://github.com/dresar/workflowai/tree/3e937f2cc97dea8128a72e88a9efa58c7c243a79)
- Immutable revision: [commit `3e937f2`](https://github.com/dresar/workflowai/commit/3e937f2cc97dea8128a72e88a9efa58c7c243a79)
