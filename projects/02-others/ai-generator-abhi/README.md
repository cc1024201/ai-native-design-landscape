# AI Generator by Abhi Gandhi

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This product is a local-model code workspace rather than a single HTML prompt box. It can ask Ollama for website, React or MERN file graphs and keeps the resulting generation records in MongoDB.

## Local inference owns multiple artifact forms

[aiService.js](https://github.com/AbhiGandhi-A/ai-generator/blob/d7729ae461998d7ad7c6e1e75a58523ff7b78ed3/services/aiService.js) calls the local Ollama endpoint and parses requested project variants into files. Provider availability is therefore a host prerequisite rather than a cloud credential concern.

## A generation record is the durable unit

[Generation.js](https://github.com/AbhiGandhi-A/ai-generator/blob/d7729ae461998d7ad7c6e1e75a58523ff7b78ed3/models/Generation.js) stores prompts, generated content, type and ownership. History opens those records as distinct generations; the model is not presented as an append-only version graph inside a single artifact.

## Inspection and delivery branch from stored files

[LivePreview.jsx](https://github.com/AbhiGandhi-A/ai-generator/blob/d7729ae461998d7ad7c6e1e75a58523ff7b78ed3/client/src/components/LivePreview.jsx) projects supported web output while the editor exposes source. [download.js](https://github.com/AbhiGandhi-A/ai-generator/blob/d7729ae461998d7ad7c6e1e75a58523ff7b78ed3/routes/download.js) packages the selected generation rather than regenerating on delivery.

## Evidence

- [Canonical repository](https://github.com/AbhiGandhi-A/ai-generator)
- [Inspected tree](https://github.com/AbhiGandhi-A/ai-generator/tree/d7729ae461998d7ad7c6e1e75a58523ff7b78ed3)
- Commit: d7729ae461998d7ad7c6e1e75a58523ff7b78ed3
