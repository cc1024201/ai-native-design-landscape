# WebNode Framework

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WebNode Framework is a node-based Python web framework where `graph.json` is edited visually and materialized into an executable `main.py` application.

## `graph.json` is the design authority

The Node Editor defines routes, logic, markup, styles, and relationships as structured graph data. Generation projects that state into Python. The produced file can run independently, but regeneration starts from the graph, making source authority explicit rather than hiding it in a screenshot.

## AI has its own editor but writes the same system

The AI Editor can create nodes, HTML, CSS, application logic, and interface material. Its output joins the graph-to-code pipeline instead of living in a separate mock preview. Users can switch back to direct node editing whenever generated structure is wrong.

## Transcripts are part of recovery

SQLite stores project information and conversational transcripts. The source uses transcript data to reconstruct a damaged canvas, connecting AI interaction history to artifact recovery. This is useful but also means transcript integrity matters; generated Python remains a projection that should be reviewed before deployment.

## Pinned evidence

- Repository: [LifelessA/webnode](https://github.com/LifelessA/webnode)
- Inspected framework and editors: [`2691173264d606c879c1d4a661a587a580bb7188`](https://github.com/LifelessA/webnode/tree/2691173264d606c879c1d4a661a587a580bb7188)
- Immutable revision: [commit `2691173`](https://github.com/LifelessA/webnode/commit/2691173264d606c879c1d4a661a587a580bb7188)
