# Canvas AI Migrations

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Canvas AI Migrations is an autonomous Drupal-to-Canvas migration system whose current scope extends beyond the installable migration subset in Drupal Canvas Plugin.

## A nine-phase workflow owns the migration

Discovery, component audit, build, Storybook QA, upload, site configuration, page composition, and visual verification are coordinated by Claude Code and roughly fifteen specialist agents. Deterministic Bash and Node programs handle work that does not need a model.

## Files make long runs recoverable

Migration artifacts persist under `docs/migration`; JSONL journals, phase gates, issue files, screenshots, comparison reports, and a self-contained audit dashboard keep completion evidence outside the model context window.

## Control plane and executor are separated

An optional Source Migrations dashboard registers servers and dispatches prepare, launch, pause, resume, and stop commands through an outbound WebSocket agent. `migratectl` is a thin HTTP client to that dashboard; the executor still writes to Drupal Canvas through authenticated host interfaces.

## Pinned evidence

- Project and source: [Canvas AI Migrations issues](https://www.drupal.org/project/issues/canvas_ai_migrations) and [GitLab repository](https://git.drupalcode.org/project/canvas_ai_migrations)
- Inspected migration skill, agents, deterministic scripts, tests, journals, visual gates, installer, and dashboard producer protocol: [`0a86c59d353587de45a3c2cdaf786558cd70c40c`](https://git.drupalcode.org/project/canvas_ai_migrations/-/tree/0a86c59d353587de45a3c2cdaf786558cd70c40c)
- Immutable revision: [commit `0a86c59`](https://git.drupalcode.org/project/canvas_ai_migrations/-/commit/0a86c59d353587de45a3c2cdaf786558cd70c40c)
