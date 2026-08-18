# Agentic AI Website Builder by Tayyab Ellahi

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This project is a compact browser workspace rather than a durable hosted platform. The ordinary loop is still real: describe a site, receive file-producing agent output, inspect or edit code, and run the files in a WebContainer preview.

## The live workspace is the artifact

Pinned revision: `c019730f57a07d5472c7d744b46fb1b53b69024c`.

The chat route streams model output to the client. `Workspace` coordinates messages, generated files, the editor and preview; the WebContainer adapter mounts those files and starts the generated application. The source pane and running pane are two views of the same in-memory file set.

Unlike products with a project database, this repository does not establish server-side projects, versions or publication. Reload recovery and multi-device continuity are therefore outside the evidenced loop.

## Why it is not absorbed into Bolt

The repository does not retain Bolt's artifact-tag parser or imported file protocol. Its independently implemented chat-to-file state and direct workspace composition make it a small canonical product, not a renamed copy of the historical Bolt tree.

## Failure semantics

A model response can exist before files mount successfully, and mounted files can exist before the dev server becomes reachable. The UI must therefore distinguish stream completion, filesystem materialization and preview readiness; the source does not make them one atomic event.

## Pinned evidence

- [Repository](https://github.com/tayyabeh/AI-website-geenrator)
- [Streaming chat route](https://github.com/tayyabeh/AI-website-geenrator/blob/c019730f57a07d5472c7d744b46fb1b53b69024c/app/api/chat/route.ts)
- [Workspace coordinator](https://github.com/tayyabeh/AI-website-geenrator/blob/c019730f57a07d5472c7d744b46fb1b53b69024c/components/Workspace.tsx)
- [WebContainer adapter](https://github.com/tayyabeh/AI-website-geenrator/blob/c019730f57a07d5472c7d744b46fb1b53b69024c/lib/webcontainer.ts)
