# Figma2Webflow-AW

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Figma2Webflow-AW is a Vietnamese multi-agent workflow for translating Figma designs into Webflow sites that follow Finsweet Client-First conventions. A project manager coordinates an architect and an operator instead of allowing one agent to inspect, mutate and approve the same result without separation of duties.

## A file-backed workspace mediates two external authorities

Figma is the source-design authority and Webflow's DOM, classes and styles are the implementation authority. Between them, the workspace persists raw extraction, content, a design-system record, page structure, blueprints, state, error logs and a mandatory session handoff. The operator builds in small MCP chunks; the architect scans the Webflow result and either approves it or records a correction.

Archive and restore scripts preserve workspace history, while an explicit user approval gate separates blueprint agreement from host mutation. This is an independent operating product, not Webflow's official skills and not merely another link to the Figma-to-Webflow starter.

- [Pinned repository](https://github.com/Khane0212/MAS-Figma-Webflow/tree/c1e5cc0906b5418256e1283b3b358202fe775d0e)
- [Operating procedure](https://github.com/Khane0212/MAS-Figma-Webflow/blob/c1e5cc0906b5418256e1283b3b358202fe775d0e/SOP.md)
- [Architect skill](https://github.com/Khane0212/MAS-Figma-Webflow/blob/c1e5cc0906b5418256e1283b3b358202fe775d0e/.gemini/skills/architect-logic/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/Khane0212)
