# QoderWork Design

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Alibaba / Qoder |
| Category | Agent-first design surface |
| Status | Active |
| Source availability | Closed |

## Scope

A vertical QoderWork workbench described as an AI-native “design as code” surface with an infinite canvas and runnable design files.

## Technical direction

- Treats design output as an engineering/code asset.
- Separates Canvas, Design Files, Preview, Style References and Plan as views over the design task.
- Uses structured Questions and a Design Plan before generation.
- Exposes selected visual parameters through Nudge for deterministic refinement.

## Public technical choices

- Surface: infinite canvas plus running Preview.
- Artifact: runnable, editable engineering files.
- Targeting: lasso/annotation on canvas.
- Direct controls: color, spacing and corner-radius adjustments.
- Handoff: the code artifact can continue in the Qoder coding environment.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://docs.qoder.com/qoderwork/design
- https://docs.qoder.com/qoderwork/introduction
