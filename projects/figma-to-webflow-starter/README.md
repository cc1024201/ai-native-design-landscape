# Figma to Webflow Starter

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Figma to Webflow Starter drives Claude Code through both Figma and Webflow MCP so the delivery remains a real site editable in Webflow Designer. The workflow also owns visual QA, responsive rules, accessibility, SEO and publication approval.

## Webflow is mutated as the target canvas

Briefing extracts colors, type, spacing and frame width into `PROJECT_BRIEF.md` and CSS. Analysis inventories every Figma page, section, node and image. The agent then creates Webflow variables, fonts, pages, assets and sections before comparing each rendered section with Figma and correcting discrepancies.

Figma is the source reference; the Webflow project is the mutable delivery authority. A global CSS component supplies the fluid sizing system that Webflow cannot express natively, while the user chooses the class convention. Publication is a separately approved transition after QA and metadata work.

This differs from exporting static HTML: the product deliberately preserves the ordinary user's Webflow editing surface and ownership after agent execution.

- [Pinned repository](https://github.com/Produlis/figma-to-webflow-starter/tree/942fae5d361c6abfebe3a873e7871be2095651e0)
- [Build command](https://github.com/Produlis/figma-to-webflow-starter/blob/942fae5d361c6abfebe3a873e7871be2095651e0/.claude/commands/build.md)
- [Design-system contract](https://github.com/Produlis/figma-to-webflow-starter/blob/942fae5d361c6abfebe3a873e7871be2095651e0/DESIGN-SYSTEM.md)
- [Organization profile checked; no location published](https://github.com/Produlis)
