# Design DNA

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design DNA turns a visual reference into a portable specification for another agent. Its key product decision is that style must become structured data—not a vague instruction to make a new page “look like” an example.

## JSON separates observation from implementation

The [schema](https://github.com/zanwei/design-dna/blob/9d9d79568df31cd846681f89fd3be1c3ce0c2aff/references/schema.md) covers measurable design-system properties, qualitative style and effects such as motion, Canvas or WebGL. The skill requires a complete JSON profile and marks conflicting references as a main choice plus variants rather than silently averaging them.

```text
screenshots or URLs -> inspect three design dimensions
-> Design DNA JSON -> save/version/share
-> self-contained HTML/CSS/JS -> compare -> refine JSON or implementation
```

The JSON is the long-lived authority. Generated HTML is one projection and can be replaced while retaining the same visual language. The [generation guide](https://github.com/zanwei/design-dna/blob/9d9d79568df31cd846681f89fd3be1c3ce0c2aff/references/generation-guide.md) adds output checks and an explicit polish pass against the original references. There is no hosted project database or direct editor; persistence and iteration are filesystem/Git operations mediated by the host agent.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Primary sources

- [Pinned repository](https://github.com/zanwei/design-dna/tree/9d9d79568df31cd846681f89fd3be1c3ce0c2aff)
- [Operational skill](https://github.com/zanwei/design-dna/blob/9d9d79568df31cd846681f89fd3be1c3ce0c2aff/SKILL.md)
- [MIT license](https://github.com/zanwei/design-dna/blob/9d9d79568df31cd846681f89fd3be1c3ce0c2aff/LICENSE)
