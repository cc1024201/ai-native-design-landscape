# DeepSite

DeepSite defines design as *ordinary web files*: a prompt generates replaceable file content, and the design lives in those files as they are read back, edited and versioned. It is a Hugging Face-hosted vibe-coding workspace in which there is no separate design artifact — the file set is the design, and inspection, editing and preview all read the same content.

## Generated files become repository state

The mechanism is direct: the pinned [`ask` route](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/app/api/ask/route.ts) sends the selected model the existing file set and conversation context and streams replacement file content; [`useGeneration.ts`](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/components/ask-ai/useGeneration.ts) merges those files into the workspace and publishes them through the Spaces API. Mutation is whole-file replacement, not pixel or node editing — a rename of "generation" to "authoring" of a codebase.

## Editing and preview are one file set

[`components/editor/index.tsx`](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/components/editor/index.tsx) hands Sandpack the current path/content array, with chat, code mode, device preview and redesign requests surrounding that single provider. Website redesign first converts a source URL to markdown and feeds it back into the same generation path — context, not a competing artifact authority.

## Commits are user-visible versions

[`actions/projects.ts`](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/actions/projects.ts) reads project files and commit history from the user's static Spaces; historical commits can be previewed and the [`commit restore route`](https://huggingface.co/spaces/enzostvs/deepsite/blob/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9/app/api/projects/%5BrepoId%5D/%5BcommitId%5D/route.ts) repoints `main` to a chosen revision. Repository files and their commit graph are the durable authority — design persists as git history.

## Identity recursion

The GitHub result `MartinsMessias/deepsite-locally` declares itself a fork of `enzostvs/deepsite`, a self-hosting derivative mapped here rather than counted independently.

## Pinned evidence

- [Canonical Space repository](https://huggingface.co/spaces/enzostvs/deepsite) · [Inspected tree](https://huggingface.co/spaces/enzostvs/deepsite/tree/d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9)
- [Derivative declaration](https://github.com/MartinsMessias/deepsite-locally/blob/8f2ea021ccb4153a4ad2efd14885b91c323efd0c/README.md) · [Maintainer profile](https://github.com/enzostvs)
- Commit: `d4c8bedc29019597fa5dd25cd8a73e875f1ea8b9`
