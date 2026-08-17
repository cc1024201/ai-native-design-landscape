# Archify

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Archify treats architecture communication as a compiled artifact system. An agent authors typed semantic JSON; dedicated renderers and delivery rules produce several visual forms from that model.

## Authoring contract before aesthetics

At commit [`a3bf80c2`](https://github.com/tt-a1i/archify/tree/a3bf80c25a824f5d5c46dfdbfdb96cc52dd4742a), the skill defines supported diagram families and their schemas. Examples and tests constrain nodes, relations and narrative fields before visual rendering.

## Delivery is multi-surface but traceable

The same IR can produce interactive HTML, PNG, SVG, WebM and share-card assets. A visual-check command and delivery contract distinguish semantic validity from rendered usability. Delta artifacts make architectural change itself reviewable.

## Why it is not just a template library

The defining mechanism is the enforced path from an agent-authored model through validation to evidence-bearing deliverables. Templates are runtime components of that pipeline rather than the product's sole value.

## Evidence

- [Pinned repository](https://github.com/tt-a1i/archify/tree/a3bf80c25a824f5d5c46dfdbfdb96cc52dd4742a)
- [Skill and authoring contract](https://github.com/tt-a1i/archify/blob/a3bf80c25a824f5d5c46dfdbfdb96cc52dd4742a/archify/SKILL.md)
- [Delivery contract](https://github.com/tt-a1i/archify/blob/a3bf80c25a824f5d5c46dfdbfdb96cc52dd4742a/archify/references/delivery-contract.md)
- [Architecture delta implementation](https://github.com/tt-a1i/archify/blob/a3bf80c25a824f5d5c46dfdbfdb96cc52dd4742a/archify/delta/architecture-delta.mjs)
- [Visual check command](https://github.com/tt-a1i/archify/blob/a3bf80c25a824f5d5c46dfdbfdb96cc52dd4742a/archify/bin/visual-check.mjs)
