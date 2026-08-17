# PromptCraft AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PromptCraft combines prompt-to-site and screenshot-to-site creation with an unusually explicit distinction between provider output and deterministic demo output. Its Mongo project is also a bounded version repository rather than only a latest-code record.

## Fallback provenance stays attached to the artifact

[`aiGenerationService.js`](https://github.com/krishkapuriya04/promptcraft-ai/blob/0106f9a842bc1e794cab0051e605bdca0ae9f918/backend/src/services/aiGenerationService.js) uses the OpenAI Responses API when configured and otherwise creates a demo artifact; authentication-like provider failures also fall back. The normalized result carries `demoMode`. [`screenshotGenerationService.js`](https://github.com/krishkapuriya04/promptcraft-ai/blob/0106f9a842bc1e794cab0051e605bdca0ae9f918/backend/src/services/screenshotGenerationService.js) preserves the same distinction for vision input.

## Checkpoints are complete restorable source snapshots

[`Project.js`](https://github.com/krishkapuriya04/promptcraft-ai/blob/0106f9a842bc1e794cab0051e605bdca0ae9f918/backend/src/models/Project.js) stores current code, optimization before/after pairs and up to eighty source versions. [`versionController.js`](https://github.com/krishkapuriya04/promptcraft-ai/blob/0106f9a842bc1e794cab0051e605bdca0ae9f918/backend/src/controllers/versionController.js) creates named checkpoints, compares snapshots and restores a selected snapshot while appending a new restore checkpoint instead of erasing history.

## Preview and delivery expose their limits

The browser projects current source in an iframe beside its editor and ZIP export can materialize HTML or React files. [`deploymentService.js`](https://github.com/krishkapuriya04/promptcraft-ai/blob/0106f9a842bc1e794cab0051e605bdca0ae9f918/backend/src/services/deploymentService.js) persists a timed lifecycle and URL under a provider explicitly named `mock`; the dossier therefore records deployment-state prototyping but not external hosting.

## Evidence

- [Canonical repository](https://github.com/krishkapuriya04/promptcraft-ai)
- [Inspected tree](https://github.com/krishkapuriya04/promptcraft-ai/tree/0106f9a842bc1e794cab0051e605bdca0ae9f918)
- Commit: `0106f9a842bc1e794cab0051e605bdca0ae9f918`
