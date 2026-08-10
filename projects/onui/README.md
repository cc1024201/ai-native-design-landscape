# onUI

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | onLLM.dev / onUI contributors |
| Category | Visual annotation and context bridge for AI agents |
| Status | Active; v2.2.3 at pinned revision |
| Source availability | GPL-3.0 |
| Previous names / aliases | — |
| Canonical product URL | https://onllm.dev |
| Canonical source repository | https://github.com/onllm-dev/onUI |
| Pinned source revision | `d1a2d29677a412353e64b15a14300dc13b84dc3c` |

## 1. Product facts

onUI is a lightweight browser extension plus local MCP bridge for annotating arbitrary web UIs and giving structured feedback to AI agents. It does not require integration into the target application's source code.

The browser extension supports Chrome, Edge and Firefox. A user can enable it per tab, target individual elements, shift-select multiple elements, draw rectangle/ellipse regions, attach comments with intent/severity metadata, and export reports at compact/standard/detailed/forensic fidelity levels.

The local MCP service can be installed alongside the extension and automatically registered for Claude Code and Codex when their CLIs are detected.

## 2. Technical direction

onUI focuses on **visual observation/annotation**, not direct source mutation.

Its architecture deliberately keeps four concerns separate:

1. the arbitrary target webpage remains untouched by application-level integration;
2. an isolated browser-extension content UI captures element/region annotations;
3. a local native/MCP bridge persists and exposes those annotations;
4. the external AI/coding agent consumes structured reports and decides how to act on the user's code or task.

This makes onUI useful even when there is no accessible source tree or when the agent already has its own independent code/runtime tools.

## 3. Technology choices

### Repository/runtime

- **Language:** TypeScript.
- **Package manager:** pnpm 9.
- **Runtime requirement:** Node >=20 for local tooling/MCP.
- **Monorepo packages:** `core`, `extension`, `mcp-server`.

### Browser surface

- **Delivery:** browser extension for Chromium/Firefox.
- **UI isolation:** Shadow DOM is explicitly used to isolate annotation UI from target-page styles.
- **Browser architecture:** extension runtime contains background/content/popup concerns.

### Agent bridge

- **Protocol:** Model Context Protocol (`@modelcontextprotocol/sdk`).
- **Transport:** MCP stdio server.
- **Native integration:** local/native host bridge connects browser-extension state to the local MCP/data layer.
- **Cloud dependency:** none required for the core annotation/MCP workflow according to the product README.

## 4. Artifact and data model

### Primary durable artifact

onUI's durable artifact is **annotation/report state**, not the target application's code or a design document.

Annotations are stored in a local store used by the MCP server. They are associated with page URLs and can be queried across pages.

### Annotation semantics

Public MCP schemas establish first-class annotation metadata including:

- annotation ID;
- page URL;
- status: `pending`, `acknowledged`, `resolved`, `dismissed`;
- intent: `fix`, `change`, `question`, `approve`;
- severity: `blocking`, `important`, `suggestion`;
- comment text;
- update timestamp / optimistic-concurrency input (`expectedUpdatedAt`) for metadata updates.

The browser workflow also records element or drawn-region targeting information. Reports can be rendered at multiple fidelity levels rather than exposing only raw records.

### Target artifact relationship

The target web page is observational input. onUI does not claim that its annotations are themselves source edits or that the annotation store replaces the source repository.

## 5. Agent interface

The pinned MCP server exposes a concrete local tool contract.

### MCP tools

- `onui_list_pages` — list pages with annotations;
- `onui_get_annotations` — retrieve annotations for a page;
- `onui_get_report` — generate compact/standard/detailed/forensic reports;
- `onui_search_annotations` — query annotations across the local store;
- `onui_update_annotation_metadata` — update status/intent/severity/comment;
- `onui_bulk_update_annotation_metadata` — bulk metadata transition;
- `onui_delete_annotation`;
- `onui_clear_page_annotations`.

The server runs over `StdioServerTransport`, so Codex/Claude Code or another MCP client interacts with the local annotation repository as normal agent tools.

### Human/agent workflow

A typical loop is:

`user points/draws/comments in browser → local annotation store → agent reads report/annotations over MCP → agent performs its own implementation work → agent or human marks annotation status resolved/dismissed`.

This means the annotation lifecycle itself can become structured coordination state between human and agent.

## 6. Runtime and rendering

### Target runtime

onUI works against an already-running arbitrary website tab. It does not own or sandbox the target application's execution environment.

### Annotation rendering

A content-script/extension overlay renders visual markers, hover targeting, annotation dialogs and drawing geometry over the target page. Shadow DOM isolates the tool's styles from page CSS.

### Bridge runtime

The browser-side extension talks through a native/local bridge to the MCP-side process. The MCP bundle is packaged as a local Node executable/bundle; no hosted backend is required for the documented workflow.

## 7. Source mapping and targeting

onUI's targeting is intentionally **page/runtime-oriented**, not deterministic source-file mapping.

### Element targeting

The extension identifies rendered elements and can batch-select multiple targets. Exported reports include structured element/page context according to the selected output fidelity.

### Region targeting

Draw mode creates rectangle/ellipse annotations against page geometry. This is useful when the user's target is a visual region rather than one DOM element.

### Source relationship

Because onUI requires no integration into app code and can run on arbitrary websites, it cannot generally guarantee a source file/line mapping. It instead produces enough visual/runtime context for an external coding agent to resolve the source using its own repository knowledge/tools.

That limitation is architectural and deliberate, not an implementation omission.

## 8. Persistence and versioning

### Annotation persistence

The MCP server constructs a `StoreRepository` from a local store path and exposes page/annotation CRUD/search over it. Annotation state therefore survives independently of the browser UI session.

### Lifecycle/version state

Status values (`pending`, `acknowledged`, `resolved`, `dismissed`) provide a lightweight annotation lifecycle. Metadata updates can include `expectedUpdatedAt`, indicating an optimistic-concurrency guard for updates.

### Product configuration

Installation artifacts live under local onUI directories and the installer can configure MCP/native-host integration for supported browsers and coding-agent clients.

### Target code versioning

onUI does not own target-repository version history, undo or checkpoints. Those remain responsibilities of the external agent/code workflow.

## 9. Open-source implementation map

Repository pinned at `d1a2d29677a412353e64b15a14300dc13b84dc3c`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product architecture | `README.md` | browser extension + local MCP/native bridge, annotation/draw modes, no code integration, packaging |
| Monorepo | `package.json` | TypeScript/pnpm/Node boundaries and core/extension/MCP packages |
| Shared model/reporting | `packages/core/` | annotation/report shared types and formatting logic |
| Browser runtime | `packages/extension/` | background/content/popup annotation implementation |
| MCP server | `packages/mcp-server/src/mcp/server.ts` | exact agent tools and stdio transport |
| Local annotation repository | `packages/mcp-server/src/store/` | durable local store boundary |
| Native host/setup | `packages/mcp-server/src/` and setup/doctor tooling | extension ↔ local process bridge and client installation |
| MCP docs | `docs/mcp-setup.md` | supported setup/configuration paths |

## 10. Commit-level evidence

**Pinned revision:** `d1a2d29677a412353e64b15a14300dc13b84dc3c`

| Claim | Evidence at pinned revision |
|---|---|
| onUI is a browser annotation extension plus local MCP bridge with no app-code integration requirement | [`README.md`](https://github.com/onllm-dev/onUI/blob/d1a2d29677a412353e64b15a14300dc13b84dc3c/README.md) |
| Monorepo consists of core, extension and MCP packages and requires Node 20+ | [`package.json`](https://github.com/onllm-dev/onUI/blob/d1a2d29677a412353e64b15a14300dc13b84dc3c/package.json) |
| MCP runs over stdio and exposes page/report/search/update/delete/clear annotation tools | [`packages/mcp-server/src/mcp/server.ts`](https://github.com/onllm-dev/onUI/blob/d1a2d29677a412353e64b15a14300dc13b84dc3c/packages/mcp-server/src/mcp/server.ts) |
| Local MCP setup supports Codex/Claude Code registration | [`README.md`](https://github.com/onllm-dev/onUI/blob/d1a2d29677a412353e64b15a14300dc13b84dc3c/README.md), [`docs/mcp-setup.md`](https://github.com/onllm-dev/onUI/blob/d1a2d29677a412353e64b15a14300dc13b84dc3c/docs/mcp-setup.md) |

## Evidence boundary

- **Fact:** extension/MCP separation, no-code-integration requirement, local store/tool contract, annotation lifecycle and packaging are source-established.
- **Inference:** onUI is best modeled as a visual feedback/context protocol because it deliberately stops before source mutation and lets the external agent own implementation.
- **Unknown/not applicable:** deterministic DOM→source mapping and target-repository versioning are not part of onUI's claimed architecture.

## Research gaps

- Trace exact serialized annotation schema in `packages/core` and local store format.
- Trace browser target selectors and robustness across DOM mutations/SPA navigation.
- Trace native messaging protocol between extension and local host.
- Trace report-fidelity differences and what evidence is included at each level.
- Trace optimistic concurrency semantics around `expectedUpdatedAt`.

## Primary sources

- https://github.com/onllm-dev/onUI/tree/d1a2d29677a412353e64b15a14300dc13b84dc3c
- https://onllm.dev
