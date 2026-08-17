# SolidWorks Automation Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SolidWorks Automation Skill is broader than a prose skill: it ships a desktop CAD workbench, CLI scripts and an MCP server that share machine-readable capability and evidence contracts. It can operate installed SolidWorks or AutoCAD and also use headless open-format geometry paths.

## Capability truth precedes agent choice

[`capabilities.yaml`](https://github.com/wzyn20051216/solidworks-automation-skill/blob/cc1e9301ecdff69ec8a8758e4aba4dd9298c0c3e/capabilities.yaml) is the declared source for what each backend can actually do. [`agent_contracts.py`](https://github.com/wzyn20051216/solidworks-automation-skill/blob/cc1e9301ecdff69ec8a8758e4aba4dd9298c0c3e/apps/desktop/cad_workbench/agent_contracts.py) defines request and result boundaries for the workbench. Golden workflows require preview manifests, review reports and engineering checks rather than treating file creation as success.

```text
design request -> capability/backend selection -> queued CAD operation
-> native or headless exact artifact -> preview + evidence graph
-> DFM / FEA / review gate -> export
```

This dossier covers that executable system, not every bundled tutorial as a separate product. The maintainer profile reports Dalian, China.

## Evidence

- [Pinned repository](https://github.com/wzyn20051216/solidworks-automation-skill/tree/cc1e9301ecdff69ec8a8758e4aba4dd9298c0c3e)
- [Capability truth source](https://github.com/wzyn20051216/solidworks-automation-skill/blob/cc1e9301ecdff69ec8a8758e4aba4dd9298c0c3e/capabilities.yaml)
- [Golden engineering workflows](https://github.com/wzyn20051216/solidworks-automation-skill/blob/cc1e9301ecdff69ec8a8758e4aba4dd9298c0c3e/golden-workflows.yaml)
- [Maintainer location evidence](https://github.com/wzyn20051216)
