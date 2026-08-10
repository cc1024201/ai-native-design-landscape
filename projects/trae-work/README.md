# TRAE Work

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | ByteDance / TRAE |
| Category | Agent workspace with Design Mode |
| Status | Active |
| Source availability | Closed |
| Previous names / aliases | TRAE SOLO |

## Scope

A standalone AI work assistant available across desktop, web and mobile. It includes Work and Code modes and exposes Design Mode as a dedicated professional design workflow inside the product.

## Technical direction

- Places design inside a broader agent workspace rather than inside a traditional vector-design editor.
- Uses a dedicated Design Mode for generating drafts, applying natural-language batch edits, managing design systems and exporting design to code.
- Keeps project files in a shared workspace and supports real-time preview, comments and iterative revision.
- Uses the same agent-centric product shell for design, code and broader knowledge-work tasks.

## Public technical choices

- Surface: standalone desktop/web/mobile AI workspace.
- Product modes: Work Mode and Code Mode, with Design Mode exposed as a design-specific workflow.
- Interaction: conversational task definition, live preview, comments/revision, natural-language design edits.
- Artifact: project files in a shared workspace; official changelog documents design-to-code export.
- Product family: TRAE Work is distinct from TRAE IDE.

## Product continuity

TRAE SOLO officially evolved into TRAE Work in June 2026. The team presents TRAE Work and TRAE IDE as two separate products in the same product family.

## Evidence boundary

This file records only TRAE Work. TRAE IDE is mentioned only to establish the public product boundary. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Research gaps

- Detailed Design Mode artifact representation, source mapping and internal agent/tool protocol are not publicly documented.

## Primary sources

- https://www.trae.ai/blog/trae_work_0609
- https://www.trae.ai/work
- https://www.trae.ai/changelog
