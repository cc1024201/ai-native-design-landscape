# TIMECODE-AGENT

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

TIMECODE-AGENT separates video understanding from editorial decision-making. Ingest builds reusable local signals; agents record time-addressed evidence in `checkpoints.jsonl`; the editing loop writes decisions to `sequences.jsonl` and derives EDL, FCPXML or OTIO only from supported records.

## Ledgers make an edit reproducible

Corrections occur upstream in the evidence ledger and affected edits are re-derived. Self-contained HTML corpus, relation and timeline views are projections over the same durable records, not a second source of truth. This prevents a plausible model reply from becoming an untraceable cut list.

The current evidence supports grounded handoff and revision-pinned multi-cut export. It does not claim subjective editorial superiority or a complete nonlinear editor.

- [Pinned repository](https://github.com/mupozg823/timecode-agent/tree/02f7c5a9ce1c09b4ba49177d2a4dc8e9ee1bbc03)
- [Architecture](https://github.com/mupozg823/timecode-agent/blob/02f7c5a9ce1c09b4ba49177d2a4dc8e9ee1bbc03/docs/ARCHITECTURE.md)
- [Checkpoint store](https://github.com/mupozg823/timecode-agent/blob/02f7c5a9ce1c09b4ba49177d2a4dc8e9ee1bbc03/src/video_agent/checkpoint_store.py)
- [Sequence model](https://github.com/mupozg823/timecode-agent/blob/02f7c5a9ce1c09b4ba49177d2a4dc8e9ee1bbc03/src/video_agent/sequence.py)
- [Maintainer profile checked; no location published](https://github.com/mupozg823)
