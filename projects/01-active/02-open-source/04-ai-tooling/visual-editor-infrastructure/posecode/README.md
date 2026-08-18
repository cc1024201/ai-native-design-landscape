# Posecode

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Posecode defines human movement as readable, editable and renderable source. A `.posecode` document records phases, joint actions, timing, contacts and range constraints; humans, animation tools and language models can all author the same representation.

## The language contract is the artifact authority

The standard parser and language packages validate source independently of a model. The [renderer/embed package](https://github.com/posecode-dev/posecode/tree/579d986c3f8bf1f59414692dd2a0bbe4d867dc4a/packages/posecode-embed) projects it as interactive Three.js motion, while [`posecode-eval`](https://github.com/posecode-dev/posecode/tree/579d986c3f8bf1f59414692dd2a0bbe4d867dc4a/packages/posecode-eval) reports grounding, range-of-motion, collision and fidelity defects. The MCP package exposes generation, validation, critique and sharing to agents.

Text source remains canonical; animation is a deterministic projection. This makes motion inspectable and diffable instead of hiding semantic decisions in a black-box trajectory or binary clip.

## Evidence

- [Pinned repository](https://github.com/posecode-dev/posecode/tree/579d986c3f8bf1f59414692dd2a0bbe4d867dc4a)
- [Language specification](https://github.com/posecode-dev/posecode/tree/579d986c3f8bf1f59414692dd2a0bbe4d867dc4a/spec)
- [MCP package](https://github.com/posecode-dev/posecode/tree/579d986c3f8bf1f59414692dd2a0bbe4d867dc4a/packages/posecode-mcp)
