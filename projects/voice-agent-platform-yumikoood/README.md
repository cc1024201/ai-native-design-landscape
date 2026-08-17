# Voice Agent Platform by YumikoooD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This platform combines AI-assisted agent specification with a working OpenAI Realtime voice surface and external-action tools.

## Prompt-to-agent promotion

[The generation route](https://github.com/YumikoooD/VoiceAgentBuilder/blob/822777ccf75bb07b5926b231a6a65a74ec6fdaea/src/app/api/generate-agent/route.ts) asks GPT-4o for a strict agent configuration containing voice instructions and typed tools. The builder lets the user inspect and edit that result before saving.

## Local artifact authority

[useAgentStorage](https://github.com/YumikoooD/VoiceAgentBuilder/blob/822777ccf75bb07b5926b231a6a65a74ec6fdaea/src/app/builder/hooks/useAgentStorage.ts) keeps configurations in localStorage and supports JSON import and export. This is a portable agent specification but not synchronized project storage or version history.

## The specification becomes a live voice agent

[useCustomAgents](https://github.com/YumikoooD/VoiceAgentBuilder/blob/822777ccf75bb07b5926b231a6a65a74ec6fdaea/src/app/hooks/useCustomAgents.ts) converts saved definitions into RealtimeAgent instances. A server route mints an ephemeral OpenAI Realtime session and configured Gmail Calendar or webhook tools cross into real external APIs.

## Fidelity gaps

Custom handoff selections are discarded during conversion and every custom agent is placed in a one-agent set. Tools without a recognized integration or webhook return synthetic success. Google OAuth access tokens are retained client-side and custom webhook destinations pass through a proxy that requires careful deployment hardening.

## Pinned evidence

- [Repository](https://github.com/YumikoooD/VoiceAgentBuilder)
- [Inspected tree](https://github.com/YumikoooD/VoiceAgentBuilder/tree/822777ccf75bb07b5926b231a6a65a74ec6fdaea)
- [Realtime session route](https://github.com/YumikoooD/VoiceAgentBuilder/blob/822777ccf75bb07b5926b231a6a65a74ec6fdaea/src/app/api/session/route.ts)
- [Agent builder](https://github.com/YumikoooD/VoiceAgentBuilder/blob/822777ccf75bb07b5926b231a6a65a74ec6fdaea/src/app/builder/components/AgentBuilder.tsx)
