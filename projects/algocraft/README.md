# AlgoCraft

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

AlgoCraft is an Algorand-oriented prompt-to-application workbench. It combines wallet/token product framing with a browser IDE, but its most consequential mechanism is a human approval gate between model output and filesystem mutation.

## Approval is the mutation boundary

Pinned revision: `375662b17210cf8b7b795e29188ba700e9e4a613`.

The chat route sends the current file tree and a bounded selection of file contents to an AI SDK stream. The system prompt asks for four project operations: write, rename, delete and install. A parser extracts custom `algocraft-*` tags, but the first pass only lists proposed paths and packages. The user can inspect that operation set and explicitly apply or reject it.

After approval, `ResponseProcessor` executes delete → rename → write → install against the WebContainer. This makes approval real mutation control, although the preview does not show a full semantic diff before consent.

## The WebContainer is the live project authority

Files are read from and written to the browser runtime, and the same runtime supplies the terminal and preview. The model sees only the first twenty non-`node_modules` files with truncated contents, so its apparent project awareness is a deliberately lossy prompt projection. PostgreSQL in this revision stores wallet users, plans and purchases—not project files or chat history.

That boundary matters: the monetization state is durable, while the authored application state is primarily the current browser filesystem.

## Algorand is product context, not a separate artifact type

The default assistant is instructed to build Algorand applications, while optional Web and GitHub agent routes change the source of responses. All of them ultimately converge on the same tagged file operations. The blockchain specialization changes generated dependencies and user intent; it does not replace source files with an on-chain design graph.

## Undo and redo are session-local and incomplete

`VersionManager` keeps copied file maps only in memory. The UI records a “Before AI changes” snapshot at approval time, but does not create the corresponding post-change snapshot. A first edit cannot be undone because only one version exists; later index movement can skip the expected immediate state. Reloading also discards the array.

The controls therefore express a recovery intention, not reliable project versioning. Durable delivery requires exporting or committing the generated source outside this implementation.

## Pinned evidence

- [Repository](https://github.com/nickthelegend/v0-clone)
- [Chat context and model stream](https://github.com/nickthelegend/v0-clone/blob/375662b17210cf8b7b795e29188ba700e9e4a613/app/api/chat/route.ts)
- [Operation parsing and ordered execution](https://github.com/nickthelegend/v0-clone/blob/375662b17210cf8b7b795e29188ba700e9e4a613/lib/response-processor.ts)
- [Human approval and session undo UI](https://github.com/nickthelegend/v0-clone/blob/375662b17210cf8b7b795e29188ba700e9e4a613/components/chat-interface.tsx)
- [In-memory version manager](https://github.com/nickthelegend/v0-clone/blob/375662b17210cf8b7b795e29188ba700e9e4a613/lib/version-manager.ts)
