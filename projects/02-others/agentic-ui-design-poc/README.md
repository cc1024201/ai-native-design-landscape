# Agentic UI Design Workflow POC

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Agentic UI Design Workflow POC is a book companion that implements a five-agent Figma-to-HTML pipeline. It is included as a runnable source project, not because its POC label implies production readiness.

## Persistent design context prevents repeated extraction

The project registers Figma token and page nodes, synchronizes variables into `design/tokens.json` and `tokens.css`, and extracts the selected design into `design.md`. Layout and style agents then consume that persistent context to build semantic HTML rather than repeatedly querying Figma with drifting summaries.

An accessibility specialist and visual-QA agent render the page, screenshot it and compare it with the Figma source. Figma owns the original design; token/context files and generated HTML form a new repository authority. The comparison guides code changes but does not create a lossless round trip.

## POC boundary

The checked-in demo is directly inspectable and runnable. It does not claim production component identity, collaboration, deployment or generalized framework coverage beyond its documented HTML/Tailwind path.

- [Pinned Agentic UI POC revision](https://github.com/arwasil/Convert-Figma-with-Multiple-Agents/tree/f83dbe8232e0a8938ed8d5114461a850ecfa54d6)
- [Pipeline and artifact flow](https://github.com/arwasil/Convert-Figma-with-Multiple-Agents/blob/f83dbe8232e0a8938ed8d5114461a850ecfa54d6/README.md)
- [Figma-to-page skill](https://github.com/arwasil/Convert-Figma-with-Multiple-Agents/blob/f83dbe8232e0a8938ed8d5114461a850ecfa54d6/.claude/skills/figma-to-page/SKILL.md)
- [Visual QA skill](https://github.com/arwasil/Convert-Figma-with-Multiple-Agents/blob/f83dbe8232e0a8938ed8d5114461a850ecfa54d6/.claude/skills/visual-qa/SKILL.md)
