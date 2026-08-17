# Design Ruler

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design Ruler is a measurement-first runtime verification tool for coding agents. It is deliberately agnostic about where the design came from: Figma, Penpot, tokens or a screenshot can supply intent while the tool reports what the browser actually rendered.

## Numbers confirm; images locate

[`measure.ts`](https://github.com/Fzhiyu1/design-ruler/blob/750b343e119bb9934d50327b39e31949bdc1dc9b/src/commands/measure.ts) returns computed rectangles and CSS as structured JSON. [`screenshot.ts`](https://github.com/Fzhiyu1/design-ruler/blob/750b343e119bb9934d50327b39e31949bdc1dc9b/src/commands/screenshot.ts) captures visual context. [`overlay.ts`](https://github.com/Fzhiyu1/design-ruler/blob/750b343e119bb9934d50327b39e31949bdc1dc9b/src/commands/overlay.ts) tints the design reference magenta so one- or two-pixel offsets become visible against the live implementation.

Both Playwright and Chrome DevTools Protocol engines implement the same command contract, allowing local pages, CI browsers and Android WebViews to participate.

```text
external design evidence + runtime URL
-> screenshot/ghost overlay -> agent finds likely mismatch
-> exact measurement -> source CSS fix -> remeasure under tolerance
```

Design Ruler never writes application code or decides aesthetic correctness. The repository remains authoritative; captured images and JSON are evidence. Visual checks cover effects that box geometry cannot see, while measurement is the final arbiter only for properties it actually observes.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/Fzhiyu1/design-ruler/tree/750b343e119bb9934d50327b39e31949bdc1dc9b)
- [Playwright engine](https://github.com/Fzhiyu1/design-ruler/blob/750b343e119bb9934d50327b39e31949bdc1dc9b/src/engine/playwright/playwright-engine.ts)
- [CDP engine](https://github.com/Fzhiyu1/design-ruler/blob/750b343e119bb9934d50327b39e31949bdc1dc9b/src/engine/cdp/cdp-engine.ts)
- [MIT license](https://github.com/Fzhiyu1/design-ruler/blob/750b343e119bb9934d50327b39e31949bdc1dc9b/LICENSE)
