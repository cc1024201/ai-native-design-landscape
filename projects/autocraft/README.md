# Autocraft

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

Autocraft's design claim is about control after generation. It combines a multi-page canvas with direct edits a scoped code agent and a locked visual system.

## Three mutation lanes

| Lane | Intended work | Scope control |
|---|---|---|
| Quick edit | copy spacing color and other obvious changes | direct selected object |
| Design chat | generation restructuring restyling and creative refinement | selected component can be attached to the request |
| Style guide | colors typography spacing buttons and tone across pages | project-wide constraint |

Each generated page is a first-class canvas object that can be inspected duplicated moved and compared beside references. The inspiration board provides visual memory while a chosen style guide constrains later page generations. This separates creative inference from deterministic small edits and from system-level governance.

## Code and canvas relationship

The workspace renders frontend pages and exposes their code for inspection and download. The public contract supports a code-backed visual workflow but does not publish whether every manual operation is an AST patch a schema mutation or regeneration. For that reason the hosted project is treated as the immediate authority and downloaded frontend code as an owned delivery artifact; a stronger round-trip claim would require implementation evidence.

Autocraft uses a user-supplied OpenAI key for agent work while charging for the workspace. Model spend and workspace state are therefore separate operational concerns.

## Lifecycle

The service is labeled beta and has a live low-cost founding plan. Its loop is usable but still an active transition rather than a mature stable contract.

## Primary evidence

- [Autocraft product and mechanism](https://autocraft.sh/)
- [Autocraft feature surface](https://autocraft.sh/features)
- [Autocraft company information](https://autocraft.sh/company)
- [Autocraft terms](https://autocraft.sh/tos)
