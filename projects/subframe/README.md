# Subframe

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Subframe |
| Category | AI-native UI design, design-system-to-code and prototyping |
| Status | Active |
| Working authority | Split: Subframe owns design-system components and hosted design artifacts; application code owns shipped pages; prototype code has a separate hosted history |
| Public implementation | Hosted editor, AI workers, deterministic code generator and MCP service are closed; developer docs, agent skills, CLI and React runtime wrappers are public |
| Evidence pin | Public repository [`658287f`](https://github.com/SubframeApp/subframe/tree/658287fbefd9103b59a08e055f5052e0e667b46d); `@subframe/cli@1.209.0`; `@subframe/core@1.155.0` distribution |

## Evidence pin: inspectable edges do not make the editor open source

The public repository was pinned at `658287fbefd9103b59a08e055f5052e0e667b46d` on 2026-08-11. It contains the documentation site, public Claude plugin/skills, starter kits, `@subframe/cli`, shared CLI types and `@subframe/core`. It does **not** contain the hosted editor, canonical design graph, AI workers, deterministic code generator or the implementation of `https://mcp.subframe.com/mcp`.

The distribution boundary needs two separate pins:

- [`@subframe/cli@1.209.0`](https://registry.npmjs.org/@subframe%2fcli/1.209.0) was published from reachable commit [`a6f0f72`](https://github.com/SubframeApp/subframe/commit/a6f0f7283e7beab2e7c5f3a03c285ef4982f7ad2). There are no CLI source changes between that commit and the pinned repository head. Its npm tarball contains two bundled JavaScript files, a README and manifest, but no source maps; the public Git tree is therefore the source audit surface.
- [`@subframe/core@1.155.0`](https://registry.npmjs.org/@subframe%2fcore/1.155.0) is newer than the public repository manifest, which remains at `1.153.0`. Its registry `gitHead`, `fd770d2a845c1b09c685a21f5004eba7239e1542`, is not reachable from the public Git server. The versioned tarball nevertheless includes TypeScript/TSX source and source maps, so the release is inspectable as a distribution but is not reproducible from a pinned public commit.

Both package manifests declare ISC. The repository has no root `LICENSE` and GitHub detects no repository-wide license, so the package declarations should not be projected onto the docs, skills or absent hosted implementation.

## Decisive architecture: three artifacts with three exit rules

Subframe should not be described as one round-trip “design becomes code” system. Its public contract deliberately separates three workflows:

1. **Components remain a Subframe-owned design system.** The CLI repeatedly materializes them into a repository through one-way sync.
2. **Pages are design/handoff artifacts.** They are copied, exported or fetched through MCP once, then application code is expected to diverge as business logic is added. The docs explicitly say shipped page code becomes source of truth.
3. **Prototype mode creates another React + Vite codebase.** Design changes enter it only through an explicit Apply action; prototype-code changes do not return to the designed pages.

That distinction is more consequential than whether all three surfaces happen to render React.

### Authority and artifact map

| Native object | What it contains | Normal exit | Authority after exit | Reverse edge |
|---|---|---|---|---|
| Project theme | color, typography, corner, shadow, font, dark-mode and responsive-breakpoint definitions | Tailwind 3 config or Tailwind 4 theme CSS during sync/export | Subframe while components remain synced; repository receives a projection | no supported code-to-theme sync |
| Component and instances | reusable presentational graph, variants, states, props, slots and design documents | CLI-generated component source plus an optional sync-disabled wrapper | Subframe remains visual/design-system truth; Git owns intentional wrapper logic | public docs call sync one-way; one experimental single-file push and a gated AI import are weaker ingress paths |
| Page in a flow | static screen composition, responsive states, annotations and prototype references | code copy/export or MCP-generated JSX | repository page becomes implementation truth after product logic is added | no page CLI sync; “import existing page” is screenshot/AI recreation, not identity-preserving reverse sync |
| Snippet | small reusable design fragment and document example | inserts into a design as a detached copy | inserted nodes are independent; snippet does not sync to code | no round trip |
| Click-through interaction | one trigger/action attached to an element | hosted preview | Subframe page/flow | separate from AI Prototype mode and not automatically supplied to it |
| AI prototype | separately generated React + Vite application and conversation versions | exact-version code inspect, ZIP download or shared latest prototype | prototype code/history, not page graph or repository | page changes require Apply; prototype edits cannot be extracted back into pages |
| Repository application | business logic, routing, data access and the reviewed component/page integration | Git commit, build and deployment | application repository | Subframe can provide fresh design context, but publishes no source-baseline merge protocol |

## Journey A: keep a component library synchronized without losing local work

The safe ordinary path is:

1. A designer establishes theme tokens and reusable components in Subframe.
2. A developer runs `init` in the intended package root. `.subframe/sync.json` records the generated directory, import alias, truncated project id, team id and CSS mode.
3. CLI `sync` requests generated component/theme/document files from the hosted service and writes them under the configured directory.
4. Product-specific logic belongs in the generated component's wrapper, normally `Component/index.tsx`, with `// @subframe/sync-disable` in any file that must survive future sync.
5. A developer reviews the real Git diff, runs the application and commits only after imports, responsive behavior and interactions work.

The one-way rule is explicit, but the public CLI makes its destructive scope more important than the UI wording suggests.

### What full sync actually does

The hosted `/api/cli/sync` endpoint returns file strings and metadata. The public client filters code-generation errors, builds an absolute path-to-content map, recursively enumerates **every file** under the configured sync directory and then:

- preserves a file if its content contains `@subframe/sync-disable` anywhere;
- skips a generated target when its bytes already match;
- on a full sync, removes every other writable file in that directory, including unrelated hand-written files not represented in the response;
- writes all returned files directly with `writeFile` after creating parent directories.

Deletion and writing each use `Promise.all`; there is no temp-directory swap, transaction, dry run, backup, server revision, expected-content hash or Git-baseline check. A filesystem failure can therefore leave a partially cleared and partially rewritten directory. A component-specific sync avoids the full clear, but that also permits stale generated files to remain.

The May 2026 component-directory migration adds another edge. A former flat `Button.tsx` becomes `Button/Button.tsx`, while `Button/index.tsx` is the wrapper. A sync-disabled flat file is moved to the new depth and retained, but the CLI only warns that its relative imports may now be wrong. Git is the practical review and recovery mechanism; Subframe history cannot rewind repository files.

### Configuration and authentication are CWD-sensitive

`.subframe/sync.json` is discovered relative to `process.cwd()`. In a monorepo, starting the CLI in the wrong package can select the wrong generated directory or fail to find configuration. The CLI rejects an explicit project id that disagrees with the local config, but the config has no repository URL, branch, commit or package-root identity.

CLI token resolution is `--auth-token`, then `SUBFRAME_AUTH_TOKEN`, then a team-keyed cached token or interactive prompt. Cached credentials live in an XDG application-data `com.subframe.cli/auth.json` variant, outside the repository. The inspected source writes JSON but does not add an explicit encryption or file-mode guarantee. These CLI bearer tokens are not accepted by the MCP server, which uses its own OAuth flow.

The 2026 automation work adds global `--yes`, `--non-interactive` and `--json` behavior, keeps machine JSON on stdout, sends human logs to stderr and fails non-zero instead of prompting in a non-TTY. That makes the CLI usable by agents and CI; it does not make full sync transactional.

## Journey B: export a page, then accept the fork

Pages are intentionally presentational. Subframe generates static React/Tailwind code with component imports and stubs, not API calls, routing, application state or domain logic. A developer can copy code, use Code inspect, or ask an external coding agent to fetch it through MCP and merge it into an existing implementation.

The docs describe that merge semantically—preserve existing functionality—but publish no baseline hash, diff format, AST mapping, conflict result or repository revision guard. After the feature ships, design and code may drift by design:

- the Subframe page remains useful for communication and future visual reference;
- application source is the durable implementation artifact;
- a later MCP request gives an agent fresh design code/context, but not a deterministic patch against the prior export;
- existing application code cannot be round-tripped into the same page graph. The documented “import a page” route takes a screenshot and uses AI to recreate it.

A correct-looking hosted page or MCP screenshot therefore does not prove the repository merge, business logic or deployed journey. Acceptance is a real application diff plus a rebuilt user path.

## Journey C: prototype behavior in a separate code world

Prototype mode takes designed screens and annotations and asks AI to create a separate React + Vite application. Its conversation can add behavior and features that do not exist in the presentational page graph.

The bridge is deliberately asymmetric:

- when page designs change, the prototype chat shows an explicit **Apply** step;
- prototype edits do not sync back to pages and cannot be extracted as page design;
- starting over regenerates from current screens/annotations;
- a prototype conversation can revert its own code versions;
- Code inspect and ZIP download expose an exact prototype version, while sharing exposes the current/latest prototype.

The public MCP surface is read-only for this artifact: `list_prototypes`, `get_prototype_info` and `read_prototype_file`. `get_prototype_info` returns a standalone runnable Vite projection after internal scaffold details are removed and Vite/Tailwind/entrypoint files are added. There is no public prototype-write MCP tool.

Manual click-through interactions are a fourth, smaller behavior system, not an alternate authoring UI for the same prototype. One element can have one click/hover/right-click interaction such as navigation, overlay, dropdown, popover, tooltip or context menu. The docs say those interactions are currently separate from Prototype mode and will only feed it automatically in the future.

## The hosted design graph and its mutation semantics

The public model exposes projects, flows, pages, page layouts, components, instances, snippets, theme, design documents, prototypes, conversations/jobs and version histories. The internal storage schema and renderer are closed, but several graph behaviors are observable and consequential.

### Components are references; snippets become copies

A component edit updates all Subframe instances. Props may be text, number, icon, image or slot; slots preserve composability and allow exported wrappers to inject nested UI and handlers. Interactive primitives rely on `@subframe/core`, a thin public layer over Radix primitives plus Recharts, calendar and utility code.

Deletion is type-dependent:

- custom components and most detachable primitives leave detached element copies;
- tightly coupled dropdown, select, dialog, drawer, chart, table and calendar instances are deleted;
- page-layout assignments are cleared;
- page/prototype references are removed.

Most deletion is not normal undo; recovery requires version history. Snippets behave differently again: inserting one detaches it immediately, so later snippet edits do not propagate and snippets never sync to code.

Cross-project component import brings nested components, tokens, fonts, icons and assets as dependencies. It is a copy into the destination project, not a shared cross-project identity. Existing destination components do not automatically satisfy or replace same-purpose source dependencies.

### Theme tokens retain identity until deletion

Theme changes autosave and apply across the project immediately. A token can be renamed safely because native references use token identity rather than display name. Deletion replaces every use with the token's current concrete value and detaches those references. Restoring only a theme version can revive the token definition without reattaching those already-materialized values; full project history is needed when the design references must also return.

Spacing remains Tailwind-default rather than a configurable token family. Custom named breakpoints and dark-mode values project into Tailwind 3 config or Tailwind 4 CSS, including max-width breakpoint variants. The visual Ask AI theme flow offers preview/Apply, while MCP `edit_theme` applies immediately and supports destructive deletion.

## AI generation is asynchronous promotion into the native graph

Ask AI does not merely return an image. Page generation can produce one to four real page variations; each successful variation lands independently in a flow as it completes. There is no required “select winner” promotion transaction, so all variants may remain as native pages. Quick edits use a different review model: up to three temporary variants plus Original appear for Keep/Discard, while a simple deterministic edit may return one result.

Project company context, existing designs, snippets, theme, components, documents and explicit `@` references condition generation. Public materials say this personalizes AI in the project and that customer designs are not used to train the service; they do not expose an internal model, retrieval index, memory schema or context-version pin.

Input routes normalize rather than preserve source identity:

- images can be uploaded and used as visual references;
- a Figma frame is copied as PNG and recreated by AI;
- a website URL contributes captured pixels plus content/copy;
- MCP design references may be native Subframe ids, raw code, or up to five Subframe-hosted image URLs. Arbitrary/local image URLs are rejected, and MCP has no image-upload tool;
- an invalid reference can be dropped with a warning instead of failing the whole request.

`sourcePageId` is stronger than a screenshot because generation begins from an existing native page structure, but it still creates new page results rather than a branch/merge relation exposed to clients.

### Jobs expose completion, not atomicity

`design_page`, `design_component` and `edit_component` return a live editor URL and `jobId`. `wait_for_jobs` accepts one to ten ids and reports `running`, `done`, `error` or `not_found`. Read tools can return empty or stale state until the job finishes. If progress stops for about ten minutes, the service reports `error` so polling terminates.

For multi-variation page generation, `done` means at least one usable page landed; the summary can report fewer pages than requested. Zero applied pages is an error. Because variations arrive independently, a failure can leave a useful prefix in the flow. Public docs do not specify idempotency keys, cancellation rollback, resume tokens, isolation from concurrent collaborators or an all-variations transaction.

AI component edits are also global graph writes. An edit propagates to all usages, and a second conversation attempting to edit the same component is directed to the already-running conversation. AI does not edit page layouts.

## MCP edits native nodes, not repository source

The remote MCP endpoint is `https://mcp.subframe.com/mcp` over HTTP with OAuth. Most read tools default to the first accessible project when `projectId` is omitted; the public skills add a safer convention to enumerate and ask when several projects are available.

The current documented surface groups as follows:

| Domain | Public tools | Mutation model |
|---|---|---|
| Discovery/auth/docs | `list_projects`, `generate_auth_token`, `get_project_info`, `search_docs` | discovery; generated CLI token remains separate from MCP OAuth |
| Pages | `list_pages`, `get_page_info`, `design_page`, `edit_page`, `screenshot_page`, `delete_page` | async generation; immediate node edit; destructive delete |
| Components | `list_components`, `get_component_info`, `screenshot_component`, `design_component`, `edit_component`, `delete_component` | async create/edit with project-wide instance effects |
| Snippets | `list_snippets`, `get_snippet_info`, `design_snippet`, `edit_snippet`, `delete_snippet` | synchronous create plus immediate node edits |
| Flows | `list_flows`, `get_flow_info`, `delete_flow` | flow delete can optionally cascade through child pages |
| Prototypes | `list_prototypes`, `get_prototype_info`, `read_prototype_file` | read-only projection |
| Design documents | `write_design_document` | project- or component-scoped documentation write |
| Theme/icons | `get_theme`, `edit_theme`, `search_icons` | natural-language theme edit is immediate |
| Jobs | `wait_for_jobs` | polling receipt, not an artifact transaction |

`get_page_info(includeNodeIds: true)` and its snippet equivalent add `data-node-id` to every element in generated Subframe JSX. `edit_page` addresses one of those ids with `replace`, `insert-above`, `insert-below` or `delete`. The submitted code must be one static Subframe-JSX root: hooks, state, conditionals, `.map`, `<html>/<body>`, event handlers and many data attributes are rejected or normalized. `appliedCode` returns the canonical parsed result with node ids retained, and warnings disclose normalization.

That is strong identity **inside the hosted graph**. It is not a source map:

- the id points to the native page/snippet node that the same service renders and mutates;
- exported repository JSX is a detached projection and receives no documented node-id/revision binding;
- no tool returns an application file, line, AST node, source map or repository commit;
- screenshot tools verify hosted rendering at a node/breakpoint/dark mode, not the external implementation;
- a coding agent updating an existing page performs a semantic merge, not a server-defined reverse patch.

Subframe therefore does not add another canvas-to-application-source return mechanism. It demonstrates a cleaner boundary: exact native graph identity can coexist with an intentionally forked repository artifact.

## Persistence is a set of clocks, not one version graph

Subframe autosaves hosted work and exposes project history plus page-, component- and theme-specific history. Project restore is documented to restore changes across pages, components, theme and other project modifications. Retention is currently 24 hours on Free, 7 days on Pro and longer on custom plans.

At least four clocks remain independent:

| Clock | What it can recover | What it does not recover publicly |
|---|---|---|
| Project/page/component/theme history | hosted design graph within retained snapshots | repository sync/copy output, Git, deployment, external business logic |
| Prototype conversation versions | generated prototype code in that conversation | source pages/components and repository application |
| Ask AI conversations/jobs | prompts, progress and generated native results visible across sessions | no documented immutable context bundle or transaction with version restore |
| Git/repository history | synced components, exported pages, wrapper logic and application behavior | hosted Subframe graph, prototype history or team state |

Public docs do not state immutable version ids, branching, collaborator conflict resolution, restore transaction boundaries, whether an export is bound to a particular snapshot, or whether project restore includes Ask AI conversation/prototype histories. Those are left unknown rather than inferred from autosave wording.

## Reverse-looking paths are imports, not a supported round trip

Three paths can look like code-to-design sync but have different semantics.

### AI recreation

Figma, screenshot, website and existing-code imports rebuild editable Subframe nodes from pixels/content or code context. They do not retain the source node ids, source revision, AST identity or an update channel. Re-import creates another normalized artifact.

### Experimental `push-component`

The public CLI registers `push-component` and labels it `[EXPERIMENTAL]`. It reads one file, extracts a component name only through `/export const (\w+) = /`, sends raw source plus optional `skipNormalize` to a closed endpoint and returns success/name. There is no baseline, diff, conflict result, local update, native component version or documented compatibility contract. It is an inspectable experimental ingress edge, not evidence that supported component sync is bidirectional.

### Gated bulk design-system import

The public bulk-import skill says to use the route only when explicitly requested and for enabled teams. A `.subframe/import-design-system.json` manifest names theme files plus component entrypoints, source and supporting files. The CLI reads them, enforces a 512 KB per-file check and a 50 MB serialized payload limit, uploads one JSON payload to a presigned URL and starts a hosted import session.

CLI success means “Import started.” The command returns a session id but exposes no polling/result receipt and does not prove that the AI import completed or preserved behavior. The skill describes the same underlying AI normalization used by incremental import. This is a batch ingestion job, not deterministic reverse sync.

## Public runtime and closed generation boundary

`@subframe/core` is intentionally small relative to the product. Its current distribution exports Radix-based checkbox, popover, tooltip, menus and related primitives; Subframe wrappers for progress, slider, select, dialog/drawer, charts, calendar, icons and utilities; Sonner; Recharts; Tailwind class merging; and React compatibility declarations. This package supplies target-application runtime behavior for generated components.

It does not contain the design graph, renderer, page/component generator, AI orchestration, MCP server or export merge logic. Likewise, the public CLI receives already-generated file strings from hosted APIs; it does not implement the claimed deterministic design-to-React projection. Public code establishes materialization and runtime edges, while the central compiler claim remains a closed product contract.

## Reproducibility check on Windows

The pinned public repository declares Node `^24` and npm `^11`. It was independently installed on Windows with Node 24.16.0/npm 11.13.0 using `npm ci --ignore-scripts`:

- CLI TypeScript checking passed;
- Core TypeScript checking passed;
- Core passed 1 file / 7 tests;
- CLI passed 24 of 29 tests, while 5 Tailwind-config snapshot tests failed because implementation output used Windows backslashes where committed snapshots expect POSIX separators.

This does not prove the generated hosted code compiler, which is absent. It does establish that the public CLI test surface is not currently platform-neutral at the pinned commit. The observed failures concern Tailwind config path injection, not the hosted sync response, and should not be generalized into an untested runtime failure.

## Evolution: public edges reveal the architecture becoming agent-addressable

| Date | Commit | Consequence |
|---|---|---|
| 2024-03-03 | [`975ae5a`](https://github.com/SubframeApp/subframe/commit/975ae5a6f35ae1c668b23e12c5cd961208e0bb1d) | opened the developer-tool repository rather than the hosted product core |
| 2025-11-19 | [`6fd4204`](https://github.com/SubframeApp/subframe/commit/6fd4204cec120e0d23da8c5853a1ed91d67178c8) | added the experimental single-component push edge |
| 2026-01-07 | [`8091c84`](https://github.com/SubframeApp/subframe/commit/8091c849003bb81696f5fcb6516be321f3b01c95) | developer-doc overhaul made the “components sync, pages export” authority split explicit |
| 2026-02-18 | [`77321d1`](https://github.com/SubframeApp/subframe/commit/77321d1d042979031f9ac5056fe50f4b5b3fe40f) | added asynchronous bulk design-system import to the CLI |
| 2026-05-26 | [`14d47d9`](https://github.com/SubframeApp/subframe/commit/14d47d94375d916a9c6b75fd4ac3c0d73452e8e0) | introduced component directories, generated/wrapper separation and migration behavior |
| 2026-06-16 | [`d78860d`](https://github.com/SubframeApp/subframe/commit/d78860dd7d45df29b92a22940ee905199d87f93d) | exposed read-only prototype tools through MCP docs |
| 2026-06-23 | [`f3d3f40`](https://github.com/SubframeApp/subframe/commit/f3d3f40e0ab95ec7252a6a6042973d83b472f743) | made CLI commands non-interactive/JSON-capable for agents and CI |
| 2026-06-30 | [`b6723ee`](https://github.com/SubframeApp/subframe/commit/b6723ee8a91c813b95bd141e705f89b9cd571ccf) | changed page/snippet editing to targeted node rewrites |
| 2026-07-17 | [`8c3c27a`](https://github.com/SubframeApp/subframe/commit/8c3c27a492a2c21add7ef3ec3f7e981cd13f4afd) | documented applied-code node ids and explicit job error/stall semantics |
| 2026-07-27 | [`a056108`](https://github.com/SubframeApp/subframe/commit/a05610888b9f873eec584aae45a53b1b443abdc3) | added component screenshot verification and multiple-image references |

The lineage is not a closed editor gradually becoming open source. The stable pattern is a closed hosted artifact service publishing increasingly precise read/write contracts, agent guidance and local materialization code around its boundary.

## Implementation evidence map

All Git paths below are pinned to `658287fbefd9103b59a08e055f5052e0e667b46d`.

| Concern | Pinned evidence | What it establishes |
|---|---|---|
| Repository/product boundary | [`README.md`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/README.md), [root `package.json`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/package.json) | public package scope, workspaces and Node/npm contract |
| Authority split | [`design-to-code.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/concepts/design-to-code.mdx), [`syncing-components.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/concepts/syncing-components.mdx), [`exporting-pages.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/concepts/exporting-pages.mdx) | components remain Subframe truth; page code intentionally forks |
| Deterministic output contract | [`code-generation.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/concepts/code-generation.mdx) | deterministic presentational React/Tailwind claim; compiler itself is absent |
| CLI protocol shapes | [`shared/types.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/shared/types.ts), [`api-endpoints.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/api-endpoints.ts) | generated file metadata and hosted CLI endpoints |
| Sync overwrite behavior | [`sync-components.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/sync-components.ts), [`utils/files.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/utils/files.ts) | recursive enumeration, marker preservation, full-directory clear and direct writes |
| Local config/auth | [`sync-settings.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/sync-settings.ts), [`access-token.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/access-token.ts), [`config.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/config.ts) | CWD config, token precedence and team-keyed cache |
| Agent/CI behavior | [`index.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/index.ts), [`interactive.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/interactive.ts), [`output.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/output/output.ts) | strict non-interactive path, stdout/stderr split and JSON result contract |
| Experimental reverse edge | [`push-component.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/push-component.ts) | raw one-file push, regex name extraction and experimental label |
| Bulk import | [`import.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/import.ts), [`import-manifest.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-cli/src/import-manifest.ts), [bulk-import skill](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/plugins/claude/subframe/skills/bulk-import/SKILL.md) | manifest resolution, size gates, presigned upload and asynchronous AI-import boundary |
| MCP tool contract | [`mcp-server.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/guides/mcp-server.mdx) | current tools, node ids, screenshot options, destructive effects and job polling |
| Agent operating policy | [`design/SKILL.md`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/plugins/claude/subframe/skills/design/SKILL.md), [`develop/SKILL.md`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/plugins/claude/subframe/skills/develop/SKILL.md) | component-first dependency waves, project disambiguation and verification conventions |
| Prototype split | [`prototype overview`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/learn/prototype-mode/overview.mdx), [`click-through prototypes`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/learn/prototype-mode/click-through-prototypes.mdx) | separate AI codebase, Apply boundary and unrelated manual interactions |
| Version behavior | [`version-history.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/learn/projects/version-history.mdx), [`pricing-and-plans.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/learn/admin/pricing-and-plans.mdx) | autosave/restore scope and retention windows |
| Theme detachment | [`customizing-theme.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/learn/theme/customizing-theme.mdx), [`exporting-theme.mdx`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/docs/learn/theme/exporting-theme.mdx) | immediate project-wide changes, deletion/detach and Tailwind projection |
| Target runtime | [`subframe-core/src/index.ts`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-core/src/index.ts), [`subframe-core/package.json`](https://github.com/SubframeApp/subframe/blob/658287fbefd9103b59a08e055f5052e0e667b46d/packages/subframe-core/package.json) | public runtime wrapper scope at repository version 1.153.0 |

## Failure and recovery map

| Break | User-visible consequence | Recovery / evidence boundary |
|---|---|---|
| Full CLI sync pointed at a mixed-use directory | unrelated writable files are removed before generated writes finish | keep generated output isolated, mark intentional wrapper files, review Git diff and recover from Git; there is no CLI dry run/rollback |
| Filesystem error during clear/write | partial old/new generated directory | rerun only after inspecting the directory and Git state; the operation has no transaction or receipt |
| Component-specific sync after deletions/renames | stale generated files can continue resolving | periodically review a controlled full sync in an isolated directory |
| Component-directory migration | moved sync-disabled wrapper has broken relative imports | follow the emitted warning, repair imports and render-test before commit |
| CLI launched from wrong monorepo directory | missing/wrong `.subframe` config or unintended output root | run from the intended package root and verify project id/directory before sync |
| Hosted code-generation error for some components | valid subset writes while failed definitions are only warned | treat success as partial, inspect warning list and resulting Git diff |
| Page design exported into an existing implementation | agent can overwrite business logic or preserve the wrong behavior | require application diff, tests and ordinary-user runtime verification; hosted screenshot is insufficient |
| Invalid MCP design reference | reference may be dropped while the job continues | inspect warnings and final landed pages, not only job `done` |
| Multi-variation job partially fails | fewer native pages than requested remain in the flow | read job summary/list pages; delete unwanted partials explicitly or restore hosted history |
| Immediate `edit_page`/`edit_theme` or forced delete | native graph changes before an external review/commit step | screenshot/read back; use retained version history for recovery, noting token detach semantics |
| Token deleted then only theme restored | token definition returns while usages remain concrete/detached | restore an appropriate whole-project snapshot when references must return |
| Prototype looks correct | source pages and repository app remain unchanged | Apply page updates explicitly; separately inspect/download prototype or implement behavior in application source |
| Experimental push or bulk import reports success | raw file accepted or import merely started; native result may normalize/fail | inspect the hosted component/project and version history; no CLI round-trip receipt exists |
| Windows contributor test run | five CLI path snapshots fail despite successful types/Core tests | treat cross-platform CLI validation as incomplete; do not rewrite snapshots as product acceptance |

## Evidence boundary and open questions

Established from official docs, public source and versioned distributions:

- Subframe has a deliberate component/page/prototype authority split, not a universal round trip.
- native page/snippet node ids support precise hosted edits but stop at the hosted graph boundary.
- component CLI sync is one-way and full sync has a source-confirmed recursive deletion/partial-write risk.
- deterministic code generation is a public product contract; the generator implementation is not public.
- experimental push and gated bulk import are weaker, normalization-oriented ingress paths.
- hosted history, prototype history and Git are separate recovery systems.
- the current Core distribution is inspectable but not tied to a reachable public commit.

Not established publicly at this snapshot:

- the canonical hosted graph/database schema, renderer, deterministic compiler algorithm or AI model/orchestration stack;
- immutable version ids, branch/merge semantics, collaborator conflict handling or job idempotency/cancellation transactions;
- a repository baseline, AST/source-map marker, revision guard or deterministic page merge protocol;
- whether project restore includes AI conversations, job records or prototype history;
- how generated/exported code is bound to a specific hosted snapshot;
- the security/encryption guarantees for cached CLI tokens beyond the inspected JSON path;
- completion, failure receipt and native identity mapping for bulk AI import;
- why `@subframe/core@1.155.0` was published from an unreachable Git object and whether its public-source lineage will be restored.

## Primary sources

- [Subframe product site](https://www.subframe.com/)
- [Subframe documentation](https://docs.subframe.com/)
- [Public developer repository](https://github.com/SubframeApp/subframe)
- [Pinned public repository commit](https://github.com/SubframeApp/subframe/tree/658287fbefd9103b59a08e055f5052e0e667b46d)
- [CLI 1.209.0 registry metadata](https://registry.npmjs.org/@subframe%2fcli/1.209.0)
- [Core 1.155.0 registry metadata](https://registry.npmjs.org/@subframe%2fcore/1.155.0)
- [Remote MCP endpoint](https://mcp.subframe.com/mcp)
