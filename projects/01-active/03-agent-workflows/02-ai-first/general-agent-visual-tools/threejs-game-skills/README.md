# Three.js Game Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Three.js Game Skills is a coordinated Codex and Claude Code skill suite for building and shipping browser games. A director routes work across gameplay, graphics, UI, asset, audio, debugging and release specialists, so Design is inseparable from a playable product loop.

## Repository source is tested through the canvas

The suite scaffolds Vite, TypeScript and Three.js source. Generated games expose seeded randomness and deterministic test hooks; Playwright templates capture smoke results, visual baselines and bot playtests. The WebGL canvas is therefore a projection used to inspect gameplay and visual quality, while repository code and checked-in assets remain authoritative.

The director maintains a design brief, core-loop contract and level plan for broad work. Specialist skills can revise HUDs, materials, lighting, VFX, models and interaction, then the QA/release skill checks screenshots, canvas pixels, mobile behavior, performance and static-host readiness.

## Release is a gate, not another generation

Visual scorecards and reference anchors direct iterative polish. Baseline comparison and bot playtests expose regressions; they do not independently decide that a game is fun or production-safe. Optional image, 3D and audio providers write assets into the same project rather than hosting a separate canonical game.

- [Pinned Three.js Game Skills revision](https://github.com/majidmanzarpour/threejs-game-skills/tree/7221c1f4a6d2ae189a4d85d058d24f3228499d46)
- [Director orchestration contract](https://github.com/majidmanzarpour/threejs-game-skills/blob/7221c1f4a6d2ae189a4d85d058d24f3228499d46/skills/threejs-game-director/SKILL.md)
- [QA and release skill](https://github.com/majidmanzarpour/threejs-game-skills/blob/7221c1f4a6d2ae189a4d85d058d24f3228499d46/skills/threejs-qa-release/SKILL.md)
- [Canvas inspection helper](https://github.com/majidmanzarpour/threejs-game-skills/blob/7221c1f4a6d2ae189a4d85d058d24f3228499d46/skills/threejs-qa-release/scripts/inspect-threejs-canvas.mjs)
