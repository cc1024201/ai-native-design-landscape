# KiCadAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KiCadAI is a Go toolkit that converts structured circuit requests into reviewable architecture graphs, native KiCad source and explicit evidence or refusal receipts.

## Capability gates precede file generation

Architecture search and deterministic solvers map supported electrical functions into a graph. Unknown or weakly grounded components remain untrusted; creation can stop with a refusal receipt instead of guessing. The CLI then writes project files and records provenance, checks and creation evidence around the result.

This separates model suggestions from the deterministic capability registry and KiCad-backed gates. The source supports specific circuit families and held-out tests, not unrestricted circuit synthesis or safety certification.

- [Pinned repository](https://github.com/dshills/KiCadAI/tree/e07c423ae36cd969e7aa199304299e6c6eae3632)
- [AI graph command](https://github.com/dshills/KiCadAI/blob/e07c423ae36cd969e7aa199304299e6c6eae3632/cmd/kicadai/ai_graph_design.go)
- [Creation evidence contract](https://github.com/dshills/KiCadAI/blob/e07c423ae36cd969e7aa199304299e6c6eae3632/docs/creation-evidence.md)
- [Maintainer profile: West Des Moines Iowa](https://github.com/dshills)
