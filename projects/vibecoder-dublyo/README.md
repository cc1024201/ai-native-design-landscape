# VibeCoder by Dublyo

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

VibeCoder makes a GitHub repository the canonical application artifact. Its AI pipeline classifies a request, optionally researches and plans it, emits complete file replacements, commits them through the GitHub API, then lets browser preview and container deployment consume that commit history.

## The database points at source but does not contain it

Pinned revision: `2358cef37fd61542d4acf56ec4b3575c19c12bc0`.

PostgreSQL `VcProject` rows hold framework, repository, branch, deployment identity, environment values and an optional plan. Chat messages record which paths changed and what model was used; deployment rows record commit SHA, logs, errors and repair attempts. File bodies are fetched from and written to the configured GitHub repository rather than duplicated into the project row.

The direct and Maestro pipelines both parse fenced file blocks, commit multiple files and return a commit SHA. Manual editor writes use the same GitHub content API and create their own commit. Git history is consequently the version mechanism for both agent and human changes.

## Preview is fast evidence with a narrower snapshot

After a response, the chat stream sends the changed file bodies to the client for immediate Sandpack-style feedback. The full source and file browser are loaded from GitHub routes. This means an incremental preview can temporarily show only the changed subset plus its scaffold while the repository remains the complete authority. The product should not treat the transient preview payload as a full recovery snapshot.

## Build repair and deployment continue from commits

Build routes clone the repository inside a managed container and run bounded commands. The Ralph loop watches build or runtime evidence, proposes fixes and commits them, with attempt counts stored on deployment records. Manual deployment triggers a GitHub Actions workflow; webhook and Portainer code move the built image into the running environment and update the project's deployment status. ZIP export reads repository files, adding framework scaffolding only when missing.

This is a server-heavy self-hosted architecture: losing PostgreSQL loses project routing and deployment metadata, while losing GitHub loses the authoritative design source. Neither store alone is a complete backup.

## Pinned evidence

- [Repository](https://github.com/dublyo/vibecoder)
- [Project message and deployment schema](https://github.com/dublyo/vibecoder/blob/2358cef37fd61542d4acf56ec4b3575c19c12bc0/prisma/schema.prisma)
- [Generation tiers and commit boundary](https://github.com/dublyo/vibecoder/blob/2358cef37fd61542d4acf56ec4b3575c19c12bc0/src/lib/vibecoder/pipeline.ts)
- [GitHub file and multi-file commit implementation](https://github.com/dublyo/vibecoder/blob/2358cef37fd61542d4acf56ec4b3575c19c12bc0/src/lib/vibecoder/github.ts)
- [Chat stream preview payload and repair handoff](https://github.com/dublyo/vibecoder/blob/2358cef37fd61542d4acf56ec4b3575c19c12bc0/src/app/api/vibecoder/projects/%5Bid%5D/chat/route.ts)
- [Manual source mutation route](https://github.com/dublyo/vibecoder/blob/2358cef37fd61542d4acf56ec4b3575c19c12bc0/src/app/api/vibecoder/projects/%5Bid%5D/files/route.ts)
- [Container build path](https://github.com/dublyo/vibecoder/blob/2358cef37fd61542d4acf56ec4b3575c19c12bc0/src/app/api/vibecoder/projects/%5Bid%5D/build/route.ts)
- [Deployment trigger](https://github.com/dublyo/vibecoder/blob/2358cef37fd61542d4acf56ec4b3575c19c12bc0/src/app/api/vibecoder/projects/%5Bid%5D/deploy/route.ts)
