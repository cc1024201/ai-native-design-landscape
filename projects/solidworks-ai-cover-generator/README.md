# SOLIDWORKS AI Cover Generator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Despite its repository name, this is not a CAD generator and it is not treated here as an official Dassault Systèmes product. It is an independent customer-facing demo for producing SOLIDWORKS-branded document covers.

## Copy becomes three visual candidates

The single-page [`index.html`](https://github.com/Regoletto/solidworks-ai-design-generator/blob/d3a70d2887b46f014955b979e36fc1f6672e4384/index.html) accepts document text, an optional image and layout choices. It requests three cover-text variants, builds branded cover DOM for each and keeps text contenteditable so the user can correct the selected direction.

[`complete.js`](https://github.com/Regoletto/solidworks-ai-design-generator/blob/d3a70d2887b46f014955b979e36fc1f6672e4384/api/complete.js) proxies the Anthropic completion call. The page has a deterministic fallback when that call fails; only the successful model path counts as AI participation.

## Selection and delivery are explicit

Variants coexist before selection, and the accepted cover can leave as PNG, PDF or HTML. The mutable DOM is provider-session state rather than CAD geometry or a persistent brand-system graph.

## Evidence

- [Canonical repository](https://github.com/Regoletto/solidworks-ai-design-generator)
- [Inspected tree](https://github.com/Regoletto/solidworks-ai-design-generator/tree/d3a70d2887b46f014955b979e36fc1f6672e4384)
- Commit: `d3a70d2887b46f014955b979e36fc1f6672e4384`
