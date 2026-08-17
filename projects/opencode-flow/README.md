# OpenCode Flow

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

OpenCode Flow was an experimental desktop workspace that put a visual software plan beside OpenCode agent sessions source files terminals Git branches worktrees and review. The repository is archived. Its planning graph and coding runtime are adjacent systems rather than one executable graph.

## SQLite stores a workspace planning graph

[`graph.ts`](https://github.com/IgorWarzocha/Opencode-flow/blob/e9b4087cabe3d9547bcf76dcfe6f13199c9336f9/src/server/routes/graph.ts) implements reads and insertion for node and edge tables in the workspace SQLite database. Nodes represent features and planning concepts. They do not represent model or tool calls and the graph is not traversed to run an agent.

## The visible canvas is only partly wired

[`GraphCanvas.tsx`](https://github.com/IgorWarzocha/Opencode-flow/blob/e9b4087cabe3d9547bcf76dcfe6f13199c9336f9/src/components/canvas/GraphCanvas.tsx) fetches saved nodes and edges and supports local React Flow changes. In the pinned revision its change handlers do not POST those direct edits back to the graph routes. Backend persistence exists but the ordinary drag-edit-save loop is incomplete.

## Agent work is organized through sessions and worktrees

Separate server routes start OpenCode sessions and manage Git files branches and worktrees. The terminal editor and review surfaces make parallel implementation inspectable. A plan node can contextualize that work but the source does not compile planning edges into an agent execution schedule.

## Historical value and boundary

The project captures a distinct definition of design: visually coordinating software intentions and candidate branches around a coding agent. Its archived status and unfinished canvas persistence mean it should not be presented as a current maintained builder or a completed orchestration runtime.

## Immutable evidence

- [Archived repository](https://github.com/IgorWarzocha/Opencode-flow)
- [Pinned tree](https://github.com/IgorWarzocha/Opencode-flow/tree/e9b4087cabe3d9547bcf76dcfe6f13199c9336f9)
- [Workspace service](https://github.com/IgorWarzocha/Opencode-flow/blob/e9b4087cabe3d9547bcf76dcfe6f13199c9336f9/src/server/workspace.ts)
