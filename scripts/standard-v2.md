# v2 Layer-Internal Scoring Standard

Applies AFTER entity layering (H1–H6). Read this file first; it is the only scoring authority.

## Scope by layer

- **H1 (commercial product)** and **H2 (open-source app/project)**: score AI-native degree with 4 dimensions below.
- **H3 (agent workflow/skill pack)**: score the same 4 dimensions, but interpret them as "how much the workflow itself encodes AI-driven design creation" (the workflow is the product).
- **H4 (connection/bridge)**: do NOT score AI-native. Score **host-access depth** (below). Its AI-native is capped at 3.5 by definition.
- **H5 (template/scaffold)** and **H6 (research/eval)**: no score.

## Dimensions (H1/H2/H3), each 1–10

| Dimension | 10 means | 1 means |
|---|---|---|
| `ai_in_loop` — does THIS record (not its ecosystem) call models/intelligence and let it take design decisions | the record's core loop is model-driven decision-making about the design | the record contains no model call at all; AI is purely hypothetical |
| `authority` — how much of the creation is done by the AI | AI turns intent/references directly into the complete designed artifact | human does all creative work manually |
| `mutation_by_ai` — can the AI itself (not the host tool) edit existing persistent work | the record's AI directly edits, iterates, repairs or refactors the persistent artifact | AI output is one-shot; nothing existing can be changed by AI |
| `articulation` — does the creation land in a durable editable artifact | durable structured editable artifact owned by the workflow/product | disposable output only |

**Total** = round1( 0.30*ai_in_loop + 0.25*authority + 0.25*mutation_by_ai + 0.20*articulation ).

**Critical rule**: mutation/authority must be credited to the RECORD's OWN AI. A raw MCP server, CLI engine, or extension that merely enables an external agent must score ai_in_loop and authority ≤ 2 (its capability belongs to whoever calls it). Distinguish: "the record itself contains the model loop that decides" vs "the record is a mechanism another AI uses".

## Anchors (H1/H2/H3)

| Total | Label |
|---|---:|
| 9.0–10.0 | fully AI-native |
| 7.0–8.9 | AI-first |
| 4.0–6.9 | AI-enhanced |
| 1.0–3.9 | AI-tooling |

## H4 host-access depth (1–10)

Judge what an AI can DO through this bridge against the host's own system:

- 1–2 read-only: fetch/parse/inspect only (no mutation anywhere)
- 3–5 constrained write: simple object creation or property/parameter changes
- 6–8 deep mutation: structural operations (component trees, feature trees, scene-graph nodes, token systems), undo-aware or bidirectional where evidenced
- 9–10 full authoring surface: complete lifecycle creation, deep iteration, multiple artifact types

Call this dimension `depth`. Output `{slug, depth, rationale}`.

## Rules

1. Read the FULL dossier before scoring.
2. Unproven dimensions score 1–3 with "no evidence for X" in rationale. Never invent.
3. Closed products: score from public contracts/bundles; penalize what is unknown.
4. Lifecycle does not change the score.
5. Be strict: the same mechanism shape must score the same across raters.
6. Lifecycle/historical records: score at last evidenced state.