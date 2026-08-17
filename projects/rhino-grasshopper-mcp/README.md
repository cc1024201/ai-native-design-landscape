# Rhino Grasshopper MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Rhino Grasshopper MCP gives an external agent structured control of a live Grasshopper definition inside Rhino. Unlike a text-to-mesh generator, the project keeps the host's component graph, parameters and solution behavior as the engineering artifact.

## Grasshopper remains the document authority

The MCP-side [`bridge.py`](https://github.com/dongwoosuk/rhino-grasshopper-mcp/blob/cefb1de4c9783ebfa796172be9d356feeeb16ba8/rhino_grasshopper_mcp/bridge.py) exposes status, canvas inspection, definition load/solve/save, component creation, wiring, deletion, movement, values and code execution. Requests cross a TCP bridge to [`rhino_bridge_listener.py`](https://github.com/dongwoosuk/rhino-grasshopper-mcp/blob/cefb1de4c9783ebfa796172be9d356feeeb16ba8/rhino_listener/rhino_bridge_listener.py), which runs in the host and performs actual Grasshopper operations.

The external model never becomes the geometric kernel. Rhino and Grasshopper resolve component types, connections and solutions; `.gh` or `.ghx` remains the durable definition.

## Tools expose topology, not only screenshots

An agent can read the current component graph, discover a large component library, place nodes, connect ports and solve the definition. [`gh_file_ops.py`](https://github.com/dongwoosuk/rhino-grasshopper-mcp/blob/cefb1de4c9783ebfa796172be9d356feeeb16ba8/rhino_grasshopper_mcp/gh_file_ops.py) adds file-level inspection. This makes the protocol suitable for constraint-bearing parametric work rather than merely remote mouse control.

Canvas positions are also first-class operations. The [`persistent layout learner`](https://github.com/dongwoosuk/rhino-grasshopper-mcp/blob/cefb1de4c9783ebfa796172be9d356feeeb16ba8/rhino_grasshopper_mcp/mentoring/persistent_layout_learner.py) records spatial preferences and uses clustering and nearest-neighbor techniques to suggest readable graph placement. That ML layer influences coordination of the definition; it does not replace the definition's computational semantics.

## Persistence and safety boundary

Definitions can be loaded, solved and saved through the live host. The listener tracks components created during a session, but that bookkeeping is not a complete version-control system. Arbitrary Rhino Python execution is powerful and broadens the trust boundary: tool clients can reach far beyond the safer typed operations. Production use therefore depends on controlling the MCP client and listener exposure.

## Identity boundary

This project is distinct from the separately maintained RhinoMCP record. RhinoMCP centers Rhino scene/NURBS operations and explicitly leaves Grasshopper support under development; this repository implements a Grasshopper component-graph bridge and its own layout-learning subsystem.

## Evidence

- [Pinned repository](https://github.com/dongwoosuk/rhino-grasshopper-mcp/tree/cefb1de4c9783ebfa796172be9d356feeeb16ba8)
- [MCP server package](https://github.com/dongwoosuk/rhino-grasshopper-mcp/tree/cefb1de4c9783ebfa796172be9d356feeeb16ba8/rhino_grasshopper_mcp)
