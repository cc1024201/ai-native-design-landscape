# Frappe Studio

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Frappe Studio is an early visual application builder for the Frappe Framework. Its AI assistant is not a separate mock canvas: it reads the current page block tree and applies typed operations to the same graph edited by the visual builder.

## A mirrored block tree governs agent work

The pinned [`AgentRunner`](https://github.com/frappe/studio/blob/ecdee25f094f2d1b77bccf1931cddbd101b1888b/studio/ai/agent/loop.py) compresses the current page into model context and maintains a server-side `WorkingTree`. It separates terminal server client and full-page artifact tools then validates each client operation against that mirror before returning the result to the model.

## Streaming operations mutate the live canvas

[`AIChatController.ts`](https://github.com/frappe/studio/blob/ecdee25f094f2d1b77bccf1931cddbd101b1888b/frontend/src/components/AIChatController.ts) consumes page JSON and tool batches in real time. It sends every batch through [`ToolDispatcher`](https://github.com/frappe/studio/blob/ecdee25f094f2d1b77bccf1931cddbd101b1888b/frontend/src/components/ai/toolDispatch.ts), whose operations create move remove or patch blocks and wire styles bindings variables events and visibility. The controller then invokes `savePage`, joining AI and manual editing at the native Studio page document.

## Persistence and source export are separate boundaries

Frappe doctypes persist pages resources scripts and AI sessions. The [export module](https://github.com/frappe/studio/blob/ecdee25f094f2d1b77bccf1931cddbd101b1888b/studio/export.py) writes standard documents as JSON and companion code as diffable files but only in developer mode. The database-backed Studio page remains the ordinary editing authority; exported app source is a controlled materialization.

## Lifecycle caution

The [README](https://github.com/frappe/studio/blob/ecdee25f094f2d1b77bccf1931cddbd101b1888b/README.md) explicitly labels the project very early and not production-ready. That affects lifecycle confidence but not the source-visible creation and correction loop.

## Pinned evidence

- [Repository](https://github.com/frappe/studio)
- [Inspected tree](https://github.com/frappe/studio/tree/ecdee25f094f2d1b77bccf1931cddbd101b1888b)
- Commit: `ecdee25f094f2d1b77bccf1931cddbd101b1888b`
