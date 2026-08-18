# FigmaLint

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FigmaLint is an AI-assisted governance plugin that audits a live Figma document and can apply approved repairs to that same native graph. It combines deterministic token, component and consistency checks with AI explanation instead of treating a generated report as the end product.

## Fixes mutate the inspected document

[`component-analyzer.ts`](https://github.com/southleft/figmalint/blob/247b0a8bc063e382053d3a7c958a3dc44edc59d7/src/core/component-analyzer.ts), [`token-analyzer.ts`](https://github.com/southleft/figmalint/blob/247b0a8bc063e382053d3a7c958a3dc44edc59d7/src/core/token-analyzer.ts) and the consistency engine construct findings from Figma nodes. After user approval, token and naming fixers bind variables, rename layers and update properties through the plugin runtime.

The UI message handler separates analysis from mutation and restores local session state. Markdown, JSON and an AI-oriented prompt export are secondary evidence packages; the Figma document remains authoritative. The maintainer's first-party profile identifies New Orleans, United States.

## Evidence

- [Pinned repository](https://github.com/southleft/figmalint/tree/247b0a8bc063e382053d3a7c958a3dc44edc59d7)
- [Token fixer](https://github.com/southleft/figmalint/blob/247b0a8bc063e382053d3a7c958a3dc44edc59d7/src/fixes/token-fixer.ts)
- [Plugin entrypoint](https://github.com/southleft/figmalint/blob/247b0a8bc063e382053d3a7c958a3dc44edc59d7/src/code.ts)
- [Maintainer profile](https://github.com/southleft)
