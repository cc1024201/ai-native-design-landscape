# ADK Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ADK Studio is the standalone visual product extracted from ADK Rust. It uses one project graph as the input to interactive execution and Rust source generation so the canvas is both runnable specification and code-producing authority.

## Project JSON spans agents actions and triggers

[`project.rs`](https://github.com/zavora-ai/adk-studio/blob/0b2aa2e9eb64381a9e1708e5b4109c757ec03982/src/schema/project.rs) composes workflow metadata agents tools and deployment settings. The canvas supports LLM sequential parallel loop and router agents together with deterministic HTTP set transform switch merge wait code and database actions. Webhook schedule and event triggers connect the saved project to runtime entry points.

Projects can be held in application state or written beneath `.adk-studio/projects`; the artifact is explicit JSON rather than only browser layout.

## The same graph runs live

[`graph_runner.rs`](https://github.com/zavora-ai/adk-studio/blob/0b2aa2e9eb64381a9e1708e5b4109c757ec03982/src/server/graph_runner.rs) interprets graph structure and emits versioned server-sent events. The UI execution hook maps those events back to nodes so a user can inspect progress errors and outputs against the authored topology.

## The same graph generates Rust

Code generation turns project nodes connections tools and orchestration patterns into a Rust agent project. Studio can compile build run and target deployment from that materialization. This is not merely an export of canvas JSON: it creates a second executable representation whose source can be inspected outside the editor.

## Round-trip boundary

Graph-to-code is implemented but arbitrary edits to generated Rust are not shown being parsed back into the canvas. Project JSON remains the forward authoring authority. External services credentials and deploy targets still determine whether a generated project succeeds in a real environment.

## Source evidence

- [Repository](https://github.com/zavora-ai/adk-studio)
- [Pinned tree](https://github.com/zavora-ai/adk-studio/tree/0b2aa2e9eb64381a9e1708e5b4109c757ec03982)
- [Workflow schema](https://github.com/zavora-ai/adk-studio/blob/0b2aa2e9eb64381a9e1708e5b4109c757ec03982/src/schema/workflow.rs)
