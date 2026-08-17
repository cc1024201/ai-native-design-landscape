# Website That Builds Itself

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

This experiment makes the browser page itself the assembly surface. A user opens an insertion point on the canvas, describes a UI fragment and places Claude's returned markup at that position.

## Spatial composition is the product distinction

[`main.py`](https://github.com/echohive42/website-that-builds-itself/blob/2f1644ae7c829880f62cf4f7bd2eaed31a4950d6/main.py) sends component briefs to Claude 3.5 Sonnet and returns generated markup. [`app.js`](https://github.com/echohive42/website-that-builds-itself/blob/2f1644ae7c829880f62cf4f7bd2eaed31a4950d6/static/app.js) owns insertion coordinates, component selection and canvas manipulation instead of presenting a linear chat transcript.

The same client can serialize the assembled page as downloadable HTML. [`index.html`](https://github.com/echohive42/website-that-builds-itself/blob/2f1644ae7c829880f62cf4f7bd2eaed31a4950d6/templates/index.html) is the host shell; there is no durable server project or version graph. The record is historical because the inspected lineage stopped changing in 2024.

## Evidence

- [Canonical repository](https://github.com/echohive42/website-that-builds-itself)
- [Inspected tree](https://github.com/echohive42/website-that-builds-itself/tree/2f1644ae7c829880f62cf4f7bd2eaed31a4950d6)
- Commit: `2f1644ae7c829880f62cf4f7bd2eaed31a4950d6`
