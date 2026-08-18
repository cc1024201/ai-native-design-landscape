# MerMark Editor

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MerMark Editor is a desktop Markdown workspace where Claude, Codex, Ollama and OpenAI-compatible providers can propose direct document changes. Mermaid diagrams participate in the same guarded source-editing lifecycle.

## Per-document access maps constrain the agent

At commit [`8970487e`](https://github.com/Vesperino/MerMarkEditor/tree/8970487e375e1940a68ee20b0d99c2d398765a3e), the Tauri backend builds an access map for each session and exposes file tools through provider adapters. The model does not receive unrestricted filesystem authority by default.

## Proposal and recovery surround mutation

AI edits become previewable proposals with explicit Apply or Discard. Snapshots and temporary recovery records protect the pre-change document, while atomic-save tests cover the final filesystem boundary.

## Mermaid-aware targeting

The editor parses Mermaid blocks into dedicated nodes and can pin the corresponding source as AI context. Accepted edits serialize back to Markdown attributes and source; the preview is not a parallel hidden artifact.

## Evidence

- [Pinned source](https://github.com/Vesperino/MerMarkEditor/tree/8970487e375e1940a68ee20b0d99c2d398765a3e)
- [AI access map](https://github.com/Vesperino/MerMarkEditor/blob/8970487e375e1940a68ee20b0d99c2d398765a3e/src-tauri/src/ai/access_map.rs)
- [Snapshot lifecycle](https://github.com/Vesperino/MerMarkEditor/blob/8970487e375e1940a68ee20b0d99c2d398765a3e/src-tauri/src/ai/snapshots.rs)
- [AI panel](https://github.com/Vesperino/MerMarkEditor/blob/8970487e375e1940a68ee20b0d99c2d398765a3e/src/components/ai/AiPanel.vue)
- [Mermaid extension](https://github.com/Vesperino/MerMarkEditor/blob/8970487e375e1940a68ee20b0d99c2d398765a3e/src/extensions/MermaidExtension.ts)
- [Targeting tests](https://github.com/Vesperino/MerMarkEditor/blob/8970487e375e1940a68ee20b0d99c2d398765a3e/src/__tests__/composables/useAiMermaidTarget.test.ts)
