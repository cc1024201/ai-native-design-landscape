# CLI-Anything

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CLI-Anything is a generation framework and registry for making existing GUI software agent-native. It is counted as one collection product, not one census record per harness. The Design evidence comes from its concrete FreeCAD, Blender, GIMP, Krita, Inkscape, Draw.io and related implementations.

## A harness must preserve truth and reversibility

The project prescribes a seven-phase construction process that first inspects the real application and then builds state, operations, rendering, export and tests. Its Design harnesses use structured project state, session-scoped undo/redo and machine-readable JSON responses. Preview bundles contain rendered evidence and an immutable trajectory so an agent can compare what changed rather than trusting a success string.

[`freecad/agent-harness`](https://github.com/HKUDS/CLI-Anything/tree/39634a640cf20bc603b4faae4d31069c44821a9a/freecad/agent-harness) exposes hundreds of CAD operations, structured project state, native `FCStd` and engineering exports. [`gimp/agent-harness`](https://github.com/HKUDS/CLI-Anything/tree/39634a640cf20bc603b4faae4d31069c44821a9a/gimp/agent-harness) shows the different layered-image shape of the same contract. This collection-level framework is the independent product; individual generated harnesses are components.

The HKUDS organization reports Hong Kong. The evidence supports a maintainer umbrella, not a claim that all harness contributors are one internal team.

## Evidence

- [Pinned repository and methodology](https://github.com/HKUDS/CLI-Anything/tree/39634a640cf20bc603b4faae4d31069c44821a9a)
- [Preview methodology](https://github.com/HKUDS/CLI-Anything/blob/39634a640cf20bc603b4faae4d31069c44821a9a/cli-anything-plugin/guides/preview-methodology.md)
- [FreeCAD harness contract](https://github.com/HKUDS/CLI-Anything/blob/39634a640cf20bc603b4faae4d31069c44821a9a/freecad/agent-harness/cli_anything/freecad/README.md)
- [Maintainer location evidence](https://github.com/HKUDS)
