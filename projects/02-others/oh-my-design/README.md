# oh-my-design

> Research status: **Source-level** · Last reviewed: **2026-08-12**

`oh-my-design` makes `DESIGN.md` project-owned policy rather than a downloaded inspiration file. The installer places skills, specialist roles, evidence-graded references and managed instructions into the chosen agent environment; later preferences and reviews update explicit local state.

## Governance precedence

```text
project DESIGN.md
  > pending/remembered project preferences
  > managed agent shims
  > framework defaults
```

`omd:init` recommends a reference and asks for confirmation before writing product-specific facts. `omd:apply` uses the accepted document; `omd:remember` and `omd:learn` preserve corrections; review and “slop audit” skills produce findings rather than silently rewriting policy. Managed files carry markers/hashes so reinstall can refresh owned content while skipping user drift.

## Delivery channels are explicit

Claude Code, Codex and OpenCode receive native skills/roles; Cursor receives a narrower project rule and catalog. The doctor verifies the selected scope and prints scoped repairs. A retired MCP implementation remains archived but is not presented as the current runtime.

Pinned commit [`0a7f3a1`](https://github.com/kwakseongjae/oh-my-design/commit/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e) exposes:

- [installer](https://github.com/kwakseongjae/oh-my-design/blob/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/src/cli/install-skills.ts) and [doctor](https://github.com/kwakseongjae/oh-my-design/blob/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/src/cli/doctor.ts) with unit tests;
- [sync](https://github.com/kwakseongjae/oh-my-design/blob/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/skills/omd-sync/SKILL.md), [memory](https://github.com/kwakseongjae/oh-my-design/blob/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/skills/omd-remember/SKILL.md), [reference capture](https://github.com/kwakseongjae/oh-my-design/blob/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/skills/omd-reference-capture/SKILL.md) and [designer review](https://github.com/kwakseongjae/oh-my-design/blob/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/skills/omd-designer-review/SKILL.md);
- recorded harness runs under [`skills/omd-lab-02-design-harness/runs`](https://github.com/kwakseongjae/oh-my-design/tree/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/skills/omd-lab-02-design-harness/runs).

## Region and rights

The repository is MIT-licensed. The maintainer profile identifies Seoul and Hongik University, supporting South Korea as the public team region. Live host-agent output was not used as a substitute for the pinned file protocol.

## Decisive sources

- [Repository README](https://github.com/kwakseongjae/oh-my-design/blob/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/README.md)
- [Project site](https://oh-my-design.kr)
- [MIT license](https://github.com/kwakseongjae/oh-my-design/blob/0a7f3a1e17814c8a1b000ce075b3b2620b70db9e/LICENSE)
- [Maintainer profile](https://github.com/kwakseongjae)
