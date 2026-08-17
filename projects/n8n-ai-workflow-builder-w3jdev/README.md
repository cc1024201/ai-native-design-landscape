# N8N AI Workflow Builder by W3JDev

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This small application is a natural-language-to-n8n materializer. It owns the translation and promotion step while n8n owns the resulting workflow artifact.

## Translation contract

[The create route](https://github.com/W3JDev/n8n-ai-workflow-builder/blob/fb555a9ab6a48b0f8641eda340cc972096cfe0a9/app/api/n8n/create/route.ts) asks GPT-4 for a strict n8n object containing nodes connections settings and inactive state. It parses the response as JSON and rejects non-JSON output rather than silently treating prose as a workflow.

## Promotion into n8n

The same route posts the generated object to the n8n workflows API with the user's n8n key. [The page](https://github.com/W3JDev/n8n-ai-workflow-builder/blob/fb555a9ab6a48b0f8641eda340cc972096cfe0a9/app/page.tsx) shows both the created n8n response and generated JSON for inspection.

## What it does not own

There is no local graph editor persistence revision history or correction loop beyond rewriting the prompt. Despite the README wording the source does not activate or execute the new workflow and does not fetch execution logs. Runtime authority begins only after the artifact enters n8n.

## Pinned evidence

- [Repository](https://github.com/W3JDev/n8n-ai-workflow-builder)
- [Inspected tree](https://github.com/W3JDev/n8n-ai-workflow-builder/tree/fb555a9ab6a48b0f8641eda340cc972096cfe0a9)
- [Dependency manifest](https://github.com/W3JDev/n8n-ai-workflow-builder/blob/fb555a9ab6a48b0f8641eda340cc972096cfe0a9/package.json)
