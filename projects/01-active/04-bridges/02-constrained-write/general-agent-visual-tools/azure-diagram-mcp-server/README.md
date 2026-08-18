# Azure Diagram MCP Server

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Azure Diagram MCP Server defines a safety-bounded route from a Copilot request to executable diagram code and then to a rendered cloud-architecture image.

## Code is the intermediate authority

At commit [`12d71327`](https://github.com/Jah-yee/diagrams-mcp-server/tree/12d71327d487942da89db3113b1f366484ac0913), the model produces Python for the `diagrams` library. The server parses its AST and applies security scanning before execution; Graphviz performs the final layout.

This is not a native canvas loop. Revision means regenerating or changing source, and the rendered PNG is downstream evidence.

## The MCP Apps viewer is a delivery surface

The bundled viewer provides pan, zoom and download inside the agent client. It improves inspection but does not become the canonical model. That boundary keeps the project in code-visual authoring rather than native graph editing.

## Attribution note

The package namespace contains `microsoft`, but the verified GitHub repository is not a fork of a resolvable Microsoft upstream. The census therefore attributes this implementation to its public maintainer rather than inventing a corporate lineage.

## Evidence

- [Pinned repository](https://github.com/Jah-yee/diagrams-mcp-server/tree/12d71327d487942da89db3113b1f366484ac0913)
- [Server pipeline](https://github.com/Jah-yee/diagrams-mcp-server/blob/12d71327d487942da89db3113b1f366484ac0913/microsoft/azure_diagram_mcp_server/server.py)
- [Source scanner](https://github.com/Jah-yee/diagrams-mcp-server/blob/12d71327d487942da89db3113b1f366484ac0913/microsoft/azure_diagram_mcp_server/scanner.py)
- [Embedded viewer](https://github.com/Jah-yee/diagrams-mcp-server/blob/12d71327d487942da89db3113b1f366484ac0913/microsoft/azure_diagram_mcp_server/viewer/app.html)
