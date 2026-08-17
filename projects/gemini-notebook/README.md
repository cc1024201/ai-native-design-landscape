# Gemini Notebook

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Gemini Notebook, formerly NotebookLM, now includes a first-party Slide Deck workspace inside its source-grounded Studio. A notebook owner can choose a detailed or presenter format, length, audience, style and focus, then keep working while the hosted service generates the deck.

## Revisions are staged and materialize a new deck

The [official Slide Deck help](https://support.google.com/notebooklm/answer/16757456?hl=en) documents per-slide instructions for text, layout and visual changes. Multiple edits are grouped as `Pending Changes`; deletion can be restored before application; thumbnails can be reordered; and generating the revision creates an entirely new deck instead of silently overwriting the current one. Previously generated decks remain loadable.

This makes the hosted deck—not the original prompt or downloaded PDF—the working authority. Notebook sources ground initial generation, while the staged revision set records the user's current decision boundary. Presentation and sharing stay in the notebook; PDF and PowerPoint are explicit delivery copies. The [current product page](https://notebooklm.google/) names the service Gemini Notebook, while the support URL and older ecosystem integrations preserve the NotebookLM lineage.

## Evidence

- [Gemini Notebook product](https://notebooklm.google/)
- [Slide generation, revision, history and export contract](https://support.google.com/notebooklm/answer/16757456?hl=en)
- [Google's NotebookLM Studio examples](https://blog.google/innovation-and-ai/products/notebooklm/notebooklm-google-io-2026/)
