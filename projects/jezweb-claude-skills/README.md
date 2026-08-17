# Jezweb Claude Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Jezweb Claude Skills is a broad plugin collection, but it qualifies here through an unusually complete design-production and UX-verification subsystem: a multi-page design loop, persistent design-system files, responsive screenshots and hard evidence gates.

## Design state is carried between agent turns in files

The design loop records site-level decisions in `.design/SITE.md`, page-level decisions in `DESIGN.md` and a baton for the next step. Optional generated-reference IDs can be retained without replacing repository authority. Front-end implementation is followed by desktop and mobile captures, design review and UX audit; the audit requires an evidence manifest and blocks unsupported claims.

`capture-screenshots` makes the visual checks executable. The repository files remain canonical, while screenshots and audit outputs decide whether the loop may advance. This is one packaged product collection rather than a separate census record for every skill.

## Evidence

- [Pinned repository](https://github.com/jezweb/claude-skills/tree/e875a6bfff809e5d42c584104031e36e1f014f18)
- [Design loop](https://github.com/jezweb/claude-skills/blob/e875a6bfff809e5d42c584104031e36e1f014f18/plugins/frontend/skills/design-loop/SKILL.md)
- [Design-system contract](https://github.com/jezweb/claude-skills/blob/e875a6bfff809e5d42c584104031e36e1f014f18/plugins/frontend/skills/design-system/SKILL.md)
- [UX audit gate](https://github.com/jezweb/claude-skills/blob/e875a6bfff809e5d42c584104031e36e1f014f18/plugins/dev-tools/skills/ux-audit/SKILL.md)
