# AI Module Generator by Sawan Kumar

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project does not begin from a blank visual prompt. It ingests a host repository, design system, and API reference; plans a module against those constraints; pauses for a human coverage decision; and only then generates and delivers an artifact.

## Repository context precedes generation

[`graph.py`](https://github.com/sawan-kumar10/AI-Frontend-generator/blob/ccba97f9c747e71ea0651a85db5ea4f58eb75a40/server/module_generator/orchestrator/graph.py) coordinates ingest, clarification, planning, coverage, approval, generation, validation, and delivery. The state carries a context bundle rather than a standalone prompt.

## Human approval is a hard graph interrupt

The coverage gate uses LangGraph `interrupt` to return counts and gaps. Approve advances; reject ends; revise merges direction back into planning. That makes the approval a real promotion decision, not decorative UI.

## Two maturity levels coexist

The current MVP emits a self-contained HTML preview and versions it per job. The deeper workspace path in [`code_generator.py`](https://github.com/sawan-kumar10/AI-Frontend-generator/blob/ccba97f9c747e71ea0651a85db5ea4f58eb75a40/server/module_generator/stage4_generator/code_generator.py) and [`deliver.py`](https://github.com/sawan-kumar10/AI-Frontend-generator/blob/ccba97f9c747e71ea0651a85db5ea4f58eb75a40/server/module_generator/delivery/deliver.py) can diff repository files, package ZIP and patch artifacts, and optionally open a PR. Source comments explicitly mark that full path as Phase B, so the record remains active-transition.

## Pinned evidence

- [Repository](https://github.com/sawan-kumar10/AI-Frontend-generator)
- [Inspected tree](https://github.com/sawan-kumar10/AI-Frontend-generator/tree/ccba97f9c747e71ea0651a85db5ea4f58eb75a40)
- Commit: `ccba97f9c747e71ea0651a85db5ea4f58eb75a40`
