# Design Mode

> Research status: **Source-level** · Last reviewed: **2026-08-12**

| Field | Verified value |
|---|---|
| Identity | standalone browser extension by Sandeep Baskaran; not Cursor or v0 Design Mode |
| Runtime artifact | reversible style text DOM and comment changes over the current page |
| Agent artifact | structured selector-based change queue exposed through local or cloud MCP |
| Source authority | external repository or human implementation after handoff |
| Pinned source | [`a6a7f7ba22059df65742c5af7be9bc8037d61fb9`](https://github.com/SandeepBaskaran/design-mode/tree/a6a7f7ba22059df65742c5af7be9bc8037d61fb9) |

Design Mode turns a live website into a temporary design surface and preserves the difference between changing the page and changing its authored source.

## Runtime mutations have explicit inverse information

The change tracker records style changes text or HTML changes and DOM delete duplicate move or insert operations. Each carries an element ID selector before and after state timestamp and optional agent-work status. DOM moves retain both origin and destination; style overrides are written to one managed stylesheet using a precise `data-dm-id` selector.

```mermaid
flowchart LR
    P["Live page"] --> E["Inspect and edit"]
    E --> Q["Reversible change queue"]
    Q --> P
    Q --> M["MCP or clipboard handoff"]
    M --> A["Coding agent"]
    A --> S["Repository source"]
```

The user-facing selector remains useful to a coding agent but runtime application uses the private stamped ID to prevent one edit from bleeding into similar siblings. That ID is page-session identity not a stable source coordinate.

## Source hints do not guarantee source recovery

Element records can contain framework source locations React component hierarchies spatial context accessibility data and screenshots. When source maps or framework metadata are absent the agent receives selectors and visual evidence only. The MCP change lifecycle (`todo` → `in_progress` → `resolved`) coordinates work but does not prove the repository changed correctly.

| Pinned path | Mechanism |
|---|---|
| [`packages/shared/src/types.ts`](https://github.com/SandeepBaskaran/design-mode/blob/a6a7f7ba22059df65742c5af7be9bc8037d61fb9/packages/shared/src/types.ts) | element context and change schemas |
| [`packages/extension/src/content/change-tracker.ts`](https://github.com/SandeepBaskaran/design-mode/blob/a6a7f7ba22059df65742c5af7be9bc8037d61fb9/packages/extension/src/content/change-tracker.ts) | scoped runtime rules replay inversion persistence and handoff |
| [`packages/extension/src/content/source-detection.ts`](https://github.com/SandeepBaskaran/design-mode/blob/a6a7f7ba22059df65742c5af7be9bc8037d61fb9/packages/extension/src/content/source-detection.ts) | optional framework and source hints |
| [`packages/extension/src/sidepanel/agent-workflow.ts`](https://github.com/SandeepBaskaran/design-mode/blob/a6a7f7ba22059df65742c5af7be9bc8037d61fb9/packages/extension/src/sidepanel/agent-workflow.ts) | agent handoff control |
| [`packages/mcp-local/src/mcp-server.ts`](https://github.com/SandeepBaskaran/design-mode/blob/a6a7f7ba22059df65742c5af7be9bc8037d61fb9/packages/mcp-local/src/mcp-server.ts) | local tool protocol over the browser bridge |

## Persistence ceiling

The extension persists a session-level change set and can undo individual changes or clear the set. A reload can replay compatible changes but DOM order selectors and runtime state may have shifted. MCP resolution status is not Git history. Source persistence begins only after the external agent applies and verifies an implementation.

Team region remains unknown from first-party maintainer evidence.

## Primary evidence

- [Pinned repository](https://github.com/SandeepBaskaran/design-mode/tree/a6a7f7ba22059df65742c5af7be9bc8037d61fb9)
- [Product](https://www.designmode.app/)
- [Feature contract](https://github.com/SandeepBaskaran/design-mode/blob/a6a7f7ba22059df65742c5af7be9bc8037d61fb9/FEATURES.md)
- [License](https://github.com/SandeepBaskaran/design-mode/blob/a6a7f7ba22059df65742c5af7be9bc8037d61fb9/LICENSE)
