# webAi.new

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

webAi.new hands Gemini a multi-file protocol and makes a generated filesystem executable. The running Vite service is visual evidence of those files; it is not a separate saved design representation.

## Tagged output becomes a workspace

[`server.js`](https://github.com/Zeeshan1903/webAi.new/blob/6e67e2e0909fcc1a3c044503e2ef28d515fdff58/backend/server.js) asks Gemini for tagged files, parses each path and content and materializes them under one generated-site directory. It then installs dependencies and launches Vite against the same directory. A fixed todo project is used only as an explicit provider-failure fallback, and the response reports that fallback state.

## Execution and delivery share source authority

[`App.tsx`](https://github.com/Zeeshan1903/webAi.new/blob/6e67e2e0909fcc1a3c044503e2ef28d515fdff58/frontend/src/App.tsx) waits for the preview server and embeds its URL. The download endpoint packages the generated directory directly. At the inspected commit this is a single shared workspace with an in-memory prompt cache rather than isolated persisted projects, so concurrent or reload-safe authoring is not claimed.

## Evidence

- [Canonical repository](https://github.com/Zeeshan1903/webAi.new)
- [Inspected tree](https://github.com/Zeeshan1903/webAi.new/tree/6e67e2e0909fcc1a3c044503e2ef28d515fdff58)
- Commit: `6e67e2e0909fcc1a3c044503e2ef28d515fdff58`
