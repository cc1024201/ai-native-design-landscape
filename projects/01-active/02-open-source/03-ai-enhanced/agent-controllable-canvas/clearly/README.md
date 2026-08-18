# Clearly

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Verified value |
|---|---|
| Product / operator | Clearly, operated by Jinri Hong as a Virginia sole proprietorship |
| Category | Hosted agent-controllable design canvas, collaborative vector editor and spatial agent workspace |
| Current lifecycle | Active early-access product; public interfaces and pricing are changing quickly |
| Canonical design object | A cloud-hosted **Composition** containing editable scene nodes, pages, sources, comments, prototype links and restore points |
| Human surface | Browser-based infinite canvas with live multiplayer, direct vector editing, components, prototypes and export |
| Agent surfaces | Hosted Streamable-HTTP MCP, the Beehaven CLI plus local daemon, and agent rooms described for a future desktop app |
| Current live MCP snapshot | Server `clearly` version `0.2.0`; unauthenticated `tools/list` exposed 132 tool schemas on 2026-08-11, while data calls required OAuth |
| Current CLI snapshot | Public `beehaven-latest.tgz` resolves to private package `beehaven@0.7.6`; 481,428 bytes; SHA-256 `CA679C35FB29AAA7FC21F8FBB1DEDF6AA21F586A6D5800ABAD82FF2D684C6B99` |
| Public source boundary | Closed editor, renderer, collaboration service and hosted MCP implementation; public MIT Claude Code adapter at commit `67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2`; inspectable MIT compiled CLI distribution without its TypeScript repository |
| Evidence snapshot | Official product/docs/legal pages, live public MCP handshake and catalog, public installer/distribution, and pinned official plugin repository; no authenticated Composition was created or mutated |

## The shortest accurate description

Clearly is not merely an image-generation endpoint and not merely a Figma-like editor. Its distinctive product contract is a **hosted, versioned Composition that both people and agents can inhabit**:

- a person draws, comments, selects and prototypes in a live browser canvas;
- an external agent can build and inspect the same Composition without opening that browser;
- an optional local daemon can run a coding agent against either a Composition-scoped scratch directory or a locally bound Git repository;
- rendered diff cards, status blocks and human ink can coordinate code work, but do not become source-code identity;
- SVG, PDF, PNG, CSS, JSON and code changes leave through different projection paths with different authorities.

The most important architectural fact is therefore not “AI can edit vectors.” It is the split between a **durable cloud scene**, a **live browser room**, a **local agent runtime**, and an **independent Git checkout**.

## One Composition, four clocks

The public surfaces expose four authorities that can cooperate without becoming one transaction.

| Authority | What it owns | Identity | Clock / recovery |
|---|---|---|---|
| Hosted Composition | pages, scene nodes, comments, sources, prototype links, design history | Composition id plus server-minted node ids | Clearly restore points and Composition versions |
| Live browser room | viewport, selection, active tool, on-screen instruments and actual framebuffer | open tab plus ephemeral interaction state | only while a client is connected; persisted scene is the fallback |
| Local agent workspace | daemon target, Composition-to-repo map, provider session and local credentials | machine-local paths plus a Composition id | local JSON/config and provider conversation JSONL |
| Application repository | authored code, tests, commits, branch and PR | Git paths, revisions and provider metadata | Git history and review workflow |

An exported SVG or PDF is a fifth, destination-owned fork. A generated site, uploaded binary or PR is another. Nothing public establishes a transaction that commits all of these together.

## Ordinary journey A: let an agent design headlessly, then take over by hand

The current ordinary external-agent journey is explicit in the [Quickstart](https://www.clearly.sh/docs/quickstart), [Canvas API](https://www.clearly.sh/docs/canvas-api) and [Codex guide](https://www.clearly.sh/docs/codex):

1. Create a Clearly workspace and connect an MCP client to `https://relay.clearly.sh/mcp` through browser OAuth.
2. Create a Composition and keep its returned `compositionId`.
3. Use `clearly_canvas_catalog` to discover the current action vocabulary rather than relying on a static verb list.
4. Send one ordered `clearly_canvas_act` batch containing named frames, text, vectors, images or higher-level `canvas.compose` blocks.
5. Read the result through `clearly_canvas_perceive` as the complete JSON room or a compact text summary.
6. Audit or repair layout, then perceive again. A successful mutation reply is not visual acceptance.
7. Open the Composition in the browser. A person can move layers, edit paths and text, swap component variants, comment and collaborate on the same hosted graph.
8. Export or hand off deliberately. SVG/PDF can render headlessly; PNG needs the live browser path; CSS/JSON/copy operations are separate projections.
9. Confirm both the intended Composition version and the actual downstream file or destination.

This path does not require a live browser for structural authoring. It does require one for browser-owned state and some rendering/editing operations.

## Ordinary journey B: use the canvas to direct code work without making it the code

The public plugin defines a second, genuinely different journey:

1. A human pins a spec, document or sticky to a Composition.
2. The agent perceives the board, restates its interpretation and posts a plan beside the spec.
3. The local agent performs the real work in a repository or Composition scratch directory.
4. `canvas.add-diff` parses a Git diff into one vector-rendered card per file, optionally labelled with a commit.
5. The agent adds dependency arrows and risk callouts based on its repository inspection.
6. The human inks or comments near a file card.
7. The agent re-perceives the board, associates the note to a file **by geometry/proximity**, changes repository files and posts a refreshed diff.
8. The reviewed Git branch and PR become delivery authority; the Composition remains the durable coordination and review surface.

The [`ship-review` skill at the pinned plugin commit](https://github.com/clearly-sh/clearly-plugin/blob/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/plugin/skills/ship-review/SKILL.md) says this directly: annotations are mapped to file cards by their bounds. That is useful spatial grounding, not a retained file/range/AST binding.

## The Composition is a flat scene graph with first-class design semantics

The [Canvas API](https://www.clearly.sh/docs/canvas-api) publishes a compact canonical node shape:

```jsonc
{
  "id": "server-minted",
  "name": "hero-title",
  "type": "text",
  "x": 120,
  "y": 260,
  "w": 600,
  "h": 86,
  "text": "Ship faster",
  "size": 72,
  "fontWeight": 800,
  "fill": "#FFFFFF",
  "parentId": "hero-frame"
}
```

Its public invariants matter more than the example fields:

- styling is flat on the node; there is no canonical nested `style` object;
- width and height are `w` and `h`, and text size is `size`;
- every create action requires a short layer `name`;
- `parentId` expresses membership, not a new coordinate origin;
- children keep world coordinates even when nested;
- names can address later mutations, but the first matching name wins;
- server-minted node ids remain the stronger native identity;
- paint properties such as shadow, blur, opacity, blend mode, gradient, stroke alignment and masks are reported back through perception.

The pinned [`clearly-canvas` skill](https://github.com/clearly-sh/clearly-plugin/blob/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/plugin/skills/clearly-canvas/SKILL.md) also documents a useful failure: a nested `style.text` payload can persist without an error while rendering an empty node. Storage acceptance is therefore weaker than semantic validation.

### Frames, layout and constraints are graph behavior

The [layout manual](https://www.clearly.sh/docs/canvas/layout) documents row/column auto layout, gaps, padding, inferred tidy-up, grouping and z-order. The live MCP catalog additionally exposes horizontal and vertical constraints such as left/right/center/stretch/scale for child reflow when a frame resizes.

These are scene-graph rules, not CSS layout retained from an authored website. `canvas.inspect` may project a selected node into measurements and a paste-ready CSS rule; that projection does not turn the node into a DOM element or application component.

### Components preserve a design link until override or detach

The [components manual](https://www.clearly.sh/docs/canvas/components) establishes:

- a main component can stamp linked instances;
- changes to the main flow to instances;
- instance text can be overridden without breaking the link;
- variant sets allow an instance to swap state while retaining overrides;
- reset discards overrides;
- detach converts the instance into independent layers and stops propagation.

The agent path exposes matching `canvas.component` operations for create, instance, variant, property override and swap. No public contract connects those component identities to a React/Vue component, package symbol or Figma component key.

### Prototypes are frame-to-frame links

The [prototyping manual](https://www.clearly.sh/docs/canvas/prototyping) defines clickable hotspots that navigate to destination frames. Present mode renders one complete frame at a time and follows those links.

The MCP surface exposes `canvas.prototype` link/set-start/list operations. These links make a design interactive inside Clearly; they do not become application routing automatically.

## Sources, brand and tokens are distinct inputs

The [Sources guide](https://www.clearly.sh/docs/sources) corrects a tempting assumption: attaching a logo, image, SVG, URL or note to a Composition does **not** automatically inject it into every agent prompt.

| Input | Scope | Agent behavior | Persistence break |
|---|---|---|---|
| Source asset | Workspace library, attached/tagged to a Composition | searched with `canvas.list-sources`, placed with `canvas.place-source` | reference is not automatic context |
| Saved component/style | Workspace-reusable library item | surfaced to the agent for reuse | placing it creates graph nodes with their own later history |
| Brand kit | active visual identity for a Composition/workspace | supplies palette, typography, voice and generation guidance | brand updates and Composition versions have separate review clocks |
| Reference image | one image-generation request | conditions that generation | not automatically saved as a reusable source |
| Team source | a Composition published as reusable reference | other team members can pull from it | reuse does not imply live cross-file identity |

`canvas.tokens` can extract colors, text styles and spacing, save them as reusable styles and sync them into the Company Brain. That improves consistency, but the public interface does not promise one atomic version across the source Composition, brand record, shared styles and every consuming instance.

## Perception is a room, not merely a screenshot

`clearly_canvas_perceive` returns a deliberately richer model:

| Room facet | Meaning |
|---|---|
| `contents` | scene nodes with bounds, styles, visibility and optional vector geometry |
| `gaze` | pan, zoom and visible world rectangle |
| `focus` | selection and active tool |
| `instruments` | visible editor controls, labels and state |
| `occupants` | people/agents present in the live room |
| pixels | optional rendered PNG |

With an open tab, this can reflect the user's live interaction state and actual framebuffer. Without a tab, it reads the persisted scene and returns `live:false`; selection, viewport and chrome are no longer the human's live state.

The text response is not a subset-preserving JSON wrapper. It is a separate compact shape and lists at most 40 objects. Agents that need to verify every created node must request JSON.

### Human focus and agent focus are different clocks

The live tool catalog exposes persistent `clearly_agent_focus` and `clearly_nav_open` state. An agent can retain its own working set and current Composition across calls/sessions so a human click does not clobber it. Meanwhile the live browser selection remains human interaction state.

This separation reduces accidental retargeting, but it also means “selected” is ambiguous unless the caller says whose focus it is reading.

### Headless pixels have an explicit media blind spot

The current MCP tool description and public skill state that tab-free pixels are rendered through `resvg`, which draws no `<image>` content in this path. Remote images, data URLs, GIFs and video posters can therefore be present structurally while appearing as holes in the returned PNG.

Correct verification is split:

- use pixels for layout, type and color;
- use the JSON node list to prove media `src` values landed;
- use a real open-tab framebuffer before accepting final media composition.

Retrying image placement until the headless PNG changes can duplicate already-correct content.

## One mutation vocabulary spans live and headless paths, but capability is asymmetric

The hosted MCP presents three headline tools:

- `clearly_canvas_catalog` discovers actions and exact arguments from the current dispatch map;
- `clearly_canvas_act` is the single mutation entry point for one action or an ordered batch;
- `clearly_canvas_perceive` closes the see → act → see loop.

The catalog distinguishes two surfaces:

| Surface | Typical operations | Failure when unavailable |
|---|---|---|
| Persisted/headless RPC | create frames/nodes, compose blocks, update/delete, group/auto-layout, components, tokens, prototype links, SVG/PDF export | requires authenticated cloud access and a valid Composition |
| Live editor action | selection, clipboard, point editing, booleans, undo/redo, browser PNG, some effects and presentation controls | `no-client-connected` when no suitable tab is open |

The static list is intentionally non-authoritative. The current `headlessActions` catalog is the truth because product vocabulary moves faster than prose.

### A batch is ordered and partially durable on failure

The [Canvas API](https://www.clearly.sh/docs/canvas-api) says a batch stops at its first failed operation. The response reports how many operations ran and how many were skipped; callers must resend the skipped suffix after fixing the error.

The live `clearly_canvas_act` description also calls a batch an “atomic multi-step edit,” but its schema exposes `stopOnError`, and the broader `clearly_agent_batch` tool explicitly says sequential batches are **not transactions** and do not undo earlier operations. The evidence therefore supports:

- ordered execution;
- stop-on-first-error by default;
- partial persisted mutations before the error;
- no proven rollback transaction.

Calling the whole batch atomic would contradict the documented recovery procedure.

## Beehaven makes the cloud addressable from a local daemon

The public [`install.sh`](https://www.clearly.sh/install.sh) installs a Node 20+ program plus native dependencies. A daemon holds the relay connection; the CLI is a thin one-shot client.

The mental model is filesystem-like:

```text
address  -> home | team/<id> | local app
target   -> current durable object, persisted in local CLI state
actions  -> schemas callable against that target
VFS      -> files, manifests and decoded Composition views
```

The user should explicitly run `beehaven connect home` or pass a target per call. The public skill warns that an unpinned call can inherit the daemon's machine-global last connection and silently land on a team/store selected by another agent, app or terminal.

### Current distribution truth is internally inconsistent

The 2026-08-11 distribution snapshot establishes:

- `beehaven@0.7.6` in the downloaded `package.json`;
- MIT license;
- `private: true`, no public npm package route;
- 115 compiled JavaScript files and no TypeScript source in the tarball;
- declared repository `clearly-sh/beehaven-sdk`, which was not publicly accessible;
- installer default `https://downloads.clearly.sh/cli/beehaven-latest.tgz`;
- Node 20+, npm, `better-sqlite3` and `node-pty` platform resolution;
- local prefixes under `~/.beehaven` and `~/.local/bin`.

The archive README still calls the CLI an internal developer tool and tells users to install from the monorepo, while the website and installer advertise a public one-line installation. The [current Codex guide](https://www.clearly.sh/docs/codex) says the CLI works on any OS but the Mac desktop app is “coming soon”; other pages and legal text describe that app as already installed or bundled.

This is evidence of fast-moving distribution, not proof that any one path is unusable. Native Windows PowerShell installation and daemon startup were not exercised in this dossier.

### A Composition can bind to one local repository on one machine

The shipped compiled CLI exposes:

```text
beehaven composition bind <compositionId> <repoPath>
beehaven composition unbind <compositionId>
beehaven composition list
```

The map lives at `~/.clearly/composition-repos.json` as `compositionId -> absolute path`. It is read fresh for the next local agent session.

If the path exists, the daemon uses it verbatim as the coding agent's working directory and leaves the repository's own instruction file alone. If it is absent or stale, the runtime falls back to `~/.clearly/compositions/<id>/` rather than failing hard.

That fallback is convenient for a pure canvas task and dangerous for an assumed repo task. Acceptance must verify the actual working directory and Git diff, not merely that an agent session started.

### Local conversations persist separately from the canvas

For an unbound Composition, the daemon seeds a scratch directory with a Composition-specific `CLAUDE.md` and `.clearly-composition.json`. For a bound repository it runs directly in that checkout.

The inspected `0.7.6` runtime uses one provider query per turn, captures the provider session id and resumes the latest JSONL under the provider's project directory. Prompts for one session queue FIFO; the published default caps queued prompts and model/tool turns.

This gives conversation continuity across daemon restarts. It does not put that conversation inside a Composition version or Git commit.

### Local code mutation has no Clearly-specific Git transaction

The compiled runtime defaults the Claude Agent SDK to its normal permission mode and supplies a tool gate. Its own comments say a prior filesystem sandbox module was not wired into the default policy path; the public code-review skills instead rely on diff review, human steering and Git.

The safe conclusion is narrow: Clearly can choose a local working directory and run an agent there. It does not publicly establish a sandbox-then-commit protocol, automatic worktree isolation, or rollback that joins repository writes to Composition history.

## Source identity stops at the Composition or the repository boundary

Clearly has several useful identities:

- native Composition and node ids;
- first-match layer-name handles;
- component/instance links inside the design graph;
- Composition-to-repository binding at whole-workspace granularity;
- diff cards containing a path, hunks and optional commit label;
- user ink spatially near those cards;
- Git paths and revisions in the real repository.

What it does not publicly expose is the join key between a selected design node and an authored code location.

There is no documented packet containing:

- application file plus line/range;
- AST or component-symbol identity;
- source-map location;
- repository revision precondition on a canvas mutation;
- durable relation between a diff card and a later file version;
- automatic reverse sync from exported CSS/SVG or a code change back to its original node.

The code-review skill's proximity rule proves the boundary. A human can point much more efficiently, but an agent still interprets that gesture and edits Git separately.

## Rendering and export have three fidelity regimes

The [manual](https://www.clearly.sh/docs/canvas) and [export guide](https://www.clearly.sh/docs/canvas/export) expose a Skia/CanvasKit-oriented editor with native vector nodes, live booleans, masks, type, effects, print controls and prototype playback.

| Exit | Renderer / representation | What survives | What must be verified |
|---|---|---|---|
| SVG | vector serializer; available headlessly | paths, fills, vector cut contours and selected/page bounds | external SVG consumer fidelity, fonts and linked media |
| PDF | vector/print serializer; available headlessly | vector output, bleed, marks and dielines | print vendor interpretation and font/media handling |
| PNG | browser-owned raster export | visible composed pixels at requested scale/DPI | requires live client; compare actual downloaded bytes |
| CSS | generated inspection rule for a selected layer | measurements and supported style projection | not application structure, responsiveness or runtime behavior |
| JSON / copy-as | scene projection | node data useful for transport/debugging | not promised as a complete, stable native backup format |
| Git diff / code | agent-authored repository result | real code only after the agent writes and Git records it | tests, diff review and a real runtime journey |

The export guide also documents a precise UI boundary: JPG, WebP, GIF and video choices fall back to PNG; PNG, SVG and PDF are the true formats in that panel.

## Persistence is stronger than autosave, but it is not Git

The live MCP catalog now exposes two overlapping public history vocabularies:

### Object history and restore

- `clearly_history_list` returns restore points for documents, boards and Compositions;
- entries normally represent state **before** their named change, while Composition entries are documented as state **after**;
- `clearly_history_diff` reports structured deltas between versions;
- `clearly_history_restore` snapshots current state first, making restore itself undoable;
- board restore defaults to merge and offers exact mode; Composition restore rewrites the design snapshot.

### Composition file versions

- `clearly_version_list` describes “git-like” restorable checkpoints created as canvas/documents change;
- `clearly_version_restore` snapshots current state first, then restores `canvasNodes` and documents;
- deletion through the typed file tool commits a restorable version.

“Git-like” here means checkpointed restore, not branches, merges, cherry-picks or a repository protocol.

### Approval and cross-object changesets

- `clearly_edit_checkpoint` creates an explicit pre-edit restore point;
- otherwise checkpoints can coalesce around a roughly 90-second window;
- `clearly_edit_propose` supports deferred changes or applied changes that revert on rejection;
- `clearly_edit_get` reports before, proposed, current and whether the proposal became stale;
- `clearly_changeset_list/get` groups changes made together across objects.

These contracts are materially stronger than “the canvas probably autosaves.” They still do not publish collaboration conflict resolution, branch semantics, retention by tier or a transaction with local Git and exported files.

## Privacy and authority depend on which agent path is used

The [privacy policy](https://www.clearly.sh/privacy) says cloud canvas content lives in hosted SQLite-backed databases and object storage with encryption at rest. It distinguishes several AI paths:

- local daemon canvas/terminal prompts go directly to the selected provider in the documented primary flow;
- cloud FAB chat, voice and image-generation requests pass through Clearly infrastructure and named model providers;
- local credentials and daemon state live under platform keychain/config directories;
- cloud Composition blocks still pass through Clearly even when the model prompt does not;
- account deletion targets cloud data within 30 days and backups within 90 days.

The hosted MCP uses Streamable HTTP. `initialize` returned an `Mcp-Session-Id`; the [MCP guide](https://www.clearly.sh/docs/mcp) says an absent id remains stateless. Normal sign-in acts as the user, while an agent-scoped sign-in applies that agent's tool allowlist and activity attribution.

### Bounded live endpoint probe

On 2026-08-11, an unauthenticated public probe found:

1. MCP `initialize` succeeded and reported server `clearly@0.2.0` with protocol `2025-06-18`.
2. `tools/list` returned 132 named schemas, including canvas, versions, edit checkpoints, changesets, projects, boards and Company Brain tools.
3. `clearly_canvas_list_compositions` returned HTTP 401: `Authorization required ... Missing Authorization: Bearer <token>`.

This proves public capability discovery and protected user data. It does not prove authenticated mutation fidelity or team permissions.

## Failure atlas

| Boundary | Observable failure | Consequence | Recovery / acceptance |
|---|---|---|---|
| OAuth / scope | missing or expired token; read-only grant on a write | 401 or missing `rpc:write` | reauthenticate, inspect scope, retry only the intended call |
| Target routing | daemon/CLI retains another machine-global target | write lands in the wrong team/store/workspace | explicitly pin `home` or pass the target per call |
| Repo binding | local path moved or disappeared | daemon silently falls back to Composition scratch | print cwd, verify `.git`, stop before edits if wrong |
| Batch execution | operation N fails | prior mutations persist; suffix is skipped | compare `count`, repair, resend only skipped operations |
| Browser requirement | tab-only action used headlessly | `no-client-connected` | query live catalog, open the correct Composition or choose a headless operation |
| Name addressing | duplicate layer names | first match is mutated | use unique names or resolve native ids first |
| Node schema | nested `style`, wrong `width/fontSize`, omitted text | accepted but blank/wrong scene node | inspect JSON plus render, correct canonical flat fields |
| Nesting | frame and child overlap without `parentId`, or relative coords assumed | child does not move with frame or lands elsewhere | set membership explicitly and reason in world coordinates |
| Text perception | `format:"text"` used for a large build | nodes after the first 40 are unseen | use complete JSON for acceptance |
| Headless media render | image/video exists but pixels omit it | agent duplicates media or declares failure | verify `src` structurally and inspect a live framebuffer |
| Local media | filesystem path placed in cloud node | renderer cannot fetch it | upload first and use returned durable URL |
| Collaboration | human/agent edits overlap | public merge/precondition behavior is unspecified | re-perceive immediately before a risky edit; inspect history afterward |
| Checkpoint coalescing | applied review uses a shared recent restore point | rejection may rewind more than intended | create explicit checkpoint before the edit |
| Code review map | ink is near a stale diff card | agent interprets the wrong current file/version | bind feedback to current commit in prose, re-read Git diff |
| Distribution drift | docs, archive README and installer disagree | setup instructions fail by platform/version | inspect current package version/hash and run a bounded install smoke |
| Delivery | Composition/export/PR reported as complete | downstream bytes or runtime can still be wrong | verify the actual file, checkout, build and ordinary-user journey |

## The product changed architectural center in three public steps

| Date | Public evidence | Architectural center |
|---|---|---|
| 2026-05-23 | [Visual Claude Code guide](https://www.clearly.sh/blog/how-to-use-claude-code-without-the-terminal) | browser canvas as blocks driving a local Hive Mac daemon and returning deployments/content |
| 2026-06-17 → 2026-07-17 | [Official plugin history](https://github.com/clearly-sh/clearly-plugin/commits/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/) | hosted OAuth MCP grows from Company Brain skills into eight canvas/code-review skills |
| 2026-07-15 onward | [Headless Claude Code design guide](https://www.clearly.sh/blog/design-on-canvas-with-claude-code) plus current docs | Composition becomes a full editable design graph that external agents can create/perceive headlessly, then humans refine live |

The current homepage emphasizes editable vectors, components, prototypes, multiplayer and export. Older legal/product copy still describes “blocks for Claude” and pricing/setup that no longer matches the main surface. Historical claims should therefore be dated, not blended into one timeless architecture.

## Facts, inferences and consequential unknowns

### Established facts

- A Composition is the hosted design identity accepted by current canvas tools.
- Humans and agents can mutate the same scene, including without a live tab for many structural operations.
- The public node contract is flat and uses server-minted ids plus non-unique name handles.
- Live and persisted perception have different state and different pixel fidelity.
- Components, variants, constraints, tokens, sources and frame prototypes are public graph semantics.
- SVG/PDF headless export and browser PNG export are separate paths.
- Restore points, diffs, undoable restore, explicit checkpoints, stale proposals and cross-object changesets are present in the current public MCP catalog.
- The local CLI can bind a whole Composition to a local repo and preserve provider conversation JSONL independently.
- The official plugin maps annotations to code cards by proximity, not by source identity.
- The editor, collaboration core and hosted MCP implementation are not in the public plugin or CLI distribution.

### Evidence-backed inferences

- Clearly's durable center is the hosted Composition graph; browser room state, local conversations, repos and exports are coordinated projections around it.
- A generated CSS rule, diff card or codebase map is an explanatory/export projection rather than a second canonical representation of the node.
- The runtime dispatch catalog is designed to absorb frequent action churn; any static list should be treated as a snapshot.
- Composition history and changesets provide product recovery, but they are not a substitute for Git when application code is the deliverable.
- The most valuable “source return” behavior is human pointing plus agent interpretation, not deterministic reverse mapping.

### Consequential unknowns

- The canonical hosted Composition serialization and server schema are not published.
- The editor renderer, CanvasKit/Skia integration and collaboration implementation are closed.
- CRDT/OT choice, offline behavior, collaborator conflict resolution and mutation preconditions are unknown.
- The “atomic” wording for canvas batches is not reconciled with documented partial execution and has no public rollback proof.
- Node-id behavior across copy, cross-Composition import, restore, detached instances and team-source reuse is not fully specified.
- Version retention, pruning, tier limits and multi-user restore permissions are not published in the current technical docs.
- The exact relationship between the legacy version tools and newer generic history/changeset tools is not documented.
- There is no public lossless native backup/import roundtrip for the complete Composition.
- “Hand off the code” does not publish a node-to-code mapping or generated application schema.
- Native Windows/Linux installer, daemon, native dependency and browser-open journeys were not exercised here.
- An authenticated live Composition mutation, multiplayer race and real export byte comparison remain untested.

## Acceptance checklists

### Headless agent build

- [ ] Confirm the OAuth identity, workspace and `rpc:write` scope.
- [ ] Create or select the exact Composition and retain its id.
- [ ] Query the live catalog rather than guessing actions.
- [ ] Use unique layer names and canonical flat fields.
- [ ] Compare batch result count to requested operation count.
- [ ] Perceive complete JSON after every material batch.
- [ ] Run layout/audit checks and fix clipping, placeholder copy and off-grid geometry.
- [ ] Inspect a live framebuffer when images/video matter.
- [ ] Confirm a restorable Composition version after the edit.

### Human handoff and export

- [ ] Open the exact Composition URL and confirm the live scene is current.
- [ ] Test component overrides, constraints and prototype hotspots in the browser.
- [ ] Confirm comments/collaborator edits are present before export.
- [ ] Export the intended scope and format.
- [ ] Inspect the actual downloaded SVG/PDF/PNG in its destination tool.
- [ ] Treat CSS/JSON as projections, not lossless native backups.

### Canvas-directed repository work

- [ ] Resolve the Composition-to-repo binding on this machine.
- [ ] Verify cwd, repository root, branch and clean/dirty state before mutation.
- [ ] Keep spec, plan, status and diff map in one task frame without claiming they are Git state.
- [ ] Label a diff map with the current commit/revision.
- [ ] Translate human ink into an explicit file/change request before editing.
- [ ] Review the real Git diff, run tests and exercise the actual user journey.
- [ ] Commit/push/PR in Git independently of Composition history.
- [ ] Record the final PR/commit on the canvas as evidence, not authority.

### Risky edit or restore

- [ ] Create an explicit checkpoint before an applied-review edit.
- [ ] Inspect whether the proposal is stale before approval/rejection.
- [ ] Read current history and the intended version diff.
- [ ] Re-perceive after restore.
- [ ] Reconcile local repo, exports and external destinations separately; they are not rewound.

## Evidence boundary reached

The public evidence is sufficient to establish Clearly's decisive architecture without inventing its closed internals:

- the authoritative object is a hosted, versioned Composition graph;
- live browser state and headless persisted state have different capabilities;
- a generated runtime catalog governs the agent vocabulary;
- structural mutations can run headlessly while several interaction/render operations need a live tab;
- local Beehaven sessions and whole-repo bindings add another independent authority;
- spatial code review improves human-agent grounding without deterministic source return;
- export, Git, local conversation and cloud history remain separate clocks.

Source-level classification would require the hosted scene/collaboration/MCP implementation or an equivalent inspectable core, not only public adapters and compiled client distribution.

## Primary sources

### Product and ordinary-user surface

- [Clearly homepage](https://www.clearly.sh/)
- [Canvas manual](https://www.clearly.sh/docs/canvas)
- [Shapes, pen and vector editing](https://www.clearly.sh/docs/canvas/shapes-and-vectors)
- [Auto layout, align and arrange](https://www.clearly.sh/docs/canvas/layout)
- [Components and variants](https://www.clearly.sh/docs/canvas/components)
- [Prototyping and present](https://www.clearly.sh/docs/canvas/prototyping)
- [Export, inspect and print](https://www.clearly.sh/docs/canvas/export)
- [Sources on Compositions](https://www.clearly.sh/docs/sources)

### Agent interface and runtime contracts

- [Quickstart](https://www.clearly.sh/docs/quickstart)
- [Canvas API](https://www.clearly.sh/docs/canvas-api)
- [Clearly MCP reference](https://www.clearly.sh/docs/mcp)
- [Codex connection guide](https://www.clearly.sh/docs/codex)
- [Beehaven CLI reference](https://www.clearly.sh/docs/beehaven)
- [Hosted MCP endpoint](https://relay.clearly.sh/mcp)
- [Public installer](https://www.clearly.sh/install.sh)
- [Current Beehaven tarball](https://downloads.clearly.sh/cli/beehaven-latest.tgz)

### Pinned public adapter evidence

- [`clearly-sh/clearly-plugin` at `67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2`](https://github.com/clearly-sh/clearly-plugin/tree/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2)
- [Plugin manifest at the pinned commit](https://github.com/clearly-sh/clearly-plugin/blob/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/plugin/.claude-plugin/plugin.json)
- [MCP connector config at the pinned commit](https://github.com/clearly-sh/clearly-plugin/blob/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/plugin/.mcp.json)
- [`clearly-canvas` skill at the pinned commit](https://github.com/clearly-sh/clearly-plugin/blob/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/plugin/skills/clearly-canvas/SKILL.md)
- [`pair-on-canvas` skill at the pinned commit](https://github.com/clearly-sh/clearly-plugin/blob/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/plugin/skills/pair-on-canvas/SKILL.md)
- [`ship-review` skill at the pinned commit](https://github.com/clearly-sh/clearly-plugin/blob/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/plugin/skills/ship-review/SKILL.md)
- [`codebase-map` skill at the pinned commit](https://github.com/clearly-sh/clearly-plugin/blob/67e1dcd6be1385cb0b5b008d64c9c1bb1a904eb2/plugin/skills/codebase-map/SKILL.md)
- [Plugin commit history](https://github.com/clearly-sh/clearly-plugin/commits/master/)

### History, privacy and lifecycle

- [How to use Claude Code without the terminal, 2026-05-23](https://www.clearly.sh/blog/how-to-use-claude-code-without-the-terminal)
- [Design on the Canvas with Claude Code, 2026-07-15](https://www.clearly.sh/blog/design-on-canvas-with-claude-code)
- [BYOK with Gemini CLI, OpenRouter and Codex, 2026-07-15](https://www.clearly.sh/blog/clearly-free-gemini-cli-openrouter-codex-byok)
- [Privacy policy](https://www.clearly.sh/privacy)
- [Terms of service](https://www.clearly.sh/terms)
