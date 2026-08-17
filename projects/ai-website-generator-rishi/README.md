# AI Website Generator by Rishikesh Ugale

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project separates generation from persistence: Puter.js creates a three-layer site in the browser and a FastAPI service stores the resulting bundle as a recoverable MongoDB project. A built-in fallback means the visible artifact is not always model-authored.

## Generation has an explicit fallback boundary

[`aiService.js`](https://github.com/rishieeee/ai-website-generator/blob/6e585749deed9d2e67332ec0bea0f40643d5e45f/frontend/src/services/aiService.js) calls Puter AI for strict JSON containing HTML, CSS and JavaScript and uses multiple parsing strategies. Missing Puter support, parse failure or request failure returns a fixed fallback bundle; the implementation makes this substitution visible in source rather than falsely treating every result as a successful model response.

## Saved projects own recovery

[`Home.jsx`](https://github.com/rishieeee/ai-website-generator/blob/6e585749deed9d2e67332ec0bea0f40643d5e45f/frontend/src/pages/Home.jsx) saves each resulting bundle and reloads prior projects through the API. [`endpoints.py`](https://github.com/rishieeee/ai-website-generator/blob/6e585749deed9d2e67332ec0bea0f40643d5e45f/backend/app/api/endpoints.py) provides MongoDB create, list, get and delete operations. This is project persistence without an immutable revision chain.

## Projection and delivery consume the bundle

[`PreviewFrame.jsx`](https://github.com/rishieeee/ai-website-generator/blob/6e585749deed9d2e67332ec0bea0f40643d5e45f/frontend/src/components/PreviewFrame.jsx) writes the current three source layers into an iframe document. [`zipper.js`](https://github.com/rishieeee/ai-website-generator/blob/6e585749deed9d2e67332ec0bea0f40643d5e45f/frontend/src/utils/zipper.js) creates a downloadable project ZIP from the same values.

## Evidence

- [Canonical repository](https://github.com/rishieeee/ai-website-generator)
- [Inspected tree](https://github.com/rishieeee/ai-website-generator/tree/6e585749deed9d2e67332ec0bea0f40643d5e45f)
- Commit: `6e585749deed9d2e67332ec0bea0f40643d5e45f`
