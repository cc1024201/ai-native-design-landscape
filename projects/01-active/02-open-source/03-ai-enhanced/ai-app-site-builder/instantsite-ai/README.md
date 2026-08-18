# InstantSite AI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

InstantSite has a real multimodal website-generation loop surrounded by a much larger simulated platform shell. Its dossier separates those two layers so interface claims do not become architecture claims.

## Gemini produces a three-layer source bundle

[`api/generate.ts`](https://github.com/sabledattatray/InstantSite-AI/blob/1474f73754c65a7a3296ced132c85e2326024474/api/generate.ts) sends the brief, style choices, reference URL metadata and uploaded text or images to Gemini and asks for structured HTML, CSS and JavaScript. [`App.tsx`](https://github.com/sabledattatray/InstantSite-AI/blob/1474f73754c65a7a3296ced132c85e2326024474/src/App.tsx) keeps that bundle in React state and creates a ZIP with `index.html`, `style.css` and `script.js`.

## Preview editing is deliberately ephemeral

[`LivePreview.tsx`](https://github.com/sabledattatray/InstantSite-AI/blob/1474f73754c65a7a3296ced132c85e2326024474/src/components/LivePreview.tsx) writes the bundle into a sandboxed iframe and injects an element picker. Property changes are posted into the iframe DOM and update the floating inspector, but they do not rewrite the parent `site` bundle. A download therefore reflects generated source plus global palette substitution rather than arbitrary direct DOM edits.

## Platform chrome is not persistence or deployment

The same `App.tsx` hard-codes three prompt-history cards, always shows an empty projects view, emits random database and deployment log strings and implements outbound Git “push” success with nested timers. Public GitHub import and local ZIP creation do execute; the push, hosted URL, account workspace and project history do not cross a backend boundary in the inspected source.

## Evidence

- [Canonical repository](https://github.com/sabledattatray/InstantSite-AI)
- [Inspected tree](https://github.com/sabledattatray/InstantSite-AI/tree/1474f73754c65a7a3296ced132c85e2326024474)
- [Maintainer region evidence](https://github.com/sabledattatray)
- Commit: `1474f73754c65a7a3296ced132c85e2326024474`
