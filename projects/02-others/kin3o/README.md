# kin3o

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

kin3o defines motion design as a Git-friendly source problem. It uses an existing Claude or Codex subscription to generate and refine Lottie JSON or a dotLottie package with an interactive state machine, then validates and previews the structured animation before delivery.

## Motion intent becomes a diffable state machine

The prompt layer does more than request valid JSON. [`motion-design.ts`](https://github.com/affromero/kin3o/blob/e8a7e7cefa6e52f3e36bfdf86bcaefa73af522eb/src/prompts/motion-design.ts) maps named personalities and emotions to timing, easing, staging, anticipation and choreography constraints. Optional design tokens are converted to Lottie color values before generation.

```text
prompt + tokens + motion personality -> model JSON
-> schema/semantic validation -> deterministic auto-fix
-> versioned .json or .lottie -> hot preview -> refine
-> marketplace publish or MP4/WebM/GIF render
```

[`validator.ts`](https://github.com/affromero/kin3o/blob/e8a7e7cefa6e52f3e36bfdf86bcaefa73af522eb/src/validator.ts) checks and repairs static Lottie output. [`state-machine-validator.ts`](https://github.com/affromero/kin3o/blob/e8a7e7cefa6e52f3e36bfdf86bcaefa73af522eb/src/state-machine-validator.ts) separately checks transitions and referenced animations. The `refine` command reads the existing artifact and writes a versioned successor rather than overwriting it by default; `view` watches source changes and reloads the browser.

The Lottie or dotLottie file is authoritative and can be code-reviewed. Video and GIF are delivery projections; the browser preview is evidence, not persistence. The npm package declares MIT, although this pinned repository tree has no standalone license file. No reliable maintainer-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/affromero/kin3o/tree/e8a7e7cefa6e52f3e36bfdf86bcaefa73af522eb)
- [CLI and versioned write path](https://github.com/affromero/kin3o/blob/e8a7e7cefa6e52f3e36bfdf86bcaefa73af522eb/src/index.ts)
- [dotLottie packager](https://github.com/affromero/kin3o/blob/e8a7e7cefa6e52f3e36bfdf86bcaefa73af522eb/src/packager.ts)
- [Video exporter](https://github.com/affromero/kin3o/blob/e8a7e7cefa6e52f3e36bfdf86bcaefa73af522eb/src/export.ts)
- [Package metadata](https://github.com/affromero/kin3o/blob/e8a7e7cefa6e52f3e36bfdf86bcaefa73af522eb/package.json)
