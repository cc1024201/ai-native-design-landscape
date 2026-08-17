# DeepSite

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DeepSite is a Hugging Face-hosted vibe-coding workspace in which prompts generate ordinary web files users inspect and edit those files beside a live Sandpack projection and publication creates a versioned Hugging Face Space.

## Generated files become repository state

The pinned [`ask` route](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/app/api/ask/route.ts) sends the selected model the existing file set and conversation context and streams replacement file content. [`useGeneration.ts`](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/components/ask-ai/useGeneration.ts) merges those files into the current workspace and publishes them through the Spaces API.

## Editing and preview share one file set

[`components/editor/index.tsx`](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/components/editor/index.tsx) gives Sandpack the current path/content array while chat code mode device preview and redesign requests surround that provider. Website redesign first converts a source URL to markdown and then feeds it back into the same generation path; it is context rather than a second artifact authority.

## Hugging Face commits are user-visible versions

[`actions/projects.ts`](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/actions/projects.ts) reads project files and commit history from the user's static Spaces. Historical commits can be previewed and the [`commit restore route`](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/app/api/projects/%5BrepoId%5D/%5BcommitId%5D/route.ts) repoints `main` to a chosen revision. Repository files and their commit graph are therefore the durable authority.

## Identity recursion

The GitHub result `MartinsMessias/deepsite-locally` explicitly calls itself a fork of `enzostvs/deepsite`. It is a self-hosting derivative and is mapped here rather than counted as an independent product.

## Pinned evidence

- [Canonical Space repository](https://huggingface.co/spaces/enzostvs/deepsite)
- [Inspected tree](https://huggingface.co/spaces/enzostvs/deepsite/tree/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9)
- [Derivative declaration](https://github.com/MartinsMessias/deepsite-locally/blob/8f2ea021ccb4153a4ad2efd14885b91c323efd0c/README.md)
- [Maintainer profile locating the lineage in Canada](https://github.com/enzostvs)
- Commit: `d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9`
