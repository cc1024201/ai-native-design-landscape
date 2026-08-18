# Sutradhar AI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Sutradhar AI explores a no-code personal agent workforce for small organizations in North East India. Its distinctive implementation choice is to use a visual pipeline as structured context for one Gemini-backed worker rather than pretending that every drawn node is an independently running agent.

## Two authoring surfaces share one product context

The form builder persists named agents, roles, personality and instructions through MongoDB. The separate [pipeline-canvas.tsx](https://github.com/pheonix1005/Sutradhar-AI/blob/aee5e53eacb8a3f21a5eaea58ef3f8d4ac1743cf/components/pipeline-canvas.tsx) lets a user place agent-role nodes, connect them and save or reload the graph. The pipeline API stores both nodes and connections as the reusable artifact.

## "Deploy" changes the interpretation of the next task

The shared pipeline context records whether a standalone agent or pipeline is active. When a task is submitted, [pipeline-context.tsx](https://github.com/pheonix1005/Sutradhar-AI/blob/aee5e53eacb8a3f21a5eaea58ef3f8d4ac1743cf/lib/pipeline-context.tsx) topologically orders the graph into a readable pipeline description. The activity surface sends that description, the first node identity and the user's prompt to the chat route.

## One real model call stands behind the workforce UI

[route.ts](https://github.com/pheonix1005/Sutradhar-AI/blob/aee5e53eacb8a3f21a5eaea58ef3f8d4ac1743cf/app/api/chat/route.ts) calls Gemini with the active agent identity and pipeline description, then the product retains activity entries and exposes the generated Markdown as a document preview. This is a genuine artifact-to-model loop, but not a multi-agent executor.

## Evidence ceiling

Connections influence ordering and prompt context only. The run button toggles deployment state; it does not dispatch each node, pass intermediate values or enforce branching. Sutradhar therefore maps a visual organization into one model persona and is classified as an active transition rather than a complete graph runtime.

## Pinned evidence

- [Repository](https://github.com/pheonix1005/Sutradhar-AI)
- [Inspected tree](https://github.com/pheonix1005/Sutradhar-AI/tree/aee5e53eacb8a3f21a5eaea58ef3f8d4ac1743cf)
- [Pipeline persistence route](https://github.com/pheonix1005/Sutradhar-AI/blob/aee5e53eacb8a3f21a5eaea58ef3f8d4ac1743cf/app/api/pipelines/route.ts)
- [Task and result surface](https://github.com/pheonix1005/Sutradhar-AI/blob/aee5e53eacb8a3f21a5eaea58ef3f8d4ac1743cf/components/activity-log.tsx)
