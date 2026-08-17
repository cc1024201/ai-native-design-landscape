# Figma Weave

> Research status: **Architecture-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Figma Weave—formerly Weavy—is a browser-based AI-native media platform where image, video, audio, and 3D work is built as a visible node workflow and refined with professional editing tools.

## The workflow is the creative process

Typed nodes accept and emit text, images, video, audio, masks, lists, LoRAs, and 3D material. Generative nodes consume credits; manual and helper nodes can paint, blur, compose, route, import, preview, compare, or export. Compatible handles make the sequence inspectable and rerunnable instead of collapsing creation into one prompt and one output.

## Branching preserves alternatives

Creators can branch model outputs, remix them, compare approaches, adjust model parameters, and feed a selected result into later nodes. The graph therefore preserves decision lineage across multiple models and hands-on edits. Figma describes this as a media pipeline where each result can become the next input.

## A workflow can become a simpler product

Connecting an Output node unlocks Tool mode. Unconnected inputs become exposed attributes while locked nodes hide internal controls. Publishing creates timestamped versions; shared users can run the simplified tool while its creator retains the editable workflow. Workflows can also be published to Figma Community for duplication and adaptation.

## The Figma boundary is still moving

Figma acquired Weavy in October 2025 and now names the product and team Figma Weave. The full platform remains a separate product with separate account and credits, while a curated set of Weave tools runs inside Figma Design. A live Figma-frame node is announced but not yet treated here as generally available. The implementation is closed, so data schemas, runtime scheduling, and storage internals remain unknown.

## First-party evidence

- [Figma Weave FAQ and current product boundary](https://help.figma.com/hc/en-us/articles/35965787376919-Figma-Weave-FAQ)
- [Figma acquisition and product architecture](https://www.figma.com/blog/welcome-weavy-to-figma/)
- [Current Figma integration and workflow publishing](https://www.figma.com/blog/connecting-figma-and-weave/)
- [Node model](https://help.weavy.ai/en/articles/12292386-understanding-nodes)
- [Tool publishing and version management](https://help.weavy.ai/en/articles/12267755-tools)
