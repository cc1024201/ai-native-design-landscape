# GetUI.ai

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GetUI.ai is a minimal prompt-to-frontend loop whose artifact is one executable source string. Its value for the landscape is architectural clarity rather than feature breadth.

## Groq creates the source authority

[`groq_client.py`](https://github.com/Jayesh-019/AI-frontendGenerator/blob/7d12ef27680d21ddbd3f94af3caad0638a5482b0/utils/groq_client.py) constrains a Groq-hosted model to return HTML, CSS, and JavaScript. [`app.py`](https://github.com/Jayesh-019/AI-frontendGenerator/blob/7d12ef27680d21ddbd3f94af3caad0638a5482b0/app.py) exposes that call to the browser.

## Browser history is the persistence boundary

[`app.js`](https://github.com/Jayesh-019/AI-frontendGenerator/blob/7d12ef27680d21ddbd3f94af3caad0638a5482b0/static/js/app.js) stores generated source in `localStorage`, reopens it from chat history, and assigns exactly that source to `iframe.srcdoc`. There is no server project model, version branching, or direct editor in the pinned source.

## Pinned evidence

- [Repository](https://github.com/Jayesh-019/AI-frontendGenerator)
- [Inspected tree](https://github.com/Jayesh-019/AI-frontendGenerator/tree/7d12ef27680d21ddbd3f94af3caad0638a5482b0)
- Commit: `7d12ef27680d21ddbd3f94af3caad0638a5482b0`
