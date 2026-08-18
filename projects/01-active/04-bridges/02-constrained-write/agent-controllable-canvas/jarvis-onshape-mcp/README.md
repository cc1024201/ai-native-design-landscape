# Jarvis Onshape MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Jarvis Onshape MCP is an acknowledged derivative of `hedless/onshape-mcp`, but it is retained as a distinct product because its divergence changes the agent's verification model rather than merely renaming the server.

## Mutations must return observable truth

Jarvis adds render endpoints, sketch inspection and editing, FeatureScript operations and [`geometry_diff.py`](https://github.com/ReshefElisha/jarvis-onshape-mcp/blob/b0e725852280ebcfda5d46a4f2ed2d0b720beace/onshape_mcp/api/geometry_diff.py). Its vision-decompose skill asks the agent to reason across multiple views, while mutations return resulting measurements or entity state. That design reduces the gap between “API accepted the call” and “the requested geometry exists.”

```text
intent + reference image -> decomposition -> Onshape feature mutations
-> multi-view render + measurements + geometric diff -> revise or export
```

The underlying document is still Onshape authority. Jarvis is counted separately because the maintained truth-and-vision layer creates a different ordinary agent workflow. The maintainer reports the Bay Area in the United States.

## Evidence

- [Pinned fork and divergence statement](https://github.com/ReshefElisha/jarvis-onshape-mcp/tree/b0e725852280ebcfda5d46a4f2ed2d0b720beace)
- [Geometry diff](https://github.com/ReshefElisha/jarvis-onshape-mcp/blob/b0e725852280ebcfda5d46a4f2ed2d0b720beace/onshape_mcp/api/geometry_diff.py)
- [Rendering API](https://github.com/ReshefElisha/jarvis-onshape-mcp/blob/b0e725852280ebcfda5d46a4f2ed2d0b720beace/onshape_mcp/api/rendering.py)
- [Maintainer location evidence](https://github.com/ReshefElisha)
