# Subframe

Subframe answers "what is design" with a refusal to commit to one artifact.

Its public contract is not a single design-becomes-code pipeline but **three artifacts with three exit rules**. Components stay a Subframe-owned design system, materialized into a repository by one-way CLI sync. Pages are presentational handoff artifacts that application code is expected to fork and take over. Prototype mode generates a separate React + Vite codebase that only receives design changes through an explicit Apply and never writes back. Each surface happens to render React, but the decisive structure is the authority split, not the runtime.

The mechanism is a closed hosted design graph publishing open edges around its boundary. `@subframe/cli` receives already-generated file strings from `/api/cli/sync` and writes them — recursively enumerating every file under the sync directory, preserving anything marked `@subframe/sync-disable`, and on a full sync deleting everything else with no transaction, dry run or Git-baseline check. That makes component sync deliberately one-way and destructive, which is the point: the repository owns intentional wrapper logic while Subframe stays the visual/design-system truth.

Generation is asynchronous promotion into the native graph. Ask AI can land one to four page variations independently into a flow, each becoming a native page with no single "select winner" transaction; jobs expose `done` but not atomicity.

MCP mutates native nodes, not repository source: `get_page_info(includeNodeIds)` stamps `data-node-id` onto each element and `edit_page` addresses one id with replace/insert/delete — strong identity **inside the hosted graph**, but exported repository JSX is a detached projection with no source map. Reverse paths are imports (screenshot/AI recreation, an experimental one-file push, a gated bulk design-system ingest), never a supported round trip.

Persistence is a set of independent clocks — hosted history, prototype versions, Ask AI jobs, and Git — none of which restores another.

[Evidence: pinned repository `658287f`](https://github.com/SubframeApp/subframe/tree/658287fbefd9103b59a08e055f5052e0e667b46d) · [sync-components.ts](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/sync-components.ts) · [MCP docs](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/guides/mcp-server.mdx)
