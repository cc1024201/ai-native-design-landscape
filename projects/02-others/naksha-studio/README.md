# Naksha Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Naksha Studio defines an AI design product as a role-routed operating system inside a coding agent. Its scope runs from research and brand strategy through tokens, components, interfaces, presentations, media and handoff; the consequential mechanism is not the role count but the pipeline state that coordinates them.

## YAML pipelines make the sequence inspectable

The [research-and-design pipeline](https://github.com/Adityaraj0421/naksha-studio/blob/faa38ceaca2ae058bd5cad9e90d8a3d8e2d361ba/skills/design/pipelines/research-and-design.yaml) and specialized flows such as [design-tokens](https://github.com/Adityaraj0421/naksha-studio/blob/faa38ceaca2ae058bd5cad9e90d8a3d8e2d361ba/skills/design/pipelines/design-tokens.yaml) declare ordered stages rather than relying on one long prompt. Commands select a pipeline; the core skill loads only the required specialist references and host integrations.

```text
brief -> route to role/pipeline -> research and decisions
-> tokens/components/media/source or Figma artifact
-> score/QA/compliance gate -> handoff/deploy
```

Different outputs retain their native authority: repository files for code, reports, tokens and generated media; Figma for native design graphs. Memory and status commands preserve agent-side context, while Git or the host platform supplies durable versions. The breadth creates a verification limit: source proves the orchestration contracts, not that every one of the dozens of advertised jobs has equal production maturity.

The project is MIT-licensed. The maintainer profile reports Noida, India.

## Commit-level map

- [Pinned repository](https://github.com/Adityaraj0421/naksha-studio/tree/faa38ceaca2ae058bd5cad9e90d8a3d8e2d361ba)
- [Core design skill](https://github.com/Adityaraj0421/naksha-studio/blob/faa38ceaca2ae058bd5cad9e90d8a3d8e2d361ba/skills/design/SKILL.md)
- [Component-build pipeline](https://github.com/Adityaraj0421/naksha-studio/blob/faa38ceaca2ae058bd5cad9e90d8a3d8e2d361ba/skills/design/pipelines/component-build.yaml)
- [Failure modes](https://github.com/Adityaraj0421/naksha-studio/blob/faa38ceaca2ae058bd5cad9e90d8a3d8e2d361ba/docs/pipeline-failure-modes.md)
- [MIT license](https://github.com/Adityaraj0421/naksha-studio/blob/faa38ceaca2ae058bd5cad9e90d8a3d8e2d361ba/LICENSE)
