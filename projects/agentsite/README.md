# AgentSite

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AgentSite defines website design as a reviewed multi-role production pipeline. Its public implementation goes beyond naming agents: structured plans style specifications page files and reviewer verdicts cross concrete persistence and preview boundaries.

## A project pipeline coordinates specialized contracts

[project_pipeline.py](https://github.com/jhd3197/AgentSite/blob/00e487982f130c594b0d5c135d28511e000a5c02/agentsite/engine/project_pipeline.py) drives planning design development and specialist work over a project workspace. The roles produce typed intermediate decisions rather than merely sharing one unconstrained chat response.

## Review is an executable gate

[reviewer.py](https://github.com/jhd3197/AgentSite/blob/00e487982f130c594b0d5c135d28511e000a5c02/agentsite/agents/reviewer.py) evaluates generated pages and can send them through bounded revision loops. Optional critique dimensions and a per-project ratchet add governance to later runs; they do not create parallel design candidates unless the pipeline explicitly preserves them.

## Files remain authoritative while memory survives

[database.py](https://github.com/jhd3197/AgentSite/blob/00e487982f130c594b0d5c135d28511e000a5c02/agentsite/storage/database.py) persists project metadata and memory in SQLite while the workspace owns generated files. [preview.py](https://github.com/jhd3197/AgentSite/blob/00e487982f130c594b0d5c135d28511e000a5c02/agentsite/api/routes/preview.py) serves those files and ZIP export packages them. Live srcdoc updates are projections of writes rather than an alternate artifact authority.

## Evidence

- [Canonical repository](https://github.com/jhd3197/AgentSite)
- [Inspected tree](https://github.com/jhd3197/AgentSite/tree/00e487982f130c594b0d5c135d28511e000a5c02)
- Commit: 00e487982f130c594b0d5c135d28511e000a5c02
