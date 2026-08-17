# Higgsfield Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Higgsfield Skills is an installable agent-skill collection whose Design boundary spans brand identity, visual production and website delivery. The decisive mechanism is not a shared prompt library: the Brandkit skill persists approved palette, logo and typography slots, records dependency edges, and regenerates only outputs affected by a later change.

## Approval state is part of the artifact

The ordinary-user loop stops after palette, logo, typography and downstream reviews. Silence or a successful generation is explicitly not approval. Local state locks supplied official assets, stores selected candidates and carries those decisions into mockups, packaging, signage, social graphics, decks and brandbooks.

This makes the working authority a compound local project: approval state plus editable SVG/HTML/PPTX sources and their exports. Generated imagery may supply candidates, but it does not replace the durable identity state.

## Dependency-aware delivery

`brandkit.py` owns state inspection, logo export and brandbook construction. The skill distinguishes foundation slots from dependent outputs, repairs only a failing deliverable, and keeps local SVG, PPTX and PDF files unless the user requests hosting. The website skill extends the same collection into repository creation, preview and deployment, but source files and deployment state remain a separate authority from Brandkit approvals.

## Evidence boundary

The pinned repository establishes the public skills and deterministic helpers, not Higgsfield's private generation models or hosted service internals. Native Figma, Canva, PSD and Illustrator delivery is explicitly outside the Brandkit contract.

- [Pinned Higgsfield Skills revision](https://github.com/higgsfield-ai/skills/tree/fb18134b4aabe99c4bf7ff01c8f4883400efc80d)
- [Brandkit workflow and approval contract](https://github.com/higgsfield-ai/skills/blob/fb18134b4aabe99c4bf7ff01c8f4883400efc80d/higgsfield-brandkit/SKILL.md)
- [Brandkit state and build helper](https://github.com/higgsfield-ai/skills/blob/fb18134b4aabe99c4bf7ff01c8f4883400efc80d/higgsfield-brandkit/scripts/brandkit.py)
- [Website delivery skill](https://github.com/higgsfield-ai/skills/blob/fb18134b4aabe99c4bf7ff01c8f4883400efc80d/higgsfield-websites/SKILL.md)
