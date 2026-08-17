# Frontend Slides Editable

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Frontend Slides Editable is an explicit derivative of `frontend-slides`, retained separately because it adds a substantial authoring runtime and changes the artifact's post-generation life. The result remains one self-contained HTML file.

## The exported file carries its own editor

[`editable-deck-reference.html`](https://github.com/archlizheng/frontend-slides-editable/blob/e5663e6a0bdc2c2a673198bab3fb61036a7f20ee/examples/editable-deck-reference.html) is the runtime contract. Users can edit slots, unlock layout, add text/images/video, drag and resize objects, reorder pages and use undo/redo. Browser drafts provide local recovery; file-system access can overwrite a selected HTML; sanitized export embeds the current deck and media while removing transient controls.

The project deliberately distinguishes locked template structure from newly free-positioned objects. Its validators and generated preset corpus test viewport safety, design preservation and editability rather than assuming one editor shell fits every theme.

This mechanism is independent of the upstream read-only skill. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository and derivative statement](https://github.com/archlizheng/frontend-slides-editable/tree/e5663e6a0bdc2c2a673198bab3fb61036a7f20ee)
- [Editor runtime contract](https://github.com/archlizheng/frontend-slides-editable/blob/e5663e6a0bdc2c2a673198bab3fb61036a7f20ee/editor-runtime.md)
- [Editable-deck validator](https://github.com/archlizheng/frontend-slides-editable/blob/e5663e6a0bdc2c2a673198bab3fb61036a7f20ee/scripts/validate-editable-decks.py)
