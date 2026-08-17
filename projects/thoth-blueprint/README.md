# Thoth Blueprint

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Thoth Blueprint treats database design as an agent-editable graph rather than as a picture generated after the fact. The decisive object is a typed schema workspace; the canvas and exports are projections of that authority.

## Patchable schema authority

At commit [`908118c3`](https://github.com/AHS12/thoth-blueprint/tree/908118c338d8b5c08f84d81956c6b491bd778d41), tables, columns, relations, notes and configuration live in the application store. The AI boundary is expressed as patch-like operations against those records, so generation and revision do not need to replace an opaque SVG.

The same workspace retains checkpoints and local IndexedDB state. That makes rollback a property of the model, not merely browser undo.

## One model, several handoffs

The graph can leave the workspace as DBML, SQL, JSON or SVG. DBML and SQL preserve implementation intent; SVG is a presentation projection. The distinction matters because only the structured forms can return as design authority.

## What this adds to the landscape

This is a strong example of native-artifact authoring joined to design-code translation: AI proposes schema mutations, deterministic graph logic renders them, and the user still owns a recoverable data model.

## Evidence

- [Pinned source tree](https://github.com/AHS12/thoth-blueprint/tree/908118c338d8b5c08f84d81956c6b491bd778d41)
- [State implementation](https://github.com/AHS12/thoth-blueprint/blob/908118c338d8b5c08f84d81956c6b491bd778d41/src/store/store.ts)
- [Agent-facing repository rules](https://github.com/AHS12/thoth-blueprint/blob/908118c338d8b5c08f84d81956c6b491bd778d41/AI_RULES.md)
