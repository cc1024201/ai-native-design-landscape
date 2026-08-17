# UX Planner

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UX Planner is a Claude Code skill that converts an underspecified product idea into a durable UX specification for a downstream visual-design agent. Its Design contribution is coordination and decision capture: it owns screen inventory, flows, states, responsive parity, open risks and the handoff contract rather than pixels or production code.

## The specification is the working artifact

The [`skill workflow`](https://github.com/kyzdes/ux-planner-skill/blob/5421d525fc6adc52cd7492b95204d9edb6fae473/skills/ux-planner/SKILL.md) detects a product archetype, batches framing questions, drafts features and flows, asks adaptive gap questions and writes a dated `ux-spec-*.md` file. Existing project context can replace the initial interview, so the output is grounded in files when they are present rather than always starting from a blank prompt.

The specification contains per-screen briefs and edge states as well as an explicit section that pre-answers the input contract for Huashu Design. The handoff is copied into a separate design-agent session; UX Planner does not silently launch that downstream generation.

## Alternatives can return from the visual stage

The current workflow asks Huashu for a `cjm-canvas` when the product needs multiple screens or flows. A bundled [`canvas scaffold`](https://github.com/kyzdes/ux-planner-skill/blob/5421d525fc6adc52cd7492b95204d9edb6fae473/skills/ux-planner/assets/canvas-scaffold.html) defines how a downstream interactive comparison can expose tweak choices. Its copy action produces a lock-in prompt containing the user's selections.

Pasting that prompt back into UX Planner enters a targeted re-entry phase: selected variants become locked in the spec while rejected or conflicting choices are retained under considered alternatives. This gives the Markdown artifact a small round-trip decision history without pretending that the scaffold itself was generated or rendered by this skill.

## Quality and persistence boundaries

A mandatory self-review checks screen IDs, brief counts, density fields, responsive coverage and handoff completeness before delivery. The skill writes the spec and an optional memory pointer to the local project; filesystem history or Git can version it, but the skill does not implement its own merge or revision store.

Its boundary is intentionally upstream of visual execution. It excludes slides and infographics, produces no native canvas nodes, and cannot prove that a downstream agent followed the handoff. It qualifies as an independently reusable visual-coordination product because the UX specification and feedback-return protocol are its own complete artifact loop.

## Evidence

- [Pinned repository](https://github.com/kyzdes/ux-planner-skill/tree/5421d525fc6adc52cd7492b95204d9edb6fae473)
- [Specification template](https://github.com/kyzdes/ux-planner-skill/blob/5421d525fc6adc52cd7492b95204d9edb6fae473/skills/ux-planner/references/spec-template.md)
