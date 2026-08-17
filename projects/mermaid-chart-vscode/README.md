# Mermaid Chart for VS Code

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Mermaid Chart for VS Code joins Copilot assistance to a source-native diagram editor. The `.mmd` document remains the authority while previews, variants and cloud collaboration operate around it.

## AI changes are proposals

At commit [`cb06a561`](https://github.com/Mermaid-Chart/vscode-mermaid-chart/tree/cb06a561219a886fcb2ead591fdf919a89f0902c), generation and repair can create competing source. A diff provider and review workflow let the user inspect and explicitly apply a change instead of silently overwriting the open document.

## Visual work returns to text

The webview renders Mermaid, supports export and exposes direct manipulation paths such as drag and drop. The extension then synchronizes the resulting diagram data with the VS Code document. Optional remote sync adds a hosted layer without replacing local source authority.

## Why the companion preview is not another product

The same organization also surfaces preview utilities. This census counts the integrated creation-and-review extension once because those companion surfaces do not establish an independent artifact lifecycle.

## Evidence

- [Pinned repository](https://github.com/Mermaid-Chart/vscode-mermaid-chart/tree/cb06a561219a886fcb2ead591fdf919a89f0902c)
- [Improvement diff provider](https://github.com/Mermaid-Chart/vscode-mermaid-chart/blob/cb06a561219a886fcb2ead591fdf919a89f0902c/src/diagramImprovementDiffProvider.ts)
- [Apply workflow](https://github.com/Mermaid-Chart/vscode-mermaid-chart/blob/cb06a561219a886fcb2ead591fdf919a89f0902c/src/appCommitWorkflow.ts)
- [Preview and export surface](https://github.com/Mermaid-Chart/vscode-mermaid-chart/blob/cb06a561219a886fcb2ead591fdf919a89f0902c/webview/src/App.svelte)
