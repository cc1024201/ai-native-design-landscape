# Design System Multi-Point Inspection Kit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

The Design System Multi-Point Inspection Kit treats a design system as an operational product that can be inspected repeatedly, then connects those findings to a shipping product and a concrete adoption plan.

## Verified and reported evidence never collapse

`ds-inspection` records the reachable system surfaces in `GARAGE.md` and grades ten stations. Every finding says whether the agent directly verified it or only received a report. `product-inspection` requires a running product where possible. `adoption-plan` inventories bespoke UI, verifies replacement APIs against the real catalog and assigns each pattern a disposition and effort.

```text
system intake -> 10-station system inspection -> dated report/work order
shipping product -> 10-station product inspection -> symptoms
bespoke UI inventory -> verified mapping + estimate -> dependency-ordered build waves
```

The [adoption plan](https://github.com/Brad-Frost-Web/ai-design-systems-inspection-kit/blob/0f3c4eba1cf046c124f3de044f77b7844f91a16a/adoption-plan/SKILL.md) closes the gap between audit and implementation without applying changes automatically. Reinspection compares dated files, so Git becomes the longitudinal record. Scores guide conversation; the README explicitly rejects treating them as objective grades.

The project is MIT-licensed. The organization profile reports the United States.

## Evidence

- [Pinned repository](https://github.com/Brad-Frost-Web/ai-design-systems-inspection-kit/tree/0f3c4eba1cf046c124f3de044f77b7844f91a16a)
- [Design-system inspection](https://github.com/Brad-Frost-Web/ai-design-systems-inspection-kit/blob/0f3c4eba1cf046c124f3de044f77b7844f91a16a/ds-inspection/SKILL.md)
- [Product inspection](https://github.com/Brad-Frost-Web/ai-design-systems-inspection-kit/blob/0f3c4eba1cf046c124f3de044f77b7844f91a16a/product-inspection/SKILL.md)
- [Parts mapping phase](https://github.com/Brad-Frost-Web/ai-design-systems-inspection-kit/blob/0f3c4eba1cf046c124f3de044f77b7844f91a16a/adoption-plan/phases/phase-2-parts-mapping.md)
- [MIT license](https://github.com/Brad-Frost-Web/ai-design-systems-inspection-kit/blob/0f3c4eba1cf046c124f3de044f77b7844f91a16a/LICENSE)
