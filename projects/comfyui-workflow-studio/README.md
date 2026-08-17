# ComfyUI Workflow Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ComfyUI Workflow Studio is a plugin that manages workflow, model, image, prompt, batch, and laboratory artifacts around the existing ComfyUI canvas.

## ComfyUI JSON remains authoritative

The plugin can store API or UI workflow JSON and send it back to the ComfyUI canvas. Its Generate UI maps those graphs to inputs for execution, so the Studio does not invent a second node runtime.

## Local models assist catalog work

Ollama or LM Studio can summarize workflows, suggest tags, translate text, improve prompts, and participate in tool-called image generation. These operations augment the retained artifact catalog rather than silently rewriting every graph.

## Images can carry their provenance

Snapshots embed workflow JSON in PNG metadata. Batch axes, Lab keyframes, plan JSON, and an index image preserve experimental structure alongside generated outputs, allowing an image to lead back to the workflow that produced it.

## Pinned evidence

- Repository: [ketle-man/ComfyUI-Workflow-Studio](https://github.com/ketle-man/ComfyUI-Workflow-Studio)
- Inspected ComfyUI graph exchange, artifact catalog, local-model tools, Generate UI, batch and Lab planning, and embedded PNG provenance: [`4a23564c66fb598b9260b8d70f49e6dca701dd6d`](https://github.com/ketle-man/ComfyUI-Workflow-Studio/tree/4a23564c66fb598b9260b8d70f49e6dca701dd6d)
- Immutable revision: [commit `4a23564`](https://github.com/ketle-man/ComfyUI-Workflow-Studio/commit/4a23564c66fb598b9260b8d70f49e6dca701dd6d)
