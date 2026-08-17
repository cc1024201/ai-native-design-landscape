# Smart Canvas

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Smart Canvas combines a large React Flow authoring surface with a LangGraph-backed execution route. Users save complete graphs to Supabase, configure model or agent nodes and project the final response back into the output node.

## Supabase retains the canvas artifact

[The builder](https://github.com/suzam26/Smart-Canvas/blob/f02d5d3fe4e094714fe38ac236a6ab4b8ddfb4b1/production/Smart-Canvas/app/builder/%5BflowId%5D/page.tsx) loads and autosaves `graph_json` containing nodes and edges. It also supports undo snapshots, JSON transfer, reusable templates and model-generated graph insertion without replacing the live canvas representation.

## The run route reads that graph

[agent/route.ts](https://github.com/suzam26/Smart-Canvas/blob/f02d5d3fe4e094714fe38ac236a6ab4b8ddfb4b1/production/Smart-Canvas/app/api/agent/route.ts) accepts the serialized graph, selects the node referenced by the current edge and invokes OpenAI, Anthropic or Gemini clients. Agent nodes can bind Composio tools, loop over tool calls and record intermediate outputs before the builder writes the final response into the output node.

## The repository's breadth has uneven authority

Document, media and generation routes provide additional concrete transformations, while several database, file-storage and advertised integration branches return placeholder strings. The package metadata points to a now-unavailable Frankenbuild Labs repository, but GitHub does not mark the inspected `suzam26` repository as a fork; this dossier treats the available owner tree as the public source boundary without inferring an unseen upstream history.

## Dataflow ceiling

Most executors choose `find(edge => edge.source === currentNode.id)`, so only the first outgoing edge controls continuation. The LangGraph wrapper dispatches node types but does not preserve general fan-out or conditional branch semantics from React Flow. Real model and tool calls coexist with placeholder connectors, which is why the lifecycle remains transitional.

## Pinned evidence

- [Repository](https://github.com/suzam26/Smart-Canvas)
- [Inspected tree](https://github.com/suzam26/Smart-Canvas/tree/f02d5d3fe4e094714fe38ac236a6ab4b8ddfb4b1)
- [Application package](https://github.com/suzam26/Smart-Canvas/blob/f02d5d3fe4e094714fe38ac236a6ab4b8ddfb4b1/production/Smart-Canvas/package.json)
