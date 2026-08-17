# Director

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Director is a local-first production system for turning a live application into a narrated walkthrough video, editable pitch deck, dailies and a canonical production manifest. The repository and npm history use `ai-recorder`, but the product and CLI are now Director.

## Approval separates planning from capture

[`storyboard.ts`](https://github.com/dubh3124/Director/blob/affcf2d1bd799db6d434479c6d6a157bf58160e3/src/storyboard.ts) validates versioned YAML or JSON scenes and stage directions. Agents can scout the app and draft or revise that Storyboard, but `shoot` and `premiere` require explicit approval before browser control and artifact writes. [`manifest.ts`](https://github.com/dubh3124/Director/blob/affcf2d1bd799db6d434479c6d6a157bf58160e3/src/manifest.ts) records the resulting production.

```text
live app -> scout -> versioned storyboard -> check -> approval
-> capture + voiceover + dailies -> final-cut.mp4 + pitch-deck.pptx + manifest
```

CLI, SDK and MCP are peer adapters over the same operations. The A2A surface is explicitly a preview. No reliable first-party location was found.

## Evidence

- [Pinned repository](https://github.com/dubh3124/Director/tree/affcf2d1bd799db6d434479c6d6a157bf58160e3)
- [Storyboard schema and validation](https://github.com/dubh3124/Director/blob/affcf2d1bd799db6d434479c6d6a157bf58160e3/src/storyboard.ts)
- [Production manifest](https://github.com/dubh3124/Director/blob/affcf2d1bd799db6d434479c6d6a157bf58160e3/src/manifest.ts)
- [Editor/provider boundary](https://github.com/dubh3124/Director/blob/affcf2d1bd799db6d434479c6d6a157bf58160e3/src/editor.ts)
