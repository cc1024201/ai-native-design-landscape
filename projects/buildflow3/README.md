# BUILDFLOW3

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

BUILDFLOW3 treats generation as production of a typed site specification rather than only an HTML completion. Its strongest implemented feature is a transparent, session-local history state machine shared by prompt revisions and artifact delivery.

## GeneratedSite is the canonical artifact

Pinned revision: `1f1cf02f6c38deb0d756a69881132aba09b7d39f`.

`GeneratedSite` carries structure, design rationale, HTML, CSS, JavaScript and React-oriented output. Preview does not become a second authority: one composer derives the iframe document, new-tab view and downloadable HTML from the current typed object.

## Prompt history and version history are one sequence

Initial generation restarts a generic `useVersionHistory` machine; each successful natural-language revision appends a complete `GeneratedSite` plus its instruction. Users can undo, redo or jump directly to any entry. If they revise after moving backward, future entries are discarded, making the model explicitly linear rather than branching.

## The whole graph is ephemeral

The history hook is deliberately network-free and there is no database-backed project identity. Refresh loses the initial site, revisions and active cursor. Download preserves the current projection only; it does not serialize the design rationale or version sequence.

## Pinned evidence

- [Repository](https://github.com/n0k3m0r8k20i1g4-arch/BUILDFLOW3)
- [Canonical generated-site type](https://github.com/n0k3m0r8k20i1g4-arch/BUILDFLOW3/blob/1f1cf02f6c38deb0d756a69881132aba09b7d39f/lib/generation/types.ts)
- [Linear history state machine](https://github.com/n0k3m0r8k20i1g4-arch/BUILDFLOW3/blob/1f1cf02f6c38deb0d756a69881132aba09b7d39f/lib/hooks/useVersionHistory.ts)
- [Generation and revision integration](https://github.com/n0k3m0r8k20i1g4-arch/BUILDFLOW3/blob/1f1cf02f6c38deb0d756a69881132aba09b7d39f/lib/hooks/useSiteGenerator.ts)
- [Shared preview and download projection](https://github.com/n0k3m0r8k20i1g4-arch/BUILDFLOW3/blob/1f1cf02f6c38deb0d756a69881132aba09b7d39f/lib/preview/composeDocument.ts)
- [Direct historical selection](https://github.com/n0k3m0r8k20i1g4-arch/BUILDFLOW3/blob/1f1cf02f6c38deb0d756a69881132aba09b7d39f/components/preview/HistoryPanel.tsx)
