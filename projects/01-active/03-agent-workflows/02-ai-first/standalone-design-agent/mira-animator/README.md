# Mira Animator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Mira Animator is an agent-run presentation workshop for turning linked projects, books and PDFs into self-contained animated HTML decks. Its safety and authoring boundary is unusually explicit: agents may read linked sources, but write only into a separate `decks/` workspace.

## The deck source can be edited from its own projection

The pipeline separates extraction, planning, copy, HTML assembly, animation and validation. The durable deliverable is `decks/<name>/index.html`; templates and linked-source configuration surround it, rather than replacing it with a hosted project graph.

The decisive bidirectional mechanism is [`mira-edit.js`](https://github.com/sandeco/mira-animator/blob/94627ec0fb5346c8465a6f1ff394dfa69c8a7a57/decks/you-shall-not-pass/mira/mira-edit.js): edit mode reorders slide blocks in the rendered deck and saves the new order back into the same HTML source through the browser file picker or the local server. [`sources.js`](https://github.com/sandeco/mira-animator/blob/94627ec0fb5346c8465a6f1ff394dfa69c8a7a57/lib/commands/sources.js) keeps source projects linked and read-only.

```text
linked evidence -> specialist agent chain -> index.html
-> animated projection -> reorder/save -> revised index.html
```

The telestrator and remote-control layers coordinate a live talk but do not become the saved deck authority. Sandeco's first-party GitHub profile locates the maintainer in Brazil.

## Evidence

- [Pinned repository](https://github.com/sandeco/mira-animator/tree/94627ec0fb5346c8465a6f1ff394dfa69c8a7a57)
- [CLI edit injection](https://github.com/sandeco/mira-animator/blob/94627ec0fb5346c8465a6f1ff394dfa69c8a7a57/lib/commands/edit.js)
- [Validator skill](https://github.com/sandeco/mira-animator/blob/94627ec0fb5346c8465a6f1ff394dfa69c8a7a57/agents/mira-validator/SKILL.md)
- [Maintainer profile](https://github.com/sandeco)
