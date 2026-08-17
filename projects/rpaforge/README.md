# RPAForge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RPAForge defines design as an executable automation process. Its canvas is not merely explanatory BPMN: nodes, parameters, and connections are intended to become runnable RPA behavior.

## An executable process graph

The editor stores a structured workflow graph and projects it into a visual canvas. Process steps carry configuration that can be compiled toward Python execution. This makes the graph the authority and the diagram a programming surface, placing RPAForge closer to visual engineering than presentation diagramming.

## AI enters through a proposal gate

Natural-language process generation supports OpenAI-compatible and Anthropic routes. The generated BPMN/process proposal is presented with Apply/Discard behavior instead of being committed invisibly. That review boundary is the decisive agent-interface fact: the user can reject a structurally plausible but operationally wrong workflow.

## History before execution

IndexedDB history and editor recovery protect intermediate designs; compilation is a later boundary. Neither successful generation nor valid graph shape proves that external applications, credentials, selectors, or side effects are safe. Execution remains the point where an ordinary user must validate the automation.

## Pinned evidence

- Repository: [chelslava/rpaforge](https://github.com/chelslava/rpaforge)
- Inspected implementation: [`ff69c26f616ff9b63dce896d05d2ca3d144b7a1b`](https://github.com/chelslava/rpaforge/tree/ff69c26f616ff9b63dce896d05d2ca3d144b7a1b)
- Immutable revision: [commit `ff69c26`](https://github.com/chelslava/rpaforge/commit/ff69c26f616ff9b63dce896d05d2ca3d144b7a1b)
