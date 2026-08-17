# Figma to Astro Pipeline

> Research status: **Architecture-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

WyeWorks published the exact multi-agent prompts used to implement its website from Figma into Astro. It is explicitly a project-calibrated snapshot, so its value lies in the handoff and verification architecture rather than a claim of general drop-in automation.

## Section-sized work limits context loss

A page planner inventories sections. Component analysis decides reuse and Astro-versus-React boundaries; asset extraction localizes Figma resources; implementation writes code; framework and CSS compatibility checks repair deterministic faults. Layout QA compares measured Figma dimensions with computed browser styles, while visual QA captures interactive states and asks for perceptual judgment.

A reviewer sees both evidence streams and either passes the section or returns it for another bounded iteration. The running Astro site is the delivery authority; Figma is the reference authority and `.claude/work/<page>.md` preserves orchestration state.

The repository warns that its node IDs, tokens and component paths are specific to one production project. That disclosure is why the record remains architecture-level and `active-transition`, not a maintained framework with a stable compatibility promise.

- [Pinned repository](https://github.com/wyeworks/figma-to-astro-pipeline/tree/446261ec095c590733fd631b3b7fb42b8a65853c)
- [Implementation command](https://github.com/wyeworks/figma-to-astro-pipeline/blob/446261ec095c590733fd631b3b7fb42b8a65853c/.claude/commands/implement-section.md)
- [Visual QA agent](https://github.com/wyeworks/figma-to-astro-pipeline/blob/446261ec095c590733fd631b3b7fb42b8a65853c/.claude/agents/visual-qa.md)
- [WyeWorks location evidence](https://github.com/wyeworks)
