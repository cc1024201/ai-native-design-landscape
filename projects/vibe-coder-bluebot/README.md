# Vibe Coder by bluebot-609

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Vibe Coder is a Gemini-driven Next.js app builder with a live WebContainer workbench, explicit local project saving and an automatic runtime-error repair loop. Its source separates “currently running” files from “saved project” records more clearly than its README does.

## Structured text drives the live filesystem

Pinned revision: `abaa2f8689210383094904a0d00cf3c3956049c4`.

The generate route asks Gemini for streamed `<boltAction>` file and shell tags. The client incrementally parses completed actions, cleans generated code, fixes imports and updates the WebContainer file map. When generation finishes, that map is mounted and run as the visible application.

Shell actions are collected into dependency intent; the final project load performs installation and server startup. A displayed action is therefore not itself proof that its command ran.

## Manual editing and model editing converge before save

Monaco updates the same workbench file map used by generation and preview. File tree, terminal, iframe and fix panel all observe that session state. This gives the ordinary user a real prompt → source → rendered app → direct edit/correction loop.

## SQLite persistence is an explicit checkpoint

Project saving posts files, dependencies and selected runtime state to a server-side SQLite database. Saving replaces the stored file set inside a transaction; loading reconstructs a generated-code object and remounts it into WebContainer. The database contains current checkpoints, not a chat transcript or append-only file history.

Unsaved generated and manual changes remain only in browser/runtime state. A project ID in the workbench does not make every later change durable until Save is invoked again.

## Auto-fix has bounded session memory

Terminal/build errors are parsed and sent to a Gemini fix route. Parsed file fixes are written back into the workbench, with retry limits, cooldown and recent-attempt tracking held in React refs. Package fixes are only logged as needed in the inspected hook. Reloading loses that repair history even when the repaired files were later saved.

The repository also contains an older Vite-oriented `src/` implementation; the Next.js `app/`, database routes and workbench form the more complete current path inspected here. The dossier does not merge claims across those two paths unless the current workbench calls them.

## Pinned evidence

- [Repository](https://github.com/bluebot-609/vibe-coder)
- [Gemini action stream](https://github.com/bluebot-609/vibe-coder/blob/abaa2f8689210383094904a0d00cf3c3956049c4/app/api/generate/stream/route.ts)
- [Client action application and final mount](https://github.com/bluebot-609/vibe-coder/blob/abaa2f8689210383094904a0d00cf3c3956049c4/hooks/useAIStream.ts)
- [SQLite project schema](https://github.com/bluebot-609/vibe-coder/blob/abaa2f8689210383094904a0d00cf3c3956049c4/lib/db/schema.ts)
- [Transactional saved-file replacement](https://github.com/bluebot-609/vibe-coder/blob/abaa2f8689210383094904a0d00cf3c3956049c4/lib/db/database.ts)
- [Bounded automatic repair loop](https://github.com/bluebot-609/vibe-coder/blob/abaa2f8689210383094904a0d00cf3c3956049c4/hooks/useAutoFix.ts)
