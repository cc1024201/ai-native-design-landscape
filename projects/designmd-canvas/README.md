# DESIGN.md Canvas

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

DESIGN.md Canvas is a GitHub Copilot CLI canvas for inspecting and correcting a design-system document. It is unusual because the open canvas owns a separate working artifact: it may load a repository `DESIGN.md`, but live edits do not silently overwrite that file.

## The canvas joins source and visual diagnostics

[`extension.mjs`](https://github.com/cmaneu/designmd-canvas/blob/c70604745a94d4c89df83ae231335b14293d148f/extension.mjs) exposes agent-facing `load`, `reload_workspace`, `get_report` and `get_content` actions. A loopback server renders the canvas and streams updates over server-sent events. [`parser.mjs`](https://github.com/cmaneu/designmd-canvas/blob/c70604745a94d4c89df83ae231335b14293d148f/parser.mjs) and [`color.mjs`](https://github.com/cmaneu/designmd-canvas/blob/c70604745a94d4c89df83ae231335b14293d148f/color.mjs) support offline parsing and contrast analysis.

Inside the [`renderer.mjs`](https://github.com/cmaneu/designmd-canvas/blob/c70604745a94d4c89df83ae231335b14293d148f/renderer.mjs) shell, source edits immediately rerender typography, spacing, color and component views. [`client.js`](https://github.com/cmaneu/designmd-canvas/blob/c70604745a94d4c89df83ae231335b14293d148f/client.js) also maps an inline color-picker change back into the displayed markdown before rerunning lint and contrast checks.

## Two persistence scopes

```text
workspace DESIGN.md -> load -> per-canvas artifact
                           <-> source editor / preview / linter
agent reads report/content <-'
```

Per-instance state lives under the extension's `artifacts/` directory. Saving a corrected canvas artifact back into the repository is an explicit later action; auto-load is read-only. This prevents preview interaction from becoming an unannounced source mutation but also means users must deliberately promote accepted changes.

The project is ISC-licensed. The maintainer profile reports France.

## Evidence

- [Pinned source](https://github.com/cmaneu/designmd-canvas/tree/c70604745a94d4c89df83ae231335b14293d148f)
- [ISC license](https://github.com/cmaneu/designmd-canvas/blob/c70604745a94d4c89df83ae231335b14293d148f/LICENSE)
