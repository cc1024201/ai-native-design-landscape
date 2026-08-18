# Forge Projects

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Forge Projects is a local character concept-art and prop-design workspace. It combines reference parts AI generation explicit parent/child lineage and a non-destructive layer composer so a generated image can be decomposed reused and revised.

## The project catalog is the authority

At commit [`d6e72b5`](https://github.com/NaphatPound/character-design-and-concept-art/tree/d6e72b5ff56966d4f4509cf54b2b661485613858) [`server.py`](https://github.com/NaphatPound/character-design-and-concept-art/blob/d6e72b5ff56966d4f4509cf54b2b661485613858/server.py) owns project creation assets provider jobs masks AI photo tools part extraction and layer documents. Each project JSON records its brief parts designs graph and relationships while files are separated into uploaded generated edit extracted and layer directories.

The browser can show the same work as a gallery or a node graph. Root designs connect to selected references; edits and continuations connect to their parent; manually added links remain explicit. Layer Studio stores transforms opacity blends and order then flattens a new design without overwriting its source.

External CLIs such as Gemini or Codex provide image generation and must already be installed and authenticated. The repository proves provider orchestration and lineage but not any provider's model internals. Public first-party evidence did not establish the maintainer region.

## Evidence

- [Generation and lineage client](https://github.com/NaphatPound/character-design-and-concept-art/blob/d6e72b5ff56966d4f4509cf54b2b661485613858/website/generate.js)
- [Workspace client](https://github.com/NaphatPound/character-design-and-concept-art/blob/d6e72b5ff56966d4f4509cf54b2b661485613858/website/app.js)
- [Pinned README](https://github.com/NaphatPound/character-design-and-concept-art/blob/d6e72b5ff56966d4f4509cf54b2b661485613858/README.md)
