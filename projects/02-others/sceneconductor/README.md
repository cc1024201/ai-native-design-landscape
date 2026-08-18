# SceneConductor

> Research status: **Source-level** · Lifecycle: **active research implementation** · Last reviewed: **2026-08-12**

SceneConductor reconstructs an editable Blender scene from one image. Stage 1 segments objects and estimates coarse layout; Stage 2 builds a separable floor/wall/ceiling environment and reference views; Stage 3 derives a relation graph, validates object groups and iteratively repairs scene islands.

## Intermediate geometry survives the agent handoffs

Each scene directory retains masks, textured GLBs, layout inputs, `.blend` files, a relation graph and multi-view renders. Stage-specific skills and deterministic gates pass these artifacts forward, so the final five views can be traced back to object and layout decisions rather than to a monolithic generation call.

The checked pipeline is Linux/GPU-heavy and Claude Code-native; a Codex variant is roadmap work. Its research release establishes a reproducible scene graph but not universal single-image reconstruction accuracy.

- [Pinned repository](https://github.com/jhkim0759/SceneConductor/tree/f649dc04177d623cef75cf6c55bf2c5764ccbee4)
- [Scene orchestration skill](https://github.com/jhkim0759/SceneConductor/blob/f649dc04177d623cef75cf6c55bf2c5764ccbee4/.claude/skills/scene-orchestration/SKILL.md)
- [Stage 3 validation](https://github.com/jhkim0759/SceneConductor/blob/f649dc04177d623cef75cf6c55bf2c5764ccbee4/.claude/skills/stage3-scene-refinement/src/run_stage3_validation.py)
- [Maintainer profile: Singapore](https://github.com/jhkim0759)
