# VoxelSite

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

VoxelSite is a self-hosted site-authoring system whose AI Studio sits beside direct code editing visual editing structural site operations and publication. Its canonical artifact is therefore broader than a model response: pages partials routes tokens assets and revision state form one managed site.

## Providers feed a structured orchestration surface

[ai.php](https://github.com/NowSquare/VoxelSite/blob/a56b509f266a4c2b7b49aa2fbffa417f2bb75f24/_studio/api/endpoints/ai.php) routes Studio prompts through configured providers. Provider adapters include Anthropic OpenAI Gemini DeepSeek and compatible endpoints; configured model output participates in real file and site operations.

## SQLite and the workspace divide authority

[Database.php](https://github.com/NowSquare/VoxelSite/blob/a56b509f266a4c2b7b49aa2fbffa417f2bb75f24/_studio/engine/Database.php) supplies durable Studio state while generated PHP HTML CSS and JavaScript remain deployable files. Structural operations and visual edits converge on that managed workspace instead of remaining in chat.

## Safe editing precedes publication

[preview.php](https://github.com/NowSquare/VoxelSite/blob/a56b509f266a4c2b7b49aa2fbffa417f2bb75f24/_studio/api/endpoints/preview.php) exposes the working site before release. Snapshot and undo mechanisms protect edits; [publish.php](https://github.com/NowSquare/VoxelSite/blob/a56b509f266a4c2b7b49aa2fbffa417f2bb75f24/_studio/api/endpoints/publish.php) advances reviewed files into the live site. This is a native site lifecycle rather than iframe-only evidence.

## Evidence

- [Canonical repository](https://github.com/NowSquare/VoxelSite)
- [Inspected tree](https://github.com/NowSquare/VoxelSite/tree/a56b509f266a4c2b7b49aa2fbffa417f2bb75f24)
- Commit: a56b509f266a4c2b7b49aa2fbffa417f2bb75f24
