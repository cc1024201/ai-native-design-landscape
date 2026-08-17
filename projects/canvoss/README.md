# Canvoss

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Canvoss is embeddable visual-editor infrastructure. Its most consequential choice is not a particular canvas UI: human controls, an LLM tool loop and headless rendering all operate on one portable layout document and one operation grammar.

## One document and one mutation algebra

[`LayoutDocument`](https://github.com/shashankbhat2/Canvoss/blob/b144355cde551070ca40e76d110ebbdbf750ca1f/packages/schema/src/types.ts) is a serializable tree of layout nodes, styles, props and metadata. [`EditorOp`](https://github.com/shashankbhat2/Canvoss/blob/b144355cde551070ca40e76d110ebbdbf750ca1f/packages/schema/src/editor-ops.ts) defines the allowed create, update, move, reorder and delete operations; a pure reducer applies them.

The React editor store uses that reducer for direct manipulation and records bounded undo/redo history. The agent does not receive a privileged back door into component state: it emits the same operations, which makes an AI turn inspectable, replayable and rejectable at the document boundary.

## The agent loop is provider-pluggable but host-controlled

[`run-agent-turn.ts`](https://github.com/shashankbhat2/Canvoss/blob/b144355cde551070ca40e76d110ebbdbf750ca1f/packages/agent/src/run-agent-turn.ts) sends the current canvas context to Anthropic, OpenAI or Gemini adapters and exposes tools for document edits, validation, undo and render inspection. The host injects model credentials and decides when a turn runs; Canvoss supplies the tool protocol and deterministic application of the returned operations.

This distinction matters: the library is agent-controllable, but it is not a hosted design service and does not silently upload or persist a project.

## Preview and export resolve the same tree

[`layout-to-html.ts`](https://github.com/shashankbhat2/Canvoss/blob/b144355cde551070ca40e76d110ebbdbf750ca1f/packages/render/src/layout-to-html.ts) turns the document into HTML using the same component-resolution concept as the live editor. The Playwright adapter then captures that resolved output. Human view, agent screenshot feedback and exported evidence therefore derive from one graph rather than from parallel prompt and canvas states.

## Deliberate infrastructure boundary

Canvoss includes in-memory history but no durable project store, branch model or collaboration backend. Embedding applications must persist `LayoutDocument`, decide how component resolvers are trusted and add long-term versioning. That omission is part of the product definition: Canvoss provides the common artifact kernel through which a host can join direct editing, agents and rendering.

## Evidence

- [Pinned repository](https://github.com/shashankbhat2/Canvoss/tree/b144355cde551070ca40e76d110ebbdbf750ca1f)
- [Editor store](https://github.com/shashankbhat2/Canvoss/blob/b144355cde551070ca40e76d110ebbdbf750ca1f/packages/editor/src/store/editor-store.ts)
- [Playwright render adapter](https://github.com/shashankbhat2/Canvoss/blob/b144355cde551070ca40e76d110ebbdbf750ca1f/packages/render/src/engines/playwright-adapter.ts)
