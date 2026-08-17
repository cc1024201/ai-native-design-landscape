# AI Website Generator by Dhanu7789

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

The repository is named `Google_DeepMind`, but its user-facing artifact is an OpenAI-backed website generator. A prompt becomes three source files that remain aligned across inspection, visual preview and download.

## A textual contract separates the source artifacts

[`server.js`](https://github.com/Dhanu7789/Google_DeepMind/blob/900699b3a3bc1d85cf9e16fea93c703a6cc09f21/backend/server.js) asks the model for explicitly labelled HTML, CSS and JavaScript sections and returns the raw completion to the browser. [`script.js`](https://github.com/Dhanu7789/Google_DeepMind/blob/900699b3a3bc1d85cf9e16fea93c703a6cc09f21/frontend/script.js) parses those labels into three mutable source strings. The parser is fragile compared with a schema contract, but the model genuinely determines the resulting artifact.

## One source state feeds proof and delivery

The browser composes those strings into an iframe `srcdoc` for live visual proof, exposes each source block for copying and packages the same three strings as `index.html`, `style.css` and `script.js` in a ZIP. No project database or version store is present at the inspected commit.

## Source lineage is part of the identity result

The later [Vadane Amruta repository](https://github.com/VADANEAMRUTA/ai-website-generator-final-final) contains the complete five-commit history ending at this upstream SHA and adds one six-line derivative commit. It is therefore recorded as a duplicate source lineage rather than another team defining a separate product.

## Evidence

- [Canonical repository](https://github.com/Dhanu7789/Google_DeepMind)
- [Inspected tree](https://github.com/Dhanu7789/Google_DeepMind/tree/900699b3a3bc1d85cf9e16fea93c703a6cc09f21)
- Commit: `900699b3a3bc1d85cf9e16fea93c703a6cc09f21`
