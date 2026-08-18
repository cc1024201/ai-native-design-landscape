# AI-Powered Website Generator by Tony-VBB

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This generator inserts an explicit design-brief stage before source creation, then keeps saving and external deployment as user-controlled transitions rather than automatic consequences of a model response.

## Analysis and prompt enhancement precede generation

[`generate/route.ts`](https://github.com/Tony-VBB/ai-website-generator-/blob/bf5e6d9c9ef39eb6133267f2f13ba3722b1c4736/app/api/generate/route.ts) first asks Groq to identify missing visual and structural decisions and then expands the brief with concrete color, typography, layout and motion choices. Groq, Hugging Face or OpenRouter can generate the final single HTML document; a separate MERN mode emits one marked file at a time.

## Saving promotes transient output to a project

[`page.tsx`](https://github.com/Tony-VBB/ai-website-generator-/blob/bf5e6d9c9ef39eb6133267f2f13ba3722b1c4736/app/page.tsx) holds generated HTML and the analysis in client state until the user names and saves it. [`Project.ts`](https://github.com/Tony-VBB/ai-website-generator-/blob/bf5e6d9c9ef39eb6133267f2f13ba3722b1c4736/models/Project.ts) then persists the brief, enhanced brief, analysis, current HTML, provider and model in MongoDB. A project is one current snapshot rather than a version graph.

## Delivery paths execute against provider APIs

[`PreviewPanel.tsx`](https://github.com/Tony-VBB/ai-website-generator-/blob/bf5e6d9c9ef39eb6133267f2f13ba3722b1c4736/components/PreviewPanel.tsx) projects HTML with `srcDoc`, copies it and builds a ZIP. The GitHub, Netlify and Vercel API routes accept a user token and make real provider requests; unlike simulated “deploy” UI, failure is returned when credentials or provider calls are invalid.

## Evidence

- [Canonical repository](https://github.com/Tony-VBB/ai-website-generator-)
- [Inspected tree](https://github.com/Tony-VBB/ai-website-generator-/tree/bf5e6d9c9ef39eb6133267f2f13ba3722b1c4736)
- Commit: `bf5e6d9c9ef39eb6133267f2f13ba3722b1c4736`
