# Reframe

> Research status: **Source-level** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Ilya Makarov / contributors |
| Category | HTML-to-INode design compiler, DOM canvas and agent interface |
| Status | Public v0.1.0 source snapshot; latest commit at the pinned revision is 2026-05-01 |
| Source availability | AGPL-3.0-or-later with a commercial-license option; attributed portions retain MIT or Apache-2.0 terms |
| Canonical source repository | https://github.com/ilya-makarov-dev/Reframe |
| Pinned source revision | `c77abc6f09d786345464ead53892199a79103a56` |
| Runtime floor | TypeScript monorepo on Node.js ≥18 |

## Product loop: compile, measure, refine, deliver

Reframe is not a prompt-to-image surface. Its ordinary design loop is:

`brief / DESIGN.md + HTML, blueprint or structured content → INode SceneGraph → Yoga layout → audit and optional auto-fix → live DOM canvas → agent or direct edits → .reframe project → export`

The main human surface is the Platform UI served by the MCP sidecar. A user can watch generated HTML become an editable canvas, select graph-backed elements, drag or resize them, edit text inline, change properties, ask the embedded agent for another pass and export the result. Variants, samplers, flows and overlays extend the same scene model into multi-artboard or stateful compositions.

There are four public control routes, but they do not expose identical contracts:

- an external MCP client calls the seven Reframe tools over stdio;
- the embedded chat launches the user's local Claude Code CLI and attaches the same MCP server;
- the Platform UI mutates the live graph through sidecar HTTP endpoints;
- the `reframe` CLI operates a separate build/config and legacy scene-file command surface.

The repository README's direct-CLI quick start is currently not executable as written. It documents `reframe compile`, `reframe audit` and a generic `reframe export`; the pinned CLI switch implements none of those commands. Its current primary commands are `init`, `build` and `test`, with legacy `adapt`, `inspect`, `figma`, SVG import and format-specific HTML/SVG/raster exports. The MCP path is therefore the best-supported implementation of the README's create → inspect → edit → export loop at this revision.

## The live graph is singular; the durable project is layered

Reframe's in-process mutation authority is `SceneGraph`, a map of `SceneNode` values with one root, image data, variables, modes, timeline, annotations and canvas metadata. A `SceneNode` carries stable identity and tree links alongside geometry, fills/strokes/effects, layout and grid fields, text and vector data, semantic roles, states, responsive rules, components, variables and source provenance.

The durable artifact is not one equivalent file. A `.reframe` project separates several kinds of truth:

| Layer | Durable location | Authority and limit |
|---|---|---|
| Project registry | `.reframe/project.json` | authoritative manifest for scenes, revisions, dimensions, source paths and brand registry |
| Materialized design | `.reframe/scenes/<slug>.scene.json` | current `SceneJSON` v2 graph snapshot; fastest restart/reopen path |
| Rebuild base | `.reframe/src/<slug>.html` | authored HTML for HTML/file compiles; blueprint/content compiles do not automatically gain an equivalent editable source file |
| Edit overlay | `.reframe/history/<slug>.ops.jsonl` | append-oriented replay/undo records for the supported operation subset, not a complete mutation journal |
| Design context and compositions | `.reframe/brands/`, `components/`, `variants/`, `flows/`, `samplers/`, `overlays/` and related stores | independent sidecars referenced by project/scene identity |
| Compatibility mirror | `.reframe/project.scene.json` | best-effort project-graph dual-write; source explicitly keeps `project.json` authoritative |

`SceneJSON` v2 stores a root INode tree and optional timeline, image table and annotations. IDs survive serialization. Component instances are collapsed to placeholders before a scene snapshot and hydrated from component masters again in memory, so a snapshot can depend on another project file even though it is valid JSON by itself.

This creates two materially different artifact profiles:

- an HTML-origin scene can in principle be reconstructed as **source HTML + replay overlay**, with the scene JSON acting as its current materialization;
- a blueprint/content-origin scene is primarily **a materialized graph snapshot plus sidecars**, because no equivalent authored HTML base is persisted by that path.

The implementation sometimes describes the graph as the one source of truth. That is accurate for a running session, but not sufficient to explain recovery or recompilation. On disk, manifest, snapshot, optional source and partial operation history have different authorities.

One current metadata field demonstrates that boundary. `reframe_compile` attaches a resolved canvas preset to `graph.canvas` and comments that SceneJSON will persist it, but the pinned serializer has no `canvas` envelope field. A direct serialize/deserialize probe produced only `version` and `root`; the preset was absent both from JSON and the reloaded graph. The existing canvas-preset test checks the live stored graph, not restart recovery.

## Structural hashes make imported nodes addressable, not source-mapped

The HTML importer can assign deterministic IDs. Reframe's MCP compile path always enables this mode:

1. build a structural DOM path for the imported element;
2. choose each sibling key from `data-reframe-key`, HTML `id`, first non-internal class token, then anonymous per-tag position;
3. disambiguate duplicate keys with an order-sensitive suffix;
4. hash the path with 32-bit FNV-1a and emit `h:<8 hex chars>`;
5. retain `sourceTag`, class, source id, structural `sourcePath` and source data in `NodeMeta`.

This is stronger than a counter ID and deliberately protects later siblings when a newly inserted element has its own stable key. It is still structural identity, not a file/line source map.

The known identity breaks are concrete:

- inserting or reordering anonymous same-tag siblings changes their positional paths and can make an old edit land on a different semantic element;
- reordering siblings that share the same class/id-derived key changes duplicate suffixes;
- synthetic document/import wrappers can retain counter-style IDs even when imported descendants use `h:` IDs;
- `NodeMeta.sourcePath` identifies an importer path, not the exact source file, line, column or component that authored the DOM;
- the history recorder deliberately skips non-`h:` targets, so an edit may persist in the current snapshot but never become reconstructable history.

A runtime probe illustrates the first break. Adding a new anonymous `<section>` before `A` and `B` preserved the path-hash assigned to position zero, so the new `X` inherited `A`'s former ID, `A` inherited `B`'s former ID and `B` received a new one. Authors who need durable replay identity must supply stable keys instead of treating the hash as content identity.

## The canvas renders an exported DOM and returns the same node ID

Reframe's April 22 architecture removed the earlier OpenPencil/CanvasKit editor bridge from the interactive runtime and replaced it with a browser-native DOM canvas. The current path is:

`SceneGraph → Yoga-resolved geometry → HTML exporter with inode anchors → sandboxed iframe srcdoc → browser layout/paint`

The HTML exporter can stamp `data-reframe-inode="<SceneNode.id>"` on every emitted element. Pointer hit testing runs `elementFromPoint` inside the iframe and walks to the nearest such anchor, optionally promoting a leaf to a meaningful parent. Selection, overlays and direct-edit requests therefore return to the exact live INode identity used by MCP and server mutations.

The renderer fetches fresh exported HTML when SSE reports a scene revision:

- if the anchored ID set and tree shape are unchanged, it patches inline styles, classes and leaf text in place;
- if nodes were added, deleted or reparented—or parsing fails—it replaces `srcdoc` and remounts;
- caret state is captured and restored around reload boundaries for inline editing;
- the iframe uses `sandbox="allow-same-origin allow-scripts allow-popups"` to isolate scene CSS while retaining host access to the rendered document.

This substantially reduces renderer divergence for **HTML preview versus HTML export**, because both consume the same exporter. It does not make SVG, React, raster, PDF, Lottie, PPTX or video use the browser's DOM result; each remains a separate downstream projection with its own fidelity boundary.

## Agents and direct manipulation share the graph, not one transaction log

The pinned MCP registrar exposes exactly seven tools:

`reframe_design · reframe_compile · reframe_edit · reframe_inspect · reframe_export · reframe_project · reframe_ui`

The first six form the design/persistence pipeline. `reframe_ui` is Playwright-based browser automation for observing and operating the Platform UI. External MCP clients can use the same graph/store as the Platform sidecar.

The embedded agent is a local process boundary, not an in-process model SDK. `/api/agent/chat` launches `claude -p`, passes prompts over stdin, streams JSON events, resumes Claude sessions, sets the project workspace as `cwd`, and terminates the child when the SSE client disconnects. Its default allowed-tool list includes read, write, edit, Bash and all seven Reframe tools. A request body may substitute another non-empty allowed-tools list.

That authority assumes a trusted local workspace and network boundary. At the pinned revision:

- the HTTP sidecar defaults to the IPv6 unspecified address `::`, which is dual-stack rather than loopback-only;
- CORS is `*`;
- the `/api/*` and `/platform/*` routers contain no authentication gate before agent chat or graph-mutating endpoints;
- `REFRAME_BIND_LOCAL=1` is the explicit loopback-only option.

Consequently, the default sidecar should not be described as an isolated multi-user service. A reachable client can address project APIs and can submit prompts to a local agent whose default tool budget includes filesystem and shell mutation.

Mutation convergence is also narrower than “all surfaces use one operation protocol”:

- `reframe_edit.operations[]` executes sequentially. Single-target failures return early; macros collect per-target partial failures and continue. There is no whole-array snapshot/rollback contract.
- Platform property edits use the shared sanitizer, mutate the graph, append a `setProps` record with previous values, replace the session graph and auto-save.
- add/delete/clone/group/ungroup/reorder and other structural UI routes persist current snapshots, but they are not all members of the replayable `Operation` union.
- the UI records `reparent` with an `as any` cast even though `reparent` is absent from that union and from the replay dispatcher.

The common authority is therefore the current `SceneGraph`; the common durable mutation history is only partial.

## Rebuild safety exists in core, but the primary MCP compile bypasses it

The core helper `compileHtmlIntoProject` implements the intended non-destructive reconstruction algorithm:

`fresh stable-ID import → read JSONL history → replay known operations with graceful missing-node failures → hydrate components → save final snapshot → refresh variants`

The project's Phase 3 tests exercise this helper successfully. Replay continues past stale operations and reports applied/failed counts instead of aborting the entire rebuild.

The primary MCP handler is a different code path. `handleCompile` writes or reads the HTML source, imports it with `stableIds: true`, classifies it, audits/auto-fixes it and calls `storeScene`; at the pinned revision it never calls `readOps` or `replayHistory`. This contradicts the `reframe_project` tool description, which promises that `reframe_edit` history replays on the next `reframe_compile`.

Even after that integration gap is closed, replay coverage would remain partial:

- the typed history union covers property/token/state/responsive/animation/component operations, not the full edit/UI catalogue;
- `reframe_edit` records property history only for stable `h:` targets;
- direct structural canvas edits can survive restart through the latest scene snapshot but disappear when a fresh source import replaces that snapshot;
- stale structural hashes degrade as missing/wrong semantic targets rather than producing a three-way merge.

The accurate persistence claim is therefore: **the latest materialized scene usually survives restart; source-based regeneration preserves only the operation subset that is both recorded and actually replayed by the chosen compile path.**

## Executable quality feedback, drifting advertised totals

Reframe treats audit as part of the editing loop rather than a report after export. Compile/edit paths can run deterministic checks, auto-fix supported issues and expose remaining problems to the next agent turn.

At the pinned revision, `buildInspectAuditRules` produces:

- 20 baseline layout, typography, visibility, contrast and fidelity rules;
- 5 semantic-role rules;
- 7 aesthetic advisory rule wrappers;
- 6 additional design-system compliance rules when a design system is present.

Runtime counts are therefore **32 without a design system and 38 with one**, not the fixed 37 advertised in README badges and several descriptions. Separately, `computeAestheticScore` calculates eight numeric metrics—alignment, whitespace, balance, harmony, hierarchy, rhythm, readability and proportion—plus a weighted overall score. The eight metrics and the audit-rule count are different quantities.

These checks establish deterministic conditions and repeatable measurements; they do not establish that an ordinary user accepts the design's taste, content, interaction or export fidelity. Auto-fix success is engineering evidence, not product acceptance.

## Ten export routes, with different delivery semantics

The current `reframe_export` schema accepts ten format values, while its own description and root README still say seven. The formats are not equally complete:

| Route | Current implementation | Boundary |
|---|---|---|
| `html` | static HTML or animated HTML when an animation config is supplied | closest to the live canvas; output remains downstream, not an editable roundtrip into source |
| `svg` | graph-to-vector projection | separate renderer from the DOM canvas |
| `png` / `pdf` | CanvasKit raster; PDF wraps raster output | requires CanvasKit; PDF is image-backed rather than native editable layout |
| `react` | single component or multi-file tree | CSS Modules/inline are implemented; Tailwind/styled-components fall back to inline with a sketch, and primitive/hook extraction options are scaffolded no-ops |
| `lottie` | timeline-backed JSON plus preview HTML | requires a valid animation config |
| `video` | Hyperframes composition HTML, optionally rendered to MP4 | actual render is an out-of-process `npx hyperframes` + Chromium/FFmpeg workflow; default returns HTML and a command, not a finished video |
| `pptx` | one PNG-backed slide per scene, with optional additional scenes | presentation container is editable, design content is raster-backed |
| `bundle` | portable single-file HTML with inlined assets and optional tweak surface | single-scene delivery path |
| `react-spa` | stateful HTML export assembled from flow steps | Flow-only in the current phase; single scenes and samplers are rejected |

The compile tool's inline `exports` option exposes only HTML, SVG, React, PNG and PDF. The broader export tool must be called for the other routes. Generated files do not carry a general reverse mapping that can merge independent export edits back into the SceneGraph or original HTML.

## Snapshot persistence is best-effort, not version control

Scene saves serialize the graph, write `scenes/<slug>.scene.json`, then update `project.json` and its best-effort mirror. Writes use synchronous direct `writeFileSync`; there is no sibling temporary file plus atomic rename in the observed save path. MCP auto-save catches and suppresses disk errors, so an in-memory mutation and SSE revision can succeed even when durable persistence did not.

Two revision counters support freshness but not historical recovery:

- a session revision increments for live graph changes and drives SSE refresh;
- the manifest scene revision increments on each `saveScene` call.

The JSONL history is an edit overlay and local undo source, not a full version graph. It tolerates malformed lines on read; ordinary append is additive, but undo rewrites the file without its last record. There are no named immutable design versions, branching semantics or project-wide transactional snapshots in the observed core.

Deletion is partially recoverable: scene JSON moves to `.reframe/trash/`, while the scene's history is cleared and base-scene variants cascade into trash. Recovery therefore cannot assume the deleted snapshot's replay history remains available.

Brand drift is detected with an eight-character FNV-1a content hash. It is a cheap change detector, not a cryptographic integrity mechanism; the type comment that still calls it a 12-character MD5 hash is another documentation drift at this revision.

## Implementation map and architectural evolution

Repository pinned at [`c77abc6f09d786345464ead53892199a79103a56`](https://github.com/ilya-makarov-dev/Reframe/commit/c77abc6f09d786345464ead53892199a79103a56).

### Current implementation map

| Concern | Pinned source | What it establishes |
|---|---|---|
| Product/version/license | [`README.md`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/README.md), [`package.json`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/package.json), [`NOTICE`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/NOTICE) | claimed product loop, package v0.1.0, Node floor, AGPL/commercial boundary and third-party attribution |
| Live artifact model | [`types.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/engine/types.ts), [`scene-graph.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/engine/scene-graph.ts) | `SceneNode`, `NodeMeta`, graph-owned images/variables/timeline/annotations/canvas and mutation API |
| Serialization/project files | [`serialize.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/serialize.ts), [`project/types.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/project/types.ts), [`project/io.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/project/io.ts) | SceneJSON v2, authoritative manifest, scene snapshots, direct writes, trash and the core compile helper |
| Stable HTML identity | [`importers/html.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/importers/html.ts) | structural-key priority, FNV path IDs and source provenance |
| Preview identity/runtime | [`exporters/html.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/exporters/html.ts), [`renderer.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/editor/src/canvas-dom/renderer.ts), [`pointer.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/editor/src/canvas-dom/pointer.ts) | `data-reframe-inode`, iframe projection, incremental patch boundary and hit-test return |
| Replay model | [`history.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/project/history.ts), [`ops/types.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/ops/types.ts), [`ops/apply.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/ops/apply.ts) | replayable operation subset, graceful stale-op handling and JSONL machinery |
| Primary MCP compile/edit | [`compile.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/tools/compile.ts), [`edit.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/tools/edit.ts), [`store.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/store.ts) | actual compile path, sequential edit semantics, session IDs/revisions and best-effort auto-save |
| Direct manipulation | [`node-edit.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/platform/api/node-edit.ts), [`selection-state.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/editor/src/canvas-dom/selection-state.ts), [`inline-text-edit.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/editor/src/canvas-dom/inline-text-edit.ts) | property/structural UI mutations, partial undo log, selection and inline editing |
| Agent surface and trust boundary | [`register-tools.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/register-tools.ts), [`api/agent.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/api/agent.ts), [`agent/spawn.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/agent/spawn.ts), [`http-server.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/http-server.ts) | seven tools, local Claude process, allowed tools, HTTP host/CORS and absence of a router auth gate |
| Audit/aesthetic feedback | [`inspect-audit-rules.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/inspect-audit-rules.ts), [`aesthetic/score.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/core/src/aesthetic/score.ts) | conditional 32/38 audit stack and separate eight-metric score |
| Export/public CLI surfaces | [`tools/export.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/mcp/src/tools/export.ts), [`cli/index.ts`](https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/packages/cli/src/index.ts) | ten MCP export values, per-format limitations and actual CLI command switch |

### Evolution that changes the current reading

| Commit | Change and significance |
|---|---|
| [`8a2f0f7`](https://github.com/ilya-makarov-dev/Reframe/commit/8a2f0f7731a40969768aeee4320e7935b2395329) · 2026-04-08 | initial public v0.1.0 import already included the SceneGraph, HTML importer, exporters, project I/O, MCP and Studio-scale surface |
| [`cd94d00`](https://github.com/ilya-makarov-dev/Reframe/commit/cd94d00c56f055899e62c3a28e1a1694e29e2b50) · 2026-04-13 | introduced stable DOM-path IDs, content-aware sibling keys, JSONL operation history and the core replay-on-recompile helper |
| [`245ff4c`](https://github.com/ilya-makarov-dev/Reframe/commit/245ff4c1a31f4e90a8b3166a446d234e44357fef) · 2026-04-15 | added the editor package and OpenPencil/CanvasKit bridge; current core types/graph retain attributed OpenPencil ancestry |
| [`68a64be`](https://github.com/ilya-makarov-dev/Reframe/commit/68a64be2402a2d2af73c516cf7fe018fc26cf842) · 2026-04-22 | removed the OpenPencil/CanvasKit interactive editor path, introduced the iframe DOM canvas and consolidated the MCP/output story around HTML-native editing |
| [`c70130e`](https://github.com/ilya-makarov-dev/Reframe/commit/c70130ea89620aed6d106dd2468d30e36db07332) · 2026-04-23 | extended INode with semantic paths, intent and gesture fields so agent-operable UI surfaces could be expressed in the graph itself |
| [`39a7df7`](https://github.com/ilya-makarov-dev/Reframe/commit/39a7df70faab654df6c686b7d671a6d44a75070d) · 2026-04-25 | added multi-mount composition rendering plus variants, flows and annotations |
| [`c77abc6`](https://github.com/ilya-makarov-dev/Reframe/commit/c77abc6f09d786345464ead53892199a79103a56) · 2026-05-01 | expanded annotations, brand/component workbenches, the skill bus and composition wizards; this is the pinned state |

The repository has no Git tags at the pinned clone. Version claims here use package metadata and immutable commits rather than treating the moving `main` branch as a release.

## Reproduction at the pinned revision

Verification ran on Windows with Node v24.16.0 and npm 11.13.0. These results establish executable contracts, not end-user acceptance:

| Check | Result |
|---|---|
| `npm ci --no-audit --no-fund` | passed; 252 packages installed from the lockfile |
| cold `npm run build` | failed because MCP test sources import `packages/editor/dist/...` before the root build script builds the editor |
| `npm run build:editor`, then `npm run build` | passed; the bundle step used `npx` to fetch an unpinned `esbuild@0.28.2`, so the documented build is not fully lockfile/offline reproducible |
| `npm run typecheck` | passed for core, MCP and CLI |
| `npm test` | failed after many engine suites passed; Platform HTTP reported 63 passed / 8 failed against old viewport/right-panel/bottom-bar and 404 expectations, then `&&` prevented later suites from running |
| semantic import parity | 55 passed / 0 failed, including deterministic IDs and serialization parity |
| Phase 3 operation/replay suite | 61 passed / 0 failed, including helper-based recompile replay and graceful stale ops |
| selection, inline-edit and UI bridge contracts | 59 + 71 + 40 passed / 0 failed; one selection suite also warned that Yoga was not initialized |
| direct audit-count probe | 32 rules without a design system; 38 with one |
| direct canvas-preset roundtrip probe | `graph.canvas` absent after SceneJSON serialization/deserialization |

The failing Platform assertions appear stale relative to the redesigned UI, but that is an inference from source and assertion names; they were not repaired or re-baselined here. No real signed-in agent session, Playwright browser journey, video render, packaged npm install or export-fidelity comparison was accepted in this review.

## Evidence boundary and remaining research gaps

This dossier establishes the public TypeScript implementation at one immutable commit. It does not infer any private hosted service or roadmap implementation.

Still unverified or explicitly unknown:

- whether a fresh ordinary user can complete the documented install → agent → canvas → export journey in a real browser without source-level workarounds;
- whether any npm-published packages exactly match the pinned repository and install a working CLI/MCP bundle;
- export fidelity across complex responsive CSS, fonts, interactions, raster/PDF, React, Lottie, PPTX and Hyperframes video;
- a production authentication, tenant-isolation or collaboration model for the default HTTP sidecar;
- a complete replay/merge strategy for structural direct edits and concurrent agent/UI changes;
- a source-level mapping from an INode selection back to exact authored HTML/JSX file and location;
- durable recovery of canvas preset metadata and any other graph side-channel omitted from SceneJSON;
- post-May-2026 lifecycle evidence beyond the pinned public repository state.

## Primary sources

- https://github.com/ilya-makarov-dev/Reframe
- https://github.com/ilya-makarov-dev/Reframe/tree/c77abc6f09d786345464ead53892199a79103a56
- https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/README.md
- https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/NOTICE
- https://github.com/ilya-makarov-dev/Reframe/blob/c77abc6f09d786345464ead53892199a79103a56/COMMERCIAL_LICENSE.md
