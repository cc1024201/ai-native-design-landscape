# Ryzen AI by Anushka Chaudhary

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Ryzen AI is important as a fallback-aware implementation: the ordinary route can call Groq or OpenAI but a deterministic demonstration remains available when no credentials exist. The dossier keeps those two artifact origins separate.

## Credentials select authority rather than just model branding

[generate.ts](https://github.com/Anushka157-cha/Ryzen-Ai/blob/a185df2e7889bb49a3a59769f9ef6fe717335d48/pages/api/generate.ts) checks provider configuration and runs the planner-generator-explainer sequence through [api-client.ts](https://github.com/Anushka157-cha/Ryzen-Ai/blob/a185df2e7889bb49a3a59769f9ef6fe717335d48/lib/agent/api-client.ts). With credentials the returned source is model-authored; absent credentials activate the repository's named demo mode.

## Demo mode is not evidence of provider output

[demo-mode.ts](https://github.com/Anushka157-cha/Ryzen-Ai/blob/a185df2e7889bb49a3a59769f9ef6fe717335d48/lib/demo-mode.ts) constructs fixed components. Because the UI and API expose that state it is a product fallback and not a false positive for model participation.

## Versions and preview remain browser-owned

[PreviewPanel.tsx](https://github.com/Anushka157-cha/Ryzen-Ai/blob/a185df2e7889bb49a3a59769f9ef6fe717335d48/components/layout/PreviewPanel.tsx) Babel-renders current editable source. Versions are held in client state and disappear with the session; there is no durable project model.

## Evidence

- [Canonical repository](https://github.com/Anushka157-cha/Ryzen-Ai)
- [Inspected tree](https://github.com/Anushka157-cha/Ryzen-Ai/tree/a185df2e7889bb49a3a59769f9ef6fe717335d48)
- Commit: a185df2e7889bb49a3a59769f9ef6fe717335d48
