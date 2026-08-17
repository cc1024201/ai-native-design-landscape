# Substrata

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Substrata is a multi-domain prototyping workspace spanning printable parts, architecture, electronics, laser work and labels. Its decisive question is whether the AI produces editable engineering artifacts; in the pinned source, the implemented paths materialize OpenSCAD, schematic structures, wiring, bills of materials and exportable geometry rather than only concept images.

## Studio mode selects an artifact grammar

Maker, Architecture and Hacker modes share one application shell but change generation prompts, validation rules and deliverables. [`geminiService.ts`](https://github.com/danieljtrujillo/substrata-by-gantasmo/blob/940fd849094be7ec04291b2e355a1c0952dc8480/src/services/geminiService.ts) requests structured project output. The server-side [`AI relay`](https://github.com/danieljtrujillo/substrata-by-gantasmo/blob/940fd849094be7ec04291b2e355a1c0952dc8480/functions/api/ai/relay.ts) applies a task/model policy and supports Gemini, OpenRouter and Anthropic without exposing provider credentials to the browser.

## Generated source drives the visual projection

For printable parts, [`openscadEngine.ts`](https://github.com/danieljtrujillo/substrata-by-gantasmo/blob/940fd849094be7ec04291b2e355a1c0952dc8480/src/lib/cadEngines/openscadEngine.ts) produces an intermediate CAD result, and [`openscadParser.ts`](https://github.com/danieljtrujillo/substrata-by-gantasmo/blob/940fd849094be7ec04291b2e355a1c0952dc8480/src/lib/openscadParser.ts) evaluates supported source into Three.js geometry. The UI exposes generated code and derives STL or GLB from the current model. Hacker-mode paths can emit KiCad-oriented structures and net validation; architecture paths assemble building blueprints and reports.

The artifact loop is therefore source-bearing:

`brief + constraints → structured generation → editable domain source/IR → 2D or 3D projection → validation/export`

## Projects retain more than rendered output

[`projectService.ts`](https://github.com/danieljtrujillo/substrata-by-gantasmo/blob/940fd849094be7ec04291b2e355a1c0952dc8480/src/services/projectService.ts) saves and reloads project inputs, settings and generated state through the authenticated project API. Image-processing and label modes also expose deterministic controls and downstream PNG/SVG delivery.

## Uneven implementation boundary

The breadth is larger than the maturity of every path. The repository explicitly reports that some remote CAD workers are not deployed and falls back to the OpenSCAD engine. Its in-browser STL emitter and rule checks do not replace professional DFM, structural, electrical or code review. This dossier attributes only source-visible paths and treats domain validation as advisory until verified in the target toolchain.

## Evidence

- [Pinned repository](https://github.com/danieljtrujillo/substrata-by-gantasmo/tree/940fd849094be7ec04291b2e355a1c0952dc8480)
- [Main multi-mode workspace](https://github.com/danieljtrujillo/substrata-by-gantasmo/blob/940fd849094be7ec04291b2e355a1c0952dc8480/src/App.tsx)
