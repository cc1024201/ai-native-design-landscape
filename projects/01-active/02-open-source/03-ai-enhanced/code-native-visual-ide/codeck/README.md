# Codeck

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Codeck is a native macOS Markdown presentation editor built for teaching and live Codex workflows. A `.mdeck` file remains readable source while the app supplies structured slides, live preview, presentation mode and embedded agent sessions.

## Markdown authority is available to both human and agent

[`CodeckDeckFileStore.swift`](https://github.com/lkuczborski/Codeck/blob/fd9fdf5e5cc3c728a9242099ee9a48b807064166/Sources/CodeckCore/CodeckDeckFileStore.swift) parses and persists the deck document, including YAML front matter and slide Markdown. The native editor and preview mutate and render that same source.

The Codex integration is not a pasted chat transcript. `CodexBlock` elements live inside the deck model, and the app-server runner streams a real session into the presentation. [`CodeckMCPServer.swift`](https://github.com/lkuczborski/Codeck/blob/fd9fdf5e5cc3c728a9242099ee9a48b807064166/Sources/CodeckMCP/CodeckMCPServer.swift) also exposes guarded deck reads and mutations to external agents, with path-access checks and structured mutation responses.

No reliable first-party region evidence was found.

## Evidence

- [Pinned repository](https://github.com/lkuczborski/Codeck/tree/fd9fdf5e5cc3c728a9242099ee9a48b807064166)
- [Presentation deck model](https://github.com/lkuczborski/Codeck/blob/fd9fdf5e5cc3c728a9242099ee9a48b807064166/Sources/CodeckCore/Models/PresentationDeck.swift)
- [Deck assistant panel](https://github.com/lkuczborski/Codeck/blob/fd9fdf5e5cc3c728a9242099ee9a48b807064166/Sources/Codeck/Views/DeckAssistantPanelView.swift)
