# OpenAI Agent Builder

> Research status: **Architecture-level** · Lifecycle: **sunsetting** · Last reviewed: **2026-08-12**

OpenAI Agent Builder is the visual workflow canvas introduced with AgentKit for composing agents from models tools knowledge logic and guardrails. It remains part of the verified landscape because it defined a distinct product and was used by downstream projects; it must not be mistaken for a stable current direction.

## Officially described authoring loop

OpenAI's [AgentKit announcement](https://openai.com/index/introducing-agentkit/) describes drag-and-drop workflow construction preview runs inline evaluation configuration and full versioning. The [Agent Builder guide](https://platform.openai.com/docs/guides/agent-builder) documents a canvas where typed nodes and connections form an agent workflow that can be previewed and published for use with the surrounding agent platform.

Those first-party contracts establish an architecture-level record. No open source repository was identified for the builder itself so this dossier does not infer its internal storage schema compiler or runtime implementation.

## Canvas evaluation and version are one product boundary

The distinguishing definition is not simply “an SDK with a diagram.” Users could arrange workflow logic run it inspect traces attach evaluations and preserve versions before deployment. Design here means governing an executable agent configuration through a visual candidate-promotion loop.

## Announced shutdown changes the census meaning

The June 3 2026 update on the official announcement says Agent Builder and Evals are being wound down and will become unavailable on November 30 2026. OpenAI recommends Agents SDK or Workspace Agents instead. The record is therefore `sunsetting`: it contributes historical evidence about how a major team defined visual agent design but not evidence of a durable active open product.

## Evidence limits

The official pages establish product behavior and lifecycle. They do not expose commit-level implementation evidence and should not be used to claim that the canvas was open source or that its internal graph model matches any public SDK type.

## First-party evidence

- [Introducing AgentKit and June 2026 lifecycle update](https://openai.com/index/introducing-agentkit/)
- [OpenAI Agent Builder documentation](https://platform.openai.com/docs/guides/agent-builder)
- [OpenAI agent platform](https://openai.com/agent-platform/)
