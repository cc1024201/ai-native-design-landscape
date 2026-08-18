# Retune

> Research status: **Source-level** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Sujan Khadgi / Retune contributors |
| Category | In-app visual manipulation overlay and coding-agent intent relay |
| Status | Active; `main`, GitHub release `v0.7.6` and npm `retune@0.7.6` align |
| Source availability | Source-available under PolyForm Shield 1.0.0; competitive use is restricted |
| Canonical product URL | https://www.retune.dev/ |
| Canonical source repository | https://github.com/khadgi-sujan/retune |
| Pinned source revision | `07e055c86267096d4df08c7c64ba90f7a4d4336f` |
| Pinned distribution | npm `retune@0.7.6`, published 2026-04-18 |

## Evidence pin: the public package and source are the same revision

This dossier traces the exact revision shipped to ordinary npm users, not a moving repository branch.

- GitHub commit [`07e055c86267096d4df08c7c64ba90f7a4d4336f`](https://github.com/khadgi-sujan/retune/commit/07e055c86267096d4df08c7c64ba90f7a4d4336f), release [`v0.7.6`](https://github.com/khadgi-sujan/retune/releases/tag/v0.7.6) and npm metadata `gitHead` all identify the same revision.
- npm records SHA-1 `75fbffbe67fa4b0af8c6614496c11429a9965a1f`, integrity `sha512-a+IzAGiDeFeSwXn0T1eKLTp7sH/9QTAhfDNP024wCK54bf1kAxOkcW7+h2f3kSVg0v/UZ9JBztIvh7lyLbgksw==` and an npm/SLSA provenance attestation for the tarball.
- The pinned commit is unsigned. The npm attestation establishes the package build/publish claim; it does not turn an unsigned Git commit into a signed one.
- A newer-looking remote development branch, `dev/v1.0`, is not used as evidence for the current product because it is not the aligned `main`/release/npm path.
- The live marketing page still displays `v0.7.5` in its demo/navigation while npm and GitHub ship `0.7.6`; this is presentation drift, not a second current package.

The repository is publicly readable but is not permissive open source. Commit `091a47e` replaced the initial MIT license with PolyForm Shield 1.0.0 on 2026-03-12.

## Product boundary: a three-authority relay, not a source editor

Retune runs inside an existing web application. A person selects rendered elements and changes styles, text, attributes, component values or structure. Those edits appear immediately in the browser, but Retune does not write the application's source files. It packages the intent for an external MCP-capable coding agent—or for clipboard transfer—and that agent performs the durable repository edit.

The decisive architecture is therefore a relay across three authorities:

1. **Runtime shadow state:** Retune mutates or overlays the current browser document so the person can judge the intended result.
2. **Intent sidecar:** a selector-keyed change tracker, comments and optional manifest describe what should be carried back to source.
3. **Application source:** the external agent edits repository files; reviewed Git state is the first durable implementation authority.

This distinction matters because a visually correct Retune preview can coexist with unchanged or incorrectly changed source. MCP retrieval is a handoff, not a commit receipt, and HMR is a new projection of source rather than proof that every ordinary user journey works.

### Authority and artifact map

| Layer | What Retune owns there | Persistence / authority |
|---|---|---|
| Current page DOM | selected nodes, direct text/attribute/structure mutations and computed layout context | temporary runtime projection; React navigation/HMR/rerender may replace it |
| Constructable preview stylesheet | selector/property/breakpoint rules with `!important` | temporary and reversible; removed by clear/detach |
| Change tracker and comments | before/after values, target context, undo/redo, structural pseudo-properties and annotations | origin-scoped browser `localStorage`; useful intent, not application source |
| `retune.manifest.json` | optional component/prop/state/token semantics | repository-side advisory metadata; durable but not bound to a source revision |
| MCP/clipboard output | serialized selection, changes and comments | transfer evidence; another system must interpret and apply it |
| Repository and Git | actual application implementation | durable source of truth after the coding agent writes and the user reviews it |
| Build/deployment | reconstructed runtime and released application | separate verification and delivery authorities outside Retune |

## The ordinary safe journey

An end-to-end journey at the pinned release is:

1. Install `retune`, render `<Retune />` in the target application and start its development server.
2. Run `npx retune setup` or configure the bundled MCP command manually, then start `npx retune` from the intended project root.
3. Press `Alt+D` / `Option+D`, select an element in the main document and choose an instance, class or broader scope.
4. Adjust values or structure while judging the immediate browser projection. Retune records exact before/after intent and optional comments.
5. Ask the agent for `retune_get_formatted_changes` with **`clear: false`**. The default `clear: true` is unsafe as a durable handoff because it clears browser intent before source application succeeds.
6. Let the external agent locate and edit the repository using its own file tools. Retune supplies context but does not constrain the write or return a mutation receipt.
7. Rebuild/HMR, exercise the affected user journey and inspect the actual diff. A matching screenshot alone is insufficient for interaction, responsiveness and source-quality acceptance.
8. Only after source and runtime verification, call `retune_clear_changes`; then commit and release through the repository's own workflow.

Clipboard output can replace MCP at step 5. It does not change the durability boundary.

## What the browser actually captures

### Activation and embedding

The public package exports a React component and a Node CLI from one TypeScript package. The component checks `process.env.NODE_ENV === "development"` or `import.meta.env.DEV`; the `force` option bypasses that guard. The overlay is desktop-only and hides below 768 pixels.

Retune mounts its own interface into a shadow root, which isolates its presentation from many target-page styles. Inspection still operates only on the host page's main `document`: the current implementation does not traverse target iframes or target shadow DOM. The package requires React 18 or newer as a peer even though its DOM inspection can describe non-React elements.

### Layered target identity

Selection produces an `InspectedElement` with a generated selector, tag and direct text, class list, a curated subset of computed styles, bounding box/layout mode, DOM path, parent/child/sibling context, accessibility hints and styling classification. React pages may add component ancestry, direct props/state and an optional file/line hint.

The identity ladder is best-effort rather than deterministic source mapping:

1. `@medv/finder` builds a unique selector rooted at `document.body`, filtering generated-looking class names; a tag/`:nth-of-type` path is the fallback.
2. Scope analysis may deliberately replace the unique instance selector with a shared semantic, utility or ancestor class so one edit targets multiple matches.
3. React ownership is recovered from private DOM properties beginning `__reactFiber$` and by walking fiber `.return` links.
4. Source location is read from private `_debugSource` / owner debug metadata when the development build happens to expose it.
5. The external coding agent combines those hints with text, classes and repository search to decide what file and construct to edit.

There is no Retune build transform, source-map consumer, AST identity, file-content hash or guarded source revision in this path. Production/minified React, HMR, framework changes and repeated component instances can remove or weaken the richer layers. A selector can also resolve to a different node after DOM drift.

React prop/state controls are runtime probes, not source editors. State writes call positional hook dispatch queues. Prop writes prefer React DevTools `overrideProps`; the fallback mutates fiber `pendingProps` and attempts a parent/state dispatch. These private structures can change across React versions and any result is transient until an agent implements it in source.

### Scope is part of the requested change

The selector is both target locator and `ChangeTracker` key. Choosing a shared class can intentionally fan one edit out to all matching elements even though inspection metadata was captured from the selected instance. Undo/redo and pending-change coalescing consequently operate by selector, not by immutable DOM node or component instance.

Readable stylesheet rules are scored to decide whether a class is utility-like, semantic or a useful scope. Cross-origin stylesheets whose CSSOM cannot be read are skipped. Despite the live product FAQ saying detection works “without hardcoded framework patterns,” pinned source contains explicit utility/semantic stems, Tailwind variants and prefixes for several framework variable families. The runtime implementation is multi-signal and partly framework-informed, not pattern-free.

The style-source resolver is also an approximation of the cascade. It walks readable CSSOM and prioritizes inline/important cases, but does not implement complete selector specificity, source order, layers, origins and every conditional rule. Token/class suggestions are context for the coding agent; exact user-entered values remain the requested intent.

## Runtime shadow artifact

### Style preview

Style changes are inserted into a constructable `CSSStyleSheet` appended to `document.adoptedStyleSheets`. Rules are keyed by selector, property and optional max-width breakpoint and use `!important` so the preview wins often enough to be useful. Clearing or detaching the preview stylesheet reverts those style projections.

Invalid selectors, invalid declarations or constructable-stylesheet limitations can cause a rule to be skipped. A successful insertion proves only that this document accepted the projection; it does not establish the right source representation, cascade or browser support.

### Text, deletion and structure

Text edit, delete, sibling reorder and reparent operations directly manipulate the current DOM or temporary inline order/translate values. Retune records them as pseudo-properties such as `__text`, `__delete`, `__reorder` and `__reparent`. A `MutationObserver` helps reapply some visual state when React reconciles, but Retune does not own the React source graph.

This makes structural preview qualitatively different from style preview:

- a deleted or moved node can diverge from the framework's virtual tree;
- rerender, navigation or HMR can overwrite it;
- broad scope can repeat a structural operation across matched nodes;
- `clearChanges` assumes the agent already changed source and intentionally does not reconstruct every original DOM mutation;
- source includes a tested JSX reorder helper, but the current MCP server never imports or invokes it—repository structure is left to the external agent.

## The intent sidecar and its persistence limits

`ChangeTracker` snapshots original/current style values and optional props, attributes, responsive values, variable associations and target context. It coalesces rapid changes, stores undo/redo groups and derives an `ElementChange[]` only when output is requested. Each derived record contains selector/context plus property, prop and attribute diffs. The record's `timestamp` is generated at retrieval time, not at the moment the user made the edit.

Browser persistence uses fixed keys:

- `retune-pending-changes` for tracked changes and undo/redo stacks;
- `retune-comments` for element/area annotations;
- additional shared keys for fidelity, theme and panel position.

These keys are scoped only by browser origin. They do not include route, repository, application, Git revision, session or user identity. Two projects reused on the same `localhost` origin can inherit each other's pending selectors; different routes in one app share the same queue. On reload Retune queries the current document and silently skips missing/invalid selectors, but a still-valid selector can now address a different element.

The sidecar therefore improves accidental reload recovery but is not version history. It has no conflict detection, append-only log, source receipt, project binding or transactional handoff to the agent.

### `retune.manifest.json`: semantic aid, not a binding

Manifest v2 can describe visually relevant component props and state, class mappings, `hidden_unless` rules, token categories and responsive strategy/breakpoints. The setup command extracts CSS custom properties, writes a partial manifest under `public/` and prompts an agent to complete component definitions. The overlay fetches `/retune.manifest.json` with `cache: "no-store"`.

This file is the only Retune-owned semantic artifact intended to live beside source, but it remains manually/agent-maintained advisory metadata. It contains no schema binding to a repository commit, source hash or build output and can drift from actual components. The MCP process discovers it relative to `process.cwd()` under `public`, `static` or `dist`; starting the CLI in the wrong directory can pair one running app with another directory's manifest status.

## MCP is a local pull bridge

The Node CLI hosts an MCP server over stdio and a WebSocket bridge for the browser. The overlay connects to `ws://localhost:<port>/ws`, default 9223. The source registers eight tools:

- `retune_get_selection`;
- `retune_get_pending_changes`;
- `retune_get_formatted_changes`;
- `retune_watch_changes`;
- `retune_clear_changes`;
- `retune_manifest_loaded`;
- `retune_get_comments`;
- `retune_status`.

Most tools are request/response pulls: the MCP server asks the connected overlay for its current selection, collapsed/enriched changes, Markdown, comments or manifest reload. Requests time out after ten seconds. The bridge holds one verified browser client, and a new one replaces the old one.

The handshake accepts a JSON claim `{ client: "retune-overlay" }` within five seconds. It has no secret and checks no WebSocket `Origin`, so it is an identification convention rather than authentication. Any locally reachable page/process able to connect can impersonate it and take the single slot. This is a local trust-boundary fact, not evidence of a remotely exploitable service by itself.

If the chosen port is occupied, the server automatically tries 9224 through 9232. The browser component is not notified of the chosen fallback and continues using its configured/default port, so fallback can leave server and overlay on different ports unless the user updates `<Retune port={...}>` or `RETUNE_WS_PORT` coherently.

The MCP protocol advertises server version `0.1.0` even though the installed package is `0.7.6`. That does not change package code, but it prevents clients from treating the protocol version string as distribution identity.

### Source-confirmed break 1: `retune_watch_changes` has no normal producer

The bridge's watch buffer is filled only by a WebSocket `pushChanges` message. The browser class defines `sendChanges()`, but the entire pinned source has no call site for that method. Normal overlay edits therefore never push into the buffer; `retune_watch_changes` waits thirty seconds and returns a timeout unless a separate/manual client emits the private message.

History explains the orphaned surface:

- `8e744c0` introduced the early Composer overlay with a send button that called the push path;
- `eb87f49` removed that send handler during the toolbar redesign;
- `904d785` later retained/merged the MCP watch buffer and tool without reconnecting a browser producer.

Polling `retune_get_pending_changes` or explicit formatted retrieval works; the advertised reactive watch contract does not at `0.7.6`.

### Source-confirmed break 2: formatted retrieval clears before application

`retune_get_formatted_changes` defaults `clear` to true. The server first obtains the Markdown, immediately sends `clearChanges` to the overlay, and only then returns content to the agent. The clear operation removes tracker/localStorage state, undo/redo, comments and style preview, deselects the element and assumes source has already been changed. Yet the agent has not received the tool result when clearing occurs.

If the agent crashes, refuses, edits the wrong location or fails verification after the tool call returns, Retune has already discarded its own recoverable intent. The MCP transcript may preserve output, but there is no app-side receipt or retry state. Commit `9a2c6cf` introduced this auto-clear default on 2026-03-08.

The bundled skill says to clear only after applying and verifying, which contradicts the tool default. The robust call is `retune_get_formatted_changes({ clear: false })`, followed by explicit `retune_clear_changes` only after source and runtime acceptance.

## Setup and reproducibility boundary

`npx retune setup` detects the presence of Claude/Cursor directories, updates user-level MCP configuration and writes the bundled Retune skill under the user's home directory. It can modify:

- `.claude/claude_desktop_config.json`;
- `.cursor/mcp.json`;
- `.claude/skills/retune-visual-changes/SKILL.md`;
- `.cursor/skills/retune-visual-changes/SKILL.md`.

The CLI also refreshes the bundled skill on startup. These are global tool-side effects rather than project-contained installation, and setup detection does not prove the discovered client or project is the one the user intended. The README's manual MCP example uses `npx -y retune`, while generated setup arguments omit `-y`; first-run prompting can therefore differ.

The pinned public repository was independently rebuilt on 2026-08-11:

1. Ordinary `npm ci` failed before tests because the development-only Central Icons package's postinstall required an unavailable `CENTRAL_LICENSE_KEY`.
2. `npm install --ignore-scripts` succeeded without inventing a license key.
3. `npm test` then passed all 21 files / 449 tests.
4. `npm run build` succeeded and emitted the distribution.

This is a contributor reproducibility break, not a runtime-package failure. The repository's own publish workflow also uses `npm install --ignore-scripts`, Node 24, build, provenance-enabled npm publish and GitHub release creation. Maintainers therefore bypass the private lifecycle dependency in the public release path even though the development README says ordinary `npm install`.

The audit install reported dependency vulnerabilities at that date, but this dossier does not equate package-manager counts with reachable Retune vulnerabilities; exploitability requires a separate dependency/use-path audit.

## Evolution: from standalone composer to runtime relay

The commit sequence materially changes how the product should be understood.

| Date | Commit | Architectural consequence |
|---|---|---|
| 2026-03-02 | [`d35af51`](https://github.com/khadgi-sujan/retune/commit/d35af51) | scaffolded a standalone Next.js 15 “Composer” application |
| 2026-03-05 | [`8e744c0`](https://github.com/khadgi-sujan/retune/commit/8e744c0) | replaced that direction with an in-app visual-devtools overlay plus MCP server |
| 2026-03-08 | [`dcd3a91`](https://github.com/khadgi-sujan/retune/commit/dcd3a91) | renamed Composer to Retune |
| 2026-03-08 | [`9a2c6cf`](https://github.com/khadgi-sujan/retune/commit/9a2c6cf) | added shorthand output and the current auto-clear behavior |
| 2026-03-09–12 | [`24c2367`](https://github.com/khadgi-sujan/retune/commit/24c2367), [`e13fd73`](https://github.com/khadgi-sujan/retune/commit/e13fd73) | evolved stylesheet analysis into multi-signal, partly vocabulary-driven class/scope scoring |
| 2026-03-12 | [`091a47e`](https://github.com/khadgi-sujan/retune/commit/091a47e) | changed MIT to PolyForm Shield 1.0.0 |
| 2026-03-18 | [`2afff22`](https://github.com/khadgi-sujan/retune/commit/2afff22) | v0.5 added variables, scope, change indicators and the agent skill |
| 2026-03-26 | [`e833c3b`](https://github.com/khadgi-sujan/retune/commit/e833c3b) | v0.6 made direct structural manipulation part of the product |
| 2026-03-29 | [`385c787`](https://github.com/khadgi-sujan/retune/commit/385c787) | added element and area comments |
| 2026-04-01 | [`cd96c08`](https://github.com/khadgi-sujan/retune/commit/cd96c08), [`16353be`](https://github.com/khadgi-sujan/retune/commit/16353be) | added private-fiber component prop/state inspection and editing |
| 2026-04-04–07 | [`34520fd`](https://github.com/khadgi-sujan/retune/commit/34520fd), [`8147c28`](https://github.com/khadgi-sujan/retune/commit/8147c28), [`8a44e0f`](https://github.com/khadgi-sujan/retune/commit/8a44e0f) | introduced component manifest, v2 semantics and breakpoint-aware preview |
| 2026-04-18 | [`07e055c`](https://github.com/khadgi-sujan/retune/commit/07e055c) | published the pinned `0.7.6` package/release |

The important lineage is not “a canvas accumulated features.” A standalone composer was abandoned almost immediately in favor of a small in-runtime instrument whose durable work is delegated to an existing coding agent and repository.

## Implementation evidence map

Repository paths below are pinned to `07e055c86267096d4df08c7c64ba90f7a4d4336f`.

| Concern | Pinned implementation | What it establishes |
|---|---|---|
| Product/package boundary | [`README.md`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/README.md), [`packages/overlay/package.json`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/package.json) | install path, component/CLI exports, compatibility and package version |
| License | [`LICENSE`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/LICENSE) | PolyForm Shield terms |
| Public model | [`types.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/types.ts) | config, inspected element, change and structural context shapes |
| Overlay lifecycle | [`Retune.tsx`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/overlay/Retune.tsx), [`mount.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/overlay/mount.ts) | activation, selection, direct edits, reload restore, bridge methods and shadow-root UI |
| Target identity | [`selector/identifier.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/selector/identifier.ts) | finder fallback, class/scope scoring, fiber traversal and optional `_debugSource` |
| Runtime style projection | [`engine/live-preview.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/engine/live-preview.ts) | constructable stylesheet, `!important` rules and clear/detach semantics |
| Change persistence | [`engine/change-tracker.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/engine/change-tracker.ts), [`engine/comment-store.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/engine/comment-store.ts) | selector-keyed undo/redo and origin-only localStorage sidecars |
| Output/token context | [`engine/output.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/engine/output.ts), [`engine/candidates.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/engine/candidates.ts), [`inspector/tokens.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/inspector/tokens.ts) | Markdown fidelity, exact/fuzzy suggestions, style sources and runtime token scan |
| Manifest semantics | [`manifest/prompts.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/manifest/prompts.ts), [playground manifest](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/playground/public/retune.manifest.json) | v2 component/token/responsive metadata, a shipped example and the agent-completion prompt |
| MCP tool surface | [`mcp/server.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/mcp/server.ts) | eight tools, auto-clear default, watch semantics and CWD manifest lookup |
| Browser/server transport | [`mcp/bridge.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/mcp/bridge.ts), [`bridge/ws-client.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/bridge/ws-client.ts) | one-client WebSocket, simple handshake, request timeouts, retry and unused push producer |
| Setup/global effects | [`mcp/setup.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/mcp/setup.ts), [`mcp/cli.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/mcp/cli.ts) | user-level client config/skill writes, partial manifest and CLI startup |
| Unconnected JSX helper | [`mcp/reorder.ts`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/packages/overlay/src/mcp/reorder.ts) | deterministic text/tag reorder helper exists and is tested but is not wired into the MCP tools |
| Release workflow | [`.github/workflows/publish.yml`](https://github.com/khadgi-sujan/retune/blob/07e055c86267096d4df08c7c64ba90f7a4d4336f/.github/workflows/publish.yml) | tag-triggered ignore-scripts install, build, provenance publish and release |

## Failure and recovery map

| Break | User-visible effect | Recovery / boundary |
|---|---|---|
| Overlay not active, mobile viewport or wrong port | MCP has no usable page client | restore desktop dev component and align browser/CLI port explicitly |
| `retune_watch_changes` used as documented | 30-second no-change timeout despite edits | poll/get pending changes or formatted output; pinned watch has no normal producer |
| Formatted output retrieved with default clear | preview, queue, undo/redo and comments disappear before the agent applies source | use `clear: false`; if already cleared, recover from agent transcript or recreate intent |
| HMR/navigation/React reconciliation | direct DOM structure/text/prop/state projection disappears or changes | reselect against the rebuilt page; only source edits survive intentionally |
| Same origin reused for another route/project | stale selectors/comments may restore into the wrong document | inspect and clear origin state before reuse; no built-in project/version partition exists |
| Selector/scope drift | one instance, many instances or a different node receives the projection | verify match count and rebuilt ordinary journey; selector is not immutable identity |
| Cross-origin/complex CSS cascade | source/token classification or winning-rule advice is incomplete | treat candidates as hints and inspect actual authored styles/build output |
| Manifest stale or CLI started in wrong CWD | component/token advice and MCP nudges describe the wrong project state | regenerate/review manifest from the intended app root; no revision guard exists |
| Agent edits wrong source or fails mid-run | browser looked correct but repository does not | retain intent, inspect diff, rebuild and verify before explicit clear |
| Plain contributor install | Central Icons postinstall rejects missing private license key | public tests/build can run with `--ignore-scripts`; upstream README does not document this prerequisite |

## Evidence boundary and open questions

Established from the pinned source and distribution:

- Retune's durable result is repository source written by an external agent, not its live preview or localStorage queue.
- DOM selector + optional React-fiber metadata is an evidence ladder, not an exact source-return protocol.
- styles and direct DOM structure use different temporary mutation mechanisms.
- the manifest is durable semantic context but has no automatic source/version binding.
- normal `retune_watch_changes` and default formatted auto-clear have concrete source-level failure paths at `0.7.6`.
- GitHub release, npm package and source commit align; public contributor installation still requires bypassing an undocumented private postinstall.

Not established publicly at this snapshot:

- whether `dev/v1.0` will replace this architecture or repair the two MCP breaks;
- a supported compatibility matrix for React private-fiber prop/state mutation across releases;
- a deterministic selector-to-file/range/AST/source-map identity or concurrency guard;
- project/route/user/version partitioning or migration semantics for local sidecar state;
- an authenticated multi-page bridge, durable handoff receipt or transactional clear-after-agent-commit protocol;
- end-to-end automated acceptance tying a Retune intent to the reviewed source diff, deployment and ordinary user journey.

## Primary sources

- [Retune product site](https://www.retune.dev/)
- [Retune source repository](https://github.com/khadgi-sujan/retune)
- [Pinned commit](https://github.com/khadgi-sujan/retune/tree/07e055c86267096d4df08c7c64ba90f7a4d4336f)
- [GitHub release v0.7.6](https://github.com/khadgi-sujan/retune/releases/tag/v0.7.6)
- [npm package metadata](https://registry.npmjs.org/retune/0.7.6)
- [npm provenance attestations](https://registry.npmjs.org/-/npm/v1/attestations/retune@0.7.6)
- [PolyForm Shield 1.0.0 official text](https://github.com/polyformproject/polyform-licenses/blob/1.0.0/PolyForm-Shield-1.0.0.md)
