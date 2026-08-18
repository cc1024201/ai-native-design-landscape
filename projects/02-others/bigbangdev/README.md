# bigbangdev

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

bigbangdev frames generation as a visible production line. Architecture, file writing, QA and deployment are separate LangGraph steps whose events appear in the React control surface.

## Files are the shared authority

[`main.py`](https://github.com/ximanta/bigbangdev/blob/ae1ef469faa10bf555d8234351f2ba389cc0c0c8/backend/main.py) constrains generated paths to the React workspace, restores fixed boilerplate, writes model-returned files and gates them through imports, syntax and completeness checks. Failed checks route back to the developer node rather than merely annotating the preview.

## Event stream explains state without replacing it

[`App.jsx`](https://github.com/ximanta/bigbangdev/blob/ae1ef469faa10bf555d8234351f2ba389cc0c0c8/frontend/src/App.jsx) streams agent status and written-file events, then displays the local preview or final deployment URL. The timeline coordinates work; the workspace files remain authoritative.

## Pinned evidence

- [Canonical repository](https://github.com/ximanta/bigbangdev)
- [Inspected commit](https://github.com/ximanta/bigbangdev/commit/ae1ef469faa10bf555d8234351f2ba389cc0c0c8)
- [Maintainer region evidence](https://github.com/ximanta)
- Commit: `ae1ef469faa10bf555d8234351f2ba389cc0c0c8`
