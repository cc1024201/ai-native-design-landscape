# Quill AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Quill AI defines design as producing a typed web artifact that can survive critique repair versioning preview and export. The core mechanism is not a visual node canvas; it is a promotion pipeline around an explicit artifact contract.

## Four artifact shapes constrain generation

[`artifacts.ts`](https://github.com/tovrr/quill-ai/blob/982e64852dc69ef6e43ec8b8b4b095d829c4252a/src/lib/builder/artifacts.ts) recognizes page document React application and Next.js bundle payloads. Parsing and salvage logic reject or repair malformed model output before the UI treats it as an artifact. This gives the generator a destination schema instead of preserving only prose and code fences.

## Draft critique and rewrite are separate decisions

The two-pass builder described in [`003-two-pass-builder-stream.md`](https://github.com/tovrr/quill-ai/blob/982e64852dc69ef6e43ec8b8b4b095d829c4252a/docs/decisions/003-two-pass-builder-stream.md) first creates a draft then asks a critic to identify defects before rewriting. Quality and repair retries operate on the candidate payload. Readiness checks prevent a partial bundle from silently advancing to preview.

This is materially different from asking the same chat to try again: the candidate has a type and stage and can fail promotion for a recorded reason.

## Versions store complete candidate payloads

The PostgreSQL schema includes `artifact_version` records and the [versions API](https://github.com/tovrr/quill-ai/blob/982e64852dc69ef6e43ec8b8b4b095d829c4252a/src/app/api/artifacts/versions/route.ts) retrieves and creates them. Preview routes render supported forms and ZIP export packages files for delivery. A user can therefore compare or recover materialized states rather than relying on chat history alone.

## Boundary

Quill can emit editable code bundles but source generation does not prove that every bundle is production-safe or that edits round-trip through a semantic design model. Its authority is the stored typed artifact and version payload.

## Revision inspected

- [Repository](https://github.com/tovrr/quill-ai)
- [Pinned tree](https://github.com/tovrr/quill-ai/tree/982e64852dc69ef6e43ec8b8b4b095d829c4252a)
- [Immutable commit](https://github.com/tovrr/quill-ai/commit/982e64852dc69ef6e43ec8b8b4b095d829c4252a)
