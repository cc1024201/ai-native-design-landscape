# AI Workflow Builder by Burhan

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This is a compact Streamlit product that turns one natural-language request into a transient executable pipeline. Its useful distinction is not a general-purpose canvas: the model authors a constrained plan, Graphviz exposes that plan, and the same in-memory object is then executed.

## The artifact is an LLM-produced tool plan

[app.py](https://github.com/burhan086/ai-workflow-builder/blob/ad960ecb4ad8c033bd7a44ebc583ef6ff8a80373/app.py) asks Llama 3.3 for JSON whose steps can only name `github_fetch`, `llm_summarize`, or `send_notification`. `input_from_step` is the dependency contract. The Graphviz view is therefore a projection of executable JSON, not an independently editable diagram.

## Execution stays deliberately narrow

The run button walks the returned step list in order, carries prior output into the next tool, and can make real GitHub, Groq, and webhook calls. There is no durable workflow store, version history, manual graph correction, scheduling, or reusable deployment surface in the inspected commit.

## Why it belongs in the landscape

It represents a distinct product definition: delegated creation of a small automation followed by human inspection and explicit execution. The ordinary loop is prompt → inspect generated DAG → run → read per-step output, with the generated plan disappearing when the Streamlit session is lost.

## Pinned evidence

- [Repository](https://github.com/burhan086/ai-workflow-builder)
- [Inspected tree](https://github.com/burhan086/ai-workflow-builder/tree/ad960ecb4ad8c033bd7a44ebc583ef6ff8a80373)
- [Runtime and three tool adapters](https://github.com/burhan086/ai-workflow-builder/blob/ad960ecb4ad8c033bd7a44ebc583ef6ff8a80373/app.py)
