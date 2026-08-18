# ATV Design

> Research status: **Source-level** · Last reviewed: **2026-08-12**

ATV Design is counted separately from Open CoDesign because the downstream codebase establishes its own desktop product, maintainer identity, authentication contract and artifact lifecycle. Its distinctive technical choice is to use GitHub Copilot OAuth+PKCE as a first-class model path while keeping design work in ordinary local files.

## A workspace is a directory, not a hidden canvas

The user chooses a workspace and asks for a prototype, deck or document. The agent creates HTML/JSX, PPTX or PDF artifacts beside `DESIGN.md`, assets and generation notes. The Design System Hub can ingest a URL, repository or screenshot and compile brand tokens for later generations.

The durable hierarchy is therefore:

```text
workspace/
  DESIGN.md
  assets/
  one-or-more source artifacts
  exports/
  generation/session metadata
```

This lets Git and normal editors provide recovery independently of the desktop session. Provider switching keeps session history attached to the workspace rather than silently beginning a different project.

## Authentication is part of the architecture

The product uses the documented GitHub Copilot SDK flow with OAuth+PKCE and supports explicit BYOK providers. That choice is materially different from scraping undocumented tokens: credentials remain local and a repository rule guards against regressions to undocumented endpoints.

## Pinned implementation evidence

Revision [`bebb02d`](https://github.com/All-The-Vibes/ATV-Design/commit/bebb02df9ca73187d7ffc5a33cc3b646339b46d7) exposes:

- the desktop and package topology in the [root workspace](https://github.com/All-The-Vibes/ATV-Design/tree/bebb02df9ca73187d7ffc5a33cc3b646339b46d7);
- the tested [artifact parser package](https://github.com/All-The-Vibes/ATV-Design/tree/bebb02df9ca73187d7ffc5a33cc3b646339b46d7/packages/artifacts/src);
- the [OAuth/BYOK architecture decision](https://github.com/All-The-Vibes/ATV-Design/blob/bebb02df9ca73187d7ffc5a33cc3b646339b46d7/docs/adr/0001-byok-oauth-posture.md);
- concrete filesystem examples such as the [credit-card design system](https://github.com/All-The-Vibes/ATV-Design/tree/bebb02df9ca73187d7ffc5a33cc3b646339b46d7/examples/credit-card-banking-design-system);
- the workspace and upstream-integration reasoning in [`analysis/`](https://github.com/All-The-Vibes/ATV-Design/tree/bebb02df9ca73187d7ffc5a33cc3b646339b46d7/analysis).

## Boundary and unknowns

The repository is MIT-licensed. Source inspection establishes the local contract but this review did not authenticate a live Copilot account or exercise every provider. The organization profile supplies no reliable operating region, so the region remains `unknown`.

## Decisive sources

- [Repository README](https://github.com/All-The-Vibes/ATV-Design/blob/bebb02df9ca73187d7ffc5a33cc3b646339b46d7/README.md)
- [MIT license](https://github.com/All-The-Vibes/ATV-Design/blob/bebb02df9ca73187d7ffc5a33cc3b646339b46d7/LICENSE)
