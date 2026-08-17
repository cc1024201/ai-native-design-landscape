# AI Website Generator by shubharthaksangharsha

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This compact application is distinguished by a local source-governance loop: it can generate or modify a site through four provider families, accept image context, navigate in-memory versions and import an existing project before export.

## Providers converge on one browser-side artifact

[`app.js`](https://github.com/shubharthaksangharsha/ai-website-generator/blob/64e9399ec1d3496a3d46b2e63bc670fd3ed42373/app.js) normalizes generation and modification across Claude, Gemini, OpenAI and Groq endpoints. The service streams model output but does not own the accepted version graph. [`public/script.js`](https://github.com/shubharthaksangharsha/ai-website-generator/blob/64e9399ec1d3496a3d46b2e63bc670fd3ed42373/public/script.js) accumulates complete source snapshots in `versionHistory`, changes the iframe's `srcdoc` when the selected version moves and can seed that history from imported HTML, CSS and JavaScript files.

## Delivery materializes the selected source

Download separates styles and scripts from the accepted HTML and packages the result as a ZIP. Versions are browser-memory state rather than durable project records at the inspected commit, so reload recovery is not claimed even though correction, comparison and portable delivery exist within a session.

## Evidence

- [Canonical repository](https://github.com/shubharthaksangharsha/ai-website-generator)
- [Inspected tree](https://github.com/shubharthaksangharsha/ai-website-generator/tree/64e9399ec1d3496a3d46b2e63bc670fd3ed42373)
- [Live product](https://ai-website-generator-eight.vercel.app/)
- Commit: `64e9399ec1d3496a3d46b2e63bc670fd3ed42373`
