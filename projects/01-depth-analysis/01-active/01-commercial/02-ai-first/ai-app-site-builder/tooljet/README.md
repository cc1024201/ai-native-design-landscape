# ToolJet

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ToolJet is an established low-code application platform whose current product combines a drag-and-drop UI builder, data queries, workflows, AI app generation, and an agent builder.

## The application remains directly editable

Generated starts land in ToolJet's component canvas rather than only as screenshots or prose. Components, queries, environment values, and workflow actions remain configurable, and versions can be promoted through GitSync and deployment stages.

## Agents operate beside apps and workflows

ToolJet describes agents as automators that can orchestrate processes across platform resources. That makes the product boundary larger than prompt-to-UI: a managed app, its workflow graph, and an agent configuration can jointly define delivery.

## The open repository does not expose the whole AI path

The inspected AGPL tree contains the conventional app builder, workflow surfaces, AI client state, service calls, and enterprise test contracts. It does not expose enough of the hosted generation and agent implementation to trace model output through every mutation and deployment boundary. Those capabilities are therefore recorded at architecture level, while the open foundation revision is pinned separately.

## Evidence

- Product and repository: [ToolJet/ToolJet](https://github.com/ToolJet/ToolJet)
- Inspected open foundation revision: [`21c05d18312a436606ab2fb9e5d52a6c57e1b57d`](https://github.com/ToolJet/ToolJet/tree/21c05d18312a436606ab2fb9e5d52a6c57e1b57d)
- [ToolJet AI documentation](https://docs.tooljet.ai/docs/tooljet-ai/overview)
- [Application builder documentation](https://docs.tooljet.com/docs/app-builder/overview/)
