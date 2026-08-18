# UML Tool

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UML Tool is intentionally small: it gives a human and a repository-local coding agent one diagram JSON to discuss and edit. The point is not AI generation as a button; it is a live shared artifact outside chat.

## Source and snapshot are kept separate

At commit [`71b2e2c`](https://github.com/goodmorningcoffee/uml_tool/tree/71b2e2c7fd0172023422a52e51f73710a9840de5) diagrams under `data/diagrams` store nodes edges positions sizes notes and meta-links. [`shared/diagram.js`](https://github.com/goodmorningcoffee/uml_tool/blob/71b2e2c7fd0172023422a52e51f73710a9840de5/shared/diagram.js) validates the model. The browser supports direct manipulation while server operations let an agent inspect and mutate the current diagram.

Server-Sent Events refresh the open browser after agent operations. Operation logs provide trace evidence; SVG files under `data/exports` are visual snapshots and never the edit authority.

The tool is save-oriented rather than true simultaneous multiplayer editing. That limitation is stated by the project and prevents overclaiming a CRDT collaboration model. The maintainer profile lists NYC United States.

## Evidence

- [Agent bridge tests](https://github.com/goodmorningcoffee/uml_tool/blob/71b2e2c7fd0172023422a52e51f73710a9840de5/tests/agent_bridge.test.js)
- [Server implementation](https://github.com/goodmorningcoffee/uml_tool/blob/71b2e2c7fd0172023422a52e51f73710a9840de5/server/app.js)
- [Pinned README](https://github.com/goodmorningcoffee/uml_tool/blob/71b2e2c7fd0172023422a52e51f73710a9840de5/README.md)
