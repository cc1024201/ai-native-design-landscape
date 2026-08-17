# SDD Diagram Copilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SDD Diagram Copilot visualizes a specification-driven project without letting the browser become a second source of truth. Agents write YAML; the application derives several coordinated views.

## `project.yaml` is authoritative

At commit [`cbfc0c21`](https://github.com/rwdavisx/sdd-diagram-copilot/tree/cbfc0c2132fc93c1bb0bcc0148a64c13895d2382), services, tasks, priorities and workflow metadata live in a structured project document. Agent instructions prescribe safe updates and tests cover YAML mutation.

## One model produces multiple operational views

`graphify.js` converts dependencies into the architecture graph. The web surface also exposes kanban, priority and run state. These are live read-only projections; the user changes the design by changing specification state through the agent or source.

## Why read-only visuals still matter

The graph coordinates implementation and exposes contradictions across specifications. It is counted as visual coordination and system governance because the visualization is tightly coupled to an agent-mutated authority rather than being an unrelated dashboard.

## Evidence

- [Pinned codebase](https://github.com/rwdavisx/sdd-diagram-copilot/tree/cbfc0c2132fc93c1bb0bcc0148a64c13895d2382)
- [Authoritative project model](https://github.com/rwdavisx/sdd-diagram-copilot/blob/cbfc0c2132fc93c1bb0bcc0148a64c13895d2382/project.yaml)
- [Agent mutation rules](https://github.com/rwdavisx/sdd-diagram-copilot/blob/cbfc0c2132fc93c1bb0bcc0148a64c13895d2382/AGENTS.md)
- [Graph projection](https://github.com/rwdavisx/sdd-diagram-copilot/blob/cbfc0c2132fc93c1bb0bcc0148a64c13895d2382/graphify.js)
- [YAML update tests](https://github.com/rwdavisx/sdd-diagram-copilot/blob/cbfc0c2132fc93c1bb0bcc0148a64c13895d2382/test/yaml-update.test.js)
