# CraftFlow

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

CraftFlow is a compact Node/HTML AI website-builder prototype. Its implemented core is prompt-to-HTML generation, project records and publication; several visible “professional editor” controls are demonstration UI and must not be confused with corresponding state machinery.

## HTML is the only shared artifact

[`server.js`](https://github.com/akameredon/Craftflow/blob/ea4c3bea7ca6504fa2390e2e5799b74a2670c6d4/server.js) implements authentication, project CRUD, Claude generation and published-site routes using Node built-ins. The frontend stores returned HTML on the current project and sends that same string through save or publish APIs.

```text
brief -> Claude or local template -> HTML project field
-> preview -> save in server memory -> published route
```

The large [`index.html`](https://github.com/akameredon/Craftflow/blob/ea4c3bea7ca6504fa2390e2e5799b74a2670c6d4/index.html) displays contenteditable elements, drag components, undo/redo, code panes and AI actions. At the pinned commit, several of those actions only show toasts or manipulate a static demonstration canvas; they do not update a general graph or history model. Server storage is in memory, so restart recovery is absent. This record therefore describes a real but early HTML generation/publish loop, not a mature visual editor.

`package.json` declares ISC, but no license file was present. No reliable maintainer-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/akameredon/Craftflow/tree/ea4c3bea7ca6504fa2390e2e5799b74a2670c6d4)
- [README maturity claims](https://github.com/akameredon/Craftflow/blob/ea4c3bea7ca6504fa2390e2e5799b74a2670c6d4/README.md)
