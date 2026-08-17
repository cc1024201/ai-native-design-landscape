# IA Landing Generator Pro

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Spanish-first suite defines AI design as a family of structured business artifacts: landing pages, dashboards, UI components and kits, reports, presentations, campaign material and brand analysis. The landing workflow is the clearest place to inspect its artifact authority.

## The model generates content into a template graph

[`generate/route.ts`](https://github.com/emcon84/ia-landing-generator/blob/2814c96a2664c61295e533a3f3c9635f93d88993/app/api/generate/route.ts) uses Groq to return structured landing content rather than an opaque screenshot. [`landing/page.tsx`](https://github.com/emcon84/ia-landing-generator/blob/2814c96a2664c61295e533a3f3c9635f93d88993/app/landing/page.tsx) combines that content with the selected industry template, exposes field and section corrections and persists the resulting object in localStorage.

## Native components are the preview authority

[`LandingPreview.tsx`](https://github.com/emcon84/ia-landing-generator/blob/2814c96a2664c61295e533a3f3c9635f93d88993/components/LandingPreview.tsx) chooses real React sections from the content and template type. The preview is therefore a native projection of the structured object rather than an image or a separately generated mock document.

## Export tries to preserve preview parity

[`export-react-project-v2.ts`](https://github.com/emcon84/ia-landing-generator/blob/2814c96a2664c61295e533a3f3c9635f93d88993/lib/export-react-project-v2.ts) builds a complete Next.js ZIP from the same component implementations used by the preview. Other routes materialize dashboards, PDF reports and presentations, but there is no shared server-side project/version authority: the inspected landing and dashboard workspaces rely mainly on browser storage.

## Evidence

- [Canonical repository](https://github.com/emcon84/ia-landing-generator)
- [Inspected tree](https://github.com/emcon84/ia-landing-generator/tree/2814c96a2664c61295e533a3f3c9635f93d88993)
- Commit: `2814c96a2664c61295e533a3f3c9635f93d88993`
