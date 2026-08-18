# Canvas AI Page Context Generation Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Claude Code skill converts an existing Drupal Canvas page and its component system into reusable page-building guidance for later agents.

## It begins from rendered and source evidence

The workflow exports a Canvas page with Drush, then inspects its SDC metadata, Twig, CSS, schemas, and JavaScript components. It resolves actual colors, spacing, typography, layout patterns, and component usage instead of inventing a design system from a screenshot alone.

## The artifact is a guideline contract

The result is a `<page-type>-page-guidelines.md` file that records visual patterns and component constraints. Drupal Canvas can load that document as AI Context, making it a governance input for page-builder agents rather than a second page runtime.

## Authority stays in Drupal Canvas

The skill reads and summarizes the host artifact; it does not itself publish a page or own component revisions. Its design contribution is durable context extraction and agent guidance.

## Pinned evidence

- Repository: [akhilbabu-qed-42/Canvas-AI-Page-Generation-Skill](https://github.com/akhilbabu-qed-42/Canvas-AI-Page-Generation-Skill)
- Inspected skill instructions and page-context extraction workflow: [`b34d3474ac7da7f3593e3ce5e37ac15bbd56550f`](https://github.com/akhilbabu-qed-42/Canvas-AI-Page-Generation-Skill/tree/b34d3474ac7da7f3593e3ce5e37ac15bbd56550f)
- Immutable revision: [commit `b34d347`](https://github.com/akhilbabu-qed-42/Canvas-AI-Page-Generation-Skill/commit/b34d3474ac7da7f3593e3ce5e37ac15bbd56550f)
