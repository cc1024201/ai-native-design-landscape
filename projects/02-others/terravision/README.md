# TerraVision

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

TerraVision turns Terraform infrastructure into architecture diagrams. Its core Design decision is to recover resource relationships from infrastructure source and emit a diagram whose nodes still use native Draw.io cloud shapes rather than a flattened screenshot.

## Infrastructure source governs diagram generation

Provider resource classes and shape maps translate Terraform concepts to AWS, Azure and GCP visual vocabulary. The Draw.io emitter creates editable XML; an HTML renderer offers another projection, and smoke/emitter tests guard the conversion. The repository records specific learnings about native Draw.io output, making the materialization boundary inspectable.

Terraform remains the infrastructure authority and the generated diagram is a derived but editable coordination artifact. Subsequent manual diagram edits do not silently rewrite infrastructure, so this is one-way source-to-visual materialization rather than live bidirectional synchronization.

## Evidence

- [Pinned repository](https://github.com/patrickchugh/terravision/tree/69bae0199bf206ae106c686eac5d66a0f8331762)
- [Draw.io emitter](https://github.com/patrickchugh/terravision/blob/69bae0199bf206ae106c686eac5d66a0f8331762/modules/drawio_emitter.py)
- [Native Draw.io design notes](https://github.com/patrickchugh/terravision/blob/69bae0199bf206ae106c686eac5d66a0f8331762/docs/LEARNINGS_DRAWIO_NATIVE.md)
- [Emitter tests](https://github.com/patrickchugh/terravision/blob/69bae0199bf206ae106c686eac5d66a0f8331762/tests/test_drawio_emitter.py)
