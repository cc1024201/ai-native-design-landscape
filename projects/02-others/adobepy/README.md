# adobepy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

adobepy is the shared local control runtime underneath several DCC-MCP Adobe adapters, but it is also directly usable through its CLI, REPL and Python SDK. It is counted independently because the broker and generated object-model facade can operate Photoshop, Illustrator, After Effects, Premiere and InDesign without adopting one adapter's MCP surface.

## One broker, several incompatible host APIs

The working boundary is a local Rust JSON-RPC broker. Thin UXP or CEP bridges stay inside the Adobe application; Python talks to opaque session-scoped DOM references through typed facades. The [architecture contract](https://github.com/dcc-mcp/adobepy/blob/51148defbf6270b8193a90b8f71c93cb2eb8aa5d/docs/architecture.md) separates transport, generated DOM coverage and application-specific conveniences rather than pretending that every Adobe host has the same graph.

This makes the open document in the host authoritative. Python can select and style text, change layers or paths and request native save/export operations; the broker does not replace PSD, AI, AEP or other native persistence with its own scene model. Capability and token checks constrain the bridge, while raw script access is an explicit fallback rather than the main interface.

## Why this is not five more products

The common broker and SDK are one runtime product. The host-specific DCC-MCP adapters remain separate census records only where they publish their own installable capability graph and ordinary-user workflow. Generated stubs and bridges inside adobepy are components of this shared release.

## Evidence

- [Pinned source](https://github.com/dcc-mcp/adobepy/tree/51148defbf6270b8193a90b8f71c93cb2eb8aa5d)
- [Usage and direct Python facade](https://github.com/dcc-mcp/adobepy/blob/51148defbf6270b8193a90b8f71c93cb2eb8aa5d/docs/usage.md)
- [DCC-MCP integration boundary](https://github.com/dcc-mcp/adobepy/blob/51148defbf6270b8193a90b8f71c93cb2eb8aa5d/docs/dcc-mcp-integration.md)
