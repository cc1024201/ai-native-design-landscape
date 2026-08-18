# OpenCanvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenCanvas is an Electron desktop studio where text, uploaded media, image models, and video models are connected as a local visual generation workflow.

## The desktop owns a structured workflow

The React graph records nodes, edges, positions, viewport, provider settings, and node parameters. Import and export preserve that composition; IPC handlers keep renderer actions behind a desktop boundary rather than leaving the workflow as transient component state.

## Model nodes are executable, not illustrative

Image and video node implementations resolve configured providers and pass upstream outputs into later generations. Text and upload nodes remain reusable inputs, making one model result a branchable intermediate rather than only a downloaded endpoint.

## Local ownership is the product choice

Workflow and file services persist projects on the user's machine. The reviewed source does not establish collaborative merging or a hosted version graph, so local files and the desktop database—not a cloud conversation—are the durable authority.

## Pinned evidence

- Repository: [opencanvasai/OpenCanvas](https://github.com/opencanvasai/OpenCanvas)
- Inspected Electron, workflow service, IPC, editor, and model-node tree: [`5d21e266000c8aaab117cb5a4e3c94cd475344f9`](https://github.com/opencanvasai/OpenCanvas/tree/5d21e266000c8aaab117cb5a4e3c94cd475344f9)
- Immutable revision: [commit `5d21e26`](https://github.com/opencanvasai/OpenCanvas/commit/5d21e266000c8aaab117cb5a4e3c94cd475344f9)
