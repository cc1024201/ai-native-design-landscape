# SPECULA Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SPECULA Skill narrows the ecosystem to one implementable task: design a constitution and operational state machine for an AI system then prove they align before runtime integration.

## Constitution and state machine must agree

At commit [`b6b83f2`](https://github.com/oddtitoreal/specula-skill/tree/b6b83f2738a0f960320a64616d2cf3440eedd3cd) [`SKILL.md`](https://github.com/oddtitoreal/specula-skill/blob/b6b83f2738a0f960320a64616d2cf3440eedd3cd/SKILL.md) guides an external agent through principles constraints states transitions and guard mappings. Separate JSON schemas validate each artifact and [`validate_specula.py`](https://github.com/oddtitoreal/specula-skill/blob/b6b83f2738a0f960320a64616d2cf3440eedd3cd/scripts/validate_specula.py) checks cross-artifact consistency.

Examples include both fictional luxury-fashion and real community-space brand governance. Validation output is evidence; the constitution and state-machine JSON are the editable authority.

The skill is separately counted from the canonical Framework because it has a smaller user workflow and version boundary. It does not yet implement the broader orchestration trace and memory capabilities on its roadmap. The maintainer profile lists Pesaro Italy.

## Evidence

- [Constitution schema](https://github.com/oddtitoreal/specula-skill/blob/b6b83f2738a0f960320a64616d2cf3440eedd3cd/references/schemas-constitution.json)
- [State-machine example](https://github.com/oddtitoreal/specula-skill/blob/b6b83f2738a0f960320a64616d2cf3440eedd3cd/examples/community-space-brand/state-machine.json)
- [Pinned README](https://github.com/oddtitoreal/specula-skill/blob/b6b83f2738a0f960320a64616d2cf3440eedd3cd/README.md)
