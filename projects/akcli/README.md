# akcli

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

akcli is a zero-package-dependency Python CLI for AI-native KiCad schematic design. A versioned JSON op-list can create or edit hierarchical `.kicad_sch` files through atomic writes, whole-tree net-diff safety, deterministic UUIDs, backups and undo.

## One normalized model carries the checks

KiCad and read-only Altium inputs project into a common JSON model. Authoring, ERC-lite, intent contracts, schematic/PCB equivalence, simulation, part sourcing, SVG rendering and release preflight all consume that model. Dry runs and strict-net gates reveal the mutation before it touches source.

The native KiCad document remains the delivery authority; op-lists, diffs, SARIF, SVG and manifests make changes inspectable. Advisory review and simulation do not establish production safety or replace KiCad and human engineering checks.

- [Pinned repository](https://github.com/tipoLi5890/akcli/tree/1bde6126c1d540418e7d74bcc5d23ae216ee41c5)
- [Core source](https://github.com/tipoLi5890/akcli/tree/1bde6126c1d540418e7d74bcc5d23ae216ee41c5/src)
- [Design integrity contract](https://github.com/tipoLi5890/akcli/blob/1bde6126c1d540418e7d74bcc5d23ae216ee41c5/docs/design-integrity.md)
- [Maintainer profile: Taiwan](https://github.com/tipoLi5890)
