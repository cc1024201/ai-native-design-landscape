# PixelRuller

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PixelRuller grew from screenshot measurement into a shared UI authoring surface. A human edits the canvas while a coding agent reads and writes the same structured design through a documented skill and command interface.

## JSON is the meeting point

At commit [`f132293`](https://github.com/kalotrapezis/PixelRuller/tree/f132293706841c387d9fbd6232d88ce53d5fdff1) design JSON stores windows elements hierarchy percentage sizing styles responsive visibility and actions. [`AI_SKILL.md`](https://github.com/kalotrapezis/PixelRuller/blob/f132293706841c387d9fbd6232d88ce53d5fdff1/AI_SKILL.md) teaches an external agent the same vocabulary. The browser canvas can measure screenshots draw shapes and directly edit that model.

Demo mode interprets declared interactions so a design can be exercised before implementation. HTML JSON and XML exports derive from the model; they do not replace it. Example files such as [`PDFExtractorUI.json`](https://github.com/kalotrapezis/PixelRuller/blob/f132293706841c387d9fbd6232d88ce53d5fdff1/web/PDFExtractorUI.json) preserve a concrete handoff from design to application code.

## Distinctive boundary

The app does not call a model itself. AI participation comes from a co-located coding agent following the skill and writing the same files. That is still a real agent interface because changes are structured inspectable and immediately rendered rather than simulated in the UI.

Public first-party evidence did not establish the maintainer region.

## Sources

- [Server and command surface](https://github.com/kalotrapezis/PixelRuller/blob/f132293706841c387d9fbd6232d88ce53d5fdff1/server.py)
- [Canvas application](https://github.com/kalotrapezis/PixelRuller/blob/f132293706841c387d9fbd6232d88ce53d5fdff1/web/app.js)
- [Pinned README](https://github.com/kalotrapezis/PixelRuller/blob/f132293706841c387d9fbd6232d88ce53d5fdff1/README.md)
