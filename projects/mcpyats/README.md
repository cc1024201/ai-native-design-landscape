# MCPyATS

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MCPyATS is a network-automation agent workspace that joins live pyATS/ACI data, maps, documentation and editable topology diagrams. Its Draw.io integration is part of the product's network reasoning and delivery surface rather than an unrelated demo file.

## Network evidence can be materialized into an editable topology

The system composes multiple MCP services behind an agent UI. A bundled Draw.io server emits diagram events and XML; a local bridge connects those events to the packaged diagrams.net application. The repository includes a real Cisco DevNet sandbox `.drawio` artifact, while pyATS tools supply discovered device and topology facts.

Operational network data remains the observed source; the Draw.io document is a durable, editable coordination artifact generated from it. MCPyATS does not collapse topology evidence and diagram layout into one opaque image, and users can continue editing the XML in the bundled host.

## Evidence

- [Pinned repository](https://github.com/automateyournetwork/MCPyATS/tree/6589f1943ac1157cdeebb593b67fd2c25e815bfc)
- [Draw.io MCP server](https://github.com/automateyournetwork/MCPyATS/tree/6589f1943ac1157cdeebb593b67fd2c25e815bfc/mcp_servers/drawio_mcp)
- [Draw.io bridge](https://github.com/automateyournetwork/MCPyATS/blob/6589f1943ac1157cdeebb593b67fd2c25e815bfc/drawio/mcp-bridge.js)
- [pyATS MCP server](https://github.com/automateyournetwork/MCPyATS/blob/6589f1943ac1157cdeebb593b67fd2c25e815bfc/mcp_servers/pyats_mcp_server/pyats_mcp_server.py)
