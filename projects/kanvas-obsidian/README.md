# Kanvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Kanvas is a shared visual project board for humans and coding agents. It deliberately leaves execution in agent CLIs while making planning, dependencies, approval and progress visible in an Obsidian Canvas document.

## Canvas JSON is a governed coordination artifact

[`canvas-tool.py`](https://github.com/XMihura/Kanvas/blob/093176c079487b82ee6a9ba7427bf69a3ae61e0f/canvas-tool.py) reads and mutates `.canvas` JSON but enforces who may perform each state transition. Agents can propose work, start approved cards and submit them for review; only the human can approve proposals or mark review complete. Dependency arrows automatically block and unblock cards.

The optional [`Canvas Watcher`](https://github.com/XMihura/Kanvas/blob/093176c079487b82ee6a9ba7427bf69a3ae61e0f/canvas-watcher.js) lints manual Obsidian edits and detects invalid cycles. Git versions the visual plan alongside the implementation, so the board is evidence of coordination rather than a disposable chat view.

## Evidence

- [Pinned repository](https://github.com/XMihura/Kanvas/tree/093176c079487b82ee6a9ba7427bf69a3ae61e0f)
- [Workflow contract](https://github.com/XMihura/Kanvas/blob/093176c079487b82ee6a9ba7427bf69a3ae61e0f/RULES.md)
- [Sample canvas](https://github.com/XMihura/Kanvas/blob/093176c079487b82ee6a9ba7427bf69a3ae61e0f/examples/sample-project.canvas)
