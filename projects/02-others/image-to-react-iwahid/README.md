# Image to React Component Converter by Imroz Wahid

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project defines the artifact as editable TSX translated from a visual reference. It also reveals an important difference between implemented infrastructure and the surface an ordinary user can actually reach.

## One image tool serves agents and the browser

[`Program.cs`](https://github.com/iwahid7025/ImageToReactComponentConverter/blob/ea9d4a02c0209e2226405c7e1b97b5e86e176435/server/ImageToReact.McpServer/Program.cs) exposes image-to-React and code-refinement functions as MCP tools and as REST endpoints. OpenAI vision receives the uploaded image and must return one TSX component; the server extracts the fenced source and supplies a conspicuous error component if the required default export is absent.

## Source is the current authority

[`App.tsx`](https://github.com/iwahid7025/ImageToReactComponentConverter/blob/ea9d4a02c0209e2226405c7e1b97b5e86e176435/app/src/App.tsx) replaces its in-memory TSX after generation or AI refinement. Monaco edits mutate the same state, and copy plus `.tsx` download deliver exactly that current source. There is no project store or version graph in the inspected application.

## The preview exists in source but not in the product route

[`PreviewPane.tsx`](https://github.com/iwahid7025/ImageToReactComponentConverter/blob/ea9d4a02c0209e2226405c7e1b97b5e86e176435/app/src/components/PreviewPane.tsx) contains a script-only iframe that loads TypeScript and React, transpiles TSX and renders its default export. The current `App.tsx` never imports or mounts it; the ordinary user sees upload controls and Monaco only. The record therefore counts a real visual-to-code loop but does not claim a shipped visual feedback loop.

## Evidence

- [Canonical repository](https://github.com/iwahid7025/ImageToReactComponentConverter)
- [Inspected tree](https://github.com/iwahid7025/ImageToReactComponentConverter/tree/ea9d4a02c0209e2226405c7e1b97b5e86e176435)
- Commit: `ea9d4a02c0209e2226405c7e1b97b5e86e176435`
