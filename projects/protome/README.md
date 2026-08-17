# Proto-me

> Research status: **Source-level** · Last reviewed: **2026-08-12**

Proto-me defines Design as an optional but explicit stage between product planning and implementation. Its key rule is unusual and clear: the confirmed product brief outranks generated visual references when they conflict.

## Authority moves through explicit files

```text
Explore -> Plan -> [optional Design] -> Agent -> Refine -> Execute
             |              |            |
        editable brief   images/canvas  executable agent file
```

The interactive canvas exposes the brief as editable nodes and arrows. Later refreshes update text in place and preserve user-arranged layout instead of rebuilding the board. Visual concepts can be generated and annotated, but they remain communication assets; `proto-plan` writes the accepted brief and optional reference into the durable execution handoff.

## Why this belongs in the landscape

Proto-me does not claim a native UI design graph. It belongs under visual coordination because it makes product intent, design references and execution boundaries inspectable and correctable before an agent implements a prototype.

Pinned revision [`ed3f442`](https://github.com/protome-dev/protome-skills/commit/ed3f4422cc661bdff46ba7055730fe88f45f7123) contains:

- the top-level [Proto-me skill](https://github.com/protome-dev/protome-skills/tree/ed3f4422cc661bdff46ba7055730fe88f45f7123/skills/proto-me);
- [`proto-open-canvas`](https://github.com/protome-dev/protome-skills/blob/ed3f4422cc661bdff46ba7055730fe88f45f7123/skills/proto-open-canvas/SKILL.md);
- the executable [`proto-plan`](https://github.com/protome-dev/protome-skills/blob/ed3f4422cc661bdff46ba7055730fe88f45f7123/skills/proto-plan/SKILL.md);
- project-local task, findings and progress templates under [`proto-planning-with-files`](https://github.com/protome-dev/protome-skills/tree/ed3f4422cc661bdff46ba7055730fe88f45f7123/skills/proto-planning-with-files).

## Limits

The repository has no license file. Its output quality depends on the host Codex capabilities and optional image tools; this review establishes the file protocol rather than a specific model result. The organization profile supplies no reliable region.

## Decisive sources

- [Repository README](https://github.com/protome-dev/protome-skills/blob/ed3f4422cc661bdff46ba7055730fe88f45f7123/README.md)
- [Pinned skills tree](https://github.com/protome-dev/protome-skills/tree/ed3f4422cc661bdff46ba7055730fe88f45f7123/skills)
