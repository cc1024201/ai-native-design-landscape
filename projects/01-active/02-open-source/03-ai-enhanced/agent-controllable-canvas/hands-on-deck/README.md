# hands-on-deck

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

hands-on-deck is an agent-native PowerPoint editor whose public interface is a CLI and declarative JSON patch language. The existing `.pptx` remains the native authority; an agent never has to replace a branded deck just to change it.

## One atomic writer surrounds the native file

[`deck.py`](https://github.com/EveryInc/hands-on-deck/blob/a24b996ecff6393ccf39c4fee2b88c493fb0b693/skills/hands-on-deck/scripts/deck.py) inspects stable shape IDs, pre-validates every requested operation, applies the patch atomically and writes no partial output after validation or runtime failure. Post-apply measurement reports only new or worsened overflow, clipping, off-slide and near-alignment problems; deterministic fixes are re-measured and residue stays visible.

HTML creation does not introduce a second PPTX writer. [`html2patch.py`](https://github.com/EveryInc/hands-on-deck/blob/a24b996ecff6393ccf39c4fee2b88c493fb0b693/skills/hands-on-deck/scripts/html2patch.py) uses Chromium to measure CSS and compiles the result into the same patch IR. The native writer therefore governs creation, editing, lint, diff and render verification.

Every Inc distributes the engine as one Agent Skill; client-specific presentation rules compose above it. No first-party source reviewed here established a stable team region.

## Evidence

- [Pinned repository](https://github.com/EveryInc/hands-on-deck/tree/a24b996ecff6393ccf39c4fee2b88c493fb0b693)
- [Patch compiler specification](https://github.com/EveryInc/hands-on-deck/blob/a24b996ecff6393ccf39c4fee2b88c493fb0b693/docs/html2patch-spec.md)
- [Engine tests](https://github.com/EveryInc/hands-on-deck/blob/a24b996ecff6393ccf39c4fee2b88c493fb0b693/tests/test_deck.py)
