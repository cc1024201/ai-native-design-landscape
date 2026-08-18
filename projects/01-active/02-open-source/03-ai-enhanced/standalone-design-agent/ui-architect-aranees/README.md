# UI Architect by Anees ur Rehman

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UI Architect runs a local visual-feedback loop rather than relying on a single code answer. Qwen writes initial HTML, Playwright renders it and later turns receive screenshot-derived critique before a final source string is returned.

## Browser evidence returns to the agent

[`agent.service.ts`](https://github.com/araneeskhan/ai-ui-builder/blob/4c83d65602356694662006baf2ea12f986c7609d/backend/src/agent/agent.service.ts) chooses a scaffold, calls local Ollama, launches Chromium and iterates generation and refinement around the rendered result. Deterministic post-processing and the local ML evaluator add checks but do not replace the model-authored HTML.

## Client exposes both representations

[`App.tsx`](https://github.com/araneeskhan/ai-ui-builder/blob/4c83d65602356694662006baf2ea12f986c7609d/frontend/src/App.tsx) controls the prompt and refinement count and shows code beside an iframe projection. The inspected product does not persist a project graph after the session.

## Evidence lock

- [Canonical repository](https://github.com/araneeskhan/ai-ui-builder)
- [Inspected commit](https://github.com/araneeskhan/ai-ui-builder/commit/4c83d65602356694662006baf2ea12f986c7609d)
- [Maintainer region evidence](https://github.com/araneeskhan)
- Commit: `4c83d65602356694662006baf2ea12f986c7609d`
