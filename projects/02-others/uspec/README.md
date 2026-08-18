# uSpec

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

uSpec is a Figma component-documentation roundtrip whose durable authority is Component Markdown. Figma supplies the observed component; agent skills normalize it into a portable contract; other skills render selected contract sections back into Figma as documentation frames.

## Capture is staged before synthesis

The open Figma plugin walks the selected component in phases and writes `_base.json`. Its [base schema](https://github.com/redongreen/uSpec/blob/9c993248a32e6fbe520e116eeb08f18ec7a960b1/figma-plugin/docs/base-json-schema.md) captures structure, variants, styles and accessibility-relevant evidence. Separate extraction skills add API, color, structure, motion and screen-reader information. [`create-component-md`](https://github.com/redongreen/uSpec/blob/9c993248a32e6fbe520e116eeb08f18ec7a960b1/skills/create-component-md/SKILL.md) assembles the canonical document.

```text
Figma component -> plugin _base.json -> staged extractions
-> Component Markdown source of truth
-> create-* skills -> native Figma annotation frames
```

Hashes and staging make incomplete evidence visible instead of silently overwriting a complete spec. The rendered Figma frames are projections of Markdown; edits made only to those frames are not a reverse update. Files and Git provide versioning.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Decisive evidence

- [Pinned repository](https://github.com/redongreen/uSpec/tree/9c993248a32e6fbe520e116eeb08f18ec7a960b1)
- [Plugin phase A](https://github.com/redongreen/uSpec/blob/9c993248a32e6fbe520e116eeb08f18ec7a960b1/figma-plugin/src/phaseA.ts)
- [Markdown template](https://github.com/redongreen/uSpec/blob/9c993248a32e6fbe520e116eeb08f18ec7a960b1/references/component-md/component-md-template.md)
- [MIT license](https://github.com/redongreen/uSpec/blob/9c993248a32e6fbe520e116eeb08f18ec7a960b1/LICENSE)
