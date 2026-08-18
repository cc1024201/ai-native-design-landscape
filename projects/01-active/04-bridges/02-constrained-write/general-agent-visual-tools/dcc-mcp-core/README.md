# DCC-MCP Core

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Core is the ecosystem's independently released creative-tool control plane. It does not define a universal scene model and it is not an AI agent. It makes separately owned DCC sessions, Skills and production systems discoverable and operable through one bounded contract.

## The control plane keeps artifact authority outside itself

The gateway indexes live instances and progressively exposes search, describe, load and call operations. Host adapters keep native scene semantics; Core owns routing, main-thread affinity metadata, async jobs, cancellation, workflow checkpoints, artifacts, audit and policy. The [gateway capability index](https://github.com/dcc-mcp/dcc-mcp-core/blob/810aafdb0abf037b8fd0638401e3345e895b208f/crates/dcc-mcp-gateway-core/src/capability/index.rs) is therefore an operational catalog rather than a merged super-schema.

## Admin UI closes an engineering feedback loop

The Admin surface brings calls, traces, logs, health, statistics and artifacts into one inspectable workspace. [`artifacts.rs`](https://github.com/dcc-mcp/dcc-mcp-core/blob/810aafdb0abf037b8fd0638401e3345e895b208f/crates/dcc-mcp-gateway/src/gateway/admin/artifacts.rs) exposes produced evidence; agent traces and analytics let teams improve tool descriptions or schemas against real usage. That observability and marketplace delivery make Core a product rather than merely a shared library.

Core explicitly cannot guarantee rollback for arbitrary host APIs or define one lossless cross-DCC mesh/rig/material model. Those limits preserve the distinction between control state and creative truth.

## Evidence

- [Pinned control plane](https://github.com/dcc-mcp/dcc-mcp-core/tree/810aafdb0abf037b8fd0638401e3345e895b208f)
- [Gateway policy](https://github.com/dcc-mcp/dcc-mcp-core/blob/810aafdb0abf037b8fd0638401e3345e895b208f/crates/dcc-mcp-gateway-core/src/policy.rs)
- [First-party architecture overview](https://github.com/dcc-mcp/dcc-mcp-core/blob/810aafdb0abf037b8fd0638401e3345e895b208f/README.md)
