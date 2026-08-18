# AI Website Generator by Tulsi Pandey

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This generator gives the model content and composition choices inside a bounded website blueprint. Deterministic Python components retain rendering authority and materialize that graph as a single deployable page.

## Gemini emits a typed blueprint

[`ai_engine.py`](https://github.com/Tulsiishere/ai-website-generator/blob/184449324ca2cf1afc1a836a50fdb56b7e0807b4/backend/ai_engine.py) supplies a response schema for website type theme sections colors and content. It first requests constrained JSON and then retries through cleaning and normalization before [`models.py`](https://github.com/Tulsiishere/ai-website-generator/blob/184449324ca2cf1afc1a836a50fdb56b7e0807b4/backend/website_generator/models.py) validates the result as `WebsiteBlueprint`.

## Compilation and persistence split the artifact

[`builder.py`](https://github.com/Tulsiishere/ai-website-generator/blob/184449324ca2cf1afc1a836a50fdb56b7e0807b4/backend/website_generator/builder.py) selects fixed hero about services gallery and contact renderers from the blueprint and combines them with generated theme CSS. [`generate.py`](https://github.com/Tulsiishere/ai-website-generator/blob/184449324ca2cf1afc1a836a50fdb56b7e0807b4/backend/routes/generate.py) saves the compiled HTML on disk for preview and download while [`database.py`](https://github.com/Tulsiishere/ai-website-generator/blob/184449324ca2cf1afc1a836a50fdb56b7e0807b4/backend/database.py) stores prompt and blueprint in MongoDB. The listing is project persistence but no revision history is implemented.

## Evidence

- [Canonical repository](https://github.com/Tulsiishere/ai-website-generator)
- [Inspected tree](https://github.com/Tulsiishere/ai-website-generator/tree/184449324ca2cf1afc1a836a50fdb56b7e0807b4)
- [Live product](https://ai-website-generator-3yh7.onrender.com)
- Commit: `184449324ca2cf1afc1a836a50fdb56b7e0807b4`
