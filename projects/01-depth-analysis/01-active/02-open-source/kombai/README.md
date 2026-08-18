# Kombai

Kombai answers "what is design" by refusing to grant any single surface authority. It coordinates three mutable ledgers with different clocks — a `.canvas` HTML design file, the application's real repository source, and the live DOM in Kombai Browser — and treats the transfers between them as the unit of work. No bidirectionally synchronized document exists; the product is organized around authority transfers.

## Three surfaces, asymmetric paths

A design is created as HTML in the [Canvas](https://docs.kombai.com/design/canvas) and passed to the agent via **Code design / Code element** for implementation in the repository. In the opposite direction, the [browser](https://kombai.com/guide/how-to-use-kombai-browser-to-refine-and-debug-frontends/) lets a person mutate the running page, but that DOM change becomes source only after it is sent to the agent and materialized as a file edit plus a fresh HMR render. Web Capture turns a live page into a *new* Canvas design rather than a synchronized mirror. Each direction changes a different ledger and needs its own acceptance evidence — a correct design survives as a saved Canvas; a correct application change survives as reviewed source.

## Design System and Context Graphs stay separate clocks

The `.ds` file is Markdown with YAML frontmatter (tokens in the header, prose guidance in the body); applying it to a design *regenerates* rather than maintains a live token binding. [Context Graphs](https://docs.kombai.com/context/context-graphs) index reusable components through discovery and semantic-analysis subagents, but require a rebuild to reflect current source — they improve reuse without becoming the artifact. The shipped [2.0.81 distribution](https://open-vsx.org/api/kombai/kombai/2.0.81/file/kombai.kombai-2.0.81.vsix) exposes declarative manifests and schemas, but the generation, graph, browser-to-source and save algorithms remain closed: the public evidence establishes the federation, not its internals.

Kombai's evolution tells the same story in reverse: it first made repository writes the center, then added the browser return path, then repository indexing, then a native HTML design file. Design here is not one object but a handoff contract among Canvas, Design System, repository and runtime.
