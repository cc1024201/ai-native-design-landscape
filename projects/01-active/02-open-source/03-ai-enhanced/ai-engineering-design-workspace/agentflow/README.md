# AgentFlow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AgentFlow by Darshit Sharma is a visual multi-agent orchestrator whose React Flow topology is compiled into a LangGraph runtime backed by local models and durable services.

## Topology becomes execution

Nodes and edges express agent steps, conditions, loops, parallel branches, and fan-in or fan-out behavior. The backend maps this structure into LangGraph instead of replaying a fixed demo. Graph changes therefore affect which agents and tools run and how their results rejoin.

## Tools and memory outlive one canvas gesture

Eight runtime tools, Ollama model access, Chroma retrieval memory, and PostgreSQL persistence give agents external capabilities and durable context. Telegram is an additional interaction and delivery channel. These components make the product a working orchestration environment rather than only a flow diagram generator.

## Observability closes the authoring loop

Execution logs let a user compare intended graph behavior with actual runs and then revise the topology. The repository's tests mock heavy dependencies, so they support interface consistency rather than proving every deployment. The decisive evidence is the real source path from stored graph through LangGraph execution and logged outcomes.

## Pinned evidence

- Repository: [darshitsharma/AgentFlow](https://github.com/darshitsharma/AgentFlow)
- Inspected full-stack source: [`5e9ce84fa12a0d6ea7e40313dd7fcce58b3d24cc`](https://github.com/darshitsharma/AgentFlow/tree/5e9ce84fa12a0d6ea7e40313dd7fcce58b3d24cc)
- Immutable revision: [commit `5e9ce84`](https://github.com/darshitsharma/AgentFlow/commit/5e9ce84fa12a0d6ea7e40313dd7fcce58b3d24cc)
