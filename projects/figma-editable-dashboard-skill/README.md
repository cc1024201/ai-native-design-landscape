# Figma Editable Dashboard Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Figma Editable Dashboard Skill turns briefs, screenshots and client comments into multiple editable dashboard scenes inside a logged-in Figma file. It packages a real browser-operated iteration pattern rather than exporting static mockup images.

## Browser control reaches a native host

The agent adapts a template, creates SVG-backed dashboard variants, pastes them into Figma and leaves comments open for client review. Native Figma objects and comments become the shared authority. Local SVG and PNG files support preparation and evidence, but a pasted SVG does not automatically preserve Figma-specific properties such as native `cornerRadius`.

The skill therefore distinguishes two mutation paths: SVG paste for editable vectors and text, and Figma API/plugin/MCP operations when a requirement depends on native host properties. Change-log guidance keeps client comments and implemented revisions traceable.

## Evidence boundary

The repository includes a sanitized example and helper scripts. It requires an authorized Figma session and computer/browser control, and does not establish transaction rollback or stable element identity between every SVG node and later Figma edits.

- [Pinned dashboard skill revision](https://github.com/fazalrshah/figma-editable-dashboard-skill/tree/66a8e6d82f180e5404d96c79c7eb88fb142e6851)
- [Dashboard workflow](https://github.com/fazalrshah/figma-editable-dashboard-skill/blob/66a8e6d82f180e5404d96c79c7eb88fb142e6851/figma-editable-dashboard/SKILL.md)
- [Native Figma versus SVG boundary](https://github.com/fazalrshah/figma-editable-dashboard-skill/blob/66a8e6d82f180e5404d96c79c7eb88fb142e6851/figma-editable-dashboard/references/native-figma-vs-svg.md)
- [Sanitized editable example](https://github.com/fazalrshah/figma-editable-dashboard-skill/blob/66a8e6d82f180e5404d96c79c7eb88fb142e6851/figma-editable-dashboard/assets/sample-dashboard-editable.svg)
