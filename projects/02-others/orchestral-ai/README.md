# Orchestral AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Orchestral AI turns a project request into an agent-and-task graph that can be edited, simulated, committed and handed toward GitHub or Streamlit delivery.

## Agent cards contain task structure

[AgentsWorkflowNext.tsx](https://github.com/binaryshrey/Orchestral-AI/blob/89c59860186ab1a0925459384062c567f347ac18/orchestral-ai/app/dashboard/agents-workflow/AgentsWorkflowNext.tsx) stores agents, embedded tasks and inter-agent edges. Serialization expands those cards into assignment edges and sequential task edges; loading collapses them back for the canvas.

## Planning and running are explicit API transitions

The [plan route](https://github.com/binaryshrey/Orchestral-AI/blob/89c59860186ab1a0925459384062c567f347ac18/orchestral-ai/app/api/agents/plan/route.ts) generates a structured candidate workflow. The run route and editor expose task status and logs, while a commit route writes accepted agent output. LocalStorage provides draft recovery before those transitions.

## Delivery claims have adapters

GitHub and Streamlit routes exist, but the source mixes real adapters with simulation-oriented status progression. The dossier counts graph planning, editing, saved drafts and explicit handoff APIs without treating every displayed deployment state as provisioned infrastructure.

## Pinned evidence

- [Repository](https://github.com/binaryshrey/Orchestral-AI)
- [Inspected tree](https://github.com/binaryshrey/Orchestral-AI/tree/89c59860186ab1a0925459384062c567f347ac18)
- [Run route](https://github.com/binaryshrey/Orchestral-AI/blob/89c59860186ab1a0925459384062c567f347ac18/orchestral-ai/app/api/agents/run/route.ts)
