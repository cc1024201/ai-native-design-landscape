# Master AI Design System

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Master AI Design System is an npm-installed migration runtime for existing frontends. It does not replace business logic; it scaffolds durable context and plans, then directs a coding agent through inspection, component mapping, reconstruction and quality checks.

## `.ai/` preserves transformation state

The CLI's `init`, `audit`, `migrate` and `update` commands create or refresh context, instructions, audits and migration plans. [`MASTER_PROMPT.md`](https://github.com/breezyx28/master-ai-design-system/blob/c96a16cb9f3d7f5b5b80bb71395ac721c815e006/MASTER_PROMPT.md) routes only the needed modules, while [`component_registry.md`](https://github.com/breezyx28/master-ai-design-system/blob/c96a16cb9f3d7f5b5b80bb71395ac721c815e006/resources/component_registry.md) points the agent toward reusable implementations.

```text
existing frontend -> scaffold `.ai/` context/audit/plan
-> map source and system assets -> phased source reconstruction
-> accessibility/performance/QC modules -> reports + shipped code
```

Application source remains runtime authority; `.ai/` is decision and progress state that can be committed beside it. The CLI scaffolds rather than executing UI changes, so output quality still depends on the host model and ordinary application tests. The modular organization prevents loading the entire design corpus for every task.

The project is MIT-licensed. The maintainer profile reports Omdurman in Khartoum, Sudan.

## Evidence

- [Pinned repository](https://github.com/breezyx28/master-ai-design-system/tree/c96a16cb9f3d7f5b5b80bb71395ac721c815e006)
- [CLI entry](https://github.com/breezyx28/master-ai-design-system/blob/c96a16cb9f3d7f5b5b80bb71395ac721c815e006/bin/design-ai.js)
- [Initialization command](https://github.com/breezyx28/master-ai-design-system/blob/c96a16cb9f3d7f5b5b80bb71395ac721c815e006/src/commands/init.js)
- [Design-token source](https://github.com/breezyx28/master-ai-design-system/blob/c96a16cb9f3d7f5b5b80bb71395ac721c815e006/resources/design_tokens.yaml)
- [MIT license](https://github.com/breezyx28/master-ai-design-system/blob/c96a16cb9f3d7f5b5b80bb71395ac721c815e006/LICENSE)
