# SiteForge AI by P Sreyanshu Anupam

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SiteForge streams a full-page model response into a three-pane authoring shell. The same current source state supports iframe proof direct text editing and export while a separate server API defines project persistence.

## Streaming precedes source promotion

[`ai_service.py`](https://github.com/psa21git/AI-Website-Generator/blob/1ea6a84f22e304cfa4174891729a6f0ff07751de/backend/app/services/ai_service.py) streams Gemini output and retains an explicitly disabled offline mock branch. [`generate.py`](https://github.com/psa21git/AI-Website-Generator/blob/1ea6a84f22e304cfa4174891729a6f0ff07751de/backend/app/routes/generate.py) forwards deltas over SSE and then uses [`code_engine.py`](https://github.com/psa21git/AI-Website-Generator/blob/1ea6a84f22e304cfa4174891729a6f0ff07751de/backend/app/services/code_engine.py) to extract HTML CSS and JavaScript from the completed document.

## Current source is visually inspectable and exportable

[`PreviewPanel.jsx`](https://github.com/psa21git/AI-Website-Generator/blob/1ea6a84f22e304cfa4174891729a6f0ff07751de/frontend/src/components/PreviewPanel.jsx) projects the HTML in a sandboxed iframe and sends it to the ZIP route. The adjacent editor can mutate source state; HTML edits replace the preview document while separate CSS and JavaScript edits are not reassembled into that document. [`projects.py`](https://github.com/psa21git/AI-Website-Generator/blob/1ea6a84f22e304cfa4174891729a6f0ff07751de/backend/app/routes/projects.py) exposes PostgreSQL-backed CRUD but the inspected main UI does not call those save or load helpers, so persistence exists as an interface rather than a completed ordinary-user journey.

## Evidence

- [Canonical repository](https://github.com/psa21git/AI-Website-Generator)
- [Inspected tree](https://github.com/psa21git/AI-Website-Generator/tree/1ea6a84f22e304cfa4174891729a6f0ff07751de)
- Commit: `1ea6a84f22e304cfa4174891729a6f0ff07751de`
