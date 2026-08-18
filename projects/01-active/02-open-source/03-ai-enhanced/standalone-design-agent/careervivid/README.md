# CareerVivid

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CareerVivid embeds diagram creation inside a broader career workspace. Its relevant product boundary is the whiteboard path: a user asks for a diagram, Gemini returns native Excalidraw data, and the result continues life as an ordinary editable board.

## Generation lands in native objects

At commit [`be1c929a`](https://github.com/dbt-snowflake-u/CareerVivid/tree/be1c929a16be8454ce01a75fb0a338c63c870e96), the generation modal calls the Gemini service and normalizes the response into Excalidraw elements. The renderer is therefore also the editing surface; there is no screenshot-to-canvas reconstruction step.

## The whiteboard has a project lifecycle

The editor debounces saves to Firestore and maintains preview thumbnails. Human changes after generation are part of the saved artifact, which is stronger than a chat attachment or exported image.

## Why it is counted separately

This is an independently surfaced design workspace within CareerVivid, not evidence that every AI feature in the larger application is a design product. The counted mechanism is specifically native whiteboard generation plus continued editing and persistence.

## Evidence

- [Pinned source](https://github.com/dbt-snowflake-u/CareerVivid/tree/be1c929a16be8454ce01a75fb0a338c63c870e96)
- [Diagram generation modal](https://github.com/dbt-snowflake-u/CareerVivid/blob/be1c929a16be8454ce01a75fb0a338c63c870e96/src/components/Whiteboard/GenerateDiagramModal.tsx)
- [Whiteboard editor](https://github.com/dbt-snowflake-u/CareerVivid/blob/be1c929a16be8454ce01a75fb0a338c63c870e96/src/pages/WhiteboardEditor.tsx)
- [Gemini service](https://github.com/dbt-snowflake-u/CareerVivid/blob/be1c929a16be8454ce01a75fb0a338c63c870e96/src/services/geminiService.ts)
