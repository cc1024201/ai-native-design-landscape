# FastBuild123d

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FastBuild123d converts annotated build123d functions into a live local browser editor. Parameters become controls, geometry refreshes as values change, and an included agent skill teaches coding agents how to prepare models for that interactive correction loop.

## Last-good geometry protects exploration

Python source is the parametric authority. State logs carry parameter revisions into the browser, while a last-good result remains visible if a later execution fails. That distinction lets a user keep inspecting a known model without mistaking a failed update for successful geometry. Headless export turns an accepted state into downstream CAD files.

The project is counted as visual-editor infrastructure rather than a full autonomous CAD agent: its independent value is exposing generated parametric code to fast human manipulation, rendering and export.

- [Pinned repository](https://github.com/DevonPeroutky/FastBuild123d/tree/42ce5a1560892bbc6885afb996291ef52762ffe6)
- [Agent skill](https://github.com/DevonPeroutky/FastBuild123d/blob/42ce5a1560892bbc6885afb996291ef52762ffe6/fastbuild/SKILL.md)
- [State log implementation](https://github.com/DevonPeroutky/FastBuild123d/blob/42ce5a1560892bbc6885afb996291ef52762ffe6/fastbuild/statelog.py)
- [Maintainer profile checked; no location published](https://github.com/DevonPeroutky)
