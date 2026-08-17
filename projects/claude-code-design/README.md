# claude-code-design

> Research status: **Source-level** · Last reviewed: **2026-08-12**

`claude-code-design` removes the managed canvas but reconstructs a concrete artifact lifecycle for Claude Code. Skills route the task, starter components scaffold the artifact, Chrome DevTools supplies visual evidence, and explicit commands persist tweaks, register outputs and export them.

## A terminal workflow with visual gates

```text
brief
  -> context detection + specialized skill
  -> HTML artifact from starter components
  -> local server / browser preview
  -> screenshot + DOM snapshot + console sweep
  -> optional tweak log and source application
  -> asset registration
  -> HTML / PDF / PPTX / MP4 delivery
```

The artifact is ordinary HTML/JSX/CSS in the repository. `/done` is a gate rather than a conversational flourish: it waits for document/font readiness, takes visual and DOM evidence, checks console errors and registers clean output.

## Tweak persistence replaces hidden canvas state

`/make-tweakable` binds a preview panel to CSS variables and writes proposed values to `pending.yaml` when the browser permits. `/apply-tweaks` validates those values against the artifact schema, edits the source and appends a timestamped applied log. Git diff can therefore audit or revert the change.

`/inspect` maps a described element through the stored accessibility snapshot to a source selector/location. The mapping is weaker than a native design node ID but materially more precise than asking the model to guess from a screenshot.

## Pinned operational evidence

Revision [`ce68c84`](https://github.com/bluzir/claude-code-design/commit/ce68c84edb8b4ae0d82e3cbae216190443c474b7) includes:

- distinct [wireframe](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/.claude/skills/wireframe/SKILL.md), [prototype](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/.claude/skills/interactive-prototype/SKILL.md), [deck](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/.claude/skills/make-deck/SKILL.md) and [design-system](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/.claude/skills/create-design-system/SKILL.md) paths;
- [verification](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/.claude/skills/verify-artifact/SKILL.md), [registration](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/.claude/skills/register-asset/SKILL.md) and tweak-application contracts;
- executable [PDF](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/scripts/export-pdf.mjs) and [PPTX](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/scripts/export-pptx.mjs) scripts;
- reusable stages and components under [`starters/`](https://github.com/bluzir/claude-code-design/tree/ce68c84edb8b4ae0d82e3cbae216190443c474b7/starters).

## Limits

No license file was present, and the package's npm `test` script is an intentional failure placeholder; no green-test claim is made. The maintainer profile identifies Bali and supports an Indonesia label. This record is independent of Anthropic's Claude Design because it has a separate maintainer and filesystem interface, not because the methodology is unrelated.

## Decisive sources

- [Repository README](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/README.md)
- [Getting started](https://github.com/bluzir/claude-code-design/blob/ce68c84edb8b4ae0d82e3cbae216190443c474b7/GETTING_STARTED.md)
- [Maintainer profile](https://github.com/bluzir)
