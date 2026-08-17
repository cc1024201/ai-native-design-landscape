# Tiangong AI Decks

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Tiangong AI Decks is a filesystem-first agent pipeline for turning scattered sources into HTML presentation packages. Its contribution is the artifact contract between research, planning and an external renderer, rather than a built-in graphical editor.

## JSON handoffs make the pipeline resumable

[`briefs.ts`](https://github.com/linancn/tiangong-ai-decks/blob/e971aaae8181874eafd831d9996d3d2a8861d878/packages/pipeline/src/briefs.ts), [`decks.ts`](https://github.com/linancn/tiangong-ai-decks/blob/e971aaae8181874eafd831d9996d3d2a8861d878/packages/pipeline/src/decks.ts) and `deck-artifacts.ts` validate successive brief, outline, public deck and render-handoff objects. Content is normalized into a project library before a deck is authored, so later agents consume bounded evidence rather than the original pile of files.

[`rendering-contract.md`](https://github.com/linancn/tiangong-ai-decks/blob/e971aaae8181874eafd831d9996d3d2a8861d878/docs/rendering-contract.md) explicitly separates the repository's canonical artifact package from whichever renderer turns it into final HTML. This makes the working files inspectable and replaceable without claiming that the repository owns a full visual editor.

The maintainer's first-party GitHub profile identifies China.

## Evidence

- [Pinned repository](https://github.com/linancn/tiangong-ai-decks/tree/e971aaae8181874eafd831d9996d3d2a8861d878)
- [Domain model](https://github.com/linancn/tiangong-ai-decks/blob/e971aaae8181874eafd831d9996d3d2a8861d878/packages/domain/src/index.ts)
- [CLI](https://github.com/linancn/tiangong-ai-decks/blob/e971aaae8181874eafd831d9996d3d2a8861d878/apps/cli/src/index.ts)
- [Maintainer profile](https://github.com/linancn)
