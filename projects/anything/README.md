# Anything

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Anything |
| Category | AI app builder with design reasoning |
| Status | Active |
| Source availability | Closed |
| Previous product name | Create |

## Scope

An AI app-building product that turns natural-language ideas into production-oriented mobile and web applications, including UI design, application code, backend capabilities and publishing.

## Technical direction

- Uses an agent to reason about layout, color, spacing and visual style while generating the application.
- Generates real application code rather than stopping at a static mockup.
- Uses a real browser for visual QA in its more capable agent workflow and can detect/fix visual issues.
- Accepts URLs, screenshots, images and Figma links as visual/design context.
- Keeps design, implementation, backend services and publishing in one app-building workflow.

## Public technical choices

- Artifact: generated web and mobile applications built with code.
- Interaction: conversational building plus preview and version history.
- Design inputs: text, reference URL, screenshot, image and Figma link.
- Visual verification: browser-based visual QA/computer-use capability is publicly documented for the Max workflow.
- Product continuity: the team states that Anything is the result of rethinking its earlier product, Create, around a new AI coding agent.

## Evidence boundary

This file records only Anything and its direct product-history continuity from Create. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.anything.com/docs/apps/design
- https://www.anything.com/docs/essentials
- https://www.anything.com/blog/anything-launch
