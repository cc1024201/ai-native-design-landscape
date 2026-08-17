# Fluxwing Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Fluxwing Skills is an installable conversational design workflow built on the separate UXSCII format. It starts with low-fidelity ASCII structure, then adds component metadata, interactive states, accessibility and rendered screen examples before a team commits to high-fidelity implementation.

## Six skills write to the user's project

The distribution separates component creation, library browsing, state expansion, screen scaffolding, viewing and screenshot import. The key boundary is its own “golden rule”: bundled templates are read-only references while generated `.uxm`, `.md` and `.rendered.md` files are written under the user's `fluxwing/` directory.

[`fluxwing-component-creator`](https://github.com/trabian/fluxwing-skills/tree/d065e11550e254fd22774d6892d19683e90495d5/skills/fluxwing-component-creator) binds JSON metadata to an ASCII template through the bundled schema. [`fluxwing-screen-scaffolder`](https://github.com/trabian/fluxwing-skills/tree/d065e11550e254fd22774d6892d19683e90495d5/skills/fluxwing-screen-scaffolder) composes those components into screens and materializes examples with data rather than returning a disposable chat rendering.

## Review precedes translation

The artifact remains git-diffable throughout conversational revision. [`fluxwing-validator`](https://github.com/trabian/fluxwing-skills/tree/d065e11550e254fd22774d6892d19683e90495d5/skills/fluxwing-validator) checks conformance before the design moves to React or another higher-fidelity tool. Fluxwing therefore owns the authoring workflow; UXSCII independently owns the interchange specification.

## Evidence

- [Pinned repository](https://github.com/trabian/fluxwing-skills/tree/d065e11550e254fd22774d6892d19683e90495d5)
- [UXM component schema](https://github.com/trabian/fluxwing-skills/blob/d065e11550e254fd22774d6892d19683e90495d5/skills/fluxwing-component-creator/schemas/uxm-component.schema.json)
- [Copy and versioning guidance](https://github.com/trabian/fluxwing-skills/blob/d065e11550e254fd22774d6892d19683e90495d5/skills/shared/docs/copy-versioning.md)
