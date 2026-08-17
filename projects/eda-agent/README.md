# EDA Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

EDA Agent is a multi-backend electronics-design agent spanning KiCad, EasyEDA and Altium. Rather than exposing a loose bag of editor macros, it models an autonomous design cycle with plans, snapshots, checkpoints, review, placement, routing, simulation and fabrication-oriented exports.

## A backend bridge sits below a design discipline

Backend adapters translate bounded operations into each EDA host. Above them, the design package owns composition, wiring, buses, differential pairs, BOM reasoning, audit and autonomy. Checkpoint and recovery modules make the long-running loop observable and reversible. Render and review tools then feed visual and rule evidence back into the plan.

The canonical artifact remains the selected EDA project's native files. EDA Agent contributes a portable operation and review layer; it does not pretend that one synthetic scene graph can replace the host's electrical semantics.

## Evidence

- [Pinned repository](https://github.com/salitronic/eda-agent/tree/d6823d5458cbd4a024895156134690c6c7eb4080)
- [Autodesign skill](https://github.com/salitronic/eda-agent/blob/d6823d5458cbd4a024895156134690c6c7eb4080/skills/autodesign/SKILL.md)
- [Checkpoint implementation](https://github.com/salitronic/eda-agent/blob/d6823d5458cbd4a024895156134690c6c7eb4080/src/eda_agent/checkpoint.py)
- [Review engine](https://github.com/salitronic/eda-agent/blob/d6823d5458cbd4a024895156134690c6c7eb4080/src/eda_agent/core/review_engine.py)
