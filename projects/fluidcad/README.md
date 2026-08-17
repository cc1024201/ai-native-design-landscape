# FluidCAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FluidCAD is a browser parametric CAD environment in which JavaScript source is the canonical model. Visual tools and agents do not edit an opaque duplicate: both work by changing `.fluid.js`, rebuilding it through the geometry engine and observing the result.

## Source is geometry authority

Click-based tools can open parameter dialogs and write code; the viewport evaluates that code into an inspectable scene. The modeling history can roll back features, and STEP import/export provides an engineering interchange boundary. The MCP server separates source mutation, engine control, inspection and screenshot tools in [`mcp/src/tools`](https://github.com/Fluid-CAD/FluidCAD/tree/07c07a7bdab1f7ad419d80dfa68fa0a59647d037/mcp/src/tools).

```text
human click or agent edit -> .fluid.js
-> exact modeling engine -> scene and feature history
-> inspect + screenshot -> correction -> STEP or source delivery
```

This is a code-parametric loop: screenshots are evidence, not authority. The repository proves the local and MCP mechanisms but offers no reliable first-party maintainer location, so region remains unknown.

## Evidence

- [Pinned product repository](https://github.com/Fluid-CAD/FluidCAD/tree/07c07a7bdab1f7ad419d80dfa68fa0a59647d037)
- [Source mutation tools](https://github.com/Fluid-CAD/FluidCAD/blob/07c07a7bdab1f7ad419d80dfa68fa0a59647d037/mcp/src/tools/source.ts)
- [Geometry inspection tools](https://github.com/Fluid-CAD/FluidCAD/blob/07c07a7bdab1f7ad419d80dfa68fa0a59647d037/mcp/src/tools/inspection.ts)
- [History and rollback](https://github.com/Fluid-CAD/FluidCAD/blob/07c07a7bdab1f7ad419d80dfa68fa0a59647d037/llm-docs/concepts/history-and-rollback.md)
