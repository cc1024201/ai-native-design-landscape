# Magic Patterns

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Magic Patterns / North Park Labs, Inc. |
| Category | Code-first AI product design, collaborative prototyping, design-system and engineering-handoff platform |
| Status | Active |
| Working authority | A Design's selected `activeArtifactId` owns its editable React file snapshot; Canvas, Design System and Inspiration documents are separate identity/version domains rather than alternate views of that same artifact |
| Public implementation | Hosted editor, collaboration service, compiler, renderer, AI workers, persistence and GitHub/Figma bridges are closed; official MIT agent plugins and a Magic Patterns-maintained MIT Storybook MCP fork expose client policy and one component-context edge |
| Evidence pin | [`agent-plugins@95423db`](https://github.com/magicpatterns/agent-plugins/tree/95423dbebeed508436bcedad8df39334f05b7f28); [`storybook-mcp@f79be1f`](https://github.com/magicpatterns/storybook-mcp/tree/f79be1f8cea6546905db521f20746a677efd7288); live documentation snapshot hashed on 2026-08-11 |

## Evidence pin: current behavior is documented, the hosted implementation is not

Magic Patterns publishes unusually detailed current product, MCP and REST contracts, but not the service that implements them. This dossier therefore pins three different evidence surfaces and does not collapse them into “open source.”

1. The live [documentation index](https://magicpatterns.mintlify.dev/docs/llms.txt) had SHA-256 `e6da012b559990fbe93446438d66421b260486e3bcd8138d6893950306169622` on 2026-08-11. The 30,324-byte [MCP tools page](https://magicpatterns.mintlify.dev/docs/documentation/features/mcp-server/available_tools.md) had SHA-256 `b0685ffdc71c7a301a690c3bc78d7b1466d00d6b62447c6aa25009c3abd80d3a`. These are mutable pages, so the hashes identify the text actually inspected.
2. The official [`agent-plugins`](https://github.com/magicpatterns/agent-plugins) repository was pinned at [`95423dbebeed508436bcedad8df39334f05b7f28`](https://github.com/magicpatterns/agent-plugins/commit/95423dbebeed508436bcedad8df39334f05b7f28). Its README says the repository is generated from an `agent-plugins/` directory in Magic Patterns' private monorepo. It packages skills and an MCP URL; it does not contain the remote MCP server, editor or compiler.
3. The official [`storybook-mcp`](https://github.com/magicpatterns/storybook-mcp) fork was pinned at [`f79be1f8cea6546905db521f20746a677efd7288`](https://github.com/magicpatterns/storybook-mcp/commit/f79be1f8cea6546905db521f20746a677efd7288). It exposes Storybook component manifests, documentation and source through MCP. Public product docs require Storybook or a custom MCP for some enterprise component-library onboarding, but no public source proves that this fork is the production ingestion path.

Both repositories carry MIT licenses. Their licenses do not apply to the absent hosted product.

The documentation index advertises [`openapi.yml`](https://magicpatterns.mintlify.dev/docs/openapi.yml) and [`openapi-v3.yml`](https://magicpatterns.mintlify.dev/docs/openapi-v3.yml); both returned HTTP 404 on 2026-08-11. Individual endpoint pages still embed route-scoped OpenAPI fragments. That makes the API behavior inspectable page by page, but prevents pinning one complete machine-readable current specification.

## Decisive architecture: one product, four artifact identities

Calling Magic Patterns a React generator hides the important boundary. Four native objects have different identifiers, mutation APIs, version rules and recovery paths.

| Native object | Concrete identity and contents | Mutation path | Durable meaning |
|---|---|---|---|
| Design | `editorId` plus one selected `activeArtifactId`; React/TypeScript files, compiled preview, routes, chat items and artifact-version timeline | prompt/Agent, Select + Visual Edit, code editor, MCP or REST whole-file writes | current active artifact is editable design/code truth; an older artifact is an addressable code snapshot, not automatically current or published |
| Canvas | Canvas id, screen/design nodes, spatial positions, text/image references and prototype links; share URLs can carry `nodeIds` | direct spatial editing, import/add Design, link a rendered trigger to another screen, multiplayer operations | organization and cross-screen flow truth; the child Design still owns each screen's code and version line |
| Design System | `designSystemId`, mutable active artifact, component/token/rule files, unpublished flag and immutable published `{major, minor}` versions | unified Design System Agent in the product; direct code authoring through MCP; linked-source import/review | reusable component/rule authority inside Magic Patterns; published versions can be rolled out to selected Designs, while linked upstream code remains an external authority |
| Inspiration document | `inspirationId`, stable share URL, optional baseline/repository context and independently addressable self-contained HTML variants | create placeholders, add/update one variant, read, or clear all variants | comparison artifact with in-place variant state; it does not use Design artifact ids or the Design version timeline |

Slide decks reuse the Design/artifact generation tools and add browser presentation plus PDF export. They do not establish a fifth general source model. Published sites, ZIPs, GitHub repositories, Figma layers and PDFs are delivery forks around the four native objects, not interchangeable backups of them.

## Ordinary journey: plan intent, change one active artifact, then promote a version

A normal product-team loop is:

1. Start a Design from a prompt, screenshot, Figma frame, template, existing Design or selected Design System. Every Design is a website, and a single Design can contain multiple real routes/pages.
2. For a material change, `/Plan` asks one to three multiple-choice questions, streams an editable Markdown plan and auto-saves it. No code is written until the user chooses **Build with Auto** or another model.
3. Agent generation changes the Design asynchronously. Select Mode can instead click a particular rendered element, add its context to chat and open Visual Edit for direct text/style/layout changes before **Save**.
4. The user verifies the actual route, modal, hidden state and interactions in Preview. Official troubleshooting explicitly warns that “no visible change” may mean the agent created an unlinked page, another route or a hidden state rather than doing nothing.
5. Every code snapshot remains available through version history. Previewing an old version is non-mutating; **Restore this version** creates a new latest version from it. Sending a prompt while previewing an old version requires confirmation first.
6. Teammates see chat, generations and preview updates live. Reviewers can anchor comments to rendered elements and group feedback by Design version.
7. A preview/editor link controls collaboration access. Since 2026-08-04 new Designs are private by default; public delivery requires explicitly publishing a selected version. The published URL, password, domain and metadata are a later release state.

This journey preserves a meaningful pre-write approval boundary through Plan and a non-destructive old-version inspection boundary. It does not make generation, comment resolution, public publication or any external repository one transaction.

### Fork and restore are intentionally different

Restoring an old version advances the same Design with a new latest artifact. Forking creates another independent Design, clears the prior chat context and can start from an exact older version. A Canvas-level **Fork Current Design** copies only that Design, not the whole Canvas. Cross-Design `@` references or pasted URLs let the agent semantically copy content; they do not merge two artifact histories.

## Code-first journey: clone an artifact, replace files, compile and activate

The current MCP and v3 REST surface exposes a second, explicit workflow:

```text
resolve editorId / create blank Design
  -> get current status or active artifact
  -> clone current artifact into a named new artifact
  -> read current files
  -> replace one or more whole files
  -> publish artifact
  -> inspect the compiled active preview
```

The important state transitions are:

- `create_design` without a prompt returns immediately with a blank `App.tsx`, `index.tsx`, `index.css` and `tailwind.config.js` scaffold.
- `create_new_artifact` / `POST /v3/designs/{editorId}/artifacts` clones a source artifact, immediately selects the clone as active and adds a named timeline entry. This is the recoverable working branch.
- `write_artifact_files` / `PATCH .../files` creates or replaces complete named files. Unmentioned files remain. The call saves source only; it does not compile or prove that Preview can run it.
- `publish_artifact` / `POST .../publish` compiles the complete artifact, makes it active in editor/preview and returns emitted file names. Compilation failure returns HTTP 422.
- version history returns artifact id, label, title and millisecond timestamp. The same artifact id can be read or used as the source for another clone.

The docs separately say clone creates a version entry and the MCP page says publish adds a timeline version. They do not specify whether a clone-followed-by-publish appears as one updated card or two user-visible entries. The public contract also has no documented file-delete operation, artifact-level base revision, idempotency key or atomic multi-call transaction.

### Collaboration is handled by freshness guidance, not a Design CAS

The service repeatedly tells clients to call `get_design_status` or `get_artifact` immediately before acting because another human or agent can change the active artifact. That is advisory freshness. Normal Design file writes carry an `artifactId`, but `publish_artifact` exposes no `expectedActiveArtifactId`, base revision or compare-and-swap field.

A plausible race is therefore public even though its internal resolution is not: client A clones artifact X; client B advances the Design to Y; client A later publishes its X-derived clone and the documented operation selects it as active. Artifact identity protects which file set A edits, but no published guard proves that A reviewed B's intervening change. The safe recovery is to re-read and fork again; the exact server conflict policy remains unknown.

## React files are authoring material; compiled Preview is a separate gate

The official integration skill gives the most concrete public description of default Design source:

- React 18 + TypeScript, usually Tailwind CSS v3;
- named component exports, shallow `components/`, `pages/` and `utils/` structure;
- `react-router-dom`, `lucide-react`, `framer-motion` and `recharts` where needed;
- hard-coded mock data, placeholder assets and local-state interaction stubs rather than production auth, APIs or backend behavior;
- a Vite wrapper in ZIP and GitHub exports;
- custom Design Systems or presets such as shadcn/ui, Chakra, Mantine and MUI can replace the default component/styling choices.

The official upload helper confirms that Magic Patterns can install dependencies declared for the prototype and compile a self-contained file set. Uploaded Markdown becomes `docs/*.md` inside the Design, so research/spec context can travel with later prompts.

The compiler, bundler, sandbox, dependency allowlist, cache, build isolation, generated source maps and preview deployment implementation are not public. `compiledFiles` is a build receipt, not proof of runtime behavior or production readiness. A successful hosted Preview is also not proof that external APIs, authentication, data writes, accessibility or responsive paths are correct.

## Canvas is a graph over Designs, not their code source of truth

Canvas is the bird's-eye multiplayer surface. It can spatially arrange Designs, import screens, carry text/image references, show shared cursors/selections and connect a clicked element in one screen to another screen. Playing the prototype opens a separate interactive window.

This is intentionally useful when one Design has become too large for the agent to manage as a multi-page site. It also creates a boundary:

- a Canvas screen/node can resolve to a Design `editorId`, but Canvas documentation does not expose its child's artifact id or source revision in every link edge;
- prototype links join screens at the Canvas layer and are not documented as durable `react-router-dom` source edits inside either Design;
- a selected Design can be forked without copying the rest of the Canvas;
- comments remain element-anchored review records and can be grouped by version; they are not source patches;
- live cursors and shared selections are presence, not conflict control for whole-file artifact writes.

The Canvas is therefore spatial/prototype orchestration around independently versioned React artifacts. A playable multi-screen flow is not by itself a single exported or deployable application codebase.

## Design System is a separate compiler and release line

Design Systems are not folders inside a Design artifact. They have a unified editor/chat, an active mutable artifact and their own published semantic versions. Product UI can ask the Design System Agent to add or edit one component, several components, tokens, typography, icons or system-wide rules. A publish modal can then upgrade selected existing Designs.

The MCP authoring workflow is deliberately different: the caller writes the code; Magic Patterns does not generate it in that workflow. Its file contract includes:

```text
components/<Name>/index.tsx
components/<Name>/<Name>.previews.tsx
components/<Name>/Context.md
index.css
tailwind.config.js
rules/<slug>.md
```

Components use named exports. Root shell/registry files are generated or stripped by the service. The API returns `artifactId`, persisted files and `hasUnpublishedChanges`.

### Mutable active artifact, guarded writes, strict immutable release

Design System writes have stronger public concurrency semantics than Design writes:

1. `get_design_system` returns the latest active artifact.
2. The caller reads the affected files.
3. `write_design_system_files` merges incoming whole files over preserved files, compiles and activates a new artifact immediately.
4. Passing the previously read id as `baseArtifactId` detects drift; a changed active artifact rejects the write with HTTP 409 so the caller can re-read and retry.
5. The write is permissive: `validationErrors` do not block activation, allowing an unpublished system to be built incrementally.
6. `publish_design_system` is strict and refuses while validation errors remain. It creates an immutable `{major, minor}` version; removed components/props are documented examples of changes that can cause a major bump, and the response explains compatibility.

This preserves the last published release while allowing an invalid active draft. The validation and compatibility algorithms, transaction scope across several files, server-side delete semantics and exact binding from a Design instance to a Design System version are closed.

### Component identity can be intentionally broken

Detaching a component creates a raw one-off instance that the agent can modify but severs future library updates. Converting a Design to another Design System does not rewrite the original in place: AI creates a new Design in another tab while leaving the original unchanged. These are explicit copy/fork operations, not live two-way bindings.

## Linked sources are normalization inputs, not the Design System database

Magic Patterns can seed a Design System from several source types:

| Source | Public ingest behavior | Identity that survives | Important loss or unknown |
|---|---|---|---|
| GitHub | read-only repository/folder link; scan and propose components, colors and tokens; branch/path URLs can preselect a folder | repository and selected folder remain recorded context | no public commit pin, refresh/diff merge protocol or writeback; generated Design System artifact is a normalized copy |
| Local code | upload `.zip`, `.tar.gz` or `.tgz`, choose folders, then scan/propose | uploaded archive/folder names as one-time source context | static snapshot; no subsequent repository identity |
| NPM/private registry | enterprise-guided React package plus Storybook or custom MCP documentation | package/import paths and component APIs can be retained in generated code | onboarding, credentials, exact package-version pin and refresh/promotion mechanics are not public |
| Figma `.fig` | parse default-mode colors, typography, spacing/sizing tokens and component variants into a reviewable plan | selected token/component concepts | embedded raster images are omitted, alternate variable modes are not split and high-volume values are ranked/capped |
| Figma selection/frame | convert one selected frame/component into code-first component or Design | visual/content intent | conversion is not guaranteed pixel-perfect and does not preserve native Figma node identity as the Design System version key |

Magic Patterns' Design System Agent announcement says linked sources continue to be referenced during iteration and that the representation is code-based. That supports grounded regeneration, not a claim that the Magic Patterns artifact is an exact mirror of an upstream repository revision.

## MCP and REST share concepts but expose uneven discovery surfaces

The remote MCP endpoint is `https://mcp.magicpatterns.com/mcp`. It supports OAuth in compatible clients and API-key authentication; an optional `x-mp-agent-name` header supplies UI attribution. The current v3 REST base is `https://api.magicpatterns.com/api/v3`, authenticated with `x-mp-api-key`. Product docs describe v3 as mirroring MCP endpoint-for-endpoint and sharing the same credit balance.

The discoverable documentation is nevertheless asymmetric:

- the REST index documents health, Design System listing, Design creation/status/prompt/history, active artifact, clone, file read/write and publish;
- the MCP page additionally documents Design System authoring, slide-deck creation and Inspiration-document mutation;
- the complete linked OpenAPI files are missing, so the additional REST routes—if present—cannot be verified from one published spec;
- the older v2 single-shot endpoint is deprecated.

Two generation calls are explicitly asynchronous: prompted Design creation and `send_prompt`. They return immediately; generation normally takes 2–10 minutes, and clients must poll Design-level `isGenerating` no more than once per 60 seconds. v3 has no webhook. Public docs expose neither a request-specific status endpoint, cancellation nor idempotency. The browser UI can queue and remove not-yet-started prompts, but no corresponding programmatic queue contract is documented.

API limits and failure behavior are concrete: 1,000 generations per ten hours per key; HTTP 402 when credit-consuming operations run out of credits while reads continue; 401/403 for authentication/access; 404 for absent Designs/artifacts; 422 for failed compilation.

### A separate read-only authority boundary

`https://mcp.magicpatterns.com/mcp/readonly` registers only listing, URL resolution, status/history and file/Design System/Inspiration reads. Creation, prompts, artifact cloning/writing/publishing, Design System writes/releases and Inspiration mutations are absent. This is a real least-authority deployment option rather than a prompt-level request not to edit.

It still exposes the authenticated user's accessible designs and source contents. OAuth/API-key storage, revocation and client logging remain responsibilities of the MCP client and Magic Patterns service; the public server implementation is unavailable for audit.

## GitHub means three different things

Three similarly named workflows must not be conflated.

### 1. Attach repository context to one Design

**Connect GitHub** on a Design grants read access, selects one or more folders and lets the agent ground generation in real components/styles. It does not write the repository and does not create a reusable Design System. A `/tree/<branch>/<path>` or `/blob/...` URL can preselect scope.

### 2. Link a repository as a Design System source

The Design System connector also reads selected folders, scans them and proposes native Magic Patterns components/tokens/rules. This creates a reusable normalized Design System lineage, not a branch in the source repository.

### 3. Sync a Design through a newly created repository

The paid **Sync with GitHub** exit installs a GitHub App and creates a new repository in a selected organization. The supported exported application is React + Vite. Later Magic Patterns changes can be pushed, and external changes can be pushed to GitHub then pulled back. Magic Patterns retains a Design version for GitHub pulls.

The round trip is explicitly lossy: the docs warn that inbound GitHub sync strips code the service considers unnecessary to keep the project compatible. There is no published existing-repository import, branch name, commit parent, force-push, merge/conflict, deletion, base-hash or failed-half recovery contract. “Two-way” therefore means two directions of normalized transfer, not arbitrary repository identity preservation.

## Local-code roundtrip is deliberately semantic in both directions

The public agent skills make the true handoff contract unusually explicit.

### Repository to Magic Patterns

`upload-to-magic-patterns` selects only the requested component/screen, recreates it as a self-contained React + TypeScript + Tailwind prototype in a temporary folder, strips live fetch/auth/environment dependencies into mock data, writes that file set into a blank Design and publishes it. It explicitly warns not to mirror the whole application or paste production code unchanged.

`prototype` then uses that faithful but reduced Design as a seed and calls asynchronous `send_prompt` for the creative change. Direct file writes are reserved for deterministic tweaks, not concept generation.

### Magic Patterns to repository

`integrate-magic-patterns-design` treats generated code as a high-fidelity design specification. Its golden rule is that the destination codebase wins. The receiving agent should replace prototype buttons/forms/routing/data/icons/tokens with existing application conventions and deliberately discard:

- Vite and Tailwind scaffolding;
- `canvas.manifest.js` and `useScreenInit.js` multi-screen plumbing;
- `_designSystem/`, preview/config/context helpers;
- `data-id` editor instrumentation;
- mock data and stub interactions.

This is good productionization policy precisely because it rejects source equality. A local application → hosted prototype → application journey has two semantic normalization steps and no reversible source identity.

## Figma import and export form another intentionally lossy pair

Figma copy/paste or URL import turns one frame at a time into an interactive code-first Design. Connected Dev/Full accounts can contribute richer Figma MCP context; lower account tiers can still import with less precision. Public docs explicitly say the result may not be pixel-perfect because the two systems have different models.

Export takes the opposite projection: it captures exactly the currently visible route, viewport and open/hover/modal state into static Figma layers. Layout and styling survive, but routing and interactivity do not. Exporting multiple states means manually presenting and capturing each state. There is no documented reverse binding from exported Figma nodes to the originating artifact/file/version.

## Target identity: enough for hosted editing, not a public source map

Select Mode can click a rendered button, text, image or other element; the product adds target “context” to chat and opens Visual Edit. Inline comments remain anchored when layout moves. The official outbound integration skill reveals `data-id` properties as editor instrumentation and `canvas.manifest.js` / `useScreenInit.js` as multi-screen plumbing.

Those facts establish a hosted rendered-element identity layer. They do **not** expose:

- the Select/Visual Edit payload schema;
- a source file, byte range, AST path or source map for the selected element;
- whether repeated component instances share or distinguish source identity;
- a base artifact/revision guard on direct Visual Edit save;
- how style, text, layout and structural changes choose deterministic rewrites versus an agent;
- whether comment anchors and editable target ids are the same identifier.

MCP code tools stop at artifact id plus whole file name/content. Canvas links stop at Canvas/screen/element behavior. Public source does not close the rendered node → exact source location → guarded write chain.

## Persistence is a set of clocks, not one undo stack

| State | Persistence / recovery contract | What it does not rewind |
|---|---|---|
| Plan | editable Markdown auto-saves before Build | no public relation to a later artifact id or Git commit |
| Design source | artifact snapshots with id/label/title/time; preview old, restore as a new latest, or fork | publication, Canvas, Design System, external data and GitHub are independent |
| Design chat/context | paginated user/assistant/app items; `/Clear` resets active context; fork resets context | source is read separately and code is omitted from message items |
| Canvas | multiplayer spatial graph, references and prototype links | child Design restore does not document Canvas-link rollback |
| Comments | element-anchored and version-groupable review records | not executable patches and not proven to follow a restored/forked source identity |
| Design System draft | active artifact can contain unpublished/invalid work | last immutable published release remains separate |
| Design System release | semantic version, compatibility result and selectable rollout to Designs | detached instances, upstream Git/NPM/Figma and already-forked code |
| Inspiration | stable URL and in-place variants; clear resets all concepts to placeholders | no public version history or per-update restore |
| Public site | selected Design version marked Live; can unpublish/change URL/domain/metadata | editor restore is not documented as automatic republish |
| GitHub sync | new repository plus Design versions on pulls | normalization, repo history, live site and hosted state are not atomically reversible |
| Figma/ZIP/PDF | point-in-time output | no reverse synchronization to native histories |

The durable question must therefore name the object: a restored Design, published Design System version, updated Inspiration link, Git commit and live website can all be “latest” at different times.

## Failure and recovery map

| Failure edge | Publicly established result | Recovery / remaining unknown |
|---|---|---|
| Prompt generation appears stuck | 2–10 minutes is normal; polling faster than 60 seconds is discouraged | poll Design-level status; no webhook, request-specific resume or public cancellation |
| Result is not visible | change may be on another route/page/modal or not linked | inspect routes/states or ask the agent to explain; completion alone is not visual acceptance |
| Collaborator changes active artifact | cached artifact id can stale between calls | re-read immediately; normal Design publish has no public CAS or semantic merge |
| Whole-file write is wrong | source is saved but not compiled | re-read/repair, then publish; atomicity of a multi-file write is not documented |
| Compile fails | publish returns 422 and new source is not proven visible | fix files and republish; compiler diagnostics/sandbox internals are closed |
| Design System drift | guarded write can return 409 | re-read active artifact and retry intentionally |
| Design System draft is invalid | permissive write activates it and returns `validationErrors`; strict publish refuses | repair draft while last published release remains immutable; compatibility algorithm is closed |
| Credits exhausted | write/generation calls return 402; reads continue | top up or stop; a failed response must not be assumed to roll back earlier calls |
| GitHub pull contains unsupported code | Magic Patterns strips code for compatibility | inspect both repository and new Design version; exact transform and conflict policy are closed |
| Figma projection loses behavior | export is a static current-state snapshot; import is code-first reconstruction | retain native originals and verify each destination independently |
| Inspiration replacement is too broad | `clear` resets every variant and associated iteration state before refill | read current document first; no published rollback/version history |
| Public viewer cannot open a new Design | new Designs are private by default | invite explicitly or publish the intended version; editor/preview/public URLs have different authority |

## Evolution: the product moved from chat generation to a federation of authoring surfaces

| Date | Public change | Architectural consequence |
|---|---|---|
| 2025-05-01 | “Chats” renamed Designs; “Projects” renamed Canvas | clarified code-bearing Design versus spatial multi-Design organization |
| 2025-12-03 to 2025-12-19 | Agent Mode, then remote MCP server | generation became a longer-running tool-using agent and gained an external control plane |
| 2026-01 | MCP OAuth, Canvas text nodes, queued prompts and general Visual Edit | added programmable auth, richer Canvas context, generation queueing and direct human mutation |
| 2026-02 | Presets migrated to Design Systems; new artifact/file MCP tools | reusable UI gained its own system-level authority while external agents gained code-first Design versions |
| 2026-03 to 2026-04 | Figma copy in/out, cross-Design references, open-folder Skills and Agent 2.0 | broadened normalized ingress/egress and moved repeatable agent behavior into distributable policy |
| 2026-05 | live multiplayer, Plan Mode, artifact-attached Markdown, cross-reference UI and API v3 | added collaborative concurrency, an explicit pre-write intent document and REST parity claims |
| 2026-06-10 | Design System Agent announced | made code-based components/tokens/rules a first-class separately versioned agent workspace |
| 2026-06-24 to 2026-07-20 | official public agent-plugin history added upload/integration/prototype/inspiration helpers | exposed the intended semantic roundtrip policy without exposing the remote service |
| 2026-07 | read-only GitHub context, `.fig` Design System import and in-Design system editing | joined external sources to generation while keeping source/read and native/write authorities distinct |
| 2026-08-04 to 2026-08-05 | Designs private by default; official Cursor plugin | changed the delivery default and packaged MCP + skills as the preferred coding-agent edge |

Model names are not a stable architecture pin. The current FAQ and later changelog already disagree because new Anthropic/OpenAI models were added after the FAQ copy. The durable mechanism is model routing behind Agent/Plan/skill surfaces, not one provider/version.

## Public source: policy and component context, not the hosted editor

### Generated official agent plugins

At `95423db`, Claude Code, Cursor and Codex packages point to the same remote MCP endpoint and carry equivalent workflow skills. The repository advertises four user-facing skills; two recreation helpers are also present for composition.

| Pinned path / commit | What it establishes | Boundary |
|---|---|---|
| [`README.md`](https://github.com/magicpatterns/agent-plugins/blob/95423dbebeed508436bcedad8df39334f05b7f28/README.md) and [Codex `.mcp.json`](https://github.com/magicpatterns/agent-plugins/blob/95423dbebeed508436bcedad8df39334f05b7f28/codex/.mcp.json) | generated-export provenance, packaging and `https://mcp.magicpatterns.com/mcp` | no server code, schema implementation or editor runtime |
| [`upload-to-magic-patterns`](https://github.com/magicpatterns/agent-plugins/blob/95423dbebeed508436bcedad8df39334f05b7f28/codex/skills/upload-to-magic-patterns/SKILL.md) | minimal self-contained port, blank Design, direct file write, compile/publish | an agent policy; service transaction semantics remain remote |
| [`prototype`](https://github.com/magicpatterns/agent-plugins/blob/95423dbebeed508436bcedad8df39334f05b7f28/codex/skills/prototype/SKILL.md) | seed first, then asynchronous creative prompt; direct writes only for precise tweaks | does not reveal model router, prompt compiler or artifact worker |
| [`integrate-magic-patterns-design`](https://github.com/magicpatterns/agent-plugins/blob/95423dbebeed508436bcedad8df39334f05b7f28/codex/skills/integrate-magic-patterns-design/SKILL.md) | prototype stack, discard list and destination-codebase-wins handoff | explicitly proves semantic adaptation rather than source identity |
| [`inspiration`](https://github.com/magicpatterns/agent-plugins/blob/95423dbebeed508436bcedad8df39334f05b7f28/codex/skills/inspiration/SKILL.md) | baseline + four independently streamed HTML variants, stable-link updates and destructive all-clear | client orchestration; hosted document store and renderer are closed |
| [`bac1685`](https://github.com/magicpatterns/agent-plugins/commit/bac168574457c9d8876eb918d4bf2d3babce2345) | initial three-client plugin export on 2026-06-24 | starting public policy snapshot |
| [`0a6252c`](https://github.com/magicpatterns/agent-plugins/commit/0a6252cb5d980b356576a990e1bb6671d14cd137) | added recreation helpers and substantially rewrote Inspiration/upload flows | shows workflow policy evolution, not hosted implementation evolution |
| [`09c411f`](https://github.com/magicpatterns/agent-plugins/commit/09c411f689368027bd39053cf9af168772ec1fef) | taught skills to reuse already-resolved thread context | client context/cost behavior changed independently of artifact protocols |
| [`95423db`](https://github.com/magicpatterns/agent-plugins/commit/95423dbebeed508436bcedad8df39334f05b7f28) | corrected Cursor marketplace schema | packaging fix, no product-runtime evidence |

### Storybook MCP fork

At `f79be1f`, `@magicpatterns/storybook-mcp@0.5.1` exposes component documentation from Storybook manifests. Magic Patterns-specific commit [`46e5b18`](https://github.com/magicpatterns/storybook-mcp/commit/46e5b18e1da2679aae8f95fb3c5ab66b93343f5c) added component source, design-guideline and token tools on top of the Storybook lineage.

The current [`read-component-code.ts`](https://github.com/magicpatterns/storybook-mcp/blob/f79be1f8cea6546905db521f20746a677efd7288/packages/mcp/src/tools/read-component-code.ts) resolves an input by component/story id, then prefers React docgen's source path, falls back to a sibling inferred from `*.stories.*`, and finally tries the story file. It can return code only when the embedding environment supplies `fileReader`. [`get-manifest.ts`](https://github.com/magicpatterns/storybook-mcp/blob/f79be1f8cea6546905db521f20746a677efd7288/packages/mcp/src/utils/get-manifest.ts) fetches component and optional docs manifests in parallel, validates them and supports multi-source results with per-source errors.

This code explains one possible component-knowledge mechanism and its failures—missing manifests, stale docgen paths, unavailable file reads, partial multi-source success. It does not prove how the hosted Design System Agent imports, caches, versions or authorizes a customer's Storybook.

## Reproducibility of this review

The two official repositories were cloned and inspected at the exact commits above. Relevant file SHA-256 values at those commits included:

- `agent-plugins/codex/skills/integrate-magic-patterns-design/SKILL.md`: `c39b5e6bafe83a8f0ff7c8a44a05ce0bdb11e2e5448b8c77263d0ca5f04fc806`;
- `agent-plugins/codex/skills/upload-to-magic-patterns/SKILL.md`: `ed6930e86059e10ecdd28b7d916845719821f75e64308dd2bd04b6c7fb4f8741`;
- `storybook-mcp/packages/mcp/src/tools/read-component-code.ts`: `927342e5ad20719a31298afe13c14d7fab893b641c7c088ccc32ff83e5245301`;
- `storybook-mcp/packages/mcp/src/utils/get-manifest.ts`: `e0ce4ab5bfeba379a2148428b2457faf522c92233b91e51f5619ca1fa08f48a3`.

No authenticated paid workspace, real Design, Design System, GitHub App sync, Figma account, custom domain or MCP mutation was used. Repository dependencies were not installed and tests were not run; source inspection was sufficient for the bounded client/helper claims. Hosted visual fidelity, multi-user races, compiler errors and delivery behavior were not independently exercised.

Key mutable documentation hashes in addition to the index/tools pins were:

- v3 getting started: `e20f80fc17967d7729a2ba7386ca85b4e98f81bf38aa9318c73426e7eae91047`;
- create Design: `8b3dbad19c41ddd612b8ab4b4dd5519b354565e7c6b7b1888b1d585d2483a4dc`;
- write artifact files: `f31cf736854e8276a020c706f6408390e7ca674efd8f5ae5b61ea489ba636481`;
- publish artifact: `bb5f6b7395be3dcdb3591d88e38b67a985762789f4129b1676ba63b2ff555382`;
- Connect GitHub read-only context: `995512465ad63f7c93adf16f55cd60c8a97a487bd4319d809a2c3c7a12453ea3`;
- GitHub two-way sync: `cd05269e01d77e6542c3c9d70e2a0a3fbddc031c3e22d45c95c0559aa382f325`;
- integration skill: `5441c8f3182756388bfe7b5b14c85474800685ae6b9c6fd3ca807bda9c0ef208`;
- changelog: `94b4e0a6aef6d0e8fa2b245691459229dd1d6e10c384ced1eaa61d1bc278c75b`.

## Evidence boundary and open questions

Established at Architecture-level:

- the four native artifact identities and their distinct public APIs;
- the active React artifact, clone/write/compile/publish workflow and Design version restore semantics;
- Canvas organization/prototyping versus child-Design code authority;
- Design System draft CAS, permissive validation and strict immutable release;
- read-only MCP authority, v3 polling/credit/error contract and documentation skew;
- three GitHub meanings, lossy Figma projections and intentionally semantic local-code handoff;
- public client policy, Storybook helper implementation and commit history.

Still unknown because no public implementation or contract closes the gap:

- hosted database schema, compiler/bundler/runtime isolation, model router, collaboration transport and storage topology;
- whether Design multi-file writes are atomic and how a stale `publish_artifact` races an intervening active artifact;
- Visual Edit's rendered-target packet, exact source rewrite algorithm and revision/conflict behavior;
- Design System compatibility analysis, upstream-source revision pinning, refresh merge and component-instance version binding;
- Canvas link serialization and its exact relationship to a child Design version/export;
- Inspiration mutation history, concurrency, access model and rollback;
- GitHub branch/commit/conflict/delete/partial-failure semantics and the exact inbound stripping transform;
- transactions, if any, across source artifact, chat, comments, Design System, external integrations, publication and delivery.

## Primary sources

### Product, Design and collaboration

- [Introduction](https://www.magicpatterns.com/docs/documentation/get-started/introduction)
- [How to Prompt, Select Mode and version restore](https://www.magicpatterns.com/docs/documentation/editor/how-to-prompt)
- [Plan Mode](https://www.magicpatterns.com/docs/documentation/editor/plan-mode)
- [Forking](https://www.magicpatterns.com/docs/documentation/editor/forking)
- [Merging and cross-Design references](https://www.magicpatterns.com/docs/documentation/editor/merging-designs)
- [Using the Canvas](https://www.magicpatterns.com/docs/documentation/projects/getting-started)
- [Canvas prototype links](https://www.magicpatterns.com/docs/documentation/projects/prototyping)
- [Live multiplayer](https://www.magicpatterns.com/docs/documentation/collaboration/live-multiplayer)
- [Inline comments](https://www.magicpatterns.com/docs/documentation/collaboration/inline-comments)
- [Sharing and publishing](https://www.magicpatterns.com/docs/documentation/editor/sharing)
- [Changelog](https://www.magicpatterns.com/docs/documentation/feature-releases/changelog)

### Programmatic interfaces

- [MCP overview, authentication and read-only endpoint](https://www.magicpatterns.com/docs/documentation/features/mcp-server/overview)
- [MCP tools and workflows](https://www.magicpatterns.com/docs/documentation/features/mcp-server/available_tools)
- [v3 API getting started](https://magicpatterns.mintlify.dev/docs/api/getting-started.md)
- [Create Design](https://magicpatterns.mintlify.dev/docs/api/create-design.md)
- [Design status](https://magicpatterns.mintlify.dev/docs/api/get-design-status.md)
- [Send prompt](https://magicpatterns.mintlify.dev/docs/api/send-prompt.md)
- [Version history](https://magicpatterns.mintlify.dev/docs/api/get-design-versions.md)
- [Create artifact](https://magicpatterns.mintlify.dev/docs/api/create-artifact.md)
- [Write artifact files](https://magicpatterns.mintlify.dev/docs/api/write-artifact-files.md)
- [Publish artifact](https://magicpatterns.mintlify.dev/docs/api/publish-artifact.md)

### Design Systems and source ingestion

- [Design System overview](https://www.magicpatterns.com/docs/documentation/design-systems/overview)
- [Components and Design System versioning](https://www.magicpatterns.com/docs/documentation/design-systems/editing/components)
- [GitHub Design System source](https://www.magicpatterns.com/docs/documentation/design-systems/importing/github)
- [Local-code Design System source](https://www.magicpatterns.com/docs/documentation/design-systems/importing/local-code-folder)
- [NPM and Storybook onboarding](https://www.magicpatterns.com/docs/documentation/design-systems/importing/npm-package)
- [Figma Design System import](https://www.magicpatterns.com/docs/documentation/design-systems/importing/figma)
- [Detaching components](https://www.magicpatterns.com/docs/documentation/design-systems/using/detaching-components)
- [Converting Design Systems](https://www.magicpatterns.com/docs/documentation/design-systems/using/converting-design-systems)
- [Introducing Design System Agent](https://www.magicpatterns.com/blog/introducing-design-system-agent)

### Handoff and delivery

- [Attach GitHub context to one Design](https://www.magicpatterns.com/docs/documentation/importing/connect-github)
- [Sync a Design with a new GitHub repository](https://www.magicpatterns.com/docs/documentation/get-started/sync-to-github)
- [Integration Skill](https://www.magicpatterns.com/docs/documentation/exporting/integration-skill)
- [Import from Figma](https://www.magicpatterns.com/docs/documentation/importing/import-from-figma)
- [Export to Figma](https://www.magicpatterns.com/docs/documentation/get-started/figma-plugin)
- [Download code](https://www.magicpatterns.com/docs/documentation/get-started/download-code)
- [Custom publish URL](https://www.magicpatterns.com/docs/documentation/publishing/publish-url)
- [Slide decks](https://www.magicpatterns.com/docs/documentation/slide-decks/overview)
