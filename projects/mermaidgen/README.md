# MermaidGen

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MermaidGen is a compact example of source-authoritative AI design. Gemini does not produce an opaque visual artifact; it proposes Mermaid text that immediately enters the same editor, parser and renderer used for manual correction.

## Generation is only an alternate way to populate source

At commit [`119d7c9b`](https://github.com/adimaryanto-stack/mermaidgen/tree/119d7c9bf342506282e9be50688de3d039af5747), [`AIGenerator.tsx`](https://github.com/adimaryanto-stack/mermaidgen/blob/119d7c9bf342506282e9be50688de3d039af5747/src/components/AIGenerator.tsx) calls Gemini 2.5 Flash directly from the browser. It asks for Mermaid, strips Markdown fences and hands the result to the application’s single `code` state. Choosing a template follows the same replacement path.

There is no agent tool loop and no canvas-aware patch protocol. The model sees the prompt, not a structured representation of the current diagram, and a new response replaces the current source rather than applying a semantic delta.

## Mermaid is both validator and rendering runtime

[`App.tsx`](https://github.com/adimaryanto-stack/mermaidgen/blob/119d7c9bf342506282e9be50688de3d039af5747/src/App.tsx) runs `mermaid.parse(code)` and reports syntax validity. [`Preview.tsx`](https://github.com/adimaryanto-stack/mermaidgen/blob/119d7c9bf342506282e9be50688de3d039af5747/src/components/Preview.tsx) then uses Mermaid v11 to render the same source into SVG. A user fixes failed generation by editing the authoritative text, not by asking a second hidden representation to reconcile with it.

The renderer is configured with `securityLevel: "loose"`. That preserves Mermaid’s richer linking and HTML behavior, while making generated or pasted source a browser-rendering trust boundary rather than inert text.

## Delivery is a derivative of an ephemeral session

[`ExportButtons.tsx`](https://github.com/adimaryanto-stack/mermaidgen/blob/119d7c9bf342506282e9be50688de3d039af5747/src/components/ExportButtons.tsx) serializes the rendered SVG or rasterizes it into PNG; it can also copy a PNG to the clipboard. The UI does not provide a Mermaid-source download, although the visible editor still lets a person copy the text manually.

The current source itself has no database, browser persistence, named versions or share-link protocol. Refreshing the page loses the working session, and the repository roadmap still treats history and sharing as future work. MermaidGen therefore completes a generate–validate–correct–export loop, but not a durable artifact lifecycle.

Its value in the landscape is precision: “AI design” here means source generation governed by a real compiler-like parser and live projection. The model supplies a candidate; Mermaid source remains the inspectable authority.

## Evidence

- [Pinned repository](https://github.com/adimaryanto-stack/mermaidgen/tree/119d7c9bf342506282e9be50688de3d039af5747)
- [Direct Gemini generation path](https://github.com/adimaryanto-stack/mermaidgen/blob/119d7c9bf342506282e9be50688de3d039af5747/src/components/AIGenerator.tsx)
- [Parse gate and source state](https://github.com/adimaryanto-stack/mermaidgen/blob/119d7c9bf342506282e9be50688de3d039af5747/src/App.tsx)
- [Rendered derivative exports](https://github.com/adimaryanto-stack/mermaidgen/blob/119d7c9bf342506282e9be50688de3d039af5747/src/components/ExportButtons.tsx)
