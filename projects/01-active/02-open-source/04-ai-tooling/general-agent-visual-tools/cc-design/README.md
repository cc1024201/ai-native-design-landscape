# cc-design

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

cc-design is a cross-agent visual-design skill rather than a standalone editor. It standardizes how Claude Code, Codex-style hosts and other compatible agents build HTML, prototypes, slides and motion work while preserving review checkpoints.

## One protocol spans several visual artifact types

The root [`SKILL.md`](https://github.com/ZeroZ-lab/cc-design/blob/d5e10b4ffe694a1e99bcf88fc953cde6cde23930/SKILL.md) defines discovery, proposal, approval, staged construction and verification. Agent metadata and the plugin bundle adapt that protocol to different hosts without changing the underlying deliverables.

```text
brief + references -> proposed direction -> approval
-> section-level previews -> HTML/prototype/slides/motion source
-> structural checks + rendered visual checks -> handoff
```

The method makes approval and preview explicit rather than allowing a long autonomous generation to hide drift. Structural verification tests the artifact's inspectable form; visual verification tests the rendered consequence. The animation-verification design shows this principle extending to temporal output. Authority remains in the generated source/project files, not the skill instructions or screenshots.

No license file was present, so reuse rights cannot be inferred from public source visibility. The organization profile reports Hangzhou, China.

## Pinned evidence

- [Repository](https://github.com/ZeroZ-lab/cc-design/tree/d5e10b4ffe694a1e99bcf88fc953cde6cde23930)
- [Workflow definition](https://github.com/ZeroZ-lab/cc-design/blob/d5e10b4ffe694a1e99bcf88fc953cde6cde23930/SKILL.md)
- [Agent metadata](https://github.com/ZeroZ-lab/cc-design/blob/d5e10b4ffe694a1e99bcf88fc953cde6cde23930/agents/openai.yaml)
- [Plugin bundle](https://github.com/ZeroZ-lab/cc-design/tree/d5e10b4ffe694a1e99bcf88fc953cde6cde23930/plugins/cc-design)
- [Animation-verification design](https://github.com/ZeroZ-lab/cc-design/blob/d5e10b4ffe694a1e99bcf88fc953cde6cde23930/docs/features/20260518-animation-verification/02-design.md)
