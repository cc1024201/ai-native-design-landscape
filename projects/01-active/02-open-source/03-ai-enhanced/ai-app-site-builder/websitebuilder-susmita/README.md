# AI-Powered Website Generator by Susmita Dey

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This project defines Design as editing a generated multi-page HTML set. Gemini proposes the initial page graph a CMS-like surface selects pages and both direct element editing and natural-language revision return changes to the same in-memory website object.

## The artifact is a page map containing executable HTML

[`ai_service.py`](https://github.com/Susmita-Dey/websitebuilder/blob/540831d33e1cf0d8c8c3d3bedf6dcffb40df8aaf/backend/services/ai_service.py) constrains generation to JSON whose `pages` carry names slugs descriptions and complete HTML. It also revises one selected page by sending its current HTML and the edit instruction back to Gemini.

[`routes.py`](https://github.com/Susmita-Dey/websitebuilder/blob/540831d33e1cf0d8c8c3d3bedf6dcffb40df8aaf/backend/api/routes.py) binds generation retrieval and page-specific revision to one website ID. The result is more structured than a one-shot HTML answer but less durable than a hosted project graph.

## Direct visual edits write back to HTML

[`VisualEditor.tsx`](https://github.com/Susmita-Dey/websitebuilder/blob/540831d33e1cf0d8c8c3d3bedf6dcffb40df8aaf/frontend/components/VisualEditor.tsx) lets a user select text in the iframe change content or inline style and serializes the resulting document element back through `onPageUpdate`. [`PagePreview.tsx`](https://github.com/Susmita-Dey/websitebuilder/blob/540831d33e1cf0d8c8c3d3bedf6dcffb40df8aaf/frontend/components/PagePreview.tsx) renders the accepted HTML at desktop tablet or mobile dimensions.

That gives the project a real code-visual correction loop: the preview is not merely evidence because edits return to the HTML authority.

## Persistence is intentionally shallow

[`website_storage.py`](https://github.com/Susmita-Dey/websitebuilder/blob/540831d33e1cf0d8c8c3d3bedf6dcffb40df8aaf/backend/storage/website_storage.py) stores website objects in a process-local dictionary and replaces a page in place. A backend restart loses the workspace and there is no version history publication or deployment model in the inspected source.

## Evidence boundary

- [Canonical repository](https://github.com/Susmita-Dey/websitebuilder)
- [Inspected tree](https://github.com/Susmita-Dey/websitebuilder/tree/540831d33e1cf0d8c8c3d3bedf6dcffb40df8aaf)
- Commit: `540831d33e1cf0d8c8c3d3bedf6dcffb40df8aaf`

The maintainer profile states Kolkata India so the team region is recorded as India.
