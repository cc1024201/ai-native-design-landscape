# game-creator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

`game-creator` is an agent plugin that takes a browser-game idea through scaffold, pixel art, gameplay, visual polish, audio, QA, deployment and optional monetization. It supports both one-shot orchestration and a milestone-based multi-session project workflow.

## Design is tested as a playable system

The orchestrator delegates code-writing stages and runs a QA agent after every change. Specialist commands can revise assets, effects, transitions and gameplay, while Playwright tests inspect build, runtime, visual states and interactions. Example games retain screenshot baselines for menus, gameplay and end states.

Repository source, assets, milestones and architecture decisions remain authoritative. Browser renders and automated playthroughs are evidence. Deployment advances the same project rather than converting a static mockup into a separate product.

## Delivery boundary

Automated QA can detect broken builds, missing runtime states and visual regressions; it cannot establish game balance or commercial readiness. Play.fun registration and monetization are optional downstream surfaces, not the artifact authority.

- [Pinned game-creator revision](https://github.com/PlayableIntelligence/game-creator/tree/4e64b83b5fe400b34ad3a484d9b4a6090b26d512)
- [Creation and QA contract](https://github.com/PlayableIntelligence/game-creator/blob/4e64b83b5fe400b34ad3a484d9b4a6090b26d512/README.md)
- [QA agent](https://github.com/PlayableIntelligence/game-creator/blob/4e64b83b5fe400b34ad3a484d9b4a6090b26d512/agents/game-qa-runner.md)
- [Visual baseline example](https://github.com/PlayableIntelligence/game-creator/blob/4e64b83b5fe400b34ad3a484d9b4a6090b26d512/examples/flappy-bird/tests/e2e/visual.spec.js)
