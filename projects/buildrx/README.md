# BuildRx

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BuildRx defines app creation as a multi-agent project workflow with source editing preview GitHub and deployment surfaces. Provider provenance is conditional: NVIDIA inference is primary an Anthropic route is optional and a prompt-aware mock is an explicit no-key mode.

## A workflow coordinates agent roles over one project

[run/route.ts](https://github.com/mabrig1/BuildRx/blob/8af991b8a563da3643936b026993284c94f4de41/src/app/api/agents/run/route.ts) starts the agent workflow and reports its progress. The orchestration layer passes outputs among planning design coding review and related roles before committing project files.

## Provider paths remain distinguishable

[generate/route.ts](https://github.com/mabrig1/BuildRx/blob/8af991b8a563da3643936b026993284c94f4de41/src/app/api/ai/generate/route.ts) routes configured AI generation. The source includes real NVIDIA and optional Anthropic access plus an explicit local mock path when credentials are absent; this dossier attributes authorship only to the path actually selected.

## Supabase-backed files feed every downstream surface

[projects/route.ts](https://github.com/mabrig1/BuildRx/blob/8af991b8a563da3643936b026993284c94f4de41/src/app/api/projects/route.ts) and [files/route.ts](https://github.com/mabrig1/BuildRx/blob/8af991b8a563da3643936b026993284c94f4de41/src/app/api/projects/%5BprojectId%5D/files/route.ts) expose project authority backed by Supabase when configured. [preview/route.ts](https://github.com/mabrig1/BuildRx/blob/8af991b8a563da3643936b026993284c94f4de41/src/app/api/preview/%5BprojectId%5D/route.ts) renders it while export GitHub and deploy routes deliver the same graph. No independent immutable version lineage was found.

## Evidence

- [Canonical repository](https://github.com/mabrig1/BuildRx)
- [Inspected tree](https://github.com/mabrig1/BuildRx/tree/8af991b8a563da3643936b026993284c94f4de41)
- Commit: 8af991b8a563da3643936b026993284c94f4de41
