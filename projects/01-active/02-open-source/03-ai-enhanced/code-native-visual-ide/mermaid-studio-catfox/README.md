# MermaidStudio by CatFoxVoyager

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This MermaidStudio is a dual-mode authoring environment: Mermaid text remains authoritative while a visual surface and AI commands help users construct, repair, and refine it.

## Source and visual editing stay coupled

The editor parses Mermaid source into a live preview and exposes visual drag interactions without redefining the result as an opaque canvas file. Changes must return to valid Mermaid syntax. Generation, syntax repair, and enhancement therefore operate on a portable code artifact that can leave the application.

## Local and remote inference are product choices

The source contains several inference routes: browser-side WebGPU models, Ollama, OpenAI-compatible endpoints, and cloud providers. This is more than a provider dropdown because the local paths change where diagram context is processed. The application still validates generated Mermaid before treating it as usable design state.

## History is bounded and local

Local storage holds the working state and a bounded history of roughly 50 versions. That supports quick recovery but is not equivalent to a collaborative repository or server-side audit log. Exported Mermaid remains the most durable and interoperable artifact.

## Pinned evidence

- Repository: [CatFoxVoyager/MermaidStudio](https://github.com/CatFoxVoyager/MermaidStudio)
- Inspected tree: [`e527d8efc164a6b972c62584342091e32aeea1ac`](https://github.com/CatFoxVoyager/MermaidStudio/tree/e527d8efc164a6b972c62584342091e32aeea1ac)
- Immutable revision: [commit `e527d8e`](https://github.com/CatFoxVoyager/MermaidStudio/commit/e527d8efc164a6b972c62584342091e32aeea1ac)
