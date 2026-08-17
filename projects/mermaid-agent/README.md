# Mermaid Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Mermaid Agent is best understood as a syntax-aware repair loop. A model does not merely return Mermaid text once; tool calls validate the result and feed failures back into another controlled attempt.

## Tool use is the controller

The source supports several model routes—including OpenAI, Gemini, Cloudflare, and local/open-compatible models—but provider choice is secondary. The decisive behavior is that the agent can call Mermaid validation/rendering tools, observe an error, and revise the source until it reaches an acceptable state.

## Review precedes application

Generated or repaired Mermaid is shown to the user before it replaces the working diagram. This preserves a human boundary between “the agent found valid syntax” and “this is the design I intended.” The resulting Mermaid source remains editable outside the application.

## What validation cannot prove

A validator can catch parse and rendering failures. It cannot confirm that an architecture is secure, that a sequence is complete, or that labels describe the real system. Mermaid Agent therefore demonstrates runtime correction, not autonomous design correctness.

## Pinned evidence

- Repository: [devhims/mermaid-agent](https://github.com/devhims/mermaid-agent)
- Inspected agent loop: [`7e5a110492a763a772cb587230d4147a3e778b34`](https://github.com/devhims/mermaid-agent/tree/7e5a110492a763a772cb587230d4147a3e778b34)
- Immutable revision: [commit `7e5a110`](https://github.com/devhims/mermaid-agent/commit/7e5a110492a763a772cb587230d4147a3e778b34)
