# ogaTa.ai

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ogaTa.ai manages generated websites as user projects: model conversation, current source, shared views and deployment records are durable objects rather than one browser response.

## Conversation changes a stored project

[`langchainService.js`](https://github.com/kvineet002/Kriti2025/blob/1c24419d49bfbe896db6a369bbb73d2a32fbfba3/backend/services/langchainService.js) mediates Gemini generation. [`chat.js`](https://github.com/kvineet002/Kriti2025/blob/1c24419d49bfbe896db6a369bbb73d2a32fbfba3/backend/models/chat.js) persists the conversation and generated state used for later turns.

## Preview and publication retain different records

[`SandPackCode.js`](https://github.com/kvineet002/Kriti2025/blob/1c24419d49bfbe896db6a369bbb73d2a32fbfba3/frontend/src/pages/Home/SandPackCode.js) executes the current website source. [`deployedWebsites.js`](https://github.com/kvineet002/Kriti2025/blob/1c24419d49bfbe896db6a369bbb73d2a32fbfba3/backend/models/deployedWebsites.js) and [`deployRouter.js`](https://github.com/kvineet002/Kriti2025/blob/1c24419d49bfbe896db6a369bbb73d2a32fbfba3/backend/routes/deployRouter.js) create a distinct published representation.

## Evidence lock

- [Canonical repository](https://github.com/kvineet002/Kriti2025)
- [Inspected commit](https://github.com/kvineet002/Kriti2025/commit/1c24419d49bfbe896db6a369bbb73d2a32fbfba3)
- Commit: `1c24419d49bfbe896db6a369bbb73d2a32fbfba3`
