# Azure Diagram Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Azure Diagram Skill packages native draw.io architecture creation for GitHub Copilot. It encodes Azure-specific symbol and connection rules rather than leaving layout and icon choice entirely to a model.

## Skill rules govern the artifact

At [`d1939ed1`](https://github.com/sriramsundaresan/azure-diagram-skill/tree/d1939ed1272442dca74b83662b8246c339ba2bae), the skill directs Copilot to select official shapes, construct valid mxGraph XML and verify references. Templates provide known-good native starting points for common topologies.

## Extension closes the handoff

The bundled extension can open the generated `.drawio` artifact inside VS Code. Manual editing therefore starts from the exact file the agent produced rather than from a rendered approximation.

## Architecture boundary

There is no independent hosted model or project database. Filesystem and Git own history; draw.io owns visual manipulation; Copilot supplies delegated creation under the skill's constraints.

## Evidence

- [Pinned repository](https://github.com/sriramsundaresan/azure-diagram-skill/tree/d1939ed1272442dca74b83662b8246c339ba2bae)
- [Azure architecture skill](https://github.com/sriramsundaresan/azure-diagram-skill/blob/d1939ed1272442dca74b83662b8246c339ba2bae/.github/skills/azure-architecture-diagram/SKILL.md)
- [VS Code extension](https://github.com/sriramsundaresan/azure-diagram-skill/blob/d1939ed1272442dca74b83662b8246c339ba2bae/.github/extensions/azure-diagram/extension.mjs)
- [Hub-spoke native template](https://github.com/sriramsundaresan/azure-diagram-skill/blob/d1939ed1272442dca74b83662b8246c339ba2bae/templates/hub-spoke.drawio)
