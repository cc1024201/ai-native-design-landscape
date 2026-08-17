# TypeUI DESIGN.md Extractor

> Research status: **Source-level** · Last reviewed: **2026-08-12**

This Chrome extension converts the current rendered website into a portable design-governance artifact. Its model role is downstream: it prepares `DESIGN.md` or `SKILL.md` so coding agents can reproduce the observed system with explicit tokens and constraints.

## Extraction and generation are separate

The content script reads typography, colors, spacing, radii, shadows and motion from the active tab. Normalization converts raw browser observations into a stable structure. Separate generators emit either the TypeUI-compatible design document or an agent skill. The popup lets the user refresh, inspect an explanation and download the chosen artifact.

This separation prevents the markdown from masquerading as raw evidence:

```text
active page -> computed signals -> normalized evidence
            -> DESIGN.md generator -> download
            -> SKILL.md generator  -> download
```

## Commit-level trace

Pinned commit [`8e07614`](https://github.com/bergside/design-md-chrome/commit/8e07614fb18752ab1ee14dd65a8ff93e63c9b13b) includes:

- [`content-script.js`](https://github.com/bergside/design-md-chrome/blob/8e07614fb18752ab1ee14dd65a8ff93e63c9b13b/content-script.js);
- [normalization](https://github.com/bergside/design-md-chrome/blob/8e07614fb18752ab1ee14dd65a8ff93e63c9b13b/lib/normalize.mjs) and [validation](https://github.com/bergside/design-md-chrome/blob/8e07614fb18752ab1ee14dd65a8ff93e63c9b13b/lib/validate.mjs);
- independent [DESIGN.md](https://github.com/bergside/design-md-chrome/blob/8e07614fb18752ab1ee14dd65a8ff93e63c9b13b/lib/generate-design-md.mjs) and [SKILL.md](https://github.com/bergside/design-md-chrome/blob/8e07614fb18752ab1ee14dd65a8ff93e63c9b13b/lib/generate-skill-md.mjs) generators;
- popup behavior and a test runner in the repository.

## Boundary

The extension does not edit the source website or become a canvas. Its artifact is the extracted design-system document, later consumed by another agent. The code is MIT-licensed and published in the Chrome Web Store. Bergside's organization profile gives Romania as location.

## Decisive sources

- [Repository README](https://github.com/bergside/design-md-chrome/blob/8e07614fb18752ab1ee14dd65a8ff93e63c9b13b/README.md)
- [Chrome Web Store listing](https://chromewebstore.google.com/detail/designmd-style-extractor/ogpdnchdjiibhobphelbbkemnnemkfma)
- [MIT license](https://github.com/bergside/design-md-chrome/blob/8e07614fb18752ab1ee14dd65a8ff93e63c9b13b/LICENSE)
- [Organization profile](https://github.com/bergside)
