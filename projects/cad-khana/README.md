# CAD Khana

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CAD Khana is a diagnostics-first build123d workbench and agent skill. It asks the model to express geometry as pure declarations, accompany it with assertions and mechanism metadata, and produce evidence that can be checked before a part is treated as successful.

## Assertions and mechanism records outrank a plausible render

Parametric Python and exported BREP-derived files remain authoritative. The viewer and drawings expose geometry, but assertions test dimensions and topology while `mechanism.json` records relationships that a screenshot cannot prove. Failed diagnostics return the agent to source correction rather than encouraging visual rationalization.

This makes CAD Khana distinct from a prose-to-CAD wrapper: its product claim is a recoverable evidence chain across declarations, checks, viewer projections, engineering drawings and exports.

- [Pinned repository](https://github.com/cyberchitta/cad-khana/tree/9a03ccf148744ec9d4cf14b29e4e2e1e5532890f)
- [CAD Khana skill](https://github.com/cyberchitta/cad-khana/blob/9a03ccf148744ec9d4cf14b29e4e2e1e5532890f/skills/cad-khana/SKILL.md)
- [Export implementation](https://github.com/cyberchitta/cad-khana/blob/9a03ccf148744ec9d4cf14b29e4e2e1e5532890f/src/cad_khana/export.py)
- [Organization profile checked; no location published](https://github.com/cyberchitta)
