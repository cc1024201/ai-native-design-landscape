# AI Component Builder by Harsh Bhanushali

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This workshop repository is a complete component-authoring product rather than just course material. Its distinctive dependency is the Cursor Agent SDK: agent output is streamed into a chat and promoted into a visual artifact only after a fenced-source boundary is satisfied.

## The agent owns source generation

[`cursorAgent.ts`](https://github.com/harshbhx/cursor-rajkot-workshop/blob/27b0b296c1f0fc829d4ab45d2d488809197f627f/lib/cursorAgent.ts) creates a Cursor Agent run with a component-specific system contract and forwards assistant deltas. [`route.ts`](https://github.com/harshbhx/cursor-rajkot-workshop/blob/27b0b296c1f0fc829d4ab45d2d488809197f627f/app/api/generate/route.ts) adds recent conversation context and exposes the run as server-sent events with cancellation and an in-memory rate limit.

## Promotion creates the preview artifact

[`useGenerate.ts`](https://github.com/harshbhx/cursor-rajkot-workshop/blob/27b0b296c1f0fc829d4ab45d2d488809197f627f/hooks/useGenerate.ts) does not preview arbitrary prose. It waits for a complete fenced TSX or JSX block and then calls [`buildIframeDoc.ts`](https://github.com/harshbhx/cursor-rajkot-workshop/blob/27b0b296c1f0fc829d4ab45d2d488809197f627f/lib/buildIframeDoc.ts), which strips imports and projects the source through browser Babel with React and Tailwind inside a script-only sandbox. Chat history and the current result are client state; no saved project or version history is claimed.

## Evidence

- [Canonical repository](https://github.com/harshbhx/cursor-rajkot-workshop)
- [Inspected tree](https://github.com/harshbhx/cursor-rajkot-workshop/tree/27b0b296c1f0fc829d4ab45d2d488809197f627f)
- Commit: `27b0b296c1f0fc829d4ab45d2d488809197f627f`
