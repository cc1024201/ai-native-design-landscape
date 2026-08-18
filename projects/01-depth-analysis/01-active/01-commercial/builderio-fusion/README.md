# Builder.io Fusion

Fusion answers "what is design" with a strict separation: the canvas is **not** the durable design document. Design is a live projection of an application checkout, and its useful result is code that can enter the team's existing Git and PR workflow. It is a visual IDE and agent control plane over a running repository branch, not a Figma-style node graph that eventually exports code.

## The decisive mechanism: plural editors, one branch workspace

Design, Interact, Code and the two agent modes are not equivalent editors; each has a documented write boundary that converges on the branch filesystem. Design stages visual operations that only **Apply Visual Changes** materializes into source; Fast implements immediately; Plan changes files only after **Implement Plan**; Code writes source directly; Interact mutates nothing. [The editing-mode contract](https://www.builder.io/c/docs/projects-editing-modes/) makes these boundaries unusually explicit — the acknowledged weakness is that the visual-to-source patch planner itself is closed.

## It operates on the real application runtime

The MIT `@builder.io/dev-tools` distribution shows one public execution path: the launch proxy proxies HTTP/WebSocket to the configured app server and injects an evaluation/error bridge, proving Fusion is coupled to an executable page, not a screenshot. The source-visible push/pull paths prove the Builder container, the Builder branch metadata, the provider branch and the local checkout are separate state holders reconciled purely through Git commits. History is a destructive hosted rewind of Project state, explicitly **not** a `git revert` of remote Git or Publish.

## Design-system intelligence is context, not identity

Indexing compiles components into MDX documentation uploaded to Builder, and Builder itself calls automated mapping "typically 70%." The Figma integration is a clipboard conversion round trip, not a live shared graph. Fusion therefore grounds generation with a design-system projection while keeping the mutation authority on code under Git review — a sharper authority order than most full-stack builders. [Evidence: fusion product surface](https://www.builder.io/fusion/) · [dev-tools @ 1.79.0](https://registry.npmjs.org/@builder.io%2Fdev-tools/1.79.0)
