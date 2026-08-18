# ChartDB

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ChartDB is counted because its AI-assisted SQL path and visual schema editor operate around one normalized database model. The ERD is an editable projection of executable design intent.

## Normalized schema graph

At commit [`c24936a4`](https://github.com/chartdb/chartdb/tree/c24936a402bb3e24b4858f05282d69a04fcfe25b), tables, fields, constraints and relations are domain records retained through browser storage. Canvas layout augments that model without reducing it to pixels.

## Translation crosses database dialects

SQL, DBML and live-query imports enter the shared graph. Export can target other SQL dialects, using deterministic converters where implemented and AI assistance for cross-dialect gaps. The resulting source remains reviewable before execution.

## Why this is Design

The ordinary-user loop is schema authoring: inspect relationships visually, change the structured model and materialize implementation source. This is design-code translation even though the domain is databases rather than interface graphics.

## Evidence

- [Pinned repository](https://github.com/chartdb/chartdb/tree/c24936a402bb3e24b4858f05282d69a04fcfe25b)
- [Storage provider](https://github.com/chartdb/chartdb/blob/c24936a402bb3e24b4858f05282d69a04fcfe25b/src/context/storage-context/storage-provider.tsx)
- [Database schema domain](https://github.com/chartdb/chartdb/blob/c24936a402bb3e24b4858f05282d69a04fcfe25b/src/lib/domain/db-schema.ts)
- [Cross-dialect translation](https://github.com/chartdb/chartdb/blob/c24936a402bb3e24b4858f05282d69a04fcfe25b/src/lib/data/sql-export/cross-dialect/index.ts)
- [SQL export surface](https://github.com/chartdb/chartdb/blob/c24936a402bb3e24b4858f05282d69a04fcfe25b/src/dialogs/export-sql-dialog/export-sql-dialog.tsx)
