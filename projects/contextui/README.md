# ContextUI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ContextUI defines an AI workflow as a local interactive application, not a node graph. A workflow's React/TSX source and optional Python service are authoritative; the desktop host compiles and renders that source for humans while exposing the same artifact to agents through MCP.

## Source files are the design model

[BUILDING_WORKFLOWS.md](https://github.com/contextui-desktop/contextui/blob/2202848ea5d6ad68d2786bdc55c2501c1265fe13/docs/BUILDING_WORKFLOWS.md) specifies a workflow folder containing a TSX entry, metadata, description and optional Python backend. [module-bundler.cjs](https://github.com/contextui-desktop/contextui/blob/2202848ea5d6ad68d2786bdc55c2501c1265fe13/electron/module-bundler.cjs) resolves local imports and compiles the entry with esbuild before the renderer loads it.

## The host supplies runtime rather than owning business logic

Electron manages profiles, filesystem watching, Python downloads, per-workflow virtual environments, server processes and dynamic tabs. A workflow can therefore package a bespoke visual interface plus local model or media code without translating itself into a universal canvas schema.

## Agents receive an interface to the same artifact

The standalone [MCP server](https://github.com/contextui-desktop/contextui/blob/2202848ea5d6ad68d2786bdc55c2501c1265fe13/electron/mcp-server-standalone.cjs) can list, read and launch workflows, manage Python servers and automate visible controls through the app bridge. This is source-authority live projection: an agent edits or invokes the same files a human sees rendered.

## Trust boundary

Workflows run with local Node access and may start Python code. That power is intentional and means installation is a code-trust decision, not a sandboxed SaaS import. Exchange publishing distributes workflow packages; it does not create collaborative source versions inside the host.

## Pinned evidence

- [Repository](https://github.com/contextui-desktop/contextui)
- [Inspected tree](https://github.com/contextui-desktop/contextui/tree/2202848ea5d6ad68d2786bdc55c2501c1265fe13)
- [Architecture and lifecycle](https://github.com/contextui-desktop/contextui/blob/2202848ea5d6ad68d2786bdc55c2501c1265fe13/docs/ARCHITECTURE.md)
