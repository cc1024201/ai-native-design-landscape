# Base44

Base44 defines design as **the construction of a full-stack application**, not
a page: a prompt, URL, Figma frame or file becomes a React/Vite project welded
to Base44-managed entities, functions, auth, connectors and optional
application agents, then previewed and finally *published*. Visual editing is
only one mutation route into that application, and the Canvas is not the
durable artifact — it is a planning and targeting surface over live frames of
it. [First-prompt flow](https://docs.base44.com/Getting-Started/starting-from-your-first-prompt)

The decisive architectural fact is **one apparent app with many independently
advancing authorities**. Code history, production records, test records,
branch state, sandbox checkpoints, agent memory, Git and the published site
each have their own clock, and no public operation restores them as a single
transaction. Design intent can enter through several surfaces — Plan mode and
Discuss are non-mutating, Default mode acts immediately, Edit targets a
rendered element, Theme changes global styling, Canvas sends page-scoped
context to chat — each with a different persistence boundary and a refusal to
let a visually correct preview stand in for data correctness or delivery.
[AI chat modes](https://docs.base44.com/Building-your-app/AI-chat-modes)

That split is why Base44's recovery story is a set of separate ledgers:
Manual-Edit undo is a 50-step session, Prompt Revert replays before a message,
Version History rewinds editor code, branches and GitHub `main` are mutually
exclusive versioning regimes, entity data history restores one table's
records, and publish makes a chosen version live without touching production
data. [Working with branches](https://docs.base44.com/Building-your-app/working-with-branches) ·
[Entity data version history](https://docs.base44.com/Enterprise/data-version-history)

The public code — MIT CLI and SDK — exposes clients, resource schemas, a local
in-memory emulator, ordered deploy sequencing and a remote-sandbox bridge, but
stops before the closed builder core: the hosted generation agent, Canvas
renderer, visual writeback and renderer-to-source mapping are undisclosed.
What is established by contract is that Base44 can narrow a selected rendered
element toward source, that Figma import is a one-way reconstruction, and that
acceptance is the refreshed published URL with correct permissions — not a
completion message or green preview.
[Code tab](https://docs.base44.com/developers/app-code/editor/code-tab) ·
[Import from Figma](https://docs.base44.com/Getting-Started/import-from-figma)
