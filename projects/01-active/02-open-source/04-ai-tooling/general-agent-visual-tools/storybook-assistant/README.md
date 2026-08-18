# Storybook Assistant

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Storybook Assistant packages a set of Claude Code agents and skills around a component repository. Its artifact is not a separate design canvas: components, stories and tests remain filesystem authority while Storybook renders the evidence used to inspect them.

## From prose to a component story graph

The [`component-generator` agent](https://github.com/flight505/storybook-assistant/blob/815e6169a7c4eb7eb27a3ea008130346a3552e6a/agents/component-generator.md) turns a description into a TypeScript component plus Storybook stories, tests and accessibility treatment. That bundle is important because the generated component is defined together with the states by which a person can inspect it.

## Screenshots return evidence to source

The [`visual-regression-analyzer`](https://github.com/flight505/storybook-assistant/blob/815e6169a7c4eb7eb27a3ea008130346a3552e6a/agents/visual-regression-analyzer.md) evaluates rendered screenshots in the context of Git history, design tokens and component evolution. The screenshot coordinates review; it does not replace the source component as the canonical artifact.

## Visual design is a repository operation

The [`visual-design` skill](https://github.com/flight505/storybook-assistant/blob/815e6169a7c4eb7eb27a3ea008130346a3552e6a/skills/visual-design/SKILL.md) adds mockup generation and visual analysis to the same repository loop. Because the package exposes many separately evolving skills rather than one integrated UI, the lifecycle is recorded as active-transition.

## Pinned evidence

- [Canonical repository](https://github.com/flight505/storybook-assistant)
- [Inspected tree](https://github.com/flight505/storybook-assistant/tree/815e6169a7c4eb7eb27a3ea008130346a3552e6a)
- Commit: `815e6169a7c4eb7eb27a3ea008130346a3552e6a`
