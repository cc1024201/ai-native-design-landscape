# X-FluxAgent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

X-FluxAgent is a ComfyUI extension that treats an AI-authored Python module as a first-class workflow node rather than a detached chat response.

## The AI module stays inside the graph

A request is turned into code and node metadata that ComfyUI can place beside ordinary image-generation nodes. Inputs and outputs remain connectable in the native workflow JSON, so a user can combine generated logic with models, images, masks, and downstream transforms. The canvas—not the conversation—is the operational artifact.

## Creation and correction share one code boundary

The chatbot service and OpenAI-facing node generate or revise module code, while the code node exposes it for direct adjustment. Dirty-state tracking distinguishes changed code from the last executed form. This makes the loop inspectable: generate, wire, edit, run, observe, and repair without translating the workflow into another tool.

## Export changes who owns the result

An AI module can leave ComfyUI as standalone Python. Within the canvas, the workflow graph carries composition and execution order; after export, Python becomes the portable authority. X-FluxAgent therefore spans native graph authoring and code materialization rather than promising an autonomous end-to-end design service.

## Pinned evidence

- Repository: [X-School-Academy/X-FluxAgent](https://github.com/X-School-Academy/X-FluxAgent)
- Inspected extension source: [`7384bec656370527ed5ecd9f13c817e0f7c1b2c9`](https://github.com/X-School-Academy/X-FluxAgent/tree/7384bec656370527ed5ecd9f13c817e0f7c1b2c9)
- Immutable revision: [commit `7384bec`](https://github.com/X-School-Academy/X-FluxAgent/commit/7384bec656370527ed5ecd9f13c817e0f7c1b2c9)
