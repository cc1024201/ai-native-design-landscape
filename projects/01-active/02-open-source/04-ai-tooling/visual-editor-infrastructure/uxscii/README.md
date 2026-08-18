# UXSCII

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UXSCII is an open artifact format rather than an editor brand. A component pairs machine-readable `.uxm` JSON with a human- and agent-readable ASCII `.md` template, making structure, states and appearance available to ordinary text tools and version control.

## The paired files are one component

[`uxm-component.schema.json`](https://github.com/trabian/uxscii/blob/35063053b5c75a475d2c8b49ef0c1e3ef0f56370/specs/uxm-component.schema.json) defines identifiers, semantic type, version, properties and the referenced ASCII template. [`template-processor.ts`](https://github.com/trabian/uxscii/blob/35063053b5c75a475d2c8b49ef0c1e3ef0f56370/src/template-processor.ts) resolves variables into a view while leaving the source pair editable.

[`validator.ts`](https://github.com/trabian/uxscii/blob/35063053b5c75a475d2c8b49ef0c1e3ef0f56370/src/validator.ts) and [`cli.ts`](https://github.com/trabian/uxscii/blob/35063053b5c75a475d2c8b49ef0c1e3ef0f56370/src/cli.ts) make the specification independently executable. Extensions are registered separately instead of silently changing the core schema, and semantic versions keep downstream tooling able to reason about compatibility.

## Identity boundary

Fluxwing uses UXSCII but is not the same count: the format can be validated or implemented by another tool, while Fluxwing supplies a particular set of agent authoring and review behaviors.

## Evidence

- [Pinned repository](https://github.com/trabian/uxscii/tree/35063053b5c75a475d2c8b49ef0c1e3ef0f56370)
- [Format specification](https://github.com/trabian/uxscii/blob/35063053b5c75a475d2c8b49ef0c1e3ef0f56370/SPECIFICATION.md)
- [Extension manager](https://github.com/trabian/uxscii/blob/35063053b5c75a475d2c8b49ef0c1e3ef0f56370/src/extension-manager.ts)
