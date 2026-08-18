# Draw.io Live Editor

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Draw.io Live Editor places a local OpenAI-compatible model beside an embedded draw.io session. Its defining mechanism is two-way synchronization between XML source and the visible canvas.

## The current XML is model context

The assistant receives the diagram's current draw.io XML rather than a screenshot alone. A proposed response can therefore preserve object identities and relationships. Monaco exposes that same XML to the user, making the agent's actual mutation material inspectable.

## A live relay joins two editors

Changes move between Monaco and draw.io so either source editing or direct canvas manipulation can update the working diagram. This is a runtime bridge over draw.io's document format, not a new independent graph schema.

## Local inference narrows the trust boundary

An OpenAI-compatible local endpoint can keep source off a hosted provider, subject to the endpoint actually configured. The repository does not establish collaborative merge control, semantic architecture validation, or safe handling of concurrent XML edits.

## Pinned evidence

- Repository: [JerryKwan/drawio-live-editor](https://github.com/JerryKwan/drawio-live-editor)
- Inspected relay implementation: [`a42cc52de805248f75d61777a48d047346bb5766`](https://github.com/JerryKwan/drawio-live-editor/tree/a42cc52de805248f75d61777a48d047346bb5766)
- Immutable revision: [commit `a42cc52`](https://github.com/JerryKwan/drawio-live-editor/commit/a42cc52de805248f75d61777a48d047346bb5766)
