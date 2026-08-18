# AI Workflow Generator by Wafiq

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This workflow builder turns a natural-language automation request into a visual graph, a portable workflow definition, and an Airflow DAG.

## Retrieval constrains available APIs

A MySQL API catalog is embedded into Chroma. LangChain and OpenRouter retrieve likely operations and assess feasibility before constructing the graph, so provider output is grounded in a declared tool inventory.

## One generation produces two executable representations

The agent saves `workflow.json` and generates an `airflow_dag.py`; React Flow renders the JSON for inspection. An endpoint can then trigger the Airflow DAG, making the design more than a passive diagram.

## Generated Python is the critical trust boundary

Schema checks and catalog grounding reduce malformed plans, but the runtime ultimately executes generated Python. Feasibility is also parsed from model output, so the source does not establish a hard sandbox or formal proof of safety.

## Pinned evidence

- Repository: [Wafiqsw/ai-workflow-generator](https://github.com/Wafiqsw/ai-workflow-generator)
- Inspected API catalog, embeddings, agent tools, workflow JSON, React Flow projection, DAG generation, and Airflow trigger: [`dd0f2eb47474e2a3c63759d0086f7dcd8fe5e7b0`](https://github.com/Wafiqsw/ai-workflow-generator/tree/dd0f2eb47474e2a3c63759d0086f7dcd8fe5e7b0)
- Immutable revision: [commit `dd0f2eb`](https://github.com/Wafiqsw/ai-workflow-generator/commit/dd0f2eb47474e2a3c63759d0086f7dcd8fe5e7b0)
