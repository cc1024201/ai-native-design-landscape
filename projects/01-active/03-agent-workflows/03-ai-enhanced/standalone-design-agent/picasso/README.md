# Picasso

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Picasso is an agent skill for choosing and implementing a frontend visual direction. Its distinguishing mechanism is a visible decision gate: the agent must externalize alternatives before it mutates the product into one guessed style.

## Direction is promoted before implementation

The pinned [`SKILL.md`](https://github.com/viperrcrypto/picasso/blob/52773745e2d06559ccfb5c5a0a20d5d7ab859780/skills/picasso/SKILL.md) instructs the agent to inspect the codebase and content constraints, propose materially different directions and render them as HTML previews. The user confirms or combines a direction. That decision is recorded in `.picasso.md` and becomes a constraint on implementation.

```text
repository/context -> competing visual HTML previews
-> user chooses or mixes -> .picasso.md design authority
-> source implementation -> browser screenshot -> correction loop
```

The [`visual-preview.md`](https://github.com/viperrcrypto/picasso/blob/52773745e2d06559ccfb5c5a0a20d5d7ab859780/skills/picasso/references/visual-preview.md) reference defines the comparison artifact; the skill's screenshot iterations reconnect visual acceptance to repository source. The `/steal <url>` path can use an external page as evidence but does not make that page or its screenshot the project's authority.

## Persistence and limits

Git-tracked application files and `.picasso.md` persist the result. Preview alternatives are decision aids rather than durable branches unless the user keeps them. The workflow remains agent-dependent and does not supply an independent runtime or cloud version graph; acceptance therefore requires checking the actual browser output after implementation.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/viperrcrypto/picasso/tree/52773745e2d06559ccfb5c5a0a20d5d7ab859780)
- [MIT license](https://github.com/viperrcrypto/picasso/blob/52773745e2d06559ccfb5c5a0a20d5d7ab859780/LICENSE)
