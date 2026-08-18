# AuricIDE

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AuricIDE defines design unusually broadly: not as one canvas, but as the project structure through which humans and a fleet of CLI agents agree on desired outcomes, evidence, documents and visual artifacts. Its architecture deliberately uses several authorities because goals, Markdown, diagrams and agent execution have different lifecycle needs.

## Outcome state is separate from artifact state

At commit [`4ddf3d22`](https://github.com/j-amelunxen/AuricIDE/tree/4ddf3d2296929a23d06bdce5922ee40773931df2), goals, tickets, requirements, goal-line stations, reviews and run records live in a per-project SQLite database. The FastMCP server in [`src/mcp`](https://github.com/j-amelunxen/AuricIDE/tree/4ddf3d2296929a23d06bdce5922ee40773931df2/src/mcp) opens that same database, so agents change the project-management state used by the UI and conductor rather than a disconnected export.

[`getGoalSatisfaction`](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/src/lib/store/goalsSlice.ts) refuses empty goals and reports blockers until subtree tickets are done, linked requirements are verified, stations are done with verified evidence, and direct child goals are achieved. Free-text `successCriteria` guides planning and judging, but the final predicate is these structured records—not arbitrary natural language executed as code.

```mermaid
flowchart LR
    G["Goal + success criteria"] --> P["Tickets / requirements / evidence stations"]
    P --> C["Conductor dispatches CLI agents"]
    C --> M["MCP + filesystem changes"]
    M --> V["Structured satisfaction check"]
    V -->|Blockers| C
    V -->|All gates verified| A["Achieved"]
```

This makes orchestration itself a design surface: the desired world state, its decomposition and its evidence are first-class artifacts.

## Visual forms retain native project authorities

AuricIDE does not normalize every visual into one proprietary scene:

- [`markdownParser.ts`](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/src/lib/canvas/markdownParser.ts) parses workflow nodes, positions and edges from readable Markdown comments; moving nodes serializes the workflow back to that file.
- [`mermaidWidgetExtension.ts`](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/src/lib/editor/mermaidWidgetExtension.ts) turns supported Mermaid flowchart fences into a direct-manipulation XYFlow widget and writes visual changes back into the fenced source. Other Mermaid families remain preview-oriented.
- Local [`.excalidraw` files](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/src/app/components/excalidraw/ExcalidrawViewer.tsx) are editable and debounced back to disk. Files linked to Excalidraw+ are read-only locally because the cloud scene is declared authoritative; users can resync or unlink.
- Obsidian `.canvas` JSON is editable in the UI and through [`canvas_write`](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/src/mcp/tools/canvas.ts), whose batched operations are applied atomically and constrained to the project root.

The common interface is the project filesystem, not a universal internal artifact model. That lets Git, external editors and agents inspect the same durable objects, while format-specific round-trip code owns each visual projection.

## Agents operate through two trust boundaries

The conductor launches real CLI agents as PTY child processes and observes their output and exit state. Goals and project-management mutations have typed MCP tools over SQLite; code and visual files remain available through the agents' filesystem capabilities. Provider definitions can be added as JSON, while permission behavior is delegated to each underlying CLI.

This split is powerful but broad: a filesystem-capable agent can affect much more than a diagram, whereas MCP goal and canvas tools validate narrower operations. Human-supervision flags, dependency blocking, attempt limits and evidence judging reduce orchestration risk without forming a general sandbox.

## History follows the authority

SQLite retains selected operational history such as ticket status transitions, goal runs, review verdicts and conductor decisions. It does not version every project file. Markdown, Mermaid, workflow, Obsidian Canvas and local Excalidraw changes rely on ordinary files and the built-in Git workflow for durable revision history; the README explicitly notes that in-app branch switching is not yet implemented.

AuricIDE adds a system-level definition to the landscape: “design” is the governed project state that connects intent, executable work, visual reasoning and evidence. Its distinctiveness lies less in any one renderer than in keeping agents and humans on the same authoritative project surfaces.

## Evidence

- [Pinned product and orchestration contract](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/README.md)
- [Goal satisfaction predicate](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/src/lib/store/goalsSlice.ts)
- [SQLite/MCP schema](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/src/mcp/db.ts)
- [Atomic agent operations on Obsidian Canvas](https://github.com/j-amelunxen/AuricIDE/blob/4ddf3d2296929a23d06bdce5922ee40773931df2/src/mcp/tools/canvas.ts)
