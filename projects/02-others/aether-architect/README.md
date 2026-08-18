# Aether Architect

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Aether Architect makes a structured UI tree the center of its product. Generated React code is a downstream materialization; it is not the object that the visual editor directly manipulates.

## Generation builds a staged artifact

[`services/gemini.ts`](https://github.com/W3JDev/Aether-Architect/blob/c523d0ed6611fb712f644b26fac8f155098344f9/services/gemini.ts) separately generates a PRD, a design system and flat UI nodes before assembling them into a `UINode` tree. The service can later edit that tree from a prompt and generate React plus a README from the accepted state.

## The tree owns direct manipulation

[`ArtifactRenderer.tsx`](https://github.com/W3JDev/Aether-Architect/blob/c523d0ed6611fb712f644b26fac8f155098344f9/components/ArtifactRenderer.tsx) recursively projects nodes. In [`App.tsx`](https://github.com/W3JDev/Aether-Architect/blob/c523d0ed6611fb712f644b26fac8f155098344f9/App.tsx) a user selects nodes, changes properties and uses tree helpers to drag them around; snapshots support in-session history. AI refinement also returns an updated tree, so manual and model operations converge on the same authority.

## Export is a one-way boundary

The application generates and downloads a TSX artifact from the tree. The public source does not show imported code being mapped back into nodes or durable server persistence. Candidate history is session state and code delivery is materialization rather than round-trip synchronization.

## Pinned evidence

- [Canonical repository](https://github.com/W3JDev/Aether-Architect)
- [Tree mutation helpers](https://github.com/W3JDev/Aether-Architect/blob/c523d0ed6611fb712f644b26fac8f155098344f9/utils/treeHelpers.ts)
- [Inspected tree](https://github.com/W3JDev/Aether-Architect/tree/c523d0ed6611fb712f644b26fac8f155098344f9)
- Commit: `c523d0ed6611fb712f644b26fac8f155098344f9`
