# Impeccable

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Impeccable is a design correction layer for coding agents. It combines a persistent product/design brief, 23 named transformation commands, deterministic anti-pattern detectors and a live browser session that can turn targeted visual changes back into repository source.

## Live mode makes the browser an evidence and mutation surface

`/impeccable init` writes `PRODUCT.md` and optionally `DESIGN.md`; subsequent commands inherit the audience, brand/product lane, anti-references, tokens and components. [`detect.mjs`](https://github.com/pbakaus/impeccable/blob/ae388ac58fb33aade50fc47e2be07c3192dcaabd/skill/scripts/detect.mjs) runs deterministic design checks without an LLM.

```text
PRODUCT.md + DESIGN.md + source -> agent build/correction
-> browser-injected live session -> select/steer/insert/manual edit
-> staged evidence and source mapping -> accept/commit or discard
-> deterministic detectors + final agent review
```

[`live-server.mjs`](https://github.com/pbakaus/impeccable/blob/ae388ac58fb33aade50fc47e2be07c3192dcaabd/skill/scripts/live-server.mjs) coordinates the browser session. [`live-commit-manual-edits.mjs`](https://github.com/pbakaus/impeccable/blob/ae388ac58fb33aade50fc47e2be07c3192dcaabd/skill/scripts/live-commit-manual-edits.mjs) applies accepted manual evidence to the project; discard and recovery commands keep rejection explicit. The repository source remains authoritative, while the browser supplies target identity, rendered evidence and reversible candidate state.

The source is Apache-2.0 licensed. The maintainer profile reports San Francisco, United States. That public maintainer evidence does not imply a larger team or company boundary.

## Evidence

- [Pinned repository](https://github.com/pbakaus/impeccable/tree/ae388ac58fb33aade50fc47e2be07c3192dcaabd)
- [Product contract](https://github.com/pbakaus/impeccable/blob/ae388ac58fb33aade50fc47e2be07c3192dcaabd/README.md)
- [Live browser server](https://github.com/pbakaus/impeccable/blob/ae388ac58fb33aade50fc47e2be07c3192dcaabd/skill/scripts/live-server.mjs)
- [Accepted manual-edit materialization](https://github.com/pbakaus/impeccable/blob/ae388ac58fb33aade50fc47e2be07c3192dcaabd/skill/scripts/live-commit-manual-edits.mjs)
- [Maintainer profile](https://github.com/pbakaus)
