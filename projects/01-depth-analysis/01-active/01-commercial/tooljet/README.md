# ToolJet

ToolJet treats design as configuration that stays editable, not as a snapshot that is generated and discarded. It is an established low-code platform whose definition of "design" is the reversible wiring of an application: the component canvas, the data queries feeding it, the environment values, the workflow graph and the agent configuration all remain first-class, editable surfaces after anything is built.

## The application remains a directly editable canvas

The decisive mechanism is that generated starts land in ToolJet's component canvas rather than as screenshots or prose. Components, queries, environment values and workflow actions stay configurable, and versions can be promoted through GitSync and deployment stages. Design here is not a one-way generation event — it is a mutable, versionable graph the product continues to own.

## Agents operate beside apps and workflows

ToolJet's boundary is larger than prompt-to-UI: it describes agents as automators that orchestrate processes across platform resources. A managed app, its workflow graph and an agent configuration can jointly define what gets delivered, so the design artifact extends beyond pixels into the behavior and data layer of a running product. [ToolJet AI overview](https://docs.tooljet.ai/docs/tooljet-ai/overview)

## The openness boundary

The AGPL repository exposes the conventional builder, workflow surfaces and AI client/service calls, but not enough of the hosted generation and agent core to trace model output through every mutation and deployment boundary, so those capabilities are recorded at architecture level. [Evidence: ToolJet/ToolJet](https://github.com/ToolJet/ToolJet) @ [21c05d18](https://github.com/ToolJet/ToolJet/tree/21c05d18312a436606ab2fb9e5d52a6c57e1b57d) · [application builder docs](https://docs.tooljet.com/docs/app-builder/overview/)
