# AI Tutors Hub Visual Agent Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Tutors Hub is an Arabic and English Streamlit workspace in which projects contain agent/tool nodes, connections, memory and evaluation state. Its later double-hyphen repository is the canonical inspected line; the nested earlier upload is the same product.

## SQLite owns nodes and edges

[flow_builder.py](https://github.com/AMRSAEEDBADWAY/visual--agent--builder/blob/7fddabeb7c6e26a4bab36807e744b76c8a4de95b/core/flow_builder.py) maps editor operations to node and edge records. [database.py](https://github.com/AMRSAEEDBADWAY/visual--agent--builder/blob/7fddabeb7c6e26a4bab36807e744b76c8a4de95b/core/database.py) enforces project-scoped foreign keys rather than saving one opaque screenshot.

## Restoration replaces the complete project graph

[version_history.py](https://github.com/AMRSAEEDBADWAY/visual--agent--builder/blob/7fddabeb7c6e26a4bab36807e744b76c8a4de95b/core/version_history.py) serializes a project snapshot and restores it by replacing current nodes and edges. This is actual recoverability, although it lacks branching and merge semantics.

## Runtime breadth is uneven

The workspace includes specialized planner, researcher, writer, vision and ML agents plus testing tools. Some Streamlit surfaces are more complete than the generic graph-to-runtime path, so the dossier counts persisted composition and version restoration without claiming that every palette combination executes uniformly.

## Pinned evidence

- [Repository](https://github.com/AMRSAEEDBADWAY/visual--agent--builder)
- [Inspected tree](https://github.com/AMRSAEEDBADWAY/visual--agent--builder/tree/7fddabeb7c6e26a4bab36807e744b76c8a4de95b)
- [Flow editor](https://github.com/AMRSAEEDBADWAY/visual--agent--builder/blob/7fddabeb7c6e26a4bab36807e744b76c8a4de95b/views/2_flow_editor.py)
