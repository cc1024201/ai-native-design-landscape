# AI Website Builder by Dennis Faucher

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Dennis Faucher's builder deliberately uses one complete HTML document as its artifact. Disk files and a prompt-history file make the authority inspectable without implying a structured component graph.

## OpenRouter replaces the whole document

[server.js](https://github.com/DennisFaucher/ai-website-builder/blob/ea1f725df21a59b5341da16ac3a00804e3a1d758/server.js) sends a prompt through OpenRouter and expects a complete HTML response. It writes the accepted result to the data directory rather than storing a hidden provider-side project.

## History records prompts and outputs at file granularity

The same server appends generation records to a JSON history file. This makes prior outputs inspectable but the implementation does not expose branching semantic diffs or element-level restoration.

## Preview and download are separate HTTP paths

[public/index.html](https://github.com/DennisFaucher/ai-website-builder/blob/ea1f725df21a59b5341da16ac3a00804e3a1d758/public/index.html) supplies the ordinary-user prompt and result surface. The server launches a preview path for the current HTML and provides the document for download so the same file governs visual proof and delivery.

## Evidence

- [Canonical repository](https://github.com/DennisFaucher/ai-website-builder)
- [Inspected tree](https://github.com/DennisFaucher/ai-website-builder/tree/ea1f725df21a59b5341da16ac3a00804e3a1d758)
- Commit: ea1f725df21a59b5341da16ac3a00804e3a1d758
