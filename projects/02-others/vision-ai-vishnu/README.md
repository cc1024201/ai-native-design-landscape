# VISION.AI by Vishnu Prahalathan

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

VISION.AI requests three source layers and metadata as one JSON object. The browser keeps that result as session state and uses a combined document as both its visual proof and exported artifact.

## OpenAI supplies structured source layers

[`openai.ts`](https://github.com/vishnuprahalathan/AI-website-generator/blob/6cda9565661b44da491d05ae94c86c8660a110f2/src/utils/openai.ts) prompts GPT-4o for HTML CSS JavaScript and metadata and parses the returned JSON. [`route.ts`](https://github.com/vishnuprahalathan/AI-website-generator/blob/6cda9565661b44da491d05ae94c86c8660a110f2/src/app/api/generate/route.ts) embeds those layers into a complete document; only prompts containing `demo` take a separate fixed showcase path.

## Blob projection is the delivery bridge

[`page.tsx`](https://github.com/vishnuprahalathan/AI-website-generator/blob/6cda9565661b44da491d05ae94c86c8660a110f2/src/app/page.tsx) exposes preview and individual source tabs. [`download.ts`](https://github.com/vishnuprahalathan/AI-website-generator/blob/6cda9565661b44da491d05ae94c86c8660a110f2/src/utils/download.ts) creates a Blob URL for the iframe and places the same combined page in a ZIP. The separate [`projects` page](https://github.com/vishnuprahalathan/AI-website-generator/blob/6cda9565661b44da491d05ae94c86c8660a110f2/src/app/projects/page.tsx) is backed by a hard-coded array despite its storage language; no saved project authority is established.

## Evidence

- [Canonical repository](https://github.com/vishnuprahalathan/AI-website-generator)
- [Inspected tree](https://github.com/vishnuprahalathan/AI-website-generator/tree/6cda9565661b44da491d05ae94c86c8660a110f2)
- Commit: `6cda9565661b44da491d05ae94c86c8660a110f2`
