# MagicPath

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Verified value |
|---|---|
| Product / operator | MagicPath, operated by NewCompute, Inc. |
| Category | Hosted code-native design canvas, multiplayer agent workspace and React component exchange |
| Current lifecycle | Active; MagicPath 2.0 announced 2026-05-12 / 2026-05-14 |
| Canonical design object | A versioned **Design**—also called a Component—whose editable center is a small React/TypeScript/Tailwind program |
| Project surface | One cloud Project with an infinite canvas, project-level chat, standalone shapes/images, Designs, people and agents |
| Human edit surface | Rendered DOM layers inside each Design, with direct text/style/layout/structure editing and session-scoped undo/redo |
| External-agent surface | Official Agent Skill plus `magicpath-ai` CLI; no independently documented public MCP endpoint or stable MCP tool catalog was found |
| Current adapter snapshot | `MagicPathAI/agent-skills` plugin `1.0.9` at commit `a1ced96ad9da6c65d9f57d9fef79d944f7192dfe` |
| Current CLI snapshot | npm `magicpath-ai@2.6.1`, published 2026-07-15; 35,064-byte tarball / 119,746 bytes unpacked; SHA-1 `d2d500234f9945a5689053d17b6c24f973737cf7` |
| Public source boundary | Closed hosted editor, mutation compiler, build service, collaboration backend and model orchestration; public agent instructions and manifests; inspectable MIT npm CLI bundle; inspectable but unlicensed shipped visual-edit runtime |
| Evidence snapshot | Official product/docs/blog/legal pages, pinned official adapter repository, npm metadata and distribution, and one anonymously readable official rendered revision; no account, Project or repository was mutated |

## The shortest accurate description

MagicPath is a multiplayer canvas whose primary generated design artifact is already a **runnable Web program**. A Design is not a Figma-like node document that later happens to export code. Its source files render into an iframe; the visual editor targets the resulting DOM; a save path tries to reconcile recorded DOM mutations back into those source files and builds a new Design revision.

That makes the decisive boundary:

```text
Project canvas
  ├─ sketches / shapes / images / chat context
  ├─ Design A -> React source revision -> built iframe -> visual mutations -> next revision
  ├─ Design B -> independent revision lineage
  └─ people and agents -> live project presence

external repository
  └─ separate Git authority, reconstructed into or adapted from a Design by an agent
```

The canvas is the spatial and collaborative control plane. The versioned React mini-app inside each Design is the durable editable center. A real product repository is a third authority, not a hidden extension of that canvas.

## Three ordinary journeys, three different authorities

### Journey A: brief a design team, refine the resulting programs, then deliver them

The ordinary hosted path in the [Quick start](https://www.magicpath.ai/documentation/getting-started/quick-start), [Chat](https://www.magicpath.ai/documentation/features/chat) and [Canvas](https://www.magicpath.ai/documentation/features/canvas) is:

1. Create a Project. One project-level chat covers the whole infinite canvas.
2. Ask for one self-contained app or name several screens. MagicPath dispatches one designer agent per design, edit or variant and streams each result independently.
3. Select sketches, shapes, images or Designs, or mention them with `@`; the selected material becomes context for that message.
4. Open a completed Design as a real interactive preview. Its code view exposes the generated React files.
5. Enter visual edit mode across completed Designs. Move, resize, restyle, change literal content, group, reorder or ask an agent about exact selected DOM layers.
6. Press **Done**. The edit session becomes a new revision; unsupported source rewrites may automatically invoke an AI edit before the rebuilt revision appears.
7. Use the per-Design revision picker to recover a working version if an edit fails.
8. Deliver deliberately: share the interactive preview, download/open a code project, ask an external agent to integrate a selected revision, copy editable Figma layers or export an image.
9. Verify the actual destination. A successful Design build does not prove a downloaded app, repository change, Figma paste or deployed route.

One multi-screen prompt does not create a single atomic application revision. It can create multiple Design lineages on one canvas, each completing and versioning independently.

### Journey B: author a Design as code from an external agent

The public [`code` CLI contract](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/skills/magicpath/references/cli-reference.md) exposes a more deterministic path:

1. Authenticate and resolve the target explicitly with `selection`, `active-project`, a Project id or a Design link.
2. Run `magicpath-ai code start --project <id> --dir <work> ...` for a new Design, or `--component <id> --revision <id>` for an edit.
3. MagicPath creates a pending Design/revision immediately and writes a constrained local scaffold.
4. The agent edits only `src/App.tsx`, `src/index.css`, `src/components/generated/**` and temporary `assets/**`.
5. Run `code submit --wait`. The CLI hashes changed files, reports deleted paths, uploads complete replacement files and waits for the cloud build job.
6. Repair any sanitized build diagnostics in the same working directory and resubmit; do not create a second Design to hide the failure.
7. Review the built Design on the Project canvas and exercise its interaction states.
8. Record the returned revision id. Local source success, build success and visual acceptance are separate checkpoints.

The local directory is a staging mirror, not an automatically synchronized checkout. Its `magicpath-code.json` manifest is what binds that directory to one component/revision session.

### Journey C: move between a real repository and the canvas

The official [GitHub workflow](https://www.magicpath.ai/documentation/features/work-with-github) and pinned [`working-with-repositories.md`](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/skills/magicpath/references/working-with-repositories.md) make the two directions asymmetric.

#### Repository → MagicPath

1. The coding agent reads the requested repository slice, its global CSS, tokens, fonts, shared primitives, parent layout and interactions.
2. It translates that slice into a self-contained React + Tailwind v4 mini-app with local mock data/state.
3. `code start` creates a new Design; `code submit` sends the reconstructed files to MagicPath.
4. The agent and human compare the canvas result against the original application.

The official reference explicitly says the repository remains source of truth. The source framework may be Vue, Svelte, Angular, SwiftUI or another system; the canvas result is a new React implementation, not an uploaded repository or retained AST mapping.

#### MagicPath → repository

1. Resolve the exact Design and `selectedRevisionId`.
2. Fetch that source with `code context --revision` into an empty staging directory, or use `inspect`/`add` for the current registry form identified by `generatedName`.
3. Establish 1:1 visual parity in the target runtime before adapting it.
4. Preserve the repository's existing behavior, data flow, routing, validation, accessibility, analytics and error states.
5. Review the ordinary Git diff, tests and real browser journey; then commit/PR through the repository workflow.

The pinned [`using-magicpath-designs-in-local-code.md`](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/skills/magicpath/references/using-magicpath-designs-in-local-code.md) calls the selected Design revision the presentation authority and the local app the runtime-contract authority. This is an agent-mediated join between two sources of truth, not continuous round-trip synchronization.

## The actual artifact model

“Canvas,” “Project,” “Design,” “Component,” “revision” and “codebase” are not interchangeable.

| Object | Public identity / contents | What it controls | What it does not control |
|---|---|---|---|
| Project | Project id, owner/workspace, one canvas and project chat | spatial arrangement, collaborators, chat context, standalone images/shapes and Design membership | no published project-wide atomic snapshot across every Design |
| Design / Component | component id, stable human name and generated registry name | one runnable UI mini-app and its revision lineage | not the user's application repository |
| Design revision | revision id plus editable file set and built output | exact source/render point used by preview, rollback and revision-safe export | does not pin external repository, library, design-system or deployment revisions |
| Canvas shape | client-side shape id plus type-specific props | selection, position, sketches, images and presentation on the Project canvas | not necessarily a source-code node |
| Rendered layer | runtime DOM id plus injected source markers and DOM path | direct visual targeting within one built revision | runtime id and DOM path are not durable authored-source identities |
| Design system | Tailwind/CSS token source or `DESIGN.md` plus fonts/guidance | generation and editing context reusable by native/external agents | applying it does not create a live dependency on every consuming revision |
| Component library | a Project marked as a reusable library | discoverable/mentionable Design building blocks across Projects | public docs do not expose semantic versioning or update propagation |
| External repository | paths, framework contracts, Git revision/branch/PR | production behavior and integration truth | Design rollback does not rewind it |

The public CLI also uses several identifiers for distinct tasks:

- `componentId` addresses a hosted Design for revision-aware editing;
- `generatedName` addresses a registry item for `search`, `inspect` and `add`;
- `selectedRevisionId` is the revision currently displayed on the browser canvas;
- `clientId` identifies the canvas-side Design shape;
- `projectId` scopes the shared workspace;
- a local `magicpath-code.json` records the active code session and baseline hashes.

Losing the revision id and retaining only `generatedName` can silently change the source from a historical selected revision to the current registry form.

## The decisive mechanism: source-marked DOM mutations return to a program revision

The visual editor is not merely a screenshot overlay. An anonymously readable official [rendered revision](https://api.magicpath.ai/components/293919797937311744/revision/294796990502563840) was inspected on 2026-08-11. Its shipped bundle and injected edit runtime expose the closed product's public browser boundary.

### Build-time markers ground a DOM element to generated source

The built JavaScript contained 296 occurrences each of:

```html
data-magicpath-path="HeaderNavBar.tsx"
data-magicpath-id="9"
```

The id is file-local in this observed build; path plus id forms the stronger source key. Optional markers support repeated records:

```text
data-magicpath-uuid
data-magicpath-field
data-magicpath-repeat
data-magicpath-binding
```

The injected runtime gives every current element a separate `data-mp-runtime-id` and constructs a target packet containing:

```jsonc
{
  "runtime_element_id": "session-local",
  "data_magicpath_path": "HeaderNavBar.tsx",
  "data_magicpath_id": "9",
  "data_magicpath_uuid": "optional record identity",
  "data_magicpath_field": "optional literal field",
  "dom_path": "current rendered ancestry",
  "tag_name": "button"
}
```

This is real source-directed targeting. It is stronger than a screenshot, a CSS selector alone or an ungrounded natural-language prompt.

It is also bounded:

- the public marker names a generated file and transform-assigned element id, not an authored line/range or AST node;
- runtime ids and DOM paths can change after a rebuild;
- the outer revision id supplies version context, but the marker itself carries no Git repository/revision identity;
- the source-transform/compiler implementation that injects and consumes the markers is closed;
- imported code is first recreated as new MagicPath source, so markers point to that reconstruction rather than the original repository.

### One visual session records a mutation manifest

The observed runtime reports protocol version `5` and supports commands including group/ungroup, auto layout, position mode, arrange, align/distribute, nudge, copy/paste/replace, duplicate, create, delete and PNG export.

Each edit records:

- operation and transaction id;
- the source-marked target;
- compact before/after geometry and computed-style snapshots;
- changed property names;
- structural evidence for reorder, reparent, group, duplicate, paste, replace or create;
- timestamp and the current runtime selection.

When the parent asks to save, the iframe emits manifest version `2` with `component_id`, `base_revision_id`, viewport, mutations and serialized changed subtrees. Structural subtree evidence is capped at 256 KiB and reports when truncated. The base revision is therefore explicit, while the server-side reconciliation and conflict decision remain closed.

### Session undo is DOM recovery; Done is program durability

Undo/redo inside edit mode restores recorded inline/structural DOM state. Cancel discards the session and reloads the iframe. Done settles the current pointer/text gesture, emits the manifest and starts durable reconciliation.

The [visual editing guide](https://www.magicpath.ai/documentation/features/editing) documents the final split:

- supported literal style/content/layout/structure changes save from the deterministic change record;
- computed text, imported data or ambiguous structural changes may require an automatically started AI edit;
- the rebuilt result becomes a new Design revision.

The edit session is therefore not durable merely because the iframe looks correct. A clean rebuilt revision is the first durable proof.

### Repeated UI reveals the source model

The public runtime and docs distinguish repeated records from shared JSX source:

- a style edit to rendered instances can be source-scoped, removing record identity so the compiler changes the shared source element;
- directly bound literal text/image/placeholder fields can remain record-specific through `uuid`/`field` markers;
- content derived from props, imports, state or computation may not have a safe literal target and falls back to an agent edit;
- the runtime tries to rebind pending edits after React rerenders by requiring exactly one matching stable source key.

This explains a user-visible fact that a generic layer model cannot: selecting one rendered card can either update a shared component, update one literal record, or require AI, depending on the program provenance behind the DOM.

## External-agent sessions are constrained source workspaces

The current [public CLI reference](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/skills/magicpath/references/cli-reference.md#code--createedit-canvas-components-from-local-code) establishes the working boundary.

### Editable surface

```text
src/App.tsx
src/index.css
src/components/generated/**
assets/**                    # temporary upload staging only
magicpath-code.json         # local session manifest, not submitted app source
```

The API rejects arbitrary repository files, raw patches, dependency installation, `package.json`, `src/main.tsx`, Vite configuration and lockfile edits. Tailwind configuration lives in `src/index.css`; `@import 'tailwindcss'`, `@theme inline`, `:root` and `.dark` blocks must remain.

This is a deliberate mini-app build sandbox, not a general remote coding environment.

### Start, context and submit have different side effects

| Command | Cloud effect | Local effect | Correct use |
|---|---|---|---|
| `code start --project` | creates a pending Design and revision; exposes agent presence | writes scaffold + session manifest | create/edit that will return to canvas |
| `code start --component` | creates or reuses a pending edit revision | writes exact editable files + baseline hashes | change an existing Design |
| `code context --revision` | read-only; no pending revision or presence | writes source files but no session manifest | revision-safe export / inspection |
| `code submit --wait` | submits changed files/deletions and starts a build job | refreshes manifest baseline after success | make the staged edit durable |
| `inspect <generatedName>` | read-only registry lookup; no revision selector | no write | inspect current registry source/dependencies |
| `add <generatedName>` | reads registry form | writes source/dependencies into a React app | install and actually render current component |
| `clone --key` | redeems one-time project export | unpacks a runnable project and installs dependencies | start a separate local application fork |

`code context` output is not a complete standalone application. Conversely, `clone` is an exit path that creates a new local project clock.

### Change detection is explicit, server merge behavior is not

The distributed CLI records SHA-256 for each baseline file. On edit submit it sends:

- `baseRevisionId`;
- only locally changed editable files, as full-file replacements;
- each changed file's `baseSha256`;
- inferred `deletedPaths`;
- optional new frame dimensions.

After a completed job it advances the local manifest to the returned revision. This provides inputs for optimistic conflict detection, but the public docs and client do not establish whether the server rejects, rebases or merges a stale base, nor how concurrent visual, agent and collaborator edits are resolved.

## Selection and live presence use the browser room as a context shortcut

The current compiled CLI depends on Liveblocks. Its `selection` path asks the service for active Project rooms, joins them, reads other occupants' `selectedShapeIds`, and resolves `mp-component` / image records from room storage.

This yields two useful commands:

- `active-project` returns Projects currently open in the user's browser;
- `selection` additionally returns selected Designs/images and each Design's `selectedRevisionId`.

The browser is optional for named/id-addressed work. It is required for the implicit phrases “this Project” or “the selected Design.” Several open tabs can yield several active Projects, so the agent must not silently choose one.

`code start` also makes the external agent visible on the canvas while work is pending. Presence is progress evidence, not build or revision evidence.

## Native multi-agent work is project-level orchestration, not one transaction

The [Chat guide](https://www.magicpath.ai/documentation/features/chat) says a single request is decomposed into one agent per design, edit or variant. Results stream back as each job finishes.

This model supports:

- one brief producing several independent screen Designs;
- variants and edits running in parallel;
- one context selection being supplied to all jobs in the request;
- native and external agents appearing beside humans in the same Project.

The public surface does not establish:

- a transaction that rolls back all parallel jobs when one fails;
- one commit joining several new Design revisions;
- serializable conflict resolution when two people/agents edit the same Design;
- a project snapshot that rewinds chat, Designs, images, library references and design-system state together.

“A whole team” is an orchestration model. Durable acceptance still occurs per Design revision and per downstream destination.

## Rendering is the artifact, not merely a preview

The [FAQ](https://www.magicpath.ai/documentation/help/faq) identifies current output as React 19, TypeScript and Tailwind, optimized for Next.js. The official agent skill narrows direct canvas authoring to React + Tailwind v4.

A Design can contain real local React state, transitions and multi-view navigation. The repository-import reference explicitly asks agents to replace server/data dependencies with representative local mock data so the canvas component is self-contained.

The observed public revision resolved to:

- a revision-addressed HTML document from `api.magicpath.ai`;
- a hashed JavaScript bundle and CSS asset;
- a normal `#root` mount;
- the injected visual-edit bridge in the HTML shell;
- CORS-readable static output, while the original registry source still required authentication.

This leads to a precise acceptance rule:

- preview interaction proves the self-contained Design program;
- it does not prove a backend, real data, application routing, auth or production integration;
- source export proves files were obtained;
- only running the destination project proves the exported dependency and build contract.

## Imports normalize into new React authority

MagicPath accepts several input families, but none publicly preserves a live reverse binding.

| Input | Transformation | What survives | What breaks |
|---|---|---|---|
| Figma selection link | authorized extraction to a new interactive Design | assets, Google-font typography, colors/gradients, layout/spacing and effects | custom fonts may be approximated; Figma node/component/variable identity is not documented in the resulting React source |
| Website URL | fetch full page and convert it into an editable Design | visual/content context suitable for variants and extracted components | original runtime, source files, data and source maps are not retained as an editable upstream |
| Chrome capture | capture a selected live element | precise rendered element as design input | original application source identity and behavior are not established |
| Repository slice | external agent reads and rewrites into the fixed mini-app contract | deliberately reproduced appearance, interaction and tokens | original framework/AST/Git identity; backend is replaced with mock state |
| Screenshot / image | model reconstruction or style reference | pixels and interpreted direction | structure, behavior and source identity |
| Sketch selection | snapshot automatically attached to the next message | visible layout intent and labels | the sketch shapes are prompt context, not linked generated layers |

The [FAQ](https://www.magicpath.ai/documentation/help/faq) says ordinary users cannot directly import code. The newer agent workflow does not contradict that: the external agent reads code and authors a new constrained Design from it.

## Exports create destination-owned forks

| Exit | Result | Authority after exit | Return path |
|---|---|---|---|
| Per-Design share link | hosted interactive revision/projection | MagicPath Design remains source | viewers may copy, creating another MagicPath fork |
| `code context --revision` | exact editable source snapshot | selected revision for presentation; destination for later edits | no automatic sync |
| `add` / external-agent integration | files adapted inside an existing app | application repository and Git | agent can later reconstruct a new Design, not reverse the same edit transaction |
| Download / `clone` / Open in IDE | runnable React project | local filesystem/Git after download | no published upstream push protocol |
| Figma export | clipboard layer tree with frames/text/fills/strokes/effects | pasted Figma file | [Figma Connect](https://www.magicpath.ai/documentation/features/figma-connect) performs a new conversion; no identity-preserving round trip is documented |
| Image export | raster proof | destination file | flat output |

The [Figma export guide](https://www.magicpath.ai/documentation/features/figma-export) correctly promises editable layers rather than a screenshot. “Round-trip” there means two conversion directions; it does not establish preserved node ids, components, variables, constraints or synchronized history.

## Design systems and libraries are reusable context with their own clocks

The [Design systems guide](https://www.magicpath.ai/documentation/design/design-systems) exposes four creation forms:

- editable Tailwind-compatible tokens;
- `DESIGN.md`, retained as the system's Markdown source;
- imported CSS / Tailwind variables;
- website extraction or extraction from an existing Design.

The selected system supplies colors, typography, spacing, effects, component guidance and written direction to later generations/edits. External agents can resolve accessible systems by name.

The [Libraries guide](https://www.magicpath.ai/documentation/advanced/libraries) models a library as a Project marked reusable; its Designs are dragged or mentioned into other Projects and can be placed in front of each parallel design agent.

Public evidence does not define a package-style version constraint, dependency graph or propagation transaction. A later design-system/library edit and an already built consuming Design can diverge. “Uses the same context” is weaker than “all instances update from one pinned dependency.”

## Versioning and recovery are per Design

The [first-design guide](https://www.magicpath.ai/documentation/getting-started/first-component) says every Design version is saved automatically; the Design toolbar lists every revision and permits rollback.

The externally inspectable contract adds useful precision:

- visual **Done** creates a new revision;
- `selection` returns the revision currently shown, which may differ from current canonical registry source;
- `code start --revision` creates/reuses a pending edit based on an explicit point;
- `code context --revision` is the read-only revision-safe export path;
- successful `code submit` advances the working manifest to the returned revision;
- failed/cancelled jobs remain distinct job states and do not prove a usable revision.

Still unknown:

- whether rollback creates a new head or moves a selected/current pointer;
- retention limits and deletion recovery for Designs/Projects;
- branching/merging semantics between variants and revisions;
- project-wide restore behavior;
- conflict UI and guarantees for simultaneous editors;
- whether a shared link is permanently pinned to one revision.

## Collaboration and sharing are broader than revision authority

The [sharing guide](https://www.magicpath.ai/documentation/collaboration/sharing) defines Viewer and Editor roles. Viewers can watch the live canvas and copy Designs into their own files; Editors can chat, edit, add images/sketches and ship changes. Public-link viewing and community-gallery visibility are separate toggles.

The public product claims people and agents appear live with current work/progress. The CLI's Liveblocks room access supports that claim at the adapter boundary.

What is not public is equally important:

- CRDT/schema internals for the canvas and Design source;
- presence expiry and offline behavior;
- exact authorization on revision, registry, asset and share endpoints;
- whether simultaneous source edits are merged at file, AST or last-writer level;
- audit log completeness across native agents, external agents and humans.

## Privacy, credentials and execution boundary

The official [Privacy Policy](https://www.magicpath.ai/privacy) and [Terms](https://www.magicpath.ai/tos) are Termly documents last updated 2025-05-05 and 2025-05-06—before MagicPath 2.0 and the current external-agent surface—so they should be read as a dated legal snapshot.

Established facts:

- operator is NewCompute, Inc.; service/data hosting is described as United States-based;
- the policy names Anthropic, Google Cloud AI and OpenAI as AI service providers and says inputs, outputs and personal information are processed through them for AI features;
- personal information may be retained up to twelve months after account termination, subject to legal needs and backup deletion constraints;
- the Terms say users retain ownership of their Contributions while remaining responsible for their transmitted data and backups;
- product docs say private projects are not used for model training and external agents only send information needed for a request, but no field-level minimization contract is published.

The `magicpath-ai@2.6.1` compiled distribution stores normal login state in `~/.magicpath/session.json`, including access/refresh tokens, unless `MAGICPATH_TOKEN` supplies a bearer token from the environment. The visible client code uses ordinary JSON read/write; no OS keychain or file encryption is established. A guest token is scoped to one expiring Project.

The CLI can also:

- read local repository and asset files under the external agent's authority;
- upload selected temporary assets to stable public URLs during a Design build;
- install dependencies after a `clone` export;
- open a browser or IDE;
- transmit generated source files to the hosted service.

Teams should therefore treat skill installation, local agent permissions, token storage, uploaded assets, prompt providers and destination Git credentials as separate security boundaries.

## Distribution truth

On 2026-08-11:

- npm stable `magicpath-ai@2.6.1` had five tar entries: README, `package.json`, directories and one 104,510-byte compiled `dist/cli.js`;
- npm declared MIT, Node `>=16`, and repository `newcompute-ai/magicpath-node-cli`;
- that declared GitHub repository was not publicly reachable;
- the public `MagicPathAI/agent-skills` repository was reachable, had no tags/releases, and pinned at `a1ced96…`;
- its Codex/Claude plugin manifests declared version `1.0.9` and MIT, while the repository exposed no standalone `LICENSE` file and GitHub detected no license;
- the hosted core and visual-edit compiler had no public repository.

Accordingly:

- the npm bundle is an inspectable MIT distribution, not a current source checkout;
- the agent repository is public adapter evidence with manifest-declared licensing;
- neither makes the hosted MagicPath product source-open.

## Failure map and correct recovery

| Failure | Observable symptom | What may already exist | Correct recovery |
|---|---|---|---|
| Ambiguous open canvas | `active-project`/`selection` returns several Projects | nothing new yet | name or paste the intended Project/Design; never pick silently |
| Historical revision drift | user views old revision but agent uses `generatedName` | current registry source fetched instead | pass `selectedRevisionId` to `code context` / `code start` |
| Forbidden workspace edit | agent changes package/config/entry files | local staging divergence | restore the constrained surface; redesign within allowed files |
| Build job failure | `pending` becomes `failed` with diagnostics | pending component/revision and local edits | repair same directory and resubmit; visually verify completed revision |
| Visual edit needs AI | Done announces an AI finish step | DOM looked correct; source revision not ready | wait for rebuilt revision and recheck exact selected element/state |
| React rerender invalidates target | undo/reapply says target changed or stable key is non-unique | some session mutations remain | stop, reload/reselect and make a narrower edit; do not assume save |
| Repeated source surprise | one style edit changes every card | shared JSX mutation | inspect repeat provenance; use literal record edit or agent change intentionally |
| Stale local code session | baseline revision/files changed elsewhere | local manifest points to older base | fetch current revision, compare and restart deliberately; server merge policy is unknown |
| Missing selected asset | short-lived `accessUrl` expires | downloaded `assets/selected/**` may still exist | use the local asset path before submit; never persist the expiring URL |
| Export does not run | zip/source builds differently in destination | Design revision remains valid | install exact dependencies, fix target integration and browser-test the destination |
| Repository round-trip drift | reconstructed canvas looks close but not exact | original repo is untouched | compare source app and Design side by side; preserve repo as authority |
| Figma “round trip” identity loss | editable layers return but components/variables/history do not | two independent editable artifacts | review pasted Figma structure; do not promise reverse sync |
| Guest expiry | guest token/project can no longer be saved | ephemeral Project may be inaccessible | sign up before expiry or start a new guest Project; do not claim recovery |

## Acceptance matrix

| Claim | Minimum evidence |
|---|---|
| Native generation completed | every requested Design exists, completed independently and renders on the intended Project canvas |
| Direct visual edit persisted | Done completed, a new revision exists, reload shows the change and interaction remains correct |
| External-agent source edit persisted | `code submit --wait` completed, returned revision is selected, build diagnostics are clean and canvas review passes |
| Exact revision exported | recorded component/revision ids plus `code context --revision` output from an empty staging directory |
| Design installed in app | real repository diff, dependency/import review, build/tests and browser parity at reference + responsive states |
| Repository imported faithfully | source foundation/dependencies inspected, new Design compared against original application and known mocks/gaps named |
| Figma export succeeded | actual pasted editable layer tree reviewed at intended frame size, not only clipboard success |
| Share succeeded | recipient-role test of the actual link and intended revision/interactions |
| Multi-agent request succeeded | each requested job/Design checked; one successful sibling does not cover a failed or missing job |
| Production delivery succeeded | destination repository/build/deployment and ordinary-user journey verified independently of MagicPath preview |

## Commit-level public adapter history

The official adapter repository makes the external-agent layer's evolution concrete:

| Date | Commit | What changed in the public contract |
|---|---|---|
| 2026-03-17 | [`63ee72c`](https://github.com/MagicPathAI/agent-skills/commit/63ee72cd8e00be32b64fdb125376422538b93a9a) | first MagicPath agent skill |
| 2026-04-02 | [`2f8fa85`](https://github.com/MagicPathAI/agent-skills/commit/2f8fa8550b39a0d1a4a12f5b8c6efafe5e57bc77) | current canvas selection support |
| 2026-04-22 | [`a551c8f`](https://github.com/MagicPathAI/agent-skills/commit/a551c8f17d7a466e3a882affae46f1fdcd745661) | external `code` command workflow |
| 2026-05-01 | [`7d60010`](https://github.com/MagicPathAI/agent-skills/commit/7d60010192d0af1296f6420c9265268c9c4b13b4) | explicit component revision instructions |
| 2026-05-14 | [`5558134`](https://github.com/MagicPathAI/agent-skills/commit/5558134512014a0b8a178d744747d869ffd34aad) | MagicPath 2.0 agent contract |
| 2026-05-27 | [`33d1091`](https://github.com/MagicPathAI/agent-skills/commit/33d1091590d524998fcc36a845759a47b3b34744) | Codex plugin packaging |
| 2026-05-30 | [`a7e58e6`](https://github.com/MagicPathAI/agent-skills/commit/a7e58e6ad6b4d1daf68a9adf01b9063769b95427) | repository-to-canvas workflow |
| 2026-06-26 | [`c4cd863`](https://github.com/MagicPathAI/agent-skills/commit/c4cd863155325c73ea29875a73fc82e737a2cc13) | revision-safe export and 1:1 local integration guidance |
| 2026-07-09 | [`d458fea`](https://github.com/MagicPathAI/agent-skills/commit/d458fea82406bfa24205244faed18c4690b48f55) | image generation/asset workflow |
| 2026-07-15 | [`a1ced96`](https://github.com/MagicPathAI/agent-skills/commit/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe) | current pinned merge; adapter `1.0.9`, paired with CLI `2.6.1` publication |

The product history also matters: public changelog records Mentions (2025-08-18), Libraries (2025-09-22), Editor V2 (2025-10-13), Web Capture (2025-10-30), Figma Connect (2026-01-19), Web-to-Design (2026-03-12), MagicPath 2.0 (2026-05-12), improved repository import (2026-05-30), importable design systems (2026-06-15) and native Skills (2026-06-18). Current architecture should not be projected backward onto earlier product versions.

## Fact, inference and unknown

| Status | Statement |
|---|---|
| Fact | A Design is generated React/TypeScript/Tailwind source rendered as an interactive hosted program. |
| Fact | Completed visual edits create a new Design revision; unsafe deterministic rewrites can automatically route through AI. |
| Fact | The shipped build injects file-path and element-id markers and returns a base-revision mutation manifest from the iframe. |
| Fact | External `code` sessions accept only a constrained file surface and use a local revision/hash manifest. |
| Fact | Repository→canvas is a scoped React reconstruction; MagicPath→repository is revision-pinned source acquisition plus agent integration. |
| Fact | Figma/web/sketch/image inputs normalize into new Design authority; exits create destination-owned forks. |
| Inference | The hosted compiler likely uses the source markers plus mutation/subtree evidence to patch or regenerate the affected React files; its exact AST transform is closed. |
| Inference | `baseRevisionId` and per-file `baseSha256` are intended to support stale-write/conflict checks; the server's actual policy is unpublished. |
| Inference | Liveblocks supplies at least active-room selection/presence semantics for the current adapter; it does not establish the entire canvas persistence model. |
| Unknown | Public MCP endpoint, protocol version and tool schemas; the current auditable adapter is skill + CLI. |
| Unknown | Project-wide snapshot/transaction semantics, variant branching and cross-Design rollback. |
| Unknown | Concurrent source-edit merge rules and audit log completeness. |
| Unknown | Marker stability across source refactors, build pipeline versions and imported designs. |
| Unknown | Lossless library/design-system propagation and dependency versioning. |
| Unknown | Native source schema, database/storage architecture, model prompts and server deployment topology. |

## Primary sources

### Product and ordinary-user behavior

- [MagicPath homepage](https://www.magicpath.ai/)
- [Documentation introduction](https://www.magicpath.ai/documentation)
- [Quick start](https://www.magicpath.ai/documentation/getting-started/quick-start)
- [First Design and version history](https://www.magicpath.ai/documentation/getting-started/first-component)
- [Canvas](https://www.magicpath.ai/documentation/features/canvas)
- [Chat and multi-agent dispatch](https://www.magicpath.ai/documentation/features/chat)
- [Visual editing](https://www.magicpath.ai/documentation/features/editing)
- [External agents](https://www.magicpath.ai/documentation/features/external-agents)
- [GitHub workflow](https://www.magicpath.ai/documentation/features/work-with-github)
- [Code export](https://www.magicpath.ai/documentation/features/code-export)
- [Figma Connect](https://www.magicpath.ai/documentation/features/figma-connect)
- [Figma export](https://www.magicpath.ai/documentation/features/figma-export)
- [Web-to-Design](https://www.magicpath.ai/documentation/features/web-to-design)
- [Sketchpad](https://www.magicpath.ai/documentation/features/sketchpad)
- [Design systems](https://www.magicpath.ai/documentation/design/design-systems)
- [Libraries](https://www.magicpath.ai/documentation/advanced/libraries)
- [Sharing Projects](https://www.magicpath.ai/documentation/collaboration/sharing)
- [Single-Design sharing](https://www.magicpath.ai/documentation/collaboration/public-sharing)
- [FAQ](https://www.magicpath.ai/documentation/help/faq)
- [Troubleshooting](https://www.magicpath.ai/documentation/help/troubleshooting)
- [Changelog](https://www.magicpath.ai/documentation/changelog/updates)
- [MagicPath 2.0 announcement](https://www.magicpath.ai/documentation/changelog/magicpath-2)
- [Repository workflow blog](https://www.magicpath.ai/blog/how-to-use-your-github-repository-in-magicpath)
- [Codex canvas blog](https://www.magicpath.ai/blog/magicpath-inside-codex)

### Public adapter, distribution and live runtime

- [Official agent repository at pinned commit](https://github.com/MagicPathAI/agent-skills/tree/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe)
- [Pinned MagicPath skill](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/skills/magicpath/SKILL.md)
- [Pinned CLI reference](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/skills/magicpath/references/cli-reference.md)
- [Pinned repository-import contract](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/skills/magicpath/references/working-with-repositories.md)
- [Pinned revision-safe local integration contract](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/skills/magicpath/references/using-magicpath-designs-in-local-code.md)
- [Pinned Codex plugin manifest](https://github.com/MagicPathAI/agent-skills/blob/a1ced96ad9da6c65d9f57d9fef79d944f7192dfe/.codex-plugin/plugin.json)
- [npm registry metadata for `magicpath-ai@2.6.1`](https://registry.npmjs.org/magicpath-ai/2.6.1)
- [Immutable npm tarball for `2.6.1`](https://registry.npmjs.org/magicpath-ai/-/magicpath-ai-2.6.1.tgz)
- [Official public rendered revision inspected 2026-08-11](https://api.magicpath.ai/components/293919797937311744/revision/294796990502563840)
- [Official public Design share inspected 2026-08-11](https://designs.magicpath.ai/v1/friendly-rock-7103)

### Legal

- [Privacy Policy](https://www.magicpath.ai/privacy)
- [Terms of Service](https://www.magicpath.ai/tos)

All live-product, pricing, package and rendered-runtime claims are snapshot-dated. Closed server implementation details remain unknown rather than being inferred from UI language.
