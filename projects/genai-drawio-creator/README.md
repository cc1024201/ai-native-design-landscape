# GenAI DrawIO Creator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GenAI DrawIO Creator is a conversational control surface over draw.io. Users can create, modify, and enhance a diagram while retaining draw.io XML and the embedded editor as the correction environment.

## Conversation targets current document state

The application supplies diagram context to the model and interprets the response as draw.io mutations. Subsequent prompts can revise the same document instead of starting a new image. Direct canvas editing remains available when natural language is slower or ambiguous.

## An MCP edge broadens the controller

The preview MCP server allows an external compatible agent to participate in the same diagram workflow. Multi-provider support changes which model executes a request, while the draw.io relay and document format define the architecture.

## The XML boundary remains visible

Export and persistence preserve a normal draw.io artifact. Generated XML must still be rendered and inspected; schema validity cannot establish that an architecture, process, or label is correct. The repository does not make deployment a consequence of diagram generation.

## Pinned evidence

- Repository: [tuoxie2046/GenAI-DrawIO-Creator](https://github.com/tuoxie2046/GenAI-DrawIO-Creator)
- Inspected Next.js source: [`4b67b17a3dc5cd93d6f6ec69f4e5405cc460bf39`](https://github.com/tuoxie2046/GenAI-DrawIO-Creator/tree/4b67b17a3dc5cd93d6f6ec69f4e5405cc460bf39)
- Immutable revision: [commit `4b67b17`](https://github.com/tuoxie2046/GenAI-DrawIO-Creator/commit/4b67b17a3dc5cd93d6f6ec69f4e5405cc460bf39)
