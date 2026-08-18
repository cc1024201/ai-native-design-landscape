# Pix

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Pix defines Figma-to-code as a closed visual correction loop inside Claude Code. It does not mutate the Figma file; it uses Figma as reference authority and repeatedly changes repository source until the running implementation converges.

## Two rendered surfaces constrain implementation

The [Pix skill](https://github.com/skobak/pix/blob/4a5d90096098f3afdd6508fdfd6330827fd7ffc3/skills/pix/SKILL.md) preflights the Figma MCP and Chrome integration, detects the frontend stack and its design system, then collects metadata, variables, Code Connect mappings and the reference screenshot. After implementation, Chrome supplies a runtime screenshot and computed styles for diagnosis.

```text
Figma nodes + tokens + mappings + screenshot
-> repository implementation -> local runtime screenshot/styles
-> visual difference diagnosis -> source correction -> repeat
```

This is design-code materialization, not synchronization: later Figma edits do not merge automatically, and code changes do not flow back. Repository source becomes runtime authority; screenshots are transient evidence. The loop is operationally detailed but remains an instruction package with no independent metric engine, persisted comparison history or test corpus.

The maintainer profile reports Sweden. No explicit license text was present despite a License section in the README.

## Evidence

- [Pinned repository](https://github.com/skobak/pix/tree/4a5d90096098f3afdd6508fdfd6330827fd7ffc3)
- [Workflow overview](https://github.com/skobak/pix/blob/4a5d90096098f3afdd6508fdfd6330827fd7ffc3/README.md)
