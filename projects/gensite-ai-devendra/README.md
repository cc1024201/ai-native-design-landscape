# GenSite AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GenSite AI has a deliberately simple authority model: Gemini returns one self-contained HTML document and the React client treats that exact document as both source and iframe input.

[`gemini_service.py`](https://github.com/devendrareddy2344/ai-website-generator/blob/bde66e6bf395a4fb3a714a2b4dda68dabc0ef02a/backend/gemini_service.py) constrains Gemini to complete interactive single-file output and removes unsupported CDN fragments. [`main.py`](https://github.com/devendrareddy2344/ai-website-generator/blob/bde66e6bf395a4fb3a714a2b4dda68dabc0ef02a/backend/main.py) exposes that generation endpoint.

[`App.jsx`](https://github.com/devendrareddy2344/ai-website-generator/blob/bde66e6bf395a4fb3a714a2b4dda68dabc0ef02a/frontend/gensite-react/src/App.jsx) retains the prompt exchange and source. [`PreviewPanel.jsx`](https://github.com/devendrareddy2344/ai-website-generator/blob/bde66e6bf395a4fb3a714a2b4dda68dabc0ef02a/frontend/gensite-react/src/components/PreviewPanel.jsx) projects it with `srcDoc`. No persistent project graph is committed.

## Evidence

- [Canonical repository](https://github.com/devendrareddy2344/ai-website-generator)
- [Inspected tree](https://github.com/devendrareddy2344/ai-website-generator/tree/bde66e6bf395a4fb3a714a2b4dda68dabc0ef02a)
- Commit: `bde66e6bf395a4fb3a714a2b4dda68dabc0ef02a`
