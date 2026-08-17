# AI Web App Builder by Abdul Musawar

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This builder uses a browser-held file map as its project model. Each generation request is scoped to the currently selected file and current content rather than replacing the whole app through an opaque hosted revision.

## Context enters one file at a time

[`main.py`](https://github.com/mazzyy/AI-Web-App-Builder/blob/a7eb0c234f338494a0746b0289a922f6055af46e/Backend/main.py) sends the request to Gemini with file and project context and returns generated source. [`app.js`](https://github.com/mazzyy/AI-Web-App-Builder/blob/a7eb0c234f338494a0746b0289a922f6055af46e/Frontend/app.js) owns the file collection, active file, editor state and iframe projection.

## Delivery is a copy of client state

[`download.js`](https://github.com/mazzyy/AI-Web-App-Builder/blob/a7eb0c234f338494a0746b0289a922f6055af46e/Frontend/download.js) exports either an individual file or the assembled project ZIP. There is no server-side project store or revision graph at the inspected commit; reload boundaries therefore matter.

The product qualifies because source edits and the visual iframe share one user-controlled loop. It remains active-transition because the public tree is functional but has not shown recent evolution.

## Evidence

- [Canonical repository](https://github.com/mazzyy/AI-Web-App-Builder)
- [Inspected commit](https://github.com/mazzyy/AI-Web-App-Builder/commit/a7eb0c234f338494a0746b0289a922f6055af46e)
- [Maintainer region evidence](https://github.com/mazzyy)
- Commit: `a7eb0c234f338494a0746b0289a922f6055af46e`
