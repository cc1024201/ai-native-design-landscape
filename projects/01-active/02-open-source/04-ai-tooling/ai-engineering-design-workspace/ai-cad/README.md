# AI-CAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI-CAD is a browser parametric workspace in which chat, a feature tree, a 2D sketcher, Monaco source and MCP all converge on a Replicad/OpenCascade model.

## Features generate source and source regenerates geometry

[`cad-store.ts`](https://github.com/vespo92/AI-CAD/blob/53f27b43bd5c9d1b7f6fc2ad64553b2c662911df/src/lib/store/cad-store.ts) owns the feature structure, assembly, editor code, mesh projection, selection and undo/redo. Feature insertion generates Replicad TypeScript; a Web Worker executes it against OpenCascade WASM. Property-manager cancellation can revert edits before they join history.

[`tool-handlers.ts`](https://github.com/vespo92/AI-CAD/blob/53f27b43bd5c9d1b7f6fc2ad64553b2c662911df/src/lib/mcp/tool-handlers.ts) uses the same source and model facts for external agents. IndexedDB provides local file/project persistence, and exports target manufacturing and downstream CAD formats.

The product has broad aspirational integrations, but the dossier relies only on the pinned local store, engine, editor and MCP implementation. The maintainer reports Chicago, United States.

## Evidence

- [Pinned repository](https://github.com/vespo92/AI-CAD/tree/53f27b43bd5c9d1b7f6fc2ad64553b2c662911df)
- [Canonical CAD store](https://github.com/vespo92/AI-CAD/blob/53f27b43bd5c9d1b7f6fc2ad64553b2c662911df/src/lib/store/cad-store.ts)
- [Feature code generation](https://github.com/vespo92/AI-CAD/blob/53f27b43bd5c9d1b7f6fc2ad64553b2c662911df/src/lib/cad-engine/feature-codegen.ts)
- [Maintainer location evidence](https://github.com/vespo92)
