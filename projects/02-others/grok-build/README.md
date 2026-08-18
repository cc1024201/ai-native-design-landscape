# Grok Build

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Grok Build makes Mermaid a first-class response artifact inside a terminal coding agent. It does not create a diagram project; it gives visual source in an agent answer a rich inspection and handoff surface.

## Streaming Markdown detects diagram boundaries

At [`be713136`](https://github.com/xai-org/grok-build/tree/be713136d2a69080743a3f6b3c72077057e5948f), the Markdown parser recognizes Mermaid fences while a response is assembled. A dedicated engine can render through a pure Rust path or external Mermaid tooling.

## Terminal and image delivery coexist

The pager renders an inline terminal representation and can rasterize diagrams to PNG. User actions include Open Image, copy image path and Copy Source, preserving both a visual deliverable and the editable notation that produced it.

## Authority limit

The Mermaid block remains part of the agent response; there is no named project record or diagram version history. This is therefore a general-agent visual tool and not a native design workspace.

## Evidence

- [Pinned monorepo](https://github.com/xai-org/grok-build/tree/be713136d2a69080743a3f6b3c72077057e5948f)
- [Markdown Mermaid parser](https://github.com/xai-org/grok-build/blob/be713136d2a69080743a3f6b3c72077057e5948f/crates/codegen/xai-grok-markdown/src/mermaid.rs)
- [Rendering engine](https://github.com/xai-org/grok-build/blob/be713136d2a69080743a3f6b3c72077057e5948f/crates/codegen/xai-grok-mermaid/src/engine.rs)
- [Raster output](https://github.com/xai-org/grok-build/blob/be713136d2a69080743a3f6b3c72077057e5948f/crates/codegen/xai-grok-mermaid/src/raster.rs)
- [Pager affordance scenarios](https://github.com/xai-org/grok-build/blob/be713136d2a69080743a3f6b3c72077057e5948f/crates/codegen/xai-grok-pager/tests/scenarios/mermaid-affordances.yaml)
