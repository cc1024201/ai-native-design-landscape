# SmythOS Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SmythOS Studio is a visual environment for composing an agent from model, prompt, memory, data, API, control-flow, security, and deployment components.

## Components are executable classes

The builder's node catalog maps visual cards to concrete component classes such as LLM assistants, prompt generators, classifiers, loops, MCP clients, data sources, image generation, signing, and storage. Connections become a runtime data path rather than an illustrative diagram.

## Test and deployment reuse the same agent record

The studio can run a draft against supplied inputs, inspect intermediate values, and then publish the configured agent behind API, scheduled, or other channels. Local and hosted operation share the Smyth runtime package, so delivery does not require rewriting the visual design into another orchestration language.

## Security is configured alongside capability

Authentication, allowed domains, credentials, secrets, and signed operations appear in the agent settings. These controls do not prove safe behavior, but they expose deployment authority in the design instead of treating it as infrastructure someone will add later.

## Pinned evidence

- Repository: [SmythOS/smythos-studio](https://github.com/SmythOS/smythos-studio)
- Inspected builder classes, runtime components, test surface, agent settings, security, and deployment tree: [`3e1ea87e6718fdfdb24365b2184fbd1daa9f94f8`](https://github.com/SmythOS/smythos-studio/tree/3e1ea87e6718fdfdb24365b2184fbd1daa9f94f8)
- Immutable revision: [commit `3e1ea87`](https://github.com/SmythOS/smythos-studio/commit/3e1ea87e6718fdfdb24365b2184fbd1daa9f94f8)
