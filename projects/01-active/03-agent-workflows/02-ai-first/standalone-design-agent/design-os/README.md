# Design OS

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design OS is a gated design-production workflow packaged as an agent skill. It turns a route brief into a sequence of persisted artifacts—research, style, tokens, screens and delivery—while refusing to advance when required evidence or review is missing.

## Run state enforces the process contract

[`run-state.schema.json`](https://github.com/rudy0z/Design-OS/blob/1a76b7370bbbfc882a6d4ea5fdabafe9efef8c7f/skills/design-os/run-state.schema.json) defines the durable `.design-os/run-state.json` authority: route, selected style, packs, risk and phase status. [`runtime.mjs`](https://github.com/rudy0z/Design-OS/blob/1a76b7370bbbfc882a6d4ea5fdabafe9efef8c7f/skills/design-os/runtime.mjs) evaluates hard gates; the CLI cannot silently skip required phase artifacts.

Each phase has a fixed artifact contract, documented separately from the orchestration manifest. Figma synchronization is a projection/integration step, while repository files and run state remain canonical. The value is therefore governed production, not a generic prompt collection.

## Evidence

- [Pinned repository](https://github.com/rudy0z/Design-OS/tree/1a76b7370bbbfc882a6d4ea5fdabafe9efef8c7f)
- [Skill manifest](https://github.com/rudy0z/Design-OS/blob/1a76b7370bbbfc882a6d4ea5fdabafe9efef8c7f/skills/design-os/manifest.json)
- [Artifact contract](https://github.com/rudy0z/Design-OS/blob/1a76b7370bbbfc882a6d4ea5fdabafe9efef8c7f/skills/design-os/ARTIFACTS.md)
- [CLI](https://github.com/rudy0z/Design-OS/blob/1a76b7370bbbfc882a6d4ea5fdabafe9efef8c7f/tools/design-os.mjs)
