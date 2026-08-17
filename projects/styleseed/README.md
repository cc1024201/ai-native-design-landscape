# StyleSeed

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

StyleSeed is a design-method compiler and verification layer for coding agents. Its contribution is not another component collection: it turns a selected grammar, surface adapter, brand recipe, palette and bounded project choices into a persistent design lock and a small hash-verifiable rule bundle.

## The lock controls drift; the renderer remains replaceable

`STYLESEED.md` records the chosen design direction. [`resolve-context.mjs`](https://github.com/bitjaru/styleseed/blob/1a00699d1a8ec083f53a0cd5196de2b252c1e0ed/engine/.claude/skills/ss-resolve/scripts/resolve-context.mjs) composes the active context into `.styleseed/effective-rules.md` and a manifest containing selections and source hashes. [`validate-engine.mjs`](https://github.com/bitjaru/styleseed/blob/1a00699d1a8ec083f53a0cd5196de2b252c1e0ed/scripts/validate-engine.mjs) exercises selection, bundle hashing, drift detection and the score-before-visual-verify ordering.

```text
product job + references -> three distinct directions -> human selection
-> STYLESEED.md -> deterministic context bundle + provenance manifest
-> agent changes repository source -> code score >= 80
-> real render/screenshot review -> fix and re-render -> human evidence
```

[`STUDIO-PIPELINE.md`](https://github.com/bitjaru/styleseed/blob/1a00699d1a8ec083f53a0cd5196de2b252c1e0ed/engine/STUDIO-PIPELINE.md) preserves rejected directions and the selection rationale before implementation. The repository source remains the final UI authority; StyleSeed owns the constraint compilation, decision record and evidence gates. That separation lets the same method target product UI, decks, documents and single frames without pretending to own every renderer.

The project is MIT licensed. The maintainer profile does not provide reliable region evidence. Reported benchmark gains are not treated as independent validation here.

## Evidence

- [Pinned repository](https://github.com/bitjaru/styleseed/tree/1a00699d1a8ec083f53a0cd5196de2b252c1e0ed)
- [Architecture contract](https://github.com/bitjaru/styleseed/blob/1a00699d1a8ec083f53a0cd5196de2b252c1e0ed/engine/ARCHITECTURE.md)
- [Context resolver](https://github.com/bitjaru/styleseed/blob/1a00699d1a8ec083f53a0cd5196de2b252c1e0ed/engine/.claude/skills/ss-resolve/scripts/resolve-context.mjs)
- [Studio decision pipeline](https://github.com/bitjaru/styleseed/blob/1a00699d1a8ec083f53a0cd5196de2b252c1e0ed/engine/STUDIO-PIPELINE.md)
- [Executable contract validation](https://github.com/bitjaru/styleseed/blob/1a00699d1a8ec083f53a0cd5196de2b252c1e0ed/scripts/validate-engine.mjs)
