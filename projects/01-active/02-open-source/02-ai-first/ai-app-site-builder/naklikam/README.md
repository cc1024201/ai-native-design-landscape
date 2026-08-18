# Naklikam

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Naklikam's central artifact is a Firebase-backed project filesystem. Claude receives the actual current files and returns structured create or update operations; a browser runtime mounts the resulting tree; GitHub and Vercel are later delivery authorities.

## Claude is constrained by current project context

[`ClaudeService.ts`](https://github.com/Tedysek01/naklikam.cz/blob/ab669125876d54e38d2fc27d1486ca9dc3001849/src/services/ClaudeService.ts) sends requests through the server API and parses structured model responses. [`chatStore.ts`](https://github.com/Tedysek01/naklikam.cz/blob/ab669125876d54e38d2fc27d1486ca9dc3001849/src/store/chatStore.ts) constructs context from the real current files rather than a stale chat summary.

## ProjectStore owns mutation and durability

[`projectStore.ts`](https://github.com/Tedysek01/naklikam.cz/blob/ab669125876d54e38d2fc27d1486ca9dc3001849/src/store/projectStore.ts) serializes update add and delete operations through project locks and writes them with the Firebase project service. This makes named project files authoritative across reloads and concurrent asynchronous work. Manual editing and model changes converge through the same store.

## Runtime projection is a mounted filesystem

[`PreviewPanel.tsx`](https://github.com/Tedysek01/naklikam.cz/blob/ab669125876d54e38d2fc27d1486ca9dc3001849/src/components/PreviewPanel.tsx) mounts all project files into the bundled AlmostNode container and hot-updates changed files before loading its preview URL. The preview can navigate but does not become source authority.

## Delivery is explicit

[`GitHubService.ts`](https://github.com/Tedysek01/naklikam.cz/blob/ab669125876d54e38d2fc27d1486ca9dc3001849/src/services/GitHubService.ts) and [`VercelService.ts`](https://github.com/Tedysek01/naklikam.cz/blob/ab669125876d54e38d2fc27d1486ca9dc3001849/src/services/VercelService.ts) handle distinct outbound transitions. The deployment store keeps recent deployment metadata but is not a general immutable source-version graph.

## Evidence

- [Canonical repository](https://github.com/Tedysek01/naklikam.cz)
- [Inspected tree](https://github.com/Tedysek01/naklikam.cz/tree/ab669125876d54e38d2fc27d1486ca9dc3001849)
- [Claude API boundary](https://github.com/Tedysek01/naklikam.cz/blob/ab669125876d54e38d2fc27d1486ca9dc3001849/api/claude.js)
- Commit: `ab669125876d54e38d2fc27d1486ca9dc3001849`

No reliable team location is published on the maintainer profile; region remains `unknown`.
