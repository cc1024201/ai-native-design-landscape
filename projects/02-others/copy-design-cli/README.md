# Copy Design CLI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Copy Design CLI uses a rendered website screenshot and a selectable vision model to draft an approximate `DESIGN.md`, then creates a visual preview of the inferred system. Its important boundary is honesty about inference: the output is a reconstruction from pixels rather than extracted canonical tokens.

## Screenshot evidence enters a model-mediated compiler

[`screenshot.ts`](https://github.com/lxcong/copy-design-cli/blob/fe522f92cb7898efd49b9c8f3442778fb1a9be3b/src/screenshot.ts) captures the target page. The shared [`prompt.ts`](https://github.com/lxcong/copy-design-cli/blob/fe522f92cb7898efd49b9c8f3442778fb1a9be3b/src/providers/prompt.ts) asks Anthropic or Gemini adapters to infer typography, color, spacing, radii and component conventions from that evidence.

[`output.ts`](https://github.com/lxcong/copy-design-cli/blob/fe522f92cb7898efd49b9c8f3442778fb1a9be3b/src/output.ts) materializes the generated `DESIGN.md`; [`preview.ts`](https://github.com/lxcong/copy-design-cli/blob/fe522f92cb7898efd49b9c8f3442778fb1a9be3b/src/preview.ts) renders it so the user can see whether the inferred vocabulary is coherent.

```text
URL -> browser screenshot -> vision-provider inference
-> approximate DESIGN.md -> preview -> user correction of the file
```

## What the tool cannot prove

A screenshot cannot reveal hidden states, responsive breakpoints, semantic component boundaries or original token names. The generated design document therefore becomes a new local authority only after review; it is not a faithful export from the source site. Files and Git provide persistence and correction. The pinned tree contains no license file.

The maintainer profile reports Singapore.

## Source record

- [Pinned repository](https://github.com/lxcong/copy-design-cli/tree/fe522f92cb7898efd49b9c8f3442778fb1a9be3b)
- [Provider selection](https://github.com/lxcong/copy-design-cli/blob/fe522f92cb7898efd49b9c8f3442778fb1a9be3b/src/providers/index.ts)
- [Output tests](https://github.com/lxcong/copy-design-cli/blob/fe522f92cb7898efd49b9c8f3442778fb1a9be3b/tests/output.test.ts)
