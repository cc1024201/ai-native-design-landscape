# Lanhu to Code

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Lanhu to Code is not a general screenshot-to-code demo. It is a Claude Code skill pipeline whose ordinary input is a specific Lanhu design and whose output is a controlled mutation of an existing or newly created frontend codebase.

## The handoff begins with explicit authority

The orchestrating [`design-to-code` skill](https://github.com/ursazoo/lanhu-to-code/blob/fb26ba5d8b71e88e942aa3cc02f732d33f258367/skills/design-to-code/SKILL.md) requires the Lanhu page URL and asks whether the target is an existing project. Before generation it discovers the framework, project conventions, design specifications and reusable-component documentation. This prevents the fetched design from being treated as the only source of truth.

## A comparison table is the write gate

The workflow requires a CSS-value comparison between the design and the intended implementation and asks the user to confirm it before writing source. The [`code-gen` stage](https://github.com/ursazoo/lanhu-to-code/blob/fb26ba5d8b71e88e942aa3cc02f732d33f258367/skills/code-gen/SKILL.md) then maps the approved values into project components and tokens while leaving unsupported business behavior explicit rather than fabricating it.

## Formatting is a separate responsibility

[`code-format`](https://github.com/ursazoo/lanhu-to-code/blob/fb26ba5d8b71e88e942aa3cc02f732d33f258367/skills/code-format/SKILL.md) runs after materialization. The split matters: design retrieval and semantic grounding choose what to build; the destination repository owns the durable files; formatting only normalizes that result.

## Pinned evidence

- [Canonical repository](https://github.com/ursazoo/lanhu-to-code)
- [Inspected tree](https://github.com/ursazoo/lanhu-to-code/tree/fb26ba5d8b71e88e942aa3cc02f732d33f258367)
- Commit: `fb26ba5d8b71e88e942aa3cc02f732d33f258367`
