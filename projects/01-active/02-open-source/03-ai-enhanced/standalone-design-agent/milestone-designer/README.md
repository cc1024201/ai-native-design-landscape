# Milestone Designer

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Milestone Designer is a repository-native UX-design workflow for coding agents. A single UX architect converts the brief into a plan, a bounded group of wireframers produces screens, and an unskippable human review gate determines what becomes downstream implementation input.

## Committed HTML and specs are the handoff authority

The [`design` skill](https://github.com/kenmulford/milestone-designer/blob/0418ad0e9d6b61099d34389137077b349ab750e6/skills/design/SKILL.md) fixes the orchestration: one architect and a rolling maximum of four wireframers. Each run writes `docs/designs/<slug>/spec.md` plus standalone `screens/*.html`, governed by the [`artifact contract`](https://github.com/kenmulford/milestone-designer/blob/0418ad0e9d6b61099d34389137077b349ab750e6/docs/artifact-contract.md).

The review step cannot be skipped, so candidate screens do not silently become accepted design. Optional DesignSync is one-way; it does not displace the committed files as canonical artifacts. The maintainer's first-party profile identifies Florida, United States.

## Evidence

- [Pinned repository](https://github.com/kenmulford/milestone-designer/tree/0418ad0e9d6b61099d34389137077b349ab750e6)
- [UX architect agent](https://github.com/kenmulford/milestone-designer/blob/0418ad0e9d6b61099d34389137077b349ab750e6/agents/ux-architect.md)
- [Wireframer agent](https://github.com/kenmulford/milestone-designer/blob/0418ad0e9d6b61099d34389137077b349ab750e6/agents/wireframer.md)
- [Maintainer profile](https://github.com/kenmulford)
