# Convertix AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Convertix AI treats a landing page as structured template data rather than an opaque code dump. A model fills that graph; section controls, publishing, and analytics continue operating on the same page identity.

## The model is constrained to the product schema

[`landing-page-ai.service.ts`](https://github.com/radwa-talaat/convertix-ai/blob/65384e2cbfae7c0dc28c77b19d36a5526cc0cc03/services/ai/landing-page-ai.service.ts) joins the OpenAI Responses path to validated landing-page data. The renderer then interprets the template instead of executing arbitrary model prose.

## Direct editing returns to structured authority

The editor's [`template-mutators.service.ts`](https://github.com/radwa-talaat/convertix-ai/blob/65384e2cbfae7c0dc28c77b19d36a5526cc0cc03/services/editor/template-mutators.service.ts) changes sections and fields in that template. [`use-editor-autosave.ts`](https://github.com/radwa-talaat/convertix-ai/blob/65384e2cbfae7c0dc28c77b19d36a5526cc0cc03/hooks/editor/use-editor-autosave.ts) and Supabase project/page services make those changes reopenable.

## Publication is a snapshot boundary

[`publishing.service.ts`](https://github.com/radwa-talaat/convertix-ai/blob/65384e2cbfae7c0dc28c77b19d36a5526cc0cc03/services/publishing/publishing.service.ts) copies current content into `published_content`, increments a version, records a publish snapshot, and exposes the public URL. Draft edits therefore do not silently change the released page. Export is available through [`export.service.ts`](https://github.com/radwa-talaat/convertix-ai/blob/65384e2cbfae7c0dc28c77b19d36a5526cc0cc03/services/editor/export.service.ts).

## Pinned evidence

- [Repository](https://github.com/radwa-talaat/convertix-ai)
- [Inspected tree](https://github.com/radwa-talaat/convertix-ai/tree/65384e2cbfae7c0dc28c77b19d36a5526cc0cc03)
- Commit: `65384e2cbfae7c0dc28c77b19d36a5526cc0cc03`
