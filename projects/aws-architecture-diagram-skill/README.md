# AWS Architecture Diagram Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AWS Architecture Diagram Skill packages an AWS-specific visual language for Claude, Codex and Kiro. It provides icon references, editable templates and validation so an agent can compose diagrams with recognizable AWS semantics instead of guessing generic boxes.

## Templates establish topology; icon references preserve vocabulary

The skill selects from reusable VPC, three-tier, static-site, serverless and event-driven structures, then adapts the native Draw.io XML. Category-specific icon references constrain shape names, while the validation script and all-icons visual fixture catch broken style or resource mappings.

The output is an ordinary `.drawio` document that users can continue editing. The skills for different agent hosts are delivery adapters for one product and are not counted as separate implementations.

## Evidence

- [Pinned repository](https://github.com/vidanov/aws-architecture-diagram-skill/tree/29c1babbbe7ec69bed7f28f34380f906af5ae7af)
- [Canonical skill](https://github.com/vidanov/aws-architecture-diagram-skill/blob/29c1babbbe7ec69bed7f28f34380f906af5ae7af/skills/aws-architecture-diagram/SKILL.md)
- [Three-tier template](https://github.com/vidanov/aws-architecture-diagram-skill/blob/29c1babbbe7ec69bed7f28f34380f906af5ae7af/templates/three-tier-web-app.drawio)
- [Draw.io validator](https://github.com/vidanov/aws-architecture-diagram-skill/blob/29c1babbbe7ec69bed7f28f34380f906af5ae7af/tests/validate_drawio.py)
