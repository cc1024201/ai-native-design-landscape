# Code2Video

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Code2Video is included as an independently runnable educational-video authoring system, not merely because it has an ICML paper. Its native artifact is executable Manim source coordinated with outline, storyboard, renders and critic feedback on disk.

## Three roles converge on debuggable code

[`agent.py`](https://github.com/showlab/Code2Video/blob/cf7fba33a6db9ff332ae2b8311a4aee1c58961c0/src/agent.py) expands a learning topic into a persisted outline and storyboard, generates section-level Manim code, renders it and records feedback. Existing files are loaded on a later run, so the intermediate planning and source artifacts remain inspectable and replaceable.

The critic is not only a text reviewer. [`scope_refine.py`](https://github.com/showlab/Code2Video/blob/cf7fba33a6db9ff332ae2b8311a4aee1c58961c0/src/scope_refine.py) analyzes render and code failures, scopes repairs to a line, function or animation section and uses visual anchors for layout refinement. Re-rendering the corrected code gives a reproducible path from the editable source to the final video.

## Research ceiling

This is a scripted framework rather than a polished visual editor: a user modifies prompts, JSON or Python and reruns the pipeline. That narrower interaction model is recorded in the product form; it does not invalidate the concrete source-authority loop.

## Evidence

- [Pinned repository](https://github.com/showlab/Code2Video/tree/cf7fba33a6db9ff332ae2b8311a4aee1c58961c0)
- [Runnable single-agent entry point](https://github.com/showlab/Code2Video/blob/cf7fba33a6db9ff332ae2b8311a4aee1c58961c0/src/run_agent_single.sh)
- [First-party project page](https://showlab.github.io/Code2Video/)
