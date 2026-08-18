# Designpowers

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Designpowers treats Design as an observable multi-agent process directed by a human rather than a single generator. Ten specialist agents hand off research, strategy, visual direction, motion, content, implementation and review while repository files preserve their decisions.

## `design-state.md` is the process memory

The router and 36 skills operate in two lanes: a full Build lane and a bounded Review lane. Direct mode pauses at handoffs; Auto mode runs farther before review. In either case, [`design-state/SKILL.md`](https://github.com/Owl-Listener/designpowers/blob/cb00757da9d554591fa78d27aa1854d60a05c4f7/skills/design-state/SKILL.md) defines shared state that every agent reads and updates.

Several artifacts separate kinds of truth:

- the brief, principles and design state capture current intent and decisions;
- a `DESIGN.md` can become the visual-system authority;
- debate records retain competing directions before the user chooses;
- design debt tracks deferred findings and affected users;
- handoff and verification evidence connect decisions to source delivery;
- retrospectives record observations but the product explicitly does not feed cross-project taste memory back as an automatic controller.

```text
discover -> research -> debate -> human direction -> design/build
-> parallel critique + accessibility review -> fix -> evidence -> handoff
```

The system can use Figma or HTML through a bridge skill, but filesystem artifacts and the implementation repository remain the portable authority. The project is MIT-licensed. The maintainer profile reports London in the United Kingdom.

## Pinned evidence

- [Repository](https://github.com/Owl-Listener/designpowers/tree/cb00757da9d554591fa78d27aa1854d60a05c4f7)
- [Traced run](https://github.com/Owl-Listener/designpowers/tree/cb00757da9d554591fa78d27aa1854d60a05c4f7/examples/traced-run)
- [Design debate](https://github.com/Owl-Listener/designpowers/blob/cb00757da9d554591fa78d27aa1854d60a05c4f7/skills/design-debate/SKILL.md)
- [MIT license](https://github.com/Owl-Listener/designpowers/blob/cb00757da9d554591fa78d27aa1854d60a05c4f7/LICENSE)
