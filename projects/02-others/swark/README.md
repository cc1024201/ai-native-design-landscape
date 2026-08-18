# Swark

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Swark turns a selected part of a repository into a versionable architecture explanation inside VS Code. The model's result is not held in a proprietary conversation; it is written into the working tree as Mermaid Markdown.

## Repository context is deliberately bounded

At [`0f6b94ad`](https://github.com/swark-io/swark/tree/0f6b94adefb3af2b3863f361da5e09082165a1e9), input selection and repository readers determine what enters the prompt. The VS Code Language Model API supplies the analysis rather than a hard-coded external provider.

## Output becomes project evidence

The output writer creates dated files and diagnostic logs. Mermaid remains directly editable after generation and can be reviewed or committed with the code it explains.

## Design interpretation

Swark defines design as visual coordination over implementation authority: the diagram does not mutate the codebase but gives humans and agents a durable architecture artifact grounded in a selected source scope.

## Evidence

- [Pinned codebase](https://github.com/swark-io/swark/tree/0f6b94adefb3af2b3863f361da5e09082165a1e9)
- [Repository reader](https://github.com/swark-io/swark/blob/0f6b94adefb3af2b3863f361da5e09082165a1e9/src/io/repository-reader.ts)
- [Model interaction](https://github.com/swark-io/swark/blob/0f6b94adefb3af2b3863f361da5e09082165a1e9/src/llm/model-interactor.ts)
- [Output writer](https://github.com/swark-io/swark/blob/0f6b94adefb3af2b3863f361da5e09082165a1e9/src/view/output-writer.ts)
