# SlideFinder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SlideFinder defines presentation Design as evidence-preserving selection rather than drawing every slide anew. It searches Microsoft Build and Ignite decks, uses multiple agents to propose and critique a narrative, and merges chosen source slides into a new PowerPoint.

## Promotion keeps source provenance

[`workflow.py`](https://github.com/aymenfurter/slidefinder/blob/a0c139096d62be0197fb999c111857564ff7e1a4/src/services/deck_builder/workflow.py) coordinates architect, critic and judge stages over an explicit workflow state. The user can edit the proposed outline, search or favorite alternatives and inspect thumbnails before selection. [`merger.py`](https://github.com/aymenfurter/slidefinder/blob/a0c139096d62be0197fb999c111857564ff7e1a4/src/services/pptx/merger.py) copies selected native slides while preserving their original formatting and origin.

```text
deck intent -> semantic retrieval -> agent offer / critique / judge
-> editable outline + human slide selection -> native slide merge + provenance
```

The candidate set is bounded to indexed conference decks, so this is a curation workspace rather than a general presentation generator. The maintainer profile reports Zurich, Switzerland.

## Evidence

- [Pinned repository](https://github.com/aymenfurter/slidefinder/tree/a0c139096d62be0197fb999c111857564ff7e1a4)
- [Deck workflow](https://github.com/aymenfurter/slidefinder/blob/a0c139096d62be0197fb999c111857564ff7e1a4/src/services/deck_builder/workflow.py)
- [Native PPTX merger](https://github.com/aymenfurter/slidefinder/blob/a0c139096d62be0197fb999c111857564ff7e1a4/src/services/pptx/merger.py)
- [Maintainer location evidence](https://github.com/aymenfurter)
