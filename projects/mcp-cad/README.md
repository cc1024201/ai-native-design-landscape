# mcp-cad

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

mcp-cad is a typed MCP control layer for native CAD. It gives an agent small, composable modeling operations and higher-level skills while keeping the host CAD document—not MCP text—as the authoritative artifact.

## Stable entity resolution is the decisive mechanism

[`Program.cs`](https://github.com/Andiveli/mcp-cad/blob/dc8b53072cb518ccd098a300e4d705a7f054227e/src/McpCad.Server/Program.cs) registers the server and provider boundary. [`AtomicTools.cs`](https://github.com/Andiveli/mcp-cad/blob/dc8b53072cb518ccd098a300e4d705a7f054227e/src/McpCad.Tools/AtomicTools.cs) exposes typed modeling primitives; persistent tags let later calls resolve the intended CAD entities without relying on unstable selection indexes.

The provider protocol separates generic tool semantics from host automation. [`InventorProvider.cs`](https://github.com/Andiveli/mcp-cad/blob/dc8b53072cb518ccd098a300e4d705a7f054227e/src/McpCad.Inventor/InventorProvider.cs) implements Autodesk Inventor; SolidWorks is described as planned and is not counted as implemented. The repository documents more than eighty atomic tools and twenty-two skills, but the included product boundary is the implemented Inventor-backed loop.

The maintainer's first-party GitHub profile identifies Ecuador.

## Evidence

- [Pinned repository](https://github.com/Andiveli/mcp-cad/tree/dc8b53072cb518ccd098a300e4d705a7f054227e)
- [Provider protocol](https://github.com/Andiveli/mcp-cad/blob/dc8b53072cb518ccd098a300e4d705a7f054227e/openspec/specs/cad-provider-protocol/spec.md)
- [Maintainer profile](https://github.com/Andiveli)
