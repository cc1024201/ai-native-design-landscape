# Agentation

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Agentation contributors |
| Category | Visual context primitive |
| Status | Active |
| Source availability | Source-available |

## Scope

A browser annotation layer that turns clicked, selected or drawn UI targets into structured context for coding agents.

## Technical direction

- Focuses narrowly on expressing 'which part of the UI' with low ambiguity.
- Captures selectors, positions and surrounding visual context.
- Supports multi-select and area annotation.
- Leaves code reasoning and modification to the connected agent.

## Public technical choices

- Surface: in-browser annotation overlay.
- Output: structured target/selector/context data.
- Interaction: click, multi-select and area select.
- Implementation: public source repository; license is not a conventional permissive OSS license.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://github.com/benjitaylor/agentation
