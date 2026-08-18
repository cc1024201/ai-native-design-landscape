# Abu Cowork

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Abu is a local-first Cowork application whose Design surface is broader than a single generator. Built-in frontend, canvas, infographic and artifact skills write ordinary workspace files; a side-by-side code canvas lets the user inspect, edit, preview and roll those files back.

## Saved pages and inline widgets have different authority

Abu distinguishes ephemeral chat visualizations from durable artifacts. [`guidelines.ts`](https://github.com/PM-Shawn/Abu-Cowork/blob/307dbacd9b97b3cd278faef645bc75d1a05b2ddf/src/core/widget/guidelines.ts) constrains HTML, SVG, Mermaid and infographic widgets inside a sandboxed chat frame. A design the user should keep must instead be written as a complete HTML document in the workspace, where the preview panel and code editor operate on the file itself.

The widget CSS and the model-facing vocabulary are generated from the same constants in [`designSystem.ts`](https://github.com/PM-Shawn/Abu-Cowork/blob/307dbacd9b97b3cd278faef645bc75d1a05b2ddf/src/core/widget/designSystem.ts). This avoids a subtle agent-host failure: asking the model to use tokens that the renderer never defines.

```text
brief + selected skill -> workspace HTML/SVG/PPTX or inline widget
-> live preview + CodeMirror correction -> autosaved source file
-> version snapshot -> further agent/user edits -> rollback if needed
```

[`canvasVersions.ts`](https://github.com/PM-Shawn/Abu-Cowork/blob/307dbacd9b97b3cd278faef645bc75d1a05b2ddf/src/utils/canvasVersions.ts) and `VersionHistoryMenu` implement named snapshots and restore for canvas files. [`editorReconcile.ts`](https://github.com/PM-Shawn/Abu-Cowork/blob/307dbacd9b97b3cd278faef645bc75d1a05b2ddf/src/utils/editorReconcile.ts) handles the race between local editor text and agent filesystem updates. The workspace file remains authoritative; previews, chat messages and inline widgets are projections or transient evidence.

Abu is Apache-2.0 licensed. The maintainer profile does not state a reliable region.

## Pinned evidence

- [Repository](https://github.com/PM-Shawn/Abu-Cowork/tree/307dbacd9b97b3cd278faef645bc75d1a05b2ddf)
- [Preview state](https://github.com/PM-Shawn/Abu-Cowork/blob/307dbacd9b97b3cd278faef645bc75d1a05b2ddf/src/stores/previewStore.ts)
- [HTML widget receiver](https://github.com/PM-Shawn/Abu-Cowork/blob/307dbacd9b97b3cd278faef645bc75d1a05b2ddf/src/components/chat/HtmlWidgetBlock.tsx)
- [Apache-2.0 license](https://github.com/PM-Shawn/Abu-Cowork/blob/307dbacd9b97b3cd278faef645bc75d1a05b2ddf/LICENSE)
