# Agents365 Draw.io Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agents365 Draw.io Skill packages editable diagram production as a tested agent workflow. Its center of gravity is not an MCP transport: it is a portable skill, style schema and validation toolchain that makes `.drawio` XML a reviewable filesystem artifact.

## Style and validation are executable constraints

The skill carries named style profiles validated against a JSON schema, diagram-type guidance and scripts for validation, compression, build-up views, PR diffs and de-rasterization. The agent can therefore move from logical content to editable XML, check structure and produce visual review evidence without baking the result into a flat image.

The `.drawio` file is authoritative and remains editable in diagrams.net. Rendered images and diffs are evidence around that source, which places the project in the filesystem-agent pattern rather than a hosted canvas authority.

## Evidence

- [Pinned repository](https://github.com/Agents365-ai/drawio-skill/tree/2ee141e0ff183ce76dc405370aeb142c6961aa45)
- [Agent skill](https://github.com/Agents365-ai/drawio-skill/blob/2ee141e0ff183ce76dc405370aeb142c6961aa45/skills/drawio-skill/SKILL.md)
- [Style schema](https://github.com/Agents365-ai/drawio-skill/blob/2ee141e0ff183ce76dc405370aeb142c6961aa45/skills/drawio-skill/styles/schema.json)
