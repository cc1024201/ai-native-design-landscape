# AI UI Generator by Mohammed Kahab

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This generator does not ask Gemini for arbitrary HTML. It asks for a constrained landing-page specification and keeps that JSON graph as the input to a fixed React renderer.

## The model is bounded by a page vocabulary

[`services/api.ts`](https://github.com/Kahabk/Ai-UI-Generator/blob/b503639af2cb0136f0948d6bcc273d78527e8555/services/api.ts) requests structured JSON for intent, theme, marketing copy and modular page sections. It first calls the configured backend and can fall back to Gemini while preserving the same `LandingPageConfig` contract. This makes malformed source generation a schema problem rather than a browser execution problem.

## The JSON graph owns the visible design

[`App.tsx`](https://github.com/Kahabk/Ai-UI-Generator/blob/b503639af2cb0136f0948d6bcc273d78527e8555/App.tsx) stores the current configuration and projects its theme and sections into desktop or mobile preview widths. Subsequent instructions replace the structured configuration; they do not mutate exported HTML or repository files.

## Authority limit

The current JSON configuration is a native page graph in session state. Public source shows no durable project store, direct node inspector, version lineage or code export. Several alternate backend files and a checked-in virtual environment also make the repository transitional rather than a clean single runtime.

## Pinned evidence

- [Canonical repository](https://github.com/Kahabk/Ai-UI-Generator)
- [Backend orchestration](https://github.com/Kahabk/Ai-UI-Generator/blob/b503639af2cb0136f0948d6bcc273d78527e8555/app.py)
- [Inspected tree](https://github.com/Kahabk/Ai-UI-Generator/tree/b503639af2cb0136f0948d6bcc273d78527e8555)
- Commit: `b503639af2cb0136f0948d6bcc273d78527e8555`
