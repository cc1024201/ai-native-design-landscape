# AI App Builder SaaS by Yayasan At-Tauhid

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This implementation makes model choice and version lineage explicit application concepts. Its mock provider is a named development mode and is not conflated with Anthropic OpenAI Gemini or DeepSeek output.

## One provider interface carries distinct provenance

[provider.ts](https://github.com/YayasanAt-Tauhid/AI-App-Builder-SaaS/blob/75eeae83ee11247e8095e99b8f48dc0f7a995f46/apps/api/src/ai/provider.ts) selects a configured provider. Concrete adapters implement real external calls while [mock.ts](https://github.com/YayasanAt-Tauhid/AI-App-Builder-SaaS/blob/75eeae83ee11247e8095e99b8f48dc0f7a995f46/apps/api/src/ai/mock.ts) is used only when explicitly selected or credentials are absent.

## Versions form a parent-linked graph

[schema.ts](https://github.com/YayasanAt-Tauhid/AI-App-Builder-SaaS/blob/75eeae83ee11247e8095e99b8f48dc0f7a995f46/apps/api/src/db/schema.ts) stores projects files versions and parent-version references. [versions.ts](https://github.com/YayasanAt-Tauhid/AI-App-Builder-SaaS/blob/75eeae83ee11247e8095e99b8f48dc0f7a995f46/apps/api/src/routes/versions.ts) supports listing comparison and restoration instead of treating a numeric counter as history.

## Runtime and delivery follow selected authority

[builder.tsx](https://github.com/YayasanAt-Tauhid/AI-App-Builder-SaaS/blob/75eeae83ee11247e8095e99b8f48dc0f7a995f46/apps/web/components/builder.tsx) joins editing generation and version selection around the current project. Sandpack projects its files and [export.ts](https://github.com/YayasanAt-Tauhid/AI-App-Builder-SaaS/blob/75eeae83ee11247e8095e99b8f48dc0f7a995f46/apps/api/src/routes/export.ts) packages them.

## Evidence

- [Canonical repository](https://github.com/YayasanAt-Tauhid/AI-App-Builder-SaaS)
- [Inspected tree](https://github.com/YayasanAt-Tauhid/AI-App-Builder-SaaS/tree/75eeae83ee11247e8095e99b8f48dc0f7a995f46)
- Commit: 75eeae83ee11247e8095e99b8f48dc0f7a995f46
