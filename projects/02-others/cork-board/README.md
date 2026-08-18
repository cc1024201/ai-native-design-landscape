# Cork Board

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Cork Board turns filmmaking structure into a local, agent-writable wall. Its project graph contains boards, acts, scene cards, cast, places, labels and per-scene arc beats; prompts and reference images stay attached to the scene rather than becoming disconnected generator input.

## Story order is a graph with recovery boundaries

The main [`app.js`](https://github.com/wassermanproductions/cork-board/blob/7f071de08e55237778519ae175c88dced6719ecc/src/app.js) owns card movement, multi-board structure, status transitions, views and local persistence. Sixty-level undo, named checkpoints and full JSON export make restructuring recoverable. A Share Wall preserves both a printable visual wall and an importable project, while Markdown, CSV and Fountain are deliberate downstream representations.

The bundled [MCP server](https://github.com/wassermanproductions/cork-board/blob/7f071de08e55237778519ae175c88dced6719ecc/mcp/cork-board-mcp.mjs) can add and move cards, reorder acts, set arc beats, mutate entities and produce the application's own exports. It reads the same project JSON a person exports and reimports, so agent operations do not create a parallel story model. The product is counted even though much of the wall is useful without AI because it publishes a first-class, writable agent interface over the native planning artifact.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/cork-board/tree/7f071de08e55237778519ae175c88dced6719ecc)
- [Usage and project semantics](https://github.com/wassermanproductions/cork-board/blob/7f071de08e55237778519ae175c88dced6719ecc/docs/USAGE.md)
- [Agent control contract](https://github.com/wassermanproductions/cork-board/blob/7f071de08e55237778519ae175c88dced6719ecc/mcp/README.md)
