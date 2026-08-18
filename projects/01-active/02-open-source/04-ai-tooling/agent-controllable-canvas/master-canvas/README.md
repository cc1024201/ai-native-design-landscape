# Master Canvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Master Canvas is a local pre-production board where images, references, prompts, camera and lighting notes, shot order and sound intent become one AI-video handoff project. The visual canvas is not merely a mood board: each shot carries the structured facts required by downstream generators and operators.

## One project feeds several delivery dialects

The application's [`app.js`](https://github.com/wassermanproductions/master-canvas/blob/2da296f8958805fc2278c85711257f7a2e9a77f6/src/app.js) owns board editing and local storage. Export materializes a Markdown brief, machine-readable JSON, visual storyboard HTML/PDF and a ZIP that can include source assets, ordered shots, ComfyUI/LTX job JSON, Kling/Veo prompt sheets and agent context. The local board remains the revision authority; these packages are target-specific projections.

The [MCP bridge](https://github.com/wassermanproductions/master-canvas/blob/2da296f8958805fc2278c85711257f7a2e9a77f6/mcp/master-canvas-mcp.mjs) operates `master-canvas-project.json` headlessly: it can read or edit boards, cards, prompts, references, assets and order, build a package, then return the project for reimport. The separate MCP and Hermes repositories are distribution components of this same artifact loop rather than additional products.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/master-canvas/tree/2da296f8958805fc2278c85711257f7a2e9a77f6)
- [Product usage model](https://github.com/wassermanproductions/master-canvas/blob/2da296f8958805fc2278c85711257f7a2e9a77f6/docs/USAGE.md)
- [Agent interface](https://github.com/wassermanproductions/master-canvas/blob/2da296f8958805fc2278c85711257f7a2e9a77f6/mcp/README.md)
