# AI Website Generator by Aditya Umale

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This generator's artifact is a structured multi-page React bundle rather than one HTML document. Manual visual edits do not rewrite that generated graph; they are retained as a separate overlay when the preview is reconstructed.

## OpenAI creates a page graph

[`aiService.ts`](https://github.com/AdityaUmale/ai-website-generator/blob/222a81cee03242041ca122fdcc33588f8fe49288/backend/src/services/aiService.ts) requests JSON with pages, optional shared components and styles and requires editable element identifiers and cross-page navigation. The generation route stores that graph under a new site identifier.

## Browser Babel materializes the current page

[`WebsitePreview.tsx`](https://github.com/AdityaUmale/ai-website-generator/blob/222a81cee03242041ca122fdcc33588f8fe49288/frontend/app/components/WebsitePreview.tsx) combines shared components with the selected page, applies saved text and style overlays, transpiles JSX with browser Babel and lets the user switch between visual and reconstructed code views. Clicking a `data-edit-id` target opens the edit surface.

## Edits and projects are process-local overlays

[`website.ts`](https://github.com/AdityaUmale/ai-website-generator/blob/222a81cee03242041ca122fdcc33588f8fe49288/backend/src/routes/website.ts) saves manual element edits separately from the generated pages. [`storageService.ts`](https://github.com/AdityaUmale/ai-website-generator/blob/222a81cee03242041ca122fdcc33588f8fe49288/backend/src/services/storageService.ts) keeps both maps only in server memory. Although an AI `editElement` method exists, the exposed edit route does not call it; ordinary visual edits are deterministic overlays and all projects disappear on process restart.

## Evidence

- [Canonical repository](https://github.com/AdityaUmale/ai-website-generator)
- [Inspected tree](https://github.com/AdityaUmale/ai-website-generator/tree/222a81cee03242041ca122fdcc33588f8fe49288)
- Commit: `222a81cee03242041ca122fdcc33588f8fe49288`
