# Visual Agent Designer

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Visual Agent Designer (VAD) is a local-first pipeline for turning a product idea into high-fidelity visual assets and a handoff package for coding agents. Its tldraw surface coordinates generated directions and assets; durable project JSON and files hold the workflow authority.

## A project records design context and asset lineage

[`project/schema.ts`](https://github.com/Zullllkar/visual-agent-designer/blob/e054da46aa095f960193d23923bccbb3c4ee9ef5/src/lib/project/schema.ts) defines the brief, design direction, pages, references, generated assets, critique and history fields. Local persistence under `.vad/projects/` is implemented by [`persist.ts`](https://github.com/Zullllkar/visual-agent-designer/blob/e054da46aa095f960193d23923bccbb3c4ee9ef5/src/lib/vad/persist.ts); an optional daemon serializes writes and watches project changes.

The tldraw board computes a spatial arrangement from that state. Canvas position helps compare and organize outputs, but it does not replace the project file or erase generation ancestry.

## The agent pipeline has typed stages

[`chat-orchestrator.ts`](https://github.com/Zullllkar/visual-agent-designer/blob/e054da46aa095f960193d23923bccbb3c4ee9ef5/src/lib/agents/chat-orchestrator.ts) dispatches brief creation, design-direction planning, image plans, image execution, variants, restyling and handoff. Provider registries support Anthropic, Gemini and OpenAI-compatible text or image services and reject mock image results when a real generation action was requested.

The image planner produces an explicit plan; the executor materializes assets and associates prompts, references and design-context versions. [`critic-agent.ts`](https://github.com/Zullllkar/visual-agent-designer/blob/e054da46aa095f960193d23923bccbb3c4ee9ef5/src/lib/agents/critic-agent.ts) evaluates output with deterministic checks and model feedback so repair can target a known asset rather than restart an opaque conversation.

## Handoff is a first-class promotion step

The selected context is packaged by [`handoff-agent.ts`](https://github.com/Zullllkar/visual-agent-designer/blob/e054da46aa095f960193d23923bccbb3c4ee9ef5/src/lib/agents/handoff-agent.ts). A ZIP can contain PNG assets, prompts, tokens, project context and kickoff instructions for Cursor, Claude Code or Codex. VAD deliberately delivers visual assets and grounding rather than claiming that the canvas itself is production application code.

## Boundary

Image outputs remain raster assets, and a coding agent must still implement responsive behavior and accessibility. Local project files make runs inspectable, but the pinned source does not establish multi-user merging or a semantic vector editor for arbitrary generated images.

## Evidence

- [Pinned repository](https://github.com/Zullllkar/visual-agent-designer/tree/e054da46aa095f960193d23923bccbb3c4ee9ef5)
- [Handoff ZIP implementation](https://github.com/Zullllkar/visual-agent-designer/blob/e054da46aa095f960193d23923bccbb3c4ee9ef5/src/lib/handoff/zip.ts)
