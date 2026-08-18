# AI Website Generator by Maurya

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This Groq-backed generator models a small website as three typed source fields and keeps the full authoring loop intentionally local to the active React session.

## Three logical files, one session object

Pinned revision: `c96ab6646cd7cf9aeed6ba7f1707f4d3a1f444ef`.

The API returns `html`, `css` and `js`; the frontend exposes each field as an editable textarea. Preview composes them into an iframe document, so the typed response—not a filesystem or DOM mutation log—is current authority.

## Export is stronger than persistence

Users can copy a combined HTML document or download a ZIP containing the three logical files. The repository contains an unused-looking database scaffold, but the implemented generation route and UI do not create or reopen durable projects. Export therefore preserves work that the application itself does not.

## There is no revision protocol

Regeneration replaces the current object and manual edits mutate it in place. No snapshot, undo stack, conversation ledger or server identity is attached, which makes this a generate-edit-deliver workbench rather than a versioned builder.

## Pinned evidence

- [Repository](https://github.com/maurya1818/AIwebGenerator)
- [Groq response construction](https://github.com/maurya1818/AIwebGenerator/blob/c96ab6646cd7cf9aeed6ba7f1707f4d3a1f444ef/backend/services/llm_service.py)
- [Generation API contract](https://github.com/maurya1818/AIwebGenerator/blob/c96ab6646cd7cf9aeed6ba7f1707f4d3a1f444ef/backend/routers/generator.py)
- [Editor, preview and ZIP flow](https://github.com/maurya1818/AIwebGenerator/blob/c96ab6646cd7cf9aeed6ba7f1707f4d3a1f444ef/frontend/src/App.jsx)
- [Deployment routing](https://github.com/maurya1818/AIwebGenerator/blob/c96ab6646cd7cf9aeed6ba7f1707f4d3a1f444ef/vercel.json)
