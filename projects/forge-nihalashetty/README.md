# Forge by Nihal A. Shetty

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Forge is a self-hosted agent and workflow platform where one schema catalogue drives visual authoring, validation and runtime compilation. That three-consumer contract is more decisive than the breadth of its feature list.

## One schema crosses editor and engine

[workflow.json](https://github.com/nihalashetty/Forge/blob/f311f29b429c97adb3b2c51e306ef03494843d85/packages/schemas/forge/workflow.json) and the node schemas define the portable graph contract. The web console uses them to build configuration forms, backend services reject invalid artifacts, and the compiler turns accepted graphs into LangGraph execution. Typed edges, state schema and node-specific configuration are therefore not duplicated UI conventions.

## Authoring has both direct and delegated entry points

The React Flow workspace supports agents, model calls, tools, retrieval, classifiers, routers, loops, parallel joins, subworkflows, triggers and human pauses. An in-product assistant can draft and run a workflow, while the user can inspect “what the model sees,” edit the graph and test it before publication.

## Versions, evaluations and traces close the loop

[versions.py](https://github.com/nihalashetty/Forge/blob/f311f29b429c97adb3b2c51e306ef03494843d85/apps/api/forge/services/versions.py) snapshots entity changes; evaluations score datasets against workflow outputs; the tracing service records nested agent, model and tool spans with tokens, latency and cost. This turns correction and governance into product operations on the same artifact.

## Delivery is a projection of the workflow

The runtime can expose a saved workflow through the run API, MCP, email or a web widget, with projects, roles, encrypted secret references, budgets and egress policy surrounding execution. The documented connector marketplace remains planned and is not counted as shipped.

## Pinned evidence

- [Repository](https://github.com/nihalashetty/Forge)
- [Inspected tree](https://github.com/nihalashetty/Forge/tree/f311f29b429c97adb3b2c51e306ef03494843d85)
- [Runtime service](https://github.com/nihalashetty/Forge/blob/f311f29b429c97adb3b2c51e306ef03494843d85/apps/api/forge/services/runtime.py)
- [Workflow screen](https://github.com/nihalashetty/Forge/blob/f311f29b429c97adb3b2c51e306ef03494843d85/apps/web/components/screens/workflows.tsx)
