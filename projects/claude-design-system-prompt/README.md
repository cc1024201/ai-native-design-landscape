# Claude Design System Prompt

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claude Design System Prompt is an independent reverse-engineering and repackaging of Claude Design's opinionated behavior. It is not the hosted Claude product and owns no canvas runtime; its contribution is a portable behavior layer for Claude and Codex-style filesystem agents.

## Design is encoded as a sequence of named transformations

The system prompt rejects recurring “AI slop” patterns and directs the model to choose an aesthetic thesis before styling. Host-specific packages then expose focused operations rather than one monolithic instruction:

```text
discovery -> aesthetic direction -> distant variations
-> prototype/wireframe/deck source -> tweakable structure
-> hierarchy + interaction + accessibility + slop review -> polish
```

[`generate-variations.md`](https://github.com/Trystan-SA/claude-design-system-prompt/blob/3c3ddb07d7aa3fef051d83608596470c95cfd8fe/codex/skills/generate-variations.md) makes exploration explicit. [`make-tweakable.md`](https://github.com/Trystan-SA/claude-design-system-prompt/blob/3c3ddb07d7aa3fef051d83608596470c95cfd8fe/codex/skills/make-tweakable.md) is the structural handoff contract: output must expose meaningful controls rather than baking every choice into an opaque render. Dedicated review skills cover hierarchy, interaction states, accessibility and recognizable generation defaults.

The resulting repository or HTML file is authoritative. This package supplies policy and transformation recipes; it relies on the host agent and browser/tool environment for execution, persistence and rendering. Its value is therefore different from a native graph editor and should not be read as evidence that it implements Claude Design's private runtime.

The project is MIT-licensed. The maintainer profile reports France.

## Decisive evidence

- [Pinned repository](https://github.com/Trystan-SA/claude-design-system-prompt/tree/3c3ddb07d7aa3fef051d83608596470c95cfd8fe)
- [Codex system prompt](https://github.com/Trystan-SA/claude-design-system-prompt/blob/3c3ddb07d7aa3fef051d83608596470c95cfd8fe/codex/system-prompt.md)
- [Prototype workflow](https://github.com/Trystan-SA/claude-design-system-prompt/blob/3c3ddb07d7aa3fef051d83608596470c95cfd8fe/codex/skills/make-a-prototype.md)
- [Design-system extraction](https://github.com/Trystan-SA/claude-design-system-prompt/blob/3c3ddb07d7aa3fef051d83608596470c95cfd8fe/codex/skills/design-system-extract.md)
- [MIT license](https://github.com/Trystan-SA/claude-design-system-prompt/blob/3c3ddb07d7aa3fef051d83608596470c95cfd8fe/LICENSE)
