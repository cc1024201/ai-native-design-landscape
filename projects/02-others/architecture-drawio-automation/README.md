# Architecture Draw.io Automation

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project defines diagram design as granular agent work on the same mxGraph XML that draw.io opens. Its value is not merely “generate a diagram”; it exposes a native file as a tool-addressable engineering artifact.

## Thirteen operations instead of one opaque prompt

The MCP server at [`e36a474f`](https://github.com/debajyotim1986/architecture-drawio-automation/tree/e36a474f39e02b6c7881b428e6a81b08017f6e94) can create diagrams, inspect summaries, add or update nodes and remove elements. Stories are normalized into structured inputs before mutation.

## Native XML is both risk and leverage

The server writes `.drawio` XML directly. Verifiers and parser tests reduce malformed output, while draw.io remains the independent manual editor and renderer. This creates a clean agent-to-native-artifact handoff without pretending that the MCP server owns all layout semantics.

## Operational shape

Local diagram storage, icon utilities and natural ordering make the workflow repeatable across stories. The product is therefore closer to a source-control-friendly diagram automation layer than a hosted canvas.

## Evidence

- [Pinned implementation](https://github.com/debajyotim1986/architecture-drawio-automation/tree/e36a474f39e02b6c7881b428e6a81b08017f6e94/drawio-mcp-server)
- [Diagram store](https://github.com/debajyotim1986/architecture-drawio-automation/blob/e36a474f39e02b6c7881b428e6a81b08017f6e94/drawio-mcp-server/src/drawio_mcp_server/util/diagram_store.py)
- [Create operation](https://github.com/debajyotim1986/architecture-drawio-automation/blob/e36a474f39e02b6c7881b428e6a81b08017f6e94/drawio-mcp-server/src/drawio_mcp_server/tools/create_diagram.py)
- [Parser tests](https://github.com/debajyotim1986/architecture-drawio-automation/blob/e36a474f39e02b6c7881b428e6a81b08017f6e94/drawio-mcp-server/tests/test_parser.py)
