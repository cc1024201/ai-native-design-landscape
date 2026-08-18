# Claudesign

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Claudesign is a cross-agent design orchestration toolkit built around `DESIGN.md`. It combines reusable skills with a document lifecycle: draft a design system, let a human refine it, compare revisions, export tokens and apply the selected system while implementing an interface.

## `DESIGN.md` is the routing spine

The toolkit's visual-style and design-system skills create the governing document. [`scripts/designmd.mjs`](https://github.com/Claudate/claudesign/blob/ab5b368e977d597434ee551ff43491c6672d3d46/scripts/designmd.mjs) supplies `lint`, `diff`, `export` and `spec` operations. [`web-design-engineer/SKILL.md`](https://github.com/Claudate/claudesign/blob/ab5b368e977d597434ee551ff43491c6672d3d46/skills/web-design-engineer/SKILL.md) bridges those decisions into source implementation rather than generating an isolated style sheet.

```text
brief or existing system -> AI DESIGN.md draft -> human refinement
-> lint / diff / token export -> routed design skill
-> application source + browser evidence -> revise document or source
```

The plugin router in [`bin/claudesign-plugin.mjs`](https://github.com/Claudate/claudesign/blob/ab5b368e977d597434ee551ff43491c6672d3d46/bin/claudesign-plugin.mjs) maps user intent to skills. Example base and variant documents make revision comparison concrete, while the sample site demonstrates materialization into a running interface.

## Provenance is a material boundary

This is a derivative integration rather than a clean-room product. [`LICENSE.md`](https://github.com/Claudate/claudesign/blob/ab5b368e977d597434ee551ff43491c6672d3d46/LICENSE.md) explicitly grants no new standalone license and points to upstream provenance tracked by the skill index. The record is retained because the orchestration and artifact lifecycle are independently packaged, but reuse rights must be resolved per incorporated source.

Filesystem documents and Git own persistence; the toolkit does not evidence a hosted canvas or cloud version graph. No reliable team-region evidence was found.

## Source record

- [Pinned repository](https://github.com/Claudate/claudesign/tree/ab5b368e977d597434ee551ff43491c6672d3d46)
- [DESIGN.md workflows](https://github.com/Claudate/claudesign/blob/ab5b368e977d597434ee551ff43491c6672d3d46/docs/designmd-workflows.md)
- [Upstream map](https://github.com/Claudate/claudesign/blob/ab5b368e977d597434ee551ff43491c6672d3d46/skills/skill-index.yaml)
