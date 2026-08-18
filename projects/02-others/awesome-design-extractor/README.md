# Awesome Design Extractor

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Awesome Design Extractor is an evidence-backed agent workflow for producing a `DESIGN.md` and a recreated visual catalog from a reference product. Its central rule is epistemic: observed facts, inferred patterns and unresolved uncertainty must remain distinguishable.

## Evidence survives beside the design document

[`extraction-workflow.md`](https://github.com/Myoji/awesome-design-extractor/blob/339639d836dcbafdfdef540a17c17ebb923f0cb0/skills/awesome-design-extractor/references/extraction-workflow.md) directs the agent through page and asset evidence before synthesis. [`output-contract.md`](https://github.com/Myoji/awesome-design-extractor/blob/339639d836dcbafdfdef540a17c17ebb923f0cb0/skills/awesome-design-extractor/references/output-contract.md) requires:

- a portable `DESIGN.md` with rationale and tokens;
- a standalone preview that recreates the system without pretending to copy the product;
- QA findings and completeness notes;
- protected metadata for references or assets that must not be redistributed;
- explicit uncertainty where public evidence cannot support a decision.

The worked automotive examples pair each design document with `preview.html` and `preview-qa.json`. [`validate-preview-catalog.mjs`](https://github.com/Myoji/awesome-design-extractor/blob/339639d836dcbafdfdef540a17c17ebb923f0cb0/scripts/validate-preview-catalog.mjs) checks the catalog structure.

## Artifact relationship

```text
public reference evidence -> observations + uncertainty
-> DESIGN.md authority -> recreated preview -> QA correction
```

The preview is a falsification surface for the extracted rules; it is not the sampled site's source and there is no write-back. Files and Git provide persistence. The repository is MIT-licensed. No reliable maintainer-region evidence was found.

## Primary sources

- [Pinned repository](https://github.com/Myoji/awesome-design-extractor/tree/339639d836dcbafdfdef540a17c17ebb923f0cb0)
- [Main skill](https://github.com/Myoji/awesome-design-extractor/blob/339639d836dcbafdfdef540a17c17ebb923f0cb0/skills/awesome-design-extractor/SKILL.md)
- [MIT license](https://github.com/Myoji/awesome-design-extractor/blob/339639d836dcbafdfdef540a17c17ebb923f0cb0/LICENSE)
