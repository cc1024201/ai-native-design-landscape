# Claw Design

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claw Design is a platform-neutral skill that turns briefs, screenshots, documents and design-system context into HTML prototypes, visual explorations, decks, animation-style pages, export packages and implementation handoffs. It declares inspiration from Claude Design while remaining an independently maintained product.

## Contracts make the artifact lifecycle inspectable

A task advances through intake, artifact contract, plan, build, preview, verification and fix, export, then handoff. Small jobs use a lightweight harness; higher-risk work can expand into lane-based planning and verification. A machine-readable contract states what must be produced, while a handoff manifest records what was actually delivered.

Editable HTML and related source files remain authority. Desktop and mobile screenshots are evidence for correction, and validation scripts check the contract before a package is called complete.

- [Pinned repository](https://github.com/xianshang33/claw-design/tree/1d8ae789d901c0142a59e7efeec76431d94a5a0f)
- [Claw Design skill](https://github.com/xianshang33/claw-design/blob/1d8ae789d901c0142a59e7efeec76431d94a5a0f/skills/claw-design/SKILL.md)
- [Artifact-contract checker](https://github.com/xianshang33/claw-design/blob/1d8ae789d901c0142a59e7efeec76431d94a5a0f/skills/claw-design/scripts/check_artifact_contract.mjs)
- [Maintainer location evidence](https://github.com/xianshang33)
