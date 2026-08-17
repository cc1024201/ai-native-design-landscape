# DESIGN.md Generator

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

DESIGN.md Generator compiles a live website into a design-system reference for coding agents. Its mechanism is evidence classification: it does not treat every captured CSS value as a durable rule.

## From page observations to stable guidance

The crawler collects routes and states. [`dom-collector.ts`](https://github.com/jasonhnd/design-md-generator/blob/b591554648f9d3a4547b912ee2e81b6cd7ec3304/scripts/dom-collector.ts), [`css-analyzer.ts`](https://github.com/jasonhnd/design-md-generator/blob/b591554648f9d3a4547b912ee2e81b6cd7ec3304/scripts/css-analyzer.ts) and interaction and motion extractors record measured facts. [`design-boundary-detect.ts`](https://github.com/jasonhnd/design-md-generator/blob/b591554648f9d3a4547b912ee2e81b6cd7ec3304/scripts/design-boundary-detect.ts) helps separate stable system choices from page-specific variation.

The result is not only prose. The report pipeline creates `DESIGN.md`, structured tokens, agent instructions and an HTML preview, while [`proof.ts`](https://github.com/jasonhnd/design-md-generator/blob/b591554648f9d3a4547b912ee2e81b6cd7ec3304/scripts/proof.ts) retains pixel-level evidence for verification.

```text
site crawl -> computed and interaction evidence -> cluster/classify stability
-> DESIGN.md + tokens + preview + proof -> agent implementation guidance
```

## Authority boundary

The generated files govern later work but do not mutate the sampled website. A rerun can reveal drift; Git remains the versioning mechanism. The preview proves that the extracted vocabulary can be rendered but is not evidence of reversible write-back.

The repository is MIT-licensed. No reliable maintainer-region evidence was found.

## Pinned evidence

- [Source tree at `b591554`](https://github.com/jasonhnd/design-md-generator/tree/b591554648f9d3a4547b912ee2e81b6cd7ec3304)
- [Report generator](https://github.com/jasonhnd/design-md-generator/blob/b591554648f9d3a4547b912ee2e81b6cd7ec3304/scripts/report-gen.ts)
- [Preview generator](https://github.com/jasonhnd/design-md-generator/blob/b591554648f9d3a4547b912ee2e81b6cd7ec3304/scripts/preview-gen.ts)
- [MIT license](https://github.com/jasonhnd/design-md-generator/blob/b591554648f9d3a4547b912ee2e81b6cd7ec3304/LICENSE)
