# AI Workflow Builder by Sneha Chaurasia

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project converts a natural-language automation request into a visible sequence and publishes the generated structure into n8n. Its core contribution is prompt-to-workflow materialization, not a manually editable graph runtime.

## A model defines the intermediate workflow

[agent.py](https://github.com/SnehaChaursia/AI-Workflow-Builder-/blob/bc5f0477a9b9852f4677ea670fb302ff9d6461f5/backend/agent.py) asks Groq's Llama model for a strict workflow name, trigger and ordered step schema. The React application renders that response as service-colored trigger and step blocks and links to the resulting n8n workflow.

## The intermediate model is materialized into n8n

[n8n_builder.py](https://github.com/SnehaChaursia/AI-Workflow-Builder-/blob/bc5f0477a9b9852f4677ea670fb302ff9d6461f5/backend/n8n_builder.py) creates a manual trigger, positions generated steps, connects them in order and posts the artifact to n8n's workflow API. [main.py](https://github.com/SnehaChaursia/AI-Workflow-Builder-/blob/bc5f0477a9b9852f4677ea670fb302ff9d6461f5/backend/main.py) keeps parsing and delivery in one ordinary-user request.

## Executability ceiling

Every generated action is emitted as an n8n `noOp` node whose service and description live only in notes. The delivered workflow can open in n8n and preserves the intended sequence, but it does not implement the requested Gmail, Sheets, Slack or other service operations. Editing, version history and runtime evidence also remain delegated to n8n.

## Pinned evidence

- [Repository](https://github.com/SnehaChaursia/AI-Workflow-Builder-)
- [Inspected tree](https://github.com/SnehaChaursia/AI-Workflow-Builder-/tree/bc5f0477a9b9852f4677ea670fb302ff9d6461f5)
- [Frontend projection](https://github.com/SnehaChaursia/AI-Workflow-Builder-/blob/bc5f0477a9b9852f4677ea670fb302ff9d6461f5/frontend/src/App.jsx)
