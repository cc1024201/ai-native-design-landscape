# AI Agent Builder by Leon

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Agent Builder by Leon is best understood as a live visual projection of one fixed ReAct agent. React Flow makes the model agent and weather tool legible and interactive; the backend runtime is not compiled from arbitrary canvas topology.

## A fixed three-part composition

[`agent-flow.tsx`](https://github.com/Leon-HyperS/agent_builder/blob/d570cf6eb105a9bb05429d828580d1ae48b0417a/frontend/components/agent-flow.tsx) initializes Gemini model weather tool and ReAct agent nodes. Edges can be moved visually but there is no general node palette or persisted project model in the pinned source. Refreshing returns to the predefined composition.

This matters because the surface can look like a general workflow builder while its product definition is narrower: configure and observe a known agent pattern.

## Runtime events flow back to the picture

[`workflow.py`](https://github.com/Leon-HyperS/agent_builder/blob/d570cf6eb105a9bb05429d828580d1ae48b0417a/backend/app/graph/workflow.py) constructs a LangGraph ReAct agent around Gemini and the weather function. The API streams model tool and chain events. The frontend maps those event classes onto node highlights so users can see which conceptual component is active.

The backend gathers nodes by their type and ignores edge traversal. A visually rewired edge therefore does not redefine execution. The canvas is valuable instrumentation and configuration but not a native executable graph authority.

## Product boundary

There is no saved-version history deployment path or arbitrary tool registry in this revision. The ordinary loop is edit the fixed settings run a prompt and watch the corresponding nodes light up. Counting it as a complete low-code orchestration platform would erase the mechanism that makes it distinct.

## Inspected revision

- [Repository](https://github.com/Leon-HyperS/agent_builder)
- [Pinned tree](https://github.com/Leon-HyperS/agent_builder/tree/d570cf6eb105a9bb05429d828580d1ae48b0417a)
- [Streaming API](https://github.com/Leon-HyperS/agent_builder/blob/d570cf6eb105a9bb05429d828580d1ae48b0417a/backend/app/routers/agents.py)
