# VibecodeAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

VibecodeAI is a prompt-to-website workspace built around persistent per-file rows, selectable design skills and two preview modes. It shares educational IDE ancestry with a broader Vibe Code Editor family, but replaces generic code assistance with an independently surfaced site-generation and governed-style loop.

## ProjectFile rows are the working authority

Pinned revision: `0759fcbf4a9a6d11eda27b203bf75bdc42ec8d3d`.

Each project has a page type, active skill IDs, files, chat messages and commit records. Model tools read, list, upsert and delete `ProjectFile` rows directly. Manual saves use the same `(projectId, path)` uniqueness boundary. The database therefore owns source independently of either preview implementation.

## Skills change the design policy before generation

One active design skill and optional feature skills are loaded into the system prompt before the base landing-page rules. The page type contributes another prompt layer. This makes style governance explicit project state rather than an unrecorded phrase in one user message.

The same prompt imposes a navigation guard for ordinary preview and only unlocks navigation after an explicit extension request. That rule shows the workspace treating preview interaction policy as part of authored product behavior, not merely code syntax.

## Static and Node previews have different contracts

The default artifact is pure HTML/CSS/JavaScript that can be rendered without a build tool. A WebContainer service is available for Node-mode files and process execution. These are two runtime projections of stored source; the `run_command` tool currently returns a queued-command note rather than executing inside the server-side tool call, so command completion must not be inferred from model success.

## “Commits” are an audit feed, not restorable snapshots

After file-writing tool calls, the chat route records a `ProjectCommit` with message, summary and a JSON list of affected paths/tool names. It does not store previous or resulting file contents. The history UI interleaves these records with chat pairs, but exposes no restore operation.

VibecodeAI therefore has durable current files and durable provenance metadata, not a source version graph. Download or external source control is still required for recoverable releases.

## Pinned evidence

- [Repository](https://github.com/arpon-dutta07/vibe_code_editor)
- [Project, file, chat and audit schema](https://github.com/arpon-dutta07/vibe_code_editor/blob/0759fcbf4a9a6d11eda27b203bf75bdc42ec8d3d/prisma/schema.prisma)
- [Database-backed AI file tools](https://github.com/arpon-dutta07/vibe_code_editor/blob/0759fcbf4a9a6d11eda27b203bf75bdc42ec8d3d/lib/ai/tools.ts)
- [Skill layering, navigation policy and audit writes](https://github.com/arpon-dutta07/vibe_code_editor/blob/0759fcbf4a9a6d11eda27b203bf75bdc42ec8d3d/app/api/chat/route.ts)
- [WebContainer runtime service](https://github.com/arpon-dutta07/vibe_code_editor/blob/0759fcbf4a9a6d11eda27b203bf75bdc42ec8d3d/features/webcontainers/service/webContainerService.ts)
- [History presentation](https://github.com/arpon-dutta07/vibe_code_editor/blob/0759fcbf4a9a6d11eda27b203bf75bdc42ec8d3d/features/project/components/commit-history.tsx)
