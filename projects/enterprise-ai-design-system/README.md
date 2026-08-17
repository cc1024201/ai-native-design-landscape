# Enterprise AI Design System

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Enterprise AI Design System is a repository-native brand production framework spanning posters, infographics, architecture diagrams, dashboards, presentations, HTML, documentation and AI images. Its value is the explicit routing among assets, templates, components, prompts and acceptance criteria—not a single universal generator.

## Pipelines select bounded inputs and gates

[`SKILL.md`](https://github.com/draiagent/Enterprise-Brand-Style-AI-Design-System/blob/a83011f4d8df52af0439f5164fc79cc6fd7b6af0/SKILL.md) chooses a deliverable and pipeline. For example, the HTML path combines brand rules, token documents, reusable blocks, a template, an implementation prompt and [`checklist-html-page.md`](https://github.com/draiagent/Enterprise-Brand-Style-AI-Design-System/blob/a83011f4d8df52af0439f5164fc79cc6fd7b6af0/quality/checklist-html-page.md).

```text
requirement -> pipeline -> template + components + tokens + assets
-> generated artifact -> deliverable-specific quality gate -> revision/release
```

The checked-in `ai-assistants-card` example preserves prompt, HTML and rendered image, making the relationship inspectable. Files and Git own persistence. Many supported deliverables remain contracts rather than tested implementations, so the lifecycle is `active-transition`.

The repository contains a license placeholder rather than granting a clear public license. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/draiagent/Enterprise-Brand-Style-AI-Design-System/tree/a83011f4d8df52af0439f5164fc79cc6fd7b6af0)
- [HTML pipeline](https://github.com/draiagent/Enterprise-Brand-Style-AI-Design-System/blob/a83011f4d8df52af0439f5164fc79cc6fd7b6af0/pipelines/html-page.pipeline.md)
- [Token system](https://github.com/draiagent/Enterprise-Brand-Style-AI-Design-System/blob/a83011f4d8df52af0439f5164fc79cc6fd7b6af0/tokens/README.md)
- [Worked artifact](https://github.com/draiagent/Enterprise-Brand-Style-AI-Design-System/blob/a83011f4d8df52af0439f5164fc79cc6fd7b6af0/examples/ai-assistants-card/ai-assistants-card.html)
