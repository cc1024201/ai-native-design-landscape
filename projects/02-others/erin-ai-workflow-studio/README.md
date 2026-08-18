# AI Workflow Studio by Erin

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This AI Workflow Studio pairs a hosted control plane with an Electron device agent so a validated workflow can perform bounded local spreadsheet operations.

## Plans compile into a registered vocabulary

Natural-language requests become versioned workflow schemas. The engine accepts only registered node executors; model output is treated as untrusted data and cannot become arbitrary code, SQL, shell, or network instructions.

## Permission is part of the artifact lifecycle

Risk summaries and explicit approval precede a run. Supabase retains workflow versions, runs, audit records, and device-bound jobs while row-level policies protect the control plane.

## The device agent owns local execution

An Electron agent atomically claims jobs, renews leases, reports heartbeats, and applies idempotency and cancellation contracts. Excel and CSV handlers reject macros, embedded objects, external links, dangerous archives, and formula-like output. The project remains prerelease: no signed Store release is claimed.

## Pinned evidence

- Repository: [erin20080306/AI-Workflow-Studio](https://github.com/erin20080306/AI-Workflow-Studio)
- Inspected workflow schema and engine, web control plane, Supabase model, job protocol, Electron agent, permission gates, and local executors: [`3eb09bc398a67617e4a99fe1f49e3cc6b7cecbf1`](https://github.com/erin20080306/AI-Workflow-Studio/tree/3eb09bc398a67617e4a99fe1f49e3cc6b7cecbf1)
- Immutable revision: [commit `3eb09bc`](https://github.com/erin20080306/AI-Workflow-Studio/commit/3eb09bc398a67617e4a99fe1f49e3cc6b7cecbf1)
