# RocketRide

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RocketRide is a visual AI-pipeline environment embedded in VS Code whose portable `.pipe` JSON runs on the same C++ engine locally, on-premises, or in its cloud service.

## The file is the portability boundary

Nodes, connections, parameters, and metadata are saved as a version-controllable pipeline file. The grid editor is therefore a projection of a repository artifact rather than an opaque hosted canvas. Normal untitled-document, save, reopen, and backup behavior matters because the pipeline participates in ordinary code review.

## One runtime follows the artifact

More than one hundred node types feed a multithreaded C++ executor. Python and TypeScript SDKs invoke the same pipeline format, while local and hosted targets retain equivalent execution semantics. Logs expose model calls, token use, latency, and node results back in the IDE.

## AI edits remain reviewable

A coding agent can propose pipeline structure, but the result materializes as the same `.pipe` file and visual graph the user can inspect and change. Deployment is a target choice over that artifact, not a second undocumented design.

## Pinned evidence

- Repository: [rocketride-org/rocketride-server](https://github.com/rocketride-org/rocketride-server)
- Inspected VS Code editor, pipeline schema, save lifecycle, C++ execution, SDK, and deployment tree: [`5e5a251726d572ba8e73557212d34526e6d62303`](https://github.com/rocketride-org/rocketride-server/tree/5e5a251726d572ba8e73557212d34526e6d62303)
- Immutable revision: [commit `5e5a251`](https://github.com/rocketride-org/rocketride-server/commit/5e5a251726d572ba8e73557212d34526e6d62303)
