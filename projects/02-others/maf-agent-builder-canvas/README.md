# MAF Agent Builder Canvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MAF Agent Builder Canvas is a Streamlit prototype for arranging Microsoft Agent Framework agents and exporting the arrangement as project JSON. Its most important fact is also its boundary: the canvas records a topology that the current sandbox does not execute as a topology.

## What the canvas actually owns

[`canvas.py`](https://github.com/dcnsakthi/AIAgentCanva/blob/b4d55ea7c8bbb2cc44f667999b1bfe44ae094487/src/ui/pages/canvas.py) keeps agents and connections in the project record and renders them with `streamlit_agraph`. Users can add and configure agent types and download the resulting JSON. The generator in [`project_generator.py`](https://github.com/dcnsakthi/AIAgentCanva/blob/b4d55ea7c8bbb2cc44f667999b1bfe44ae094487/src/agents/project_generator.py) chooses deterministic templates from project type and complexity rather than asking a model to synthesize an arbitrary system.

Durability is limited. Project switching is backed by Streamlit session state; JSON export is the recoverable handoff. The repository does not establish a database or collaborative merge model.

## Connections describe intent but not orchestration

[`agent_executor.py`](https://github.com/dcnsakthi/AIAgentCanva/blob/b4d55ea7c8bbb2cc44f667999b1bfe44ae094487/src/agents/agent_executor.py) can run a chosen agent. Its multi-agent path iterates agents independently; it does not follow the saved edges or route one result into the next node. The evaluation page likewise produces simulated assessment data. The visual graph is therefore a configuration specification and communication aid rather than the authority of an executable workflow.

## Deployment is a scaffold

The deployment page and Azure helper generate instructions and Bicep-shaped output. The pinned implementation largely reports successful steps and its template retains a generic container image. It is useful as delivery scaffolding but is not evidence that an exported canvas becomes a deployed graph runtime.

## Evidence boundary

- [Repository](https://github.com/dcnsakthi/AIAgentCanva)
- [Pinned source tree](https://github.com/dcnsakthi/AIAgentCanva/tree/b4d55ea7c8bbb2cc44f667999b1bfe44ae094487)
- [Immutable commit](https://github.com/dcnsakthi/AIAgentCanva/commit/b4d55ea7c8bbb2cc44f667999b1bfe44ae094487)
