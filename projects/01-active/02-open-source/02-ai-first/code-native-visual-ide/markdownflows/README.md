# MarkdownFlows

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MarkdownFlows is a small desktop answer to a precise question: what if AI edits the same Mermaid text a person sees? Its authority is the source string. The rendered diagram is feedback and the exported SVG or PNG is delivery.

## Source remains visible through every turn

At commit [`9ee5e448`](https://github.com/dotnetfactory/markdownflows/tree/9ee5e448af3152ae731fe30537cba81373828827) [`OpenAIService`](https://github.com/dotnetfactory/markdownflows/blob/9ee5e448af3152ae731fe30537cba81373828827/src/services/OpenAIService.ts) receives both an instruction and current Mermaid for modification. The response returns to the same editor used for direct keystrokes. This makes “add error handling” a source revision rather than a fresh picture.

[`DiagramStorageService`](https://github.com/dotnetfactory/markdownflows/blob/9ee5e448af3152ae731fe30537cba81373828827/src/services/DiagramStorageService.ts) owns local project records, while Electron secure storage protects the provider key. The [`DiagramsPage`](https://github.com/dotnetfactory/markdownflows/blob/9ee5e448af3152ae731fe30537cba81373828827/src/pages/DiagramsPage.tsx) joins library, editor, preview and export.

```text
instruction + current Mermaid
              ↓
        model revision
              ↓
editable Mermaid ⇄ live renderer → SVG / PNG
       ↓
 local diagram library
```

There is no collaborative branch model or semantic node graph beyond Mermaid syntax. That limitation is structural and useful: MarkdownFlows is counted as a code-native visual IDE rather than a native-canvas system. The organization profile supplies no region evidence.

## Commit-level evidence

- [Pinned README](https://github.com/dotnetfactory/markdownflows/blob/9ee5e448af3152ae731fe30537cba81373828827/README.md)
- [AI source-revision service](https://github.com/dotnetfactory/markdownflows/blob/9ee5e448af3152ae731fe30537cba81373828827/src/services/OpenAIService.ts)
- [Local persistence service](https://github.com/dotnetfactory/markdownflows/blob/9ee5e448af3152ae731fe30537cba81373828827/src/services/DiagramStorageService.ts)
