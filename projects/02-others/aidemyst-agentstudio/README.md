# Aidemyst AgentStudio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Aidemyst AgentStudio is a multi-tenant visual agent and workflow platform whose saved node graph is compiled into LangGraph execution. The source has advanced beyond parts of its README: the execution engine is present and wired to operational records.

## Two authoring surfaces share typed contracts

The frontend contains separate agent and workflow builders. [`workflow.ts`](https://github.com/aidemyst-collab/aidemystagent/blob/873531c7faf2ecffde286490ddad2f2f6580bd8f/frontend/src/types/workflow.ts) and [`nodeSchemas.ts`](https://github.com/aidemyst-collab/aidemystagent/blob/873531c7faf2ecffde286490ddad2f2f6580bd8f/frontend/src/types/nodeSchemas.ts) describe LLM RAG MCP decision code communication and nested-workflow nodes. React Flow is not merely a diagram layer: the node and edge configuration is the input to execution.

## The graph is interpreted as a state machine

[`langgraph_engine.py`](https://github.com/aidemyst-collab/aidemystagent/blob/873531c7faf2ecffde286490ddad2f2f6580bd8f/backend/app/services/langgraph_engine.py) builds a `StateGraph` from stored workflow configuration and registers handlers for branching tools retrieval and other node classes. Execute-workflow nodes resolve and invoke another saved workflow so composition crosses graph boundaries without flattening everything into a prompt.

This source-level path outweighs stale project prose that still calls the engine unfinished. The evidence is code and route integration rather than a roadmap claim.

## Operational state is part of the product definition

PostgreSQL models cover organizations users credentials agents workflows versions deployments and execution logs. A saved design can be tested deployed and inspected in the same system. Voice and WhatsApp routes add runtime entry points while organization roles and billing records define the shared service boundary.

## Remaining caution

Breadth of implemented node handlers does not prove production reliability for every integration. The dossier records that the graph-to-runtime mechanism exists; it does not infer that every external credential deployment or communication channel was exercised successfully.

## Pinned evidence

- [Repository](https://github.com/aidemyst-collab/aidemystagent)
- [Inspected tree](https://github.com/aidemyst-collab/aidemystagent/tree/873531c7faf2ecffde286490ddad2f2f6580bd8f)
- [Version schema](https://github.com/aidemyst-collab/aidemystagent/blob/873531c7faf2ecffde286490ddad2f2f6580bd8f/backend/app/schemas/version.py)
