# Eigendeck

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Eigendeck is a freeform presentation editor whose `.eigendeck` document is a single SQLite file. Slides, elements, assets and temporal history live together, allowing the desktop/web editor and an LLM-facing CLI to operate on one portable authority.

## History is data rather than backup files

The application writes semantic deck operations into SQLite and maintains an undo-safe history graph. [`eigendeck-history.mjs`](https://github.com/dgleich/eigendeck/blob/dd0b91530c332129ea266e02f086227492d7695a/tools/eigendeck-history.mjs) exposes and repairs that history, while [`test-history-integrity.mjs`](https://github.com/dgleich/eigendeck/blob/dd0b91530c332129ea266e02f086227492d7695a/tools/test-history-integrity.mjs) checks temporal invariants.

The freeform canvas can embed ordinary shapes, HTML, notebooks and interactive demonstrations. `eigendeck-cli` gives LLM tools structured read/write access without bypassing history. Self-contained HTML and other exports are projections; they do not supersede the SQLite document.

The maintainer's first-party profile links Purdue University, supporting a United States assignment.

## Evidence

- [Pinned repository](https://github.com/dgleich/eigendeck/tree/dd0b91530c332129ea266e02f086227492d7695a)
- [History integrity checker](https://github.com/dgleich/eigendeck/blob/dd0b91530c332129ea266e02f086227492d7695a/tools/check_deck_history.py)
- [Export path](https://github.com/dgleich/eigendeck/blob/dd0b91530c332129ea266e02f086227492d7695a/tools/export-eigendeck.mjs)
- [Maintainer profile](https://github.com/dgleich)
