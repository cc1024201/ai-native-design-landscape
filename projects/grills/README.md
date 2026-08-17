# Grills

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Grills is a self-hosted generative UI workspace. A chat turn produces a structured set of source files which the interface displays as code and runs in an external sandbox; the implementation does not claim a native design graph beneath those files.

## Provider-backed structured generation

The pinned [completion route](https://github.com/grillsdev/grills/blob/dce96be6b12ede3a9ff5b8ea555aa16d42f859b9/src/app/api/completion/route.ts) selects OpenAI Anthropic or OpenRouter from user configuration and streams against a `codeGenerationSchema`. It can use Context7 MCP tools and persists user and assistant messages to Redis after the stream completes. This is a real provider path with saved chat history.

## A file object is the preview input

The [sandbox route](https://github.com/grillsdev/grills/blob/dce96be6b12ede3a9ff5b8ea555aa16d42f859b9/src/app/api/sandbox/route.ts) installs declared packages and writes every generated file into an E2B sandbox. [`code-renderer.tsx`](https://github.com/grillsdev/grills/blob/dce96be6b12ede3a9ff5b8ea555aa16d42f859b9/src/app/%28chat%29/components/code-renderer.tsx) sends the selected message's code object to that route and loads the returned host URL in an iframe. The preview is therefore a runtime projection of a particular generated message artifact.

## Persistence stops at conversations

[`ai-chat.ts`](https://github.com/grillsdev/grills/blob/dce96be6b12ede3a9ff5b8ea555aa16d42f859b9/src/db/schema/ai-chat.ts) records chat ownership and metadata while Redis holds message bodies. The in-browser sandbox store selects the current generated code but there is no separate durable project tree or promotion model. The repository README also calls the product early-stage, so this is counted as a generative UI workspace rather than a mature full-app lifecycle system.

## Pinned evidence

- [Repository](https://github.com/grillsdev/grills)
- [Inspected tree](https://github.com/grillsdev/grills/tree/dce96be6b12ede3a9ff5b8ea555aa16d42f859b9)
- Commit: `dce96be6b12ede3a9ff5b8ea555aa16d42f859b9`
