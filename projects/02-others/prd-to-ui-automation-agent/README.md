# PRD to UI Automation Agent

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

PRD to UI Automation Agent is a runnable four-agent pipeline that transforms a product-requirements document into structured requirements, user journeys, low-fidelity wireframes and a high-fidelity UI specification.

## Blackboard artifacts accumulate by stage

RequirementParsingAgent, UserJourneyAgent, WireframeAgent and HighFidelityAgent each return structured JSON. The final deliverable includes component mappings and design tokens. A Streamlit workbench lets a user paste or upload the PRD and inspect all four stages before downloading exports.

The generated stage objects and merged UI specification are authoritative inside the project. Exporters produce Figma-like JSON and Design Tokens JSON; “Figma-like” is an exchange format and does not prove native import fidelity or a live Figma object graph.

## Implementation ceiling

Mock mode provides deterministic local outputs, while real mode depends on prompt-driven JSON responses. The early repository exposes orchestration, models and exporters but not visual screenshot validation or durable collaborative version history.

- [Pinned PRD to UI revision](https://github.com/loinz-Max/PRD-to-UI-Automation-Agent/tree/07fe20ecab63c4688dd0deda70b027b039595f22)
- [Four-stage product contract](https://github.com/loinz-Max/PRD-to-UI-Automation-Agent/blob/07fe20ecab63c4688dd0deda70b027b039595f22/README.md)
- [Pipeline orchestrator](https://github.com/loinz-Max/PRD-to-UI-Automation-Agent/blob/07fe20ecab63c4688dd0deda70b027b039595f22/orchestrator.py)
- [Artifact exporters](https://github.com/loinz-Max/PRD-to-UI-Automation-Agent/blob/07fe20ecab63c4688dd0deda70b027b039595f22/exporters.py)
