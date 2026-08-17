# Reversa

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Reversa is a specification reverse-engineering framework for agents. It inspects an existing software product, checkpoints the analysis, extracts visual and design-system evidence, and produces a browsable software-design dossier without mutating the source project.

## Two persisted trees separate process from evidence

[`state.json`](https://github.com/sandeco/reversa/blob/f3c36892e8aefa44f020f7ad74917089e67ddaa3/templates/state.json) and its schema define resumable phase/checkpoint state under `.reversa/`. Evidence and generated specification artifacts live under `_reversa_sdd/`, preserving a clear boundary between research output and the inspected codebase.

The Design System agent extracts tokens and components, while the Visor skill reasons over screenshots and visual states. [`viewer.html`](https://github.com/sandeco/reversa/blob/f3c36892e8aefa44f020f7ad74917089e67ddaa3/templates/documentation/viewer.html) is a projection of the dossier, not its authority. Mira uses Reversa for plugin authoring, but Reversa is independently released and is therefore counted as its own product framework.

The maintainer's first-party profile identifies Brazil.

## Evidence

- [Pinned repository](https://github.com/sandeco/reversa/tree/f3c36892e8aefa44f020f7ad74917089e67ddaa3)
- [State schema](https://github.com/sandeco/reversa/blob/f3c36892e8aefa44f020f7ad74917089e67ddaa3/agents/reversa/references/state-schema.md)
- [Design-system agent](https://github.com/sandeco/reversa/blob/f3c36892e8aefa44f020f7ad74917089e67ddaa3/agents/reversa-design-system/SKILL.md)
- [Visor skill](https://github.com/sandeco/reversa/blob/f3c36892e8aefa44f020f7ad74917089e67ddaa3/agents/reversa-visor/SKILL.md)
- [Maintainer profile](https://github.com/sandeco)
