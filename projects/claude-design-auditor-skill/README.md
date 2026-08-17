# Claude Design Auditor Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claude Design Auditor Skill defines Design as a scored correction process across Figma files, code, screenshots, wireframes and written descriptions. Its durable output is a prioritized audit report; when the host exposes write access, selected findings can also become code patches or native Figma changes.

## Nineteen categories feed one decision surface

The [main skill](https://github.com/Ashutos1997/claude-design-auditor-skill/blob/e7a1f3153d8e7cbf485924a1b92b6110aa0be299/SKILL.md) routes evidence through rules for typography, spacing, color, states, navigation, accessibility, tokens, ethics and usability. Blockers are separated from severity-ranked quality findings. A priority matrix combines impact and effort rather than presenting an undifferentiated checklist.

```text
Figma/code/screenshot/wireframe -> evidence extraction
-> 19-category scores + blockers + priority matrix
-> report / code diff / selected Figma repair -> re-audit
```

The [Figma reference](https://github.com/Ashutos1997/claude-design-auditor-skill/blob/e7a1f3153d8e7cbf485924a1b92b6110aa0be299/references/figma-mcp.md) describes inspection and repair through host tools. Markdown reports and patched source can be versioned; Figma fixes inherit host history. The repository packages rule knowledge rather than a deterministic analyzer, so scores depend on the executing model and accessible evidence.

No license file or reliable maintainer-region evidence was found.

## Sources

- [Pinned repository](https://github.com/Ashutos1997/claude-design-auditor-skill/tree/e7a1f3153d8e7cbf485924a1b92b6110aa0be299)
- [Token rules](https://github.com/Ashutos1997/claude-design-auditor-skill/blob/e7a1f3153d8e7cbf485924a1b92b6110aa0be299/references/tokens.md)
- [Ethics rules](https://github.com/Ashutos1997/claude-design-auditor-skill/blob/e7a1f3153d8e7cbf485924a1b92b6110aa0be299/references/ethics.md)
