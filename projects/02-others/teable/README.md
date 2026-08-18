# Teable

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Teable defines an AI application as a deployed interface and workflow grounded in live relational data, with spreadsheet-like tables remaining a directly editable authority.

## Data precedes the generated app

PostgreSQL-backed bases expose tables, fields, records, links, views, charts, forms, and automations. The AI App Builder runs against that live model rather than generating a disconnected demo database, so application behavior remains accountable to a shared data schema.

## Sandboxes separate creation from serving

An AI session gets an isolated, short-lived container in which it can build an application. Publishing moves the app into a separate long-lived container. The workflow engine separately responds to record changes, schedules, and webhooks, including AI steps.

## Open core and full AI platform are not identical

The inspected repository exposes the relational core, views, field AI configuration, some AI gateway services, and workflow-facing UI. The full self-hosted AI App Builder, sandbox orchestration, and deployment platform require Teable's broader distribution and license. Those current product mechanics are recorded at architecture level rather than inferred from the open core.

## Evidence

- Repository and product overview: [teableio/teable](https://github.com/teableio/teable)
- Inspected open foundation revision: [`06a4461e2bc53055182d4df0a72dffa26fd99210`](https://github.com/teableio/teable/tree/06a4461e2bc53055182d4df0a72dffa26fd99210)
- [Self-hosted AI platform architecture](https://help.teable.ai/en/deploy/architecture)
- [Teable AI product](https://teable.ai/)
