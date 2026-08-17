# BloxAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BloxAI combines a persisted Excalidraw workspace with AI visual explanation. Source inspection changes the headline: the implemented model reads a board image and explains it; it does not currently generate the board.

## Native board ownership

At commit [`8d46ee09`](https://github.com/subhadeeproy3902/BloxAI/tree/8d46ee0968823e3fd6c89cd69c744fc96f7d61b3), the canvas stores Excalidraw content as file state through Convex. Ordinary shape editing and collaboration belong to that native graph.

## Gemini is an interpretation layer

The AI modal captures current visual context and asks Gemini for an explanation. A Mermaid-to-Excalidraw route is visible in source history but its initiating control is commented out. The census therefore records variant review and visual understanding without claiming delegated diagram creation.

## Why the narrow claim still qualifies

AI participates directly in the visual artifact loop by reading a saved design and returning contextual analysis inside the same workspace. The product differs from a passive renderer even though its current mutation edge remains human-only.

## Evidence

- [Pinned repository](https://github.com/subhadeeproy3902/BloxAI/tree/8d46ee0968823e3fd6c89cd69c744fc96f7d61b3)
- [Canvas implementation](https://github.com/subhadeeproy3902/BloxAI/blob/8d46ee0968823e3fd6c89cd69c744fc96f7d61b3/src/app/workspace/_components/Canvas.tsx)
- [AI modal](https://github.com/subhadeeproy3902/BloxAI/blob/8d46ee0968823e3fd6c89cd69c744fc96f7d61b3/src/components/shared/AiModal.tsx)
- [Gemini configuration](https://github.com/subhadeeproy3902/BloxAI/blob/8d46ee0968823e3fd6c89cd69c744fc96f7d61b3/src/config/gemini.ts)
- [Persisted file functions](https://github.com/subhadeeproy3902/BloxAI/blob/8d46ee0968823e3fd6c89cd69c744fc96f7d61b3/convex/files.tsx)
