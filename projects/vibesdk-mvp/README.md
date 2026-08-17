# VibeSDK MVP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

VibeSDK MVP separates a generated blueprint from the files that implement it. Its substantial deterministic fallback is source-visible and explicitly treated as degraded provenance rather than proof of successful OpenAI authorship.

## Generation returns plan plus files

[route.ts](https://github.com/stefanautomateed/lovable9/blob/59dbc74654396fb5f5fcedf5db282912c3013fd6/app/api/generate/route.ts) invokes the OpenAI path and validates a structured blueprint and multi-file result. When the provider cannot answer it selects named fallback templates rather than silently labeling them as model output.

## Browser storage provides recovery but not version history

[storage.ts](https://github.com/stefanautomateed/lovable9/blob/59dbc74654396fb5f5fcedf5db282912c3013fd6/lib/storage.ts) saves sessions in localStorage. This permits reopening a project but the README and source do not establish a chain of restorable revisions inside one session.

## The file graph is adapted into Sandpack

[PreviewPanel.tsx](https://github.com/stefanautomateed/lovable9/blob/59dbc74654396fb5f5fcedf5db282912c3013fd6/components/PreviewPanel.tsx) executes current files and [CodeViewer.tsx](https://github.com/stefanautomateed/lovable9/blob/59dbc74654396fb5f5fcedf5db282912c3013fd6/components/CodeViewer.tsx) exposes them for inspection. Blueprint display and file tree help explain the artifact but the source graph remains the executable authority.

## Evidence

- [Canonical repository](https://github.com/stefanautomateed/lovable9)
- [Inspected tree](https://github.com/stefanautomateed/lovable9/tree/59dbc74654396fb5f5fcedf5db282912c3013fd6)
- Commit: 59dbc74654396fb5f5fcedf5db282912c3013fd6
