# CADSmith

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CADSmith combines retrieved CadQuery knowledge, exact OpenCascade measurements and multi-view visual judgment in two nested repair loops. Its purpose is to catch both code failures and geometrically valid parts that do not satisfy the requested dimensions or structure.

## Numerical and visual validators see different failures

A planner writes a component-and-constraint specification. A coder retrieves relevant API material and emits CadQuery Python; an executor isolates that code, extracts kernel facts and exports STEP/STL. The inner loop repairs execution errors. The outer loop gives a separate judge the prompt, code, measurements and three rendered views, then lets a refiner correct structural failures.

Python and the structured plan preserve constructive intent. OpenCascade geometry and exact metrics are the dimensional authority; renders expose shape errors those scalars miss. The published benchmark uses handwritten reference scripts and absolute-millimeter alignment, but its own near-miss example shows that fixed views and aggregate metrics can still miss local gaps.

This product is unrelated to Jon Fermin's lowercase `cadsmith`; maintainer qualification prevents the shared name from merging two teams and two pipelines.

- [Pinned repository](https://github.com/jabarkle/CADSmith/tree/a856517e4e9449eb71dd6f7f83aa9fffa40f5bbb)
- [Pipeline orchestration](https://github.com/jabarkle/CADSmith/blob/a856517e4e9449eb71dd6f7f83aa9fffa40f5bbb/pipeline.py)
- [Geometry validator](https://github.com/jabarkle/CADSmith/blob/a856517e4e9449eb71dd6f7f83aa9fffa40f5bbb/validator.py)
- [Maintainer location evidence](https://github.com/jabarkle)
