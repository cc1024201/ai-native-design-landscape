# AI JointJS Diagram Editor

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project turns JointJS JSON into an embeddable diagram editor and adds GPT-based graph creation and manipulation. Its authority is a serializable JointJS graph, not a generated bitmap.

## JSON crosses every important boundary

Drag-and-drop and drag-to-create operations update JointJS elements and links. The same graph can be imported or exported as JSON and exchanged with a parent application through iframe messages. This makes the editor usable as a design surface inside another product.

## AI mutates graph structure

GPT output is interpreted as elements, relationships, grouping, and property changes that the canvas can render and the user can continue editing. Direct shape-property editing provides a correction path after generation.

## Embedding is not collaboration

Parent-frame communication proves a runtime integration contract; it does not establish durable multi-user state or conflict control. Similarly, valid JointJS JSON proves renderability, not that the modeled system is correct.

## Pinned evidence

- Repository: [navidshad/ai-based-jointjs-diagram-editor](https://github.com/navidshad/ai-based-jointjs-diagram-editor)
- Inspected source: [`4d9c10a568f8005eae269f736bdfd8f73c8b59c3`](https://github.com/navidshad/ai-based-jointjs-diagram-editor/tree/4d9c10a568f8005eae269f736bdfd8f73c8b59c3)
- Immutable revision: [commit `4d9c10a`](https://github.com/navidshad/ai-based-jointjs-diagram-editor/commit/4d9c10a568f8005eae269f736bdfd8f73c8b59c3)
