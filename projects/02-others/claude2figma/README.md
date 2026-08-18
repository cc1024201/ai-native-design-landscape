# Claude2Figma

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claude2Figma is a four-skill control layer for design-system-compliant Figma generation. It assumes a working Figma MCP and focuses on a narrower failure: visually plausible agent output that ignores the file's components, variables and styles.

## Preflight creates temporary registries

[`figma-preflight`](https://github.com/senlindesign/claude2figma/blob/edc95d78357249c513cea562659767de159e182c/.claude/skills/figma-preflight/SKILL.md) verifies connection, permissions and available libraries, then builds a token map and component registry before any mutation. Component rules require library-first construction; style binding forbids raw visual values and performs post-write checks.

```text
Figma URL -> connection/library preflight -> token map + component registry
-> search DS -> create native instances -> bind variables/styles
-> post-write inspection -> repair noncompliance
```

Figma's graph remains the authority and its history provides recovery. The registries are working context, not a second permanent design system. The package improves agent discipline but relies on the host bridge for actual reads and writes.

The project is MIT-licensed. The maintainer profile reports the Netherlands.

## Evidence

- [Pinned repository](https://github.com/senlindesign/claude2figma/tree/edc95d78357249c513cea562659767de159e182c)
- [Component construction rules](https://github.com/senlindesign/claude2figma/blob/edc95d78357249c513cea562659767de159e182c/.claude/skills/component-rules/SKILL.md)
- [Style binding and QA](https://github.com/senlindesign/claude2figma/blob/edc95d78357249c513cea562659767de159e182c/.claude/skills/figma-style-binding/SKILL.md)
- [MIT license](https://github.com/senlindesign/claude2figma/blob/edc95d78357249c513cea562659767de159e182c/LICENSE)
