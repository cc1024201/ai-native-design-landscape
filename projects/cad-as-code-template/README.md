# CAD-as-Code Template

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CAD-as-Code Template is a turnkey build123d workspace that applies source control, typed code, tests, containers, continuous integration and releases to parametric design. Coding agents operate in the same environment as the model source and OCP viewer rather than guessing at opaque desktop CAD state.

## `cad/` is the source of truth

Python models under `cad/` define geometry. Local and CI checks validate execution and dimensions; the viewer exposes sections and internal features; release jobs regenerate STEP, STL and GLB. Meshes, renders and bundles are derived and can be discarded or rebuilt from the versioned source.

The separately named Parametric Canvas Command Hook repository has identical README, agent contract and export implementation blobs at the checked revision. It is therefore a duplicate source surface of this template rather than a second product.

- [Pinned repository](https://github.com/Coffee2Bits/CAD-as-Code-Template/tree/a7cb3b58560964313cd0d2286919afa63b8f4577)
- [Agent contract](https://github.com/Coffee2Bits/CAD-as-Code-Template/blob/a7cb3b58560964313cd0d2286919afa63b8f4577/AGENTS.md)
- [Export implementation](https://github.com/Coffee2Bits/CAD-as-Code-Template/blob/a7cb3b58560964313cd0d2286919afa63b8f4577/cad_tooling/export.py)
- [Maintainer profile checked; no location published](https://github.com/Coffee2Bits)
