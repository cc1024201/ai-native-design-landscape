# Tylina

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Tylina is a downloadable local-first WYSIWYG Typst desktop editor. It is surfaced independently from SeaSlides: SeaSlides may create a deck, while Tylina owns direct rendered-page editing, source synchronization and the ongoing local document workspace.

## The typeset page is an editor projection

The first-party product contract says a user can click, select and type on the rendered page while standard `.typ` remains canonical. Source Lens and split views expose that authority, and document history stays local. For slides, thumbnails, notes, reordering and presentation mode operate over the same project.

ACP agents connect through skills and MCP with document context. This makes Tylina a code-native visual IDE: direct visual edits and agent edits must converge on Typst rather than creating two divergent document models.

The application source is not public, so this dossier does not invent the mapping algorithm or history store implementation. The public website and downloadable product support only architecture-level claims. Team region remains unknown.

## Evidence

- [Official Tylina product site](https://tylina.github.io/)
- [Official downloadable workspace](https://tylina.github.io/download/)
- [First-party SeaSlides integration contract](https://github.com/touying-typ/seaslides/blob/dcde5bf6c6875b300e2999fc7766f369a13a67ac/README.md)
