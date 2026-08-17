# AKO Visual Design Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AKO Visual Design Agent is a deterministic design-automation pipeline for producing the visual package of another software agent. It calls itself an agent because it runs a perception, planning, review and production workflow; the pinned implementation does not call a language or image-generation model.

## Configuration becomes a governed proposal

The CLI workflow in [`main.py`](https://github.com/yangguiqing2026/AKO_visual_design_agent/blob/a88dbaff660b736c01254b54ed0716370d0ec96f/main.py) reads the target agent's functions and metadata. A Perceptor classifies interface type and design needs through fixed matrices, and a Planner turns the report into layout, color, icon, animation and checklist records. Both the perception report and the proposal are written as inspectable JSON or Markdown with a trace ID.

This is rules-based template selection rather than learned interpretation. Its reproducibility is part of the technical direction, not hidden model intelligence.

## Mockup approval gates production

[`mockup_generator.py`](https://github.com/yangguiqing2026/AKO_visual_design_agent/blob/a88dbaff660b736c01254b54ed0716370d0ec96f/mockup_generator.py) renders interface, icon and palette previews with Pillow. An interactive run asks the user to inspect those files before continuing. The [`Reviewer`](https://github.com/yangguiqing2026/AKO_visual_design_agent/blob/a88dbaff660b736c01254b54ed0716370d0ec96f/reviewer.py) checks palette membership, naming and file completeness and records approval, required revision or rejection.

Only an approved proposal reaches [`producer.py`](https://github.com/yangguiqing2026/AKO_visual_design_agent/blob/a88dbaff660b736c01254b54ed0716370d0ec96f/producer.py). Production writes multi-resolution icons, functional PNGs, theme JSON, wizard and splash assets, a design-decision log and the approval record. Candidate preview and promoted assets therefore remain linked by the shared report, proposal and trace ID.

## Operational shell and limits

A separate `app.py` registers the process with an AKO registry and maintains heartbeats, while the design workflow remains the CLI in `main.py`. The repository also contains drawing-to-BIM and building-performance routines; those deterministic subsystems are adjacent capabilities rather than evidence for the advertised text-to-render image generation in the agent card.

The output directory is the durable artifact store. There is no native editable design graph, source round trip, collaborative merge or trained model. Some generated mockups use fixed example labels and layouts, so approval demonstrates conformance to this template system rather than bespoke visual quality.

## Evidence

- [Pinned repository](https://github.com/yangguiqing2026/AKO_visual_design_agent/tree/a88dbaff660b736c01254b54ed0716370d0ec96f)
- [Agent capability card](https://github.com/yangguiqing2026/AKO_visual_design_agent/blob/a88dbaff660b736c01254b54ed0716370d0ec96f/AKO_agent_card.yaml)
