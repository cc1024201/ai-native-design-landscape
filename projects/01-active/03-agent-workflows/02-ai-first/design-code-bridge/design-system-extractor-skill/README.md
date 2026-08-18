# Design System Extractor Skill

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project is an executable agent skill for reconstructing a design system from heterogeneous evidence. Unlike a URL-only scraper, it can begin from a live site, running application, screenshots or repository and must report what each evidence source can and cannot establish.

## Output is a reviewed evidence package

The pinned [`SKILL.md`](https://github.com/simonbloom/design-system-extractor-skill/blob/1055785011c9488ad2588ebf2a964f475727eae9/skills/design-system-extractor/SKILL.md) routes the agent through evidence collection, route and component coverage, token synthesis and preview inspection. [`output-contract.md`](https://github.com/simonbloom/design-system-extractor-skill/blob/1055785011c9488ad2588ebf2a964f475727eae9/skills/design-system-extractor/references/output-contract.md) requires more than `DESIGN.md`:

- design tokens in JSON and CSS forms;
- a standalone light/dark preview;
- extraction notes and source coverage;
- confidence and known-gap statements;
- screenshots that let a reviewer compare the reconstruction.

The bundled [validator](https://github.com/simonbloom/design-system-extractor-skill/blob/1055785011c9488ad2588ebf2a964f475727eae9/skills/design-system-extractor/scripts/validate-design-md.sh) and [preview renderer](https://github.com/simonbloom/design-system-extractor-skill/blob/1055785011c9488ad2588ebf2a964f475727eae9/skills/design-system-extractor/scripts/render-design-preview.py) make the workflow operational rather than advisory prose.

## Authority and correction

The generated design document and token files become the portable authority for later coding-agent work. Screenshots and previews remain evidence. Correction means revisiting missing routes or components, editing the files and rerendering; there is no write-back to the sampled product and no hosted version service.

The repository has no license file and no reliable maintainer-region evidence.

## Pinned evidence

- [Repository at `1055785`](https://github.com/simonbloom/design-system-extractor-skill/tree/1055785011c9488ad2588ebf2a964f475727eae9)
- [Complete worked example](https://github.com/simonbloom/design-system-extractor-skill/tree/1055785011c9488ad2588ebf2a964f475727eae9/examples/bloomindesign)
