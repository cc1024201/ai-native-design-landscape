# Brainfuel Agent Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Brainfuel Agent Builder is a native macOS workflow canvas. Its defining technical direction is local structured authority: SwiftData stores the graph, native services execute it and provider credentials stay in Keychain.

## The graph has domain and persistence models

[GraphDocument.swift](https://github.com/brainfuel/agent-builder/blob/264c14df0e9a5a83b612f9863f85a5ffafac3da8/Agentic/Models/Persistence/GraphDocument.swift) is the saved counterpart to typed domain nodes and edges. [GraphPersistenceService.swift](https://github.com/brainfuel/agent-builder/blob/264c14df0e9a5a83b612f9863f85a5ffafac3da8/Agentic/Services/Persistence/GraphPersistenceService.swift) commits editor changes through SwiftData rather than flattening the canvas into an image.

## Coordination follows graph structure

[CoordinatorOrchestrator.swift](https://github.com/brainfuel/agent-builder/blob/264c14df0e9a5a83b612f9863f85a5ffafac3da8/Agentic/Services/Execution/CoordinatorOrchestrator.swift) selects a root, traverses graph edges, constructs typed handoff packets and records a coordinator run. Provider and tool services handle live LLM and MCP calls.

## Inspection is part of authoring

The canvas, schema controls and execution view expose node contracts and live traces. This makes the product closer to a local agent IDE than a hosted no-code SaaS. There is no evidence of collaborative server versions or shared deployment.

## Pinned evidence

- [Repository](https://github.com/brainfuel/agent-builder)
- [Inspected tree](https://github.com/brainfuel/agent-builder/tree/264c14df0e9a5a83b612f9863f85a5ffafac3da8)
- [Live provider execution](https://github.com/brainfuel/agent-builder/blob/264c14df0e9a5a83b612f9863f85a5ffafac3da8/Agentic/Services/Execution/LiveProviderExecutionService.swift)
