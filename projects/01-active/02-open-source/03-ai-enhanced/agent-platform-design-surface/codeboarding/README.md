# CodeBoarding

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CodeBoarding constructs a maintainable visual index of a codebase. Static analyzers establish structure; an LLM adds explanation and Mermaid documents; a web viewer turns the combined artifacts into a browsing surface.

## Analysis JSON is the durable join

At [`8c3f2218`](https://github.com/CodeBoarding/CodeBoarding/tree/8c3f2218c3ecab1294902db5914f5e526f78524d), analysis code records clusters and file coverage in persisted JSON. Diagram generation consumes that structure instead of relying only on an unconstrained repository prompt.

## Incremental change is explicit

Warm-start and changed-file paths compute cluster deltas. The incremental CLI can refresh affected analysis rather than rebuilding every visual after each commit. Generated documentation remains filesystem state that can be inspected and versioned.

## Authority boundary

Code remains implementation authority; analysis JSON and Mermaid coordinate understanding. The viewer does not write architecture changes back to source, so this is visual coordination rather than a native code editor.

## Evidence

- [Pinned source](https://github.com/CodeBoarding/CodeBoarding/tree/8c3f2218c3ecab1294902db5914f5e526f78524d)
- [Analysis workflow](https://github.com/CodeBoarding/CodeBoarding/blob/8c3f2218c3ecab1294902db5914f5e526f78524d/codeboarding_workflows/analysis.py)
- [Persisted analysis model](https://github.com/CodeBoarding/CodeBoarding/blob/8c3f2218c3ecab1294902db5914f5e526f78524d/diagram_analysis/analysis_json.py)
- [Diagram generator](https://github.com/CodeBoarding/CodeBoarding/blob/8c3f2218c3ecab1294902db5914f5e526f78524d/diagram_analysis/diagram_generator.py)
- [Incremental command](https://github.com/CodeBoarding/CodeBoarding/blob/8c3f2218c3ecab1294902db5914f5e526f78524d/codeboarding_cli/commands/incremental_analysis.py)
