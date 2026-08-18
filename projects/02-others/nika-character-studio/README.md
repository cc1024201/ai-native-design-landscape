# Nika Character Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Nika Character Studio defines Design as the coupled construction of a structured character card and its rendered front end. It is not counted for role-play chat alone: the qualifying loop is generation, comparison, patching, preview and export of a character-facing visual artifact.

## One character has two joined representations

The durable semantic side is a structured character card compatible with common V2/V3 JSON and PNG conventions. The visual side is HTML/CSS embedded in the card's front-end fields. The application's [`agent module`](https://github.com/HiUnikitty/Nika-Character-Studio/blob/259674f21010aa7c874e1bf2fc30a4337b969093/js/agent.js) builds model context from the current card rather than treating the conversation as an unrelated prompt.

This is a useful artifact boundary: identity, descriptions and metadata remain machine-editable fields, while the front end is executable presentation attached to that same character.

## Generation is an explicit variant-and-selection loop

The studio can request 3, 5 or 8 front-end directions from DeepSeek, Gemini or OpenAI-compatible endpoints. [`part3.js`](https://github.com/HiUnikitty/Nika-Character-Studio/blob/259674f21010aa7c874e1bf2fc30a4337b969093/js/part3.js) holds the generation controls, candidate preview and injection path. A user previews HTML in a sandboxed frame and deliberately chooses which direction is inserted; alternatives are therefore candidates, not overwritten chat turns.

## Agent patches are reviewable mutations

The agent supports a peek operation and constrained `json:patch` proposals. Before applying a patch, the studio creates a snapshot; the user can accept or reject the proposed mutation. The source also contains real provider calls rather than a simulated assistant.

For front-end work, generated HTML is previewed inside the application's [`iframe surface`](https://github.com/HiUnikitty/Nika-Character-Studio/blob/259674f21010aa7c874e1bf2fc30a4337b969093/index.html). Direct form editing, selected AI patches and generated visual directions all return to the card that the user can save.

## Local persistence and delivery

Character records are retained in IndexedDB. JSON and character-card PNG are delivery formats, and the selected HTML/CSS travels with the character metadata. The pinned implementation is deliberately client-side: it does not establish collaborative merge semantics, remote project history or a generalized layout engine. Its Design object is specifically a character card plus its interactive presentation.

## Evidence

- [Pinned repository](https://github.com/HiUnikitty/Nika-Character-Studio/tree/259674f21010aa7c874e1bf2fc30a4337b969093)
- [Project README and supported providers](https://github.com/HiUnikitty/Nika-Character-Studio/blob/259674f21010aa7c874e1bf2fc30a4337b969093/README.md)
