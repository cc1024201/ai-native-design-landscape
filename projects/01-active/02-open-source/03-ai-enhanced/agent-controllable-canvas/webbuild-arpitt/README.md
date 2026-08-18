# WebBuild by Arpit Tiwari

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WebBuild does not make generated HTML its primary artifact. Gemini produces a structured page made of sections and props; a drag canvas and inspector mutate that graph; rendering composes the graph back into the site preview.

## Section JSON is the design authority

[`server.ts`](https://github.com/arpitt576-coder/WebBuild/blob/1540d39cc2eaa20d840303943050682d9cf39940/server.ts) asks Gemini for structured site and section data. [`src/store/useStore.ts`](https://github.com/arpitt576-coder/WebBuild/blob/1540d39cc2eaa20d840303943050682d9cf39940/src/store/useStore.ts) holds that graph and the user's editor state in Zustand.

[`EditorCanvas.tsx`](https://github.com/arpitt576-coder/WebBuild/blob/1540d39cc2eaa20d840303943050682d9cf39940/src/components/Screen5Editor/EditorCanvas.tsx) enables reordering while [`RightSidebarInspector.tsx`](https://github.com/arpitt576-coder/WebBuild/blob/1540d39cc2eaa20d840303943050682d9cf39940/src/components/Screen5Editor/RightSidebarInspector.tsx) changes selected properties. [`AskAIPanel.tsx`](https://github.com/arpitt576-coder/WebBuild/blob/1540d39cc2eaa20d840303943050682d9cf39940/src/components/Screen5Editor/AskAIPanel.tsx) can reprompt a section rather than replacing an unrelated page.

## Publication is a simulated boundary

[`Screen6PublishModal.tsx`](https://github.com/arpitt576-coder/WebBuild/blob/1540d39cc2eaa20d840303943050682d9cf39940/src/components/Screen6PublishModal.tsx) presents a URL and completion state in the client but does not call a hosting backend. The inspected source also lacks durable project or version storage. The real product loop ends at an editable browser-memory graph and preview.

## Evidence

- [Canonical repository](https://github.com/arpitt576-coder/WebBuild)
- [Inspected tree](https://github.com/arpitt576-coder/WebBuild/tree/1540d39cc2eaa20d840303943050682d9cf39940)
- Commit: `1540d39cc2eaa20d840303943050682d9cf39940`

No reliable geographic evidence was found; team region remains `unknown`.
