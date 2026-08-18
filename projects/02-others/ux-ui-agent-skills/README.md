# UX UI Agent Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UX UI Agent Skills is a filesystem design-governance runtime rather than one monolithic prompt. It combines installable workflows, DTCG token sets, component contracts, framework adapters and executable checks so an agent can create and test source artifacts against the same design rules.

## Tokens and adapters make rules portable

The repository's JSON tokens cover color, type, spacing, motion, states and other system layers. [`adapter-protocol.md`](https://github.com/plugin87/ux-ui-agent-skills/blob/93a7fbbdb3f19016fc2ea01eeec48a3895045be1/frameworks/adapter-protocol.md) translates those roles into React, SwiftUI and other target stacks. Workflows connect generation to design review, accessibility, performance and design-to-code QA.

```text
brief + selected system -> DTCG token authority + component contract
-> framework adapter -> implementation/preview
-> token contrast WCAG and state checks -> source correction
```

The CLI installs selected areas rather than forcing the whole corpus into context. Runnable validators and rendered examples distinguish it from advice-only prompt collections, although the host agent still performs most synthesis. Files and Git provide persistence.

No license file was present. The maintainer profile reports Prawet in Bangkok, Thailand.

## Pinned evidence

- [Repository](https://github.com/plugin87/ux-ui-agent-skills/tree/93a7fbbdb3f19016fc2ea01eeec48a3895045be1)
- [Token-build workflow](https://github.com/plugin87/ux-ui-agent-skills/blob/93a7fbbdb3f19016fc2ea01eeec48a3895045be1/workflows/token-build.md)
- [Design QA workflow](https://github.com/plugin87/ux-ui-agent-skills/blob/93a7fbbdb3f19016fc2ea01eeec48a3895045be1/workflows/design-qa.md)
- [CLI installer](https://github.com/plugin87/ux-ui-agent-skills/blob/93a7fbbdb3f19016fc2ea01eeec48a3895045be1/bin/cli.js)
