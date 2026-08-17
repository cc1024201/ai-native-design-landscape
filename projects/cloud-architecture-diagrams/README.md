# Cloud Architecture Diagrams

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Cloud Architecture Diagrams packages architecture design as an agent skill with a typed intermediate specification, provider icon governance and two editable output targets.

## Semantic specification before drawing

At [`3582b5da`](https://github.com/hansraj316/cloud-arch-marketplace/tree/3582b5dadac0af8adca8f02401bf8f2012e4d92d), the skill validates a JSON specification before layout. This separates system meaning from coordinates and gives tests a stable contract to check.

## Official symbols are part of correctness

Bundled and indexed provider assets constrain icon choice. Separate serializers materialize the specification into Excalidraw or draw.io rather than collapsing it to a bitmap. A preview script supports the visual inspection that schema validation cannot provide.

## Design definition

Here design means governed architecture communication: the agent chooses components and relations under provider conventions; the recipient can still edit the native deliverable. It is a skill product rather than a permanent hosted workspace.

## Evidence

- [Pinned skill repository](https://github.com/hansraj316/cloud-arch-marketplace/tree/3582b5dadac0af8adca8f02401bf8f2012e4d92d)
- [Skill contract](https://github.com/hansraj316/cloud-arch-marketplace/blob/3582b5dadac0af8adca8f02401bf8f2012e4d92d/plugins/cloud-architecture-diagrams/skills/cloud-architecture-diagrams/SKILL.md)
- [Specification schema](https://github.com/hansraj316/cloud-arch-marketplace/blob/3582b5dadac0af8adca8f02401bf8f2012e4d92d/plugins/cloud-architecture-diagrams/skills/cloud-architecture-diagrams/scripts/spec_schema.py)
- [Serializer tests](https://github.com/hansraj316/cloud-arch-marketplace/blob/3582b5dadac0af8adca8f02401bf8f2012e4d92d/plugins/cloud-architecture-diagrams/skills/cloud-architecture-diagrams/tests/test_serializers.py)
