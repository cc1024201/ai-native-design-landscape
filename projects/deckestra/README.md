# Deckestra

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Deckestra is a privacy-gated local Agent Skill for deterministic editable-presentation work. It derives part of its presentation machinery from PPT Master, but release provenance, privacy policy and executable gates establish an independently maintained product boundary.

## Release policy is part of the presentation runtime

The skill routes new-deck, template-fill, beautification and native-enhancement jobs through explicit stages. [`deterministic_layout.py`](https://github.com/sunweitaosnape-lgtm/deckestra/blob/bb146c027735aa372b6dbf467d2fa4e77d9b58c3/skills/build-editable-decks/scripts/deterministic_layout.py) and the layout-trace gate make geometry reproducible. Native PowerPoint payloads, narration and animation helpers preserve editable `.pptx` delivery rather than flattening every page.

What distinguishes Deckestra is the productized trust boundary. [`privacy_gate.py`](https://github.com/sunweitaosnape-lgtm/deckestra/blob/bb146c027735aa372b6dbf467d2fa4e77d9b58c3/tools/privacy_gate.py), license, certification and provenance locks all run before a distributable release. The local-only default and explicit network rules therefore constrain how an agent may obtain assets and process source material.

PPT Master is recorded as an upstream component, not counted again through Deckestra. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/sunweitaosnape-lgtm/deckestra/tree/bb146c027735aa372b6dbf467d2fa4e77d9b58c3)
- [Skill runtime](https://github.com/sunweitaosnape-lgtm/deckestra/blob/bb146c027735aa372b6dbf467d2fa4e77d9b58c3/skills/build-editable-decks/SKILL.md)
- [Provenance lock](https://github.com/sunweitaosnape-lgtm/deckestra/blob/bb146c027735aa372b6dbf467d2fa4e77d9b58c3/release/provenance.lock.json)
