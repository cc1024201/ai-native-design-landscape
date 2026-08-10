# Retune

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Retune |
| Category | Visual manipulation layer |
| Status | Active |
| Source availability | Closed |

## Scope

A visual overlay for live web applications that turns direct UI adjustments into structured changes for an AI coding tool to implement.

## Technical direction

- Separates visual intent capture from actual source-code modification.
- Lets the user refine spacing, color, typography and layout on the running UI.
- Produces a structured diff instead of trying to own the coding-agent runtime.
- Leaves final implementation changes to the connected coding tool.

## Public technical choices

- Surface: overlay on the live application.
- Manipulation: direct style/layout controls.
- Protocol: structured visual diff handed to external coding tools.
- Source relationship: Retune itself does not need to become the source of truth.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.retune.dev/
