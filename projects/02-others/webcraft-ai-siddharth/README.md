# WebCraft AI by Siddharth Kumar Rai

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WebCraft makes a complete HTML document the project authority for generation, conversational correction, preview and application-hosted publication. Source chronology also makes it the canonical record for a later near-copy previously counted as Dora AI by ishika-86.

## OpenRouter replaces one persisted document

[`website.controllers.js`](https://github.com/SiddharthRai22/websiteBuilder/blob/e1e91a86dd72d2bfd8f5e9b1e5323a9488742906/server/controllers/website.controllers.js) constrains model output to a message plus full HTML, creates `latestCode` after a credit check and sends that full current document back through the model for later corrections. [`website.model.js`](https://github.com/SiddharthRai22/websiteBuilder/blob/e1e91a86dd72d2bfd8f5e9b1e5323a9488742906/server/models/website.model.js) stores current source, conversation, slug and publication state without complete historical code snapshots.

## Monaco is a projection branch rather than durable authority

[`Editor.jsx`](https://github.com/SiddharthRai22/websiteBuilder/blob/e1e91a86dd72d2bfd8f5e9b1e5323a9488742906/client/src/pages/Editor.jsx) loads Mongo `latestCode`, renders it through a Blob or `srcDoc` iframe and lets Monaco change local state. No save request accompanies direct edits. Model corrections and public-slug pages continue from stored `latestCode`, so unexpressed Monaco changes can disappear.

## Lineage correction prevents double counting

Siddharth's repository began in March 2026 with a continuous sequence of implementation commits. The July [`ishika-86/ai-website-generator`](https://github.com/ishika-86/ai-website-generator/blob/17c4a9ed5be4522eecf23789a4d3c3608c04d975/backend/controllers/websiteController.js) controller preserves the same first 153 lines including the entire master prompt and follows the same generation, correction, project-list and slug-publication sequence with renamed files and different credit values. The later repository is therefore recorded as a duplicate source lineage rather than a second team product.

## Evidence

- [Canonical repository](https://github.com/SiddharthRai22/websiteBuilder)
- [Inspected canonical tree](https://github.com/SiddharthRai22/websiteBuilder/tree/e1e91a86dd72d2bfd8f5e9b1e5323a9488742906)
- [Compared duplicate tree](https://github.com/ishika-86/ai-website-generator/tree/17c4a9ed5be4522eecf23789a4d3c3608c04d975)
- Commit: `e1e91a86dd72d2bfd8f5e9b1e5323a9488742906`
