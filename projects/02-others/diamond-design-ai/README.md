# Diamond Design AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Diamond Design AI is a jewelry-concept workspace that moves from consultant conversation to generated and edited image versions, then freezes one selected concept into a workshop-oriented handoff. Its artifact is a versioned visual concept plus structured brief—not a parametric jewelry CAD model.

## The session preserves concept lineage

The [`design types`](https://github.com/Queue-Solutions/diamond-design-ai/blob/bde009d74d457913f85f67d6f62dace6cf526d8f/src/types/design.ts) distinguish uploaded references, generated concepts, edit instructions, versions, conversation stage and the finalized concept. Supabase records sessions and image rows, while private storage retains sources, generated images, edits and exports.

This gives refinement an explicit ancestry: an edit targets a selected prior image, increments its version and records the requested change. Later requirements are not silently attributed to an earlier candidate.

## Conversation dispatches bounded visual actions

The consultant prompt in [`diamond-consultant-prompt.ts`](https://github.com/Queue-Solutions/diamond-design-ai/blob/bde009d74d457913f85f67d6f62dace6cf526d8f/src/lib/diamond-consultant-prompt.ts) asks the model for a typed action such as clarify, generate or edit. [`generate-designs`](https://github.com/Queue-Solutions/diamond-design-ai/blob/bde009d74d457913f85f67d6f62dace6cf526d8f/src/app/api/generate-designs/route.ts) routes the normalized profile to configured Replicate image models; [`edit-design`](https://github.com/Queue-Solutions/diamond-design-ai/blob/bde009d74d457913f85f67d6f62dace6cf526d8f/src/app/api/edit-design/route.ts) uses the selected source image and preservation-focused instruction.

The user can therefore compare initial concepts, choose a direction and issue successive edits without treating the latest bitmap as an unexplained replacement.

## Finalization changes the artifact role

Once a concept is selected, [`handoff-context.ts`](https://github.com/Queue-Solutions/diamond-design-ai/blob/bde009d74d457913f85f67d6f62dace6cf526d8f/src/lib/handoff-context.ts) gathers only the relevant history and profile. The model produces a structured workshop brief, and [`export-design.ts`](https://github.com/Queue-Solutions/diamond-design-ai/blob/bde009d74d457913f85f67d6f62dace6cf526d8f/src/lib/export-design.ts) derives PDF, PNG and text deliveries around the finalized version.

## Manufacturing boundary

The handoff describes visible metal, stones, setting and lettering, but the source does not create toleranced geometry or a production CAD model. A jeweler must validate feasibility, dimensions and fabrication details. The project qualifies through visual candidate generation, versioned refinement and explicit promotion—not through an unsupported claim of automated manufacturing Design.

## Evidence

- [Pinned repository](https://github.com/Queue-Solutions/diamond-design-ai/tree/bde009d74d457913f85f67d6f62dace6cf526d8f)
- [Design-session API](https://github.com/Queue-Solutions/diamond-design-ai/blob/bde009d74d457913f85f67d6f62dace6cf526d8f/src/app/api/design-sessions/%5Bid%5D/route.ts)
