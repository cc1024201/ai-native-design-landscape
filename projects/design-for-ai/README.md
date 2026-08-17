# design-for-ai

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

design-for-ai is a design-foundations plugin that turns a vague idea into committed repository artifacts through four explicit gates: research, plan, mock and build. Its mechanism is not a style prompt; it combines user-pinned taste decisions with deterministic candidate generation and independent review of the rendered result.

## The mock is disposable but the decision is durable

[`research.md`](https://github.com/ryanthedev/design-for-ai/blob/37d7ae63d1afa45eb57ec90bc246cef6dd60c033/commands/research.md) establishes audience, job, feeling and taste signals. Planning assigns design doctrine and done conditions. [`mock.md`](https://github.com/ryanthedev/design-for-ai/blob/37d7ae63d1afa45eb57ec90bc246cef6dd60c033/commands/mock.md) creates a low-cost prototype and requires sign-off before a full build.

The visual DNA mechanism deliberately limits model convergence. [`dealer.mjs`](https://github.com/ryanthedev/design-for-ai/blob/37d7ae63d1afa45eb57ec90bc246cef6dd60c033/scripts/dealer.mjs) deals seeded combinations across aesthetic axes while preserving any axis the user pins. [`palette.mjs`](https://github.com/ryanthedev/design-for-ai/blob/37d7ae63d1afa45eb57ec90bc246cef6dd60c033/scripts/palette.mjs) produces OKLCH ramps; [`detect.mjs`](https://github.com/ryanthedev/design-for-ai/blob/37d7ae63d1afa45eb57ec90bc246cef6dd60c033/scripts/detect.mjs) detects listed AI-default patterns separately from a visual critic.

```text
brief -> research artifact -> plan -> candidate mock -> user sign-off
-> phased source build -> isolated visual review + detector -> commit
```

Repository files and Git remain authoritative. Browser pixels are evidence and a mock is a candidate; neither silently replaces source. No license file or reliable maintainer-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/ryanthedev/design-for-ai/tree/37d7ae63d1afa45eb57ec90bc246cef6dd60c033)
- [Prototype skill](https://github.com/ryanthedev/design-for-ai/blob/37d7ae63d1afa45eb57ec90bc246cef6dd60c033/skills/prototype/SKILL.md)
- [Build agent](https://github.com/ryanthedev/design-for-ai/blob/37d7ae63d1afa45eb57ec90bc246cef6dd60c033/agents/design-build-agent.md)
