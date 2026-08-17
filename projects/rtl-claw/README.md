# RTL-CLAW

> Research status: **Source-level with disclosed gaps** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

RTL-CLAW frames digital IC design as a skill-routed agent workflow over RTL source and deterministic EDA tools. The public repository is also unusually explicit that part of the advertised system is not yet published.

## What is executable at the pinned revision

At commit [`b880f3f`](https://github.com/TONGJI-EDA-LAB/RTL-CLAW/tree/b880f3f6e46b16c36cbced5bc90d2d0ccc495403) Docker and OpenClaw configuration establish a local environment. Skills cover [specification analysis](https://github.com/TONGJI-EDA-LAB/RTL-CLAW/blob/b880f3f6e46b16c36cbced5bc90d2d0ccc495403/skills/rtl-spec-analyzer/SKILL.md) partitioning optimization merge and testbench generation. Workspace files carry the RTL and verification outputs between stages.

The agent can propose and transform RTL but synthesis simulation and acceptance tooling remain the numerical authority. Partition-Opt-Merge lets several focused edits be recombined before verification rather than asking one prompt to own the whole design.

## Publication gap is part of the finding

The README and technical report describe broader verification synthesis and physical-design ambitions while noting that unpublished research features are absent. The current source supports an agent toolchain record; it does not support claiming a complete public RTL-to-GDS implementation.

The repository names Tongji University in Shanghai China as the affiliation.

## Evidence

- [Pinned README](https://github.com/TONGJI-EDA-LAB/RTL-CLAW/blob/b880f3f6e46b16c36cbced5bc90d2d0ccc495403/README.md)
- [Workspace agent contract](https://github.com/TONGJI-EDA-LAB/RTL-CLAW/blob/b880f3f6e46b16c36cbced5bc90d2d0ccc495403/workspace/AGENTS.md)
- [Technical report](https://github.com/TONGJI-EDA-LAB/RTL-CLAW/blob/b880f3f6e46b16c36cbced5bc90d2d0ccc495403/RTL-CLAW.pdf)
