# BrandDocs

> Research status: **Source-level** · Lifecycle: **active alpha** · Last reviewed: **2026-08-12**

BrandDocs learns a company's existing Word, PowerPoint or Excel template into a portable Brand Profile and then generates same-format documents from the original shell.

## Artifact pointers make brand compliance fail closed

The shared engine runs `extract → comprehend → verify → generate`; model-assisted steps can name captured facts but cannot invent styles, colors or fonts. Profiles point to real template artifacts, and generation publishes atomically only after deterministic checks. Render-based visual QA can detect overflow, blank pages, clipping and stale sample content.

DOCX is the mature reference lane; PPTX and XLSX share the engine but had not reached parity at the reviewed revision. Formula, structure and layout preservation are format-specific rather than a cross-format conversion promise.

- [Pinned repository](https://github.com/ferdinandobons/brand-docs/tree/97a6e384cb0664cd44ba8113c0b80c9761700670)
- [Skill contracts](https://github.com/ferdinandobons/brand-docs/blob/97a6e384cb0664cd44ba8113c0b80c9761700670/documentation/SKILLS.md)
- [Brand engine](https://github.com/ferdinandobons/brand-docs/tree/97a6e384cb0664cd44ba8113c0b80c9761700670/scripts/brandkit)
- [Maintainer profile checked; no location published](https://github.com/ferdinandobons)
