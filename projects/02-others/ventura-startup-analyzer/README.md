# Ventura Startup Analyzer

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Ventura defines design as the last mile of a startup decision system rather than as an isolated page prompt. One startup record holds a strategy analysis and a landing-page prototype, but the source deliberately gives those artifacts separate histories.

## Strategy is a persisted artifact

[`analysis.ts`](https://github.com/Anandtech09/Ventura_Startup_Analyzer/blob/05c8b07681c352d5a6cef3fc26270900934a7c64/server/routes/analysis.ts) asks Gemini for a structured market, competitor, positioning and brand analysis. It writes the current result to the startup and appends the same result to `analysis_history`. [`db.ts`](https://github.com/Anandtech09/Ventura_Startup_Analyzer/blob/05c8b07681c352d5a6cef3fc26270900934a7c64/server/db.ts) keeps that history apart from `website_history`, so a strategic revision is not silently treated as a visual version.

## The prototype has its own replacement history

[`generation.ts`](https://github.com/Anandtech09/Ventura_Startup_Analyzer/blob/05c8b07681c352d5a6cef3fc26270900934a7c64/server/routes/generation.ts) turns the stored analysis into one complete HTML document. Both initial generation and AI refinement replace `website_html` and append the new document to `website_history`; initial generation alone has an explicit deterministic template fallback. This makes the current prototype authoritative while retaining prior complete documents.

## Selection and delivery stay visible

[`WebsitePreviewView.tsx`](https://github.com/Anandtech09/Ventura_Startup_Analyzer/blob/05c8b07681c352d5a6cef3fc26270900934a7c64/src/components/WebsitePreviewView.tsx) projects the selected HTML with `srcDoc`, exposes the version list, lets a prior version be inspected and downloads either the current or historical document. The archive is therefore an inspectable design trail rather than a decorative “history” label.

## Evidence

- [Canonical repository](https://github.com/Anandtech09/Ventura_Startup_Analyzer)
- [Inspected tree](https://github.com/Anandtech09/Ventura_Startup_Analyzer/tree/05c8b07681c352d5a6cef3fc26270900934a7c64)
- Commit: `05c8b07681c352d5a6cef3fc26270900934a7c64`
