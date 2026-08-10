# Figma Make

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Figma |
| Category | AI app/prototype builder with a codebase-editing closed beta |
| Status | Active; hosted Make is generally available, while Make in a local codebase is a limited Mac-only closed beta |
| Product boundary in this dossier | The hosted prompt-to-code sandbox and the local-codebase beta share the Make name and visual editing language, but they have different source-of-truth, runtime, version and Git contracts |
| Core source availability | Closed; Figma publishes product/runtime documentation and a public MCP contract, not the Make editor, agent, renderer or target-to-source implementation |
| Decisive artifact question | Is the recoverable result a hosted Make code version, a published snapshot, an exported fork, or a real repository commit? |
| Evidence snapshot | Official product, Help Center, developer and release documentation observed on 2026-08-11; local-codebase behavior is recorded as closed beta, not projected onto ordinary hosted files |

## The shortest accurate description

Figma Make currently names **two different code-backed working regimes**.

The ordinary hosted product creates a Figma-owned React project from a prompt, a design, attachments or a Make kit. Chat, direct code edits and the current visual editing panel converge on that hosted project. Every code change becomes a Make version. The running preview is a projection of those files; it is not the source itself.

The limited local-codebase beta instead opens or clones a real Git repository, boots its development server from a committed `.figma/make` contract, lets Make's agent change the local files, and carries accepted work through branches, commits and pull requests. Here the repository and Git history—not a hosted Make version graph—are authoritative.

Most apparent “round trips” around those regimes are narrower than they look:

- a Figma Design frame conditions code generation but does not remain live-bound to the generated component tree;
- a hosted Make project can be pushed to GitHub, but later GitHub edits do not return and can be overwritten by the next push;
- a preview can be copied to Figma Design layers, but the copied layers are a destination-owned conversion rather than the hosted code project;
- an external coding agent can read Make project resources through Figma MCP, but the public MCP write tool does not mutate Make;
- a published `figma.site` is refreshed only when the author explicitly publishes an update;
- the local-codebase beta does advertise a Design-to-code return path, but its element/source identity and conflict protocol remain closed.

The project's defining architecture is therefore not “Figma canvas plus AI.” It is **two mutation authorities surrounded by several asynchronous, lossy or one-way edges**.

## Two regimes that must not be collapsed

| Question | Hosted Make project | Make in a local codebase |
|---|---|---|
| Availability | ordinary Figma Make product | limited closed beta; Figma Beta desktop app on Mac; waitlist access |
| Starting material | prompt, Figma design/component, Make kit, attachments, code or a template/remix | an existing local Git repository or a repository cloned from a supported provider |
| Working source of truth | Figma-hosted project files and their Make version graph | files in the selected local checkout plus Git branches and commits |
| Default runtime | Figma-hosted React 18/Vite-style project preview | the repository's own development server, started through `.figma/make` scripts |
| Change paths | chat, plan/build, direct code editing, properties and annotations | properties, annotations and chat against the rendered real application |
| Version model | every user or AI code change creates a numbered Make version; restore preserves later versions | prompts that change code create local commits; changes stay local until a branch is pushed and a PR is opened |
| Framework boundary | documented Make runtime centered on React/TSX, `App.tsx`, Vite and npm | any web framework/language in principle; React, Vue and Svelte are verified; backend, infrastructure, native mobile and non-web work are out of scope in beta |
| Delivery | share preview/file, publish, ZIP, one-way GitHub push, Design-layer copy, template/remix | push branch and create a GitHub PR; GitLab/Bitbucket have partial SSH support and no in-product PR creation |
| Recovery center | select/restore a Make code version; separately refresh published or exported destinations | inspect/revert Git commits and branches under the team's normal review process |

The same visible actions—select an element, change spacing, ask the agent, inspect a preview—do not imply the same underlying transaction in both columns.

## Hosted Make: the ordinary journey

An ordinary hosted project follows this loop:

1. **Create or remix a Make file.** Start from a prompt, template, Community project, Figma design context or an existing code idea.
2. **Supply context deliberately.** Attach frames, components, images, documents, datasets or code; add a Make kit for reusable package/style/guideline context; optionally connect remote MCP services or Supabase.
3. **Choose whether to plan.** Plan mode reads the prompt, current code and attached design/context, writes an editable `plan.md`, and waits for Build before it changes the application.
4. **Generate the project.** The agent creates or changes the hosted project files and shows work/status in chat.
5. **Run the preview.** The right-hand preview executes the current project and can be tested at different viewport dimensions.
6. **Refine through one of three controls.** Prompt semantically, edit existing code, or stage visual property/annotation changes in the current editing panel and click Apply.
7. **Inspect the resulting code version.** A code-changing user or AI action creates another version; preview, name, favorite and restore operate on that graph.
8. **Review with version-scoped comments.** A comment on a rendered element captures a screenshot and belongs to the current code version; only the latest version accepts new comments.
9. **Choose a destination.** Share the file or preview, publish to `figma.site`, push the hosted code to a Make-created GitHub repository, download a ZIP, or copy the current rendered state into Figma Design layers.
10. **Verify the destination independently.** None of those exits is a shared transaction with the hosted project. A later Make edit does not silently update all copies.

The user-visible loop is continuous, but its durability is not. Generation, preview, Make versions, comments, backend data, GitHub, Design layers and a published site each have a distinct clock.

## The hosted artifact is code, not a Figma Design document

### Project files

Figma's public code documentation describes the hosted result as a React application:

- TypeScript/TSX is the documented authoring surface;
- `App.tsx` is the default main component and can contain the whole application;
- the agent may create additional component files;
- `package.json` carries npm dependencies;
- public npm packages and Figma's private package registry are supported;
- Figma uses `esm.sh` to map packages into the browser-oriented runtime;
- the documented design-system package target is React 18 plus Vite compatibility.

This is a code project with a live renderer. It is not a Figma node graph with code pasted on top.

### File operations expose agent ownership

The lightweight code editor lets a user change existing files directly and download the project. Its limits reveal where the agent remains authoritative:

- users cannot manually create or delete files in the file explorer;
- they ask Make to create or remove files;
- files and folders can be dragged into the project;
- newly added files are not necessarily used until the user explicitly mentions them to the agent;
- importing an existing React implementation can cause the model to split or combine components differently from the source organization.

The filesystem is visible and editable, but the public product is not documented as a general-purpose IDE with deterministic file-structure preservation.

### Preview is an execution projection

The preview renders the current project and supports interactive/full-screen inspection. It can be stale or fail independently of the files:

- the Troubleshoot guide explicitly recommends Refresh when changes are not visible;
- unsupported packages or framework choices can prevent a usable render;
- a successful rendered frame does not establish responsive, state, accessibility or backend correctness;
- a preview share remains governed by Make file permissions, while a published website has a separate access model.

The acceptance invariant is:

`current hosted files/version -> fresh preview -> exercised user journey`

A chat completion or thumbnail is not enough.

## Plan, prompt, properties and code converge only after a write

### Plan mode is a gated artifact

Plan mode is not merely hidden chain-of-thought. It creates an editable `plan.md` after reading the project, prompt and available context. The user can revise that file and must choose Build before the plan becomes code changes.

That yields two separate facts:

- `plan.md` is a durable planning input inside the project;
- it is not an implementation until Build changes application files and a later preview verifies them.

Figma documents model-specific availability for plan mode, while the broader model picker has continued to change. The current release stream added GPT-5.6 in July 2026; model inventory should therefore be treated as snapshot evidence, not a stable artifact contract.

### The July 2026 editing panel stages intent

For newly created Make files, the current editing panel supports granular spacing, type, color and layout changes plus annotations. Those interactions **stack in chat**. The user reviews them and clicks Apply; only then does the agent apply the code changes, consuming the relevant AI work/credits.

This means the visible property panel is not documented as a deterministic CSS/AST editor. It is a structured intent collector whose durable result is the code version produced after Apply.

### Existing files can still have the old interface

Figma is rolling the new interface out to new Make files. Older files can retain the legacy point-and-edit experience. Old documentation and current documentation may therefore describe different controls without either proving a universal implementation.

For any behavioral audit, record all three:

1. file creation date/interface generation;
2. which control was used;
3. the resulting code diff/version and fresh preview.

Without that tuple, “direct edit works” is too broad to reproduce.

## Version history is the hosted recovery mechanism

Every user or AI code edit automatically creates a new Make version. The version surface can preview, name, favorite and restore a version. Restoring an older version does not delete versions that came after it.

That produces a branch-like historical graph from the user's perspective, but the public docs do not specify:

- a portable version object or patch format;
- atomicity between a code version and external backend data;
- optimistic-concurrency or merge behavior for simultaneous editors;
- whether every ancillary file-side effect shares one transaction;
- an API for exporting/importing the full version graph.

The safe claim is that Make exposes recoverable **hosted code versions**, not that it supplies Git-equivalent semantics.

### Comments belong to versions and screenshots

The current comments feature is still rolling out. When a reviewer points to an element, Make captures an image of the current state and associates the comment with the current code version. The comments panel separates the current version from other versions, and new comments can be added only to the latest version.

Consequences:

- a comment is review evidence, not a mutation;
- comment mode cannot simultaneously exercise the application interaction;
- the captured image can differ from the live state because of browser capture limitations;
- after code changes, an older comment remains historical rather than automatically retargeting to a new element;
- visitors to the separately published application cannot leave Make comments.

An older FAQ still says comments are unsupported. The newer dedicated comments documentation and rollout notice supersede that general statement for eligible files. This is documented product drift, not a reason to erase the rollout boundary.

## Design context is compiled input, not retained source identity

### Structured frames improve translation, not reversibility

A user can attach or paste a Figma Design frame/component and ask Make to preserve it exactly or use it as visual direction. Figma recommends structured frames and Auto Layout because they expose more useful design information than a screenshot.

The result is still a generated code interpretation:

- the agent chooses component/file decomposition;
- large or complex frames can be downgraded to image input;
- the public artifact contract does not retain a Figma node id on every generated DOM/React element;
- changes to the source Design frame do not automatically revise the Make code;
- changes to the Make code do not automatically revise the source frame.

Better structured input reduces ambiguity. It does not establish a live design/code binding.

### Attachment semantics matter

Attachments can include design frames, images, SVG, PDFs, Markdown, CSV/JSON, code, audio and video. Their roles differ:

- text/data/code can be read as context;
- images can be used as reference or embedded media;
- audio/video can be embedded but are not documented as content the model analyzes;
- Community assets can generate an `Attributions.md` obligation;
- large attachment sets can slow, freeze or crash the experience.

The current dedicated attachment article says up to 10 files per prompt and gives total-file limits by plan, while the current general Troubleshoot article still says three attachments per message. This official-doc conflict is left explicit. A production workflow should test the entitlement actually shown in its account rather than treating either number as timeless.

## Make kits project a design system through three different channels

A Make kit can combine:

1. **an npm package** containing executable production-aligned React components;
2. **variables and styles** extracted from a Figma Design library;
3. **guidelines** that tell the agent when and how to use those assets.

Those channels do not have equal fidelity.

### Code packages are executable dependencies

The package route can use a public npm package or Figma's private registry. Figma documents React 18 and Vite compatibility, unique package scopes, removal of workspace-only dependencies and limitations around dynamically generated import paths.

The package is both generation context and runtime supply chain. A package version change can therefore alter what the agent knows **and** what the preview executes.

### Figma library context is a CSS projection

The library route extracts supported variables/styles into a `styles.css`-like representation. Public guidance describes a simplified subset and raw values rather than preservation of every source variable expression. Updating the library context requires updating/re-adding the kit; manual guideline changes may need to be preserved.

Edits to this extracted CSS or its guidelines do not mutate the original Figma Design library. The kit is a projection, not the canonical library.

### Guidelines are behavioral policy, not schema enforcement

Guidelines live under documented files such as `guidelines/` and can explain composition and usage. Their order or precedence must be stated rather than assumed. The model can still choose an incorrect component or pattern, so verification must inspect the generated imports, props and behavior—not just visual resemblance.

### Kit updates and templates have different propagation

Published Make kit updates can notify downstream projects and be adopted. By contrast, updating a Make template does not update copies that were already created from it. A kit is reusable evolving context; a template/remix is a fork.

## Two MCP directions point opposite ways

“Figma Make supports MCP” hides two independent integrations.

| Direction | Client | Server/resource | Public authority | What it does not prove |
|---|---|---|---|---|
| Make agent outward | hosted Make agent | partner or custom remote MCP server | Make can call exposed read tools and, with permission, write tools against the external service | no transaction joins external data mutation to a Make code version or rollback |
| External coding agent inward | IDE/coding agent with Figma MCP resource support | Figma-hosted MCP and a Make project link/resource | agent can fetch the whole Make project or individual files as implementation context | no public Make mutation/writeback, no shared Git commit, no retained runtime element identity |

### In-product connectors are remote agent tools

Custom connectors must expose a public HTTPS endpoint. Localhost and stdio servers are not supported in the hosted product. Connector tools can read or write external systems:

- write tools are disabled by default;
- users can choose Ask, Always or Never per tool;
- explicit `@connector` references improve routing;
- Figma warns about prompt injection and untrusted servers;
- disabling a connector hides prior tool calls, but information already incorporated into the Make project is not automatically removed;
- disconnecting does not undo external writes;
- custom headers and shared connector configuration require careful secret handling.

The connector is an agent capability boundary, not part of the hosted code/version transaction.

### Figma MCP exposes Make as context

Figma's MCP documentation lets compatible external agents fetch Make project resources and use `get_design_context` on supported Figma Design or Make inputs. The agent then adapts that context to its own production codebase.

The important negative boundary is explicit in the public tool catalog: Figma's general `use_figma` write tool targets Figma Design, FigJam and Slides, not Make. The public Make integration is therefore a resource/context route, not a documented remote editing protocol for the hosted Make project.

## Supabase creates a second state authority

Hosted code can connect to Supabase for secrets, server-side compute and data. Figma's current setup automates a basic key-value store rather than exposing arbitrary SQL/schema management as a complete Make-native backend workflow.

The authority split is consequential:

- application code and Make versions live in the Figma project;
- database rows, authentication state, server functions and managed secrets live in Supabase;
- a Make version restore is not documented as a matching database restore;
- a published or previewed build can observe data that has changed independently of the selected code version;
- one Supabase organization is associated with a Figma organization or Professional team under the documented connection model.

Secrets should be entered through the secure secret UI and managed in Supabase, not pasted into prompts or client code. Public API calls from browser code expose any embedded secret to the client.

The minimum recoverable unit for a stateful Make app is therefore larger than the Make file: code version, backend configuration, schema/data migration state and deployed snapshot must be recorded separately.

## Every exit starts another clock

### Share and preview

Sharing the Make file or full-screen preview follows the file's permissions. It exposes the current hosted experience to collaborators, but it does not create a separately deployable source artifact.

### Publish to `figma.site`

Publishing creates a dedicated URL. Later Make changes do not appear there until an author explicitly chooses Update. Unpublishing removes the live site, and republishing can reuse the URL. Custom domains, metadata, analytics and injected head/body code add more deployment-owned state.

The published site is therefore a snapshot clock:

`selected Make state --publish/update--> current site`

Passwords and file/preview permissions are separate controls. Published visitors do not gain source or chat access merely by visiting the site.

### Push to GitHub from a hosted Make file

This integration is intentionally one-way:

- Make creates the repository; it cannot target an arbitrary existing repository;
- one Make file maps to one created repository;
- Make pushes only the default branch and does not manage branches;
- edits made directly in GitHub do not return to Make;
- the next Make push can overwrite those GitHub-side edits;
- the GitHub connection is team/organization-wide and limited to one linked account or organization under the documented model.

This is an export/mirror edge, not the local-codebase beta. A GitHub repository created from hosted Make does not turn hosted versions into Git roundtrip identity.

### Download ZIP

ZIP export materializes the current project files. An external editor can change them, but there is no automatic pushback. A user can manually paste code or describe changes in chat, which triggers another interpretation rather than a reversible synchronization protocol.

### Copy preview to Figma Design

Copy as Design converts the **current rendered state** into editable Figma Design layers. Pages or UI states must be copied separately, and runtime interaction does not survive as application behavior.

The destination has improved: Figma's 2026-07-16 release says copied code-backed screens now bind colors, type and spacing to most matching variables already in the destination file and produce more Auto Layout. That is stronger than the earlier hardcoded-layer conversion.

It remains a fork:

- the destination layers are disconnected from the hosted Make project;
- subsequent code changes do not automatically update them;
- destination edits do not automatically update hosted Make code;
- variable matching is described as “most,” not a lossless token/component reconstruction;
- application state and behavior are flattened to the copied state.

### Templates and Community remixes

Using a template or remix creates another Make file. Updating the source template does not update existing copies. Community attribution and republishing rules apply separately. These are lineage forks, not shared branches.

## The local-codebase beta replaces hosted versions with Git authority

The closed beta deserves its own model because it solves a different problem: changing an existing production repository rather than exporting a generated sandbox.

### Ordinary local-codebase journey

1. An eligible user opens the Mac Figma Beta desktop app.
2. They create a Make file, open a local repository folder or clone an authorized remote repository.
3. Make adds or reads `.figma/make` configuration and installs dependencies.
4. The configured development server starts locally and the real app loads in Make, including its real data/environment where available.
5. The user selects rendered elements for property edits, attaches annotations, or describes a change in chat.
6. The agent finds relevant code and updates the local checkout.
7. A prompt that changes code becomes a local Git commit; the user can inspect history and revert.
8. The user creates/switches a branch, pushes it, and—in the fully supported GitHub path—opens a PR for normal engineering review.

Nothing is merged or deployed automatically. That restraint is part of the safety contract.

### `.figma/make` is an executable repository interface

Each repository receives five files at the root under `.figma/make`:

| File | Role | When it runs |
|---|---|---|
| `setup` | install system dependencies/toolchains | first time Make sees the repository |
| `install` | install project packages/dependencies | start of every Make session |
| `dev` | start the development server | after install for a session |
| `verify` | wait for/check the server readiness | after the dev command |
| `env` | define environment values, mandatory `PORT` and `FIGMA_MAKE_URL`, optional bootstrap timeout | read when the session starts |

The first four operational files are documented as shell scripts, must return meaningful exit codes, and should be idempotent. Figma recommends committing the folder to `main` so every branch and teammate inherits the same bootstrap contract.

This is the most concrete public technical interface in the product. It also creates an explicit trust boundary: opening a repository can install dependencies and run repository-owned shell scripts on the local machine.

### Local source mapping is behaviorally strong and internally closed

The beta lets a user select a live element and adjust layout, color, font, spacing and related properties. Figma says the agent finds the relevant code and changes it. Annotations can ground interaction or multi-element requests, and copied screens can be edited in Figma Design and offered back to Make for application in code.

That establishes a product-level target-return behavior. It does **not** reveal:

- whether elements carry injected file/range/component metadata;
- whether the agent uses DOM structure, source maps, framework fibers, search or a combination;
- how HMR and a changing DOM invalidate a target;
- whether a copied Design layer retains a hidden code element identity;
- how repeated components, generated lists and shared style primitives are disambiguated;
- what revision guards a staged edit against concurrent file changes;
- how a return from Figma Design is reconciled with intervening commits.

The correct classification is strong closed-product source-return evidence, not a seventh source-inspected mapping mechanism in this repository's taxonomy.

### Git semantics are the recovery boundary

Figma documents these beta guarantees:

- changes remain on the local machine until pushed;
- a code-changing prompt is saved as a local commit;
- branches can be created and switched in Make;
- GitHub supports clone, branch push and PR creation;
- GitHub Enterprise Cloud is supported; GitHub Enterprise Server is not;
- GitLab and Bitbucket support SSH clone/push partially, but not in-product PR creation.

The public docs do not specify conflict resolution for several simultaneous chats, a commit-per-visual-panel-apply guarantee, rebase/merge strategy, dirty-worktree policy or atomic rollback of external processes. Those remain acceptance questions for the beta.

### Beta scope is deliberately narrow

The advertised use case is UI change to existing web screens:

- React, Vue and Svelte are verified, with other web stacks potentially usable;
- layout, component, spacing, color and design-frame implementation are in scope;
- backend/API work, infrastructure, native mobile, non-web code and major architectural refactors are not;
- very large repositories perform variably, and a narrower package/component repository can work better;
- an engineer may be needed for one-time repository bootstrap.

This is not general production-code autonomy hidden behind a design panel.

## Failure atlas

| Boundary | User-visible symptom | Mechanism established by public evidence | Recovery/acceptance check |
|---|---|---|---|
| Design input | output drifts or a large design behaves like an image | complex/large frames can be downgraded; generation interprets structure | reduce selection, use Auto Layout, state exact-vs-style intent, inspect code and multiple states |
| Attachments | conversion fails, context is ignored, UI freezes | format/size/plan limits and large context sets | reduce/convert attachments, mention imported files explicitly, verify current account limit |
| Generation context | later answers degrade | long chat history consumes context | clear chat context while preserving files, then restate current constraints |
| Hosted project file | AI chat becomes unavailable | a project file over 1 MB can block chat | shorten/delete the oversized file and verify project behavior afterward |
| Package/runtime | preview fails or generated framework is unsupported | dependency compatibility, CDN/import and framework limits | inspect `package.json`/imports, substitute supported packages, refresh and retest |
| Visual edit | staged values look right but source result is wrong | current properties/annotations route through Apply and the agent | review the new code version/diff and exercise a fresh preview |
| Preview | stale, blank or inconsistent output | renderer/runtime can fail independently of chat/files | Refresh, inspect runtime errors, test from a clean state |
| Version/comment | comment points at an old or visually different state | comments are version-scoped screenshots; only latest is commentable | open the associated version and reproduce the target state |
| Make kit | generated components/styles are stale or semantically wrong | package, CSS projection and guidelines update independently | pin package, refresh kit, inspect imported component/props and preserve guideline edits |
| Connector | unexpected external read/write or retained data | remote MCP tools have separate permissions; derived data survives disablement | use Ask for writes, inspect every tool, revoke externally, remove derived project data manually |
| Supabase | restored code reads incompatible/newer data | backend is a separate authority | pair code version with schema/data migration and secret configuration |
| Hosted GitHub push | GitHub edits disappear | next one-way Make push overwrites repository-side changes | treat GitHub as export, preserve external work elsewhere, compare before pushing |
| Published site | live URL is behind the editor | publishing requires explicit Update | publish/update deliberately and test the public URL, permissions, fonts and data |
| Design copy | layers are editable but behavior/linkage is gone | rendered-state conversion creates disconnected layers | verify variables/Auto Layout and treat later edits as a separate branch |
| Local beta setup | “Couldn't load preview” | missing/branch-local `.figma/make` config | commit the five-file contract to `main`, rerun setup and verify server health |
| Local beta bootstrap | unwanted temporary files are auto-committed | background build work can continue after initial readiness | wait 30–60 seconds on first setup, then inspect status before the first prompt |
| Local beta preview | wrong application appears | another dev server owns the configured port | stop the conflicting server or change `PORT`/`FIGMA_MAKE_URL` and verify process ownership |
| Local beta preview | blank/infinite loading | silent setup error, interactive startup prompt or race | run server in a terminal, make scripts non-interactive/idempotent, start a new session |
| Local beta Git | clone/auth/PR flow fails | provider and enterprise support differ; restricted login flows can fail | verify repository access and provider path before any mutation |
| Local beta scale | targeting/refactor quality degrades | very large repos and multi-file refactors exceed the panel's sweet spot | bind a narrower package, use explicit chat, review every commit and run repository tests |

## What survives each recovery action

| Recovery action | Hosted code | Make versions | Comments | Supabase data | GitHub/ZIP/Design copy | Published site | Local repository |
|---|---|---|---|---|---|---|---|
| Restore hosted Make version | selected code state changes | later versions remain | historical/version association remains | no documented rollback | no automatic update | no automatic update | not applicable |
| Clear chat context | project files remain | documented project versions remain | not documented as deleted | remains external | remains external | remains separately published | local beta conversation semantics not documented as equivalent |
| Duplicate/remix/template fork | copies current artifact under destination rules | full source history is not documented as shared | comment/history carryover must not be assumed | connection/data semantics require recheck | previous exits remain separate | previous URL remains separate | not the local-repo workflow |
| Re-push hosted Make to GitHub | hosted code unchanged | unchanged | unchanged | unchanged | default-branch export refreshed; external GitHub edits can be overwritten | unchanged | not a local-codebase branch push |
| Restore/revert local Git commit | not applicable to hosted project | not a Make-version operation | Make-file review context may persist separately | real app/backend remains separate | branch/PR reflects Git operation | production changes only through team's deployment | checkout becomes the reverted source state |

No single recovery button rewinds every column.

## Product evolution changed the artifact boundary

| Date | Official event | Architectural consequence |
|---|---|---|
| 2025-05-07 | Figma announced Make at Config 2025 as prompt-to-code from text or existing design | initial center was a Figma-hosted generated prototype/application |
| 2026-03/04 | Make kits and richer attachments began rolling out | design-system code, extracted style context and project documents became explicit generation inputs |
| 2026-05-28 | local-codebase capabilities launched in limited Mac closed beta | a second authority appeared: real local repositories, bootstrap scripts, Git commits, branches and PRs |
| 2026-07-09 | GPT-5.6 became selectable on all plans | model choice continued to move independently of the artifact contract |
| 2026-07-16 | code-backed screens copied to Design gained more variable binding and Auto Layout | the code-to-canvas fork became richer but did not become live synchronization |
| 2026-07-30 | the new hosted editing panel shipped for new Make files | granular property edits and annotations became staged chat intent followed by Apply/agent mutation; older files can remain on legacy controls |

Marketing language about one “source of truth” should be read against this evolution. In hosted Make, Figma owns the editable code/version center. In local-codebase Make, Git owns the implementation center. Between them sit conversions and handoffs, not one universal document.

## Facts, bounded inferences and unknowns

### Directly documented facts

- hosted Make creates and runs React/TSX code with `App.tsx`, npm dependencies and documented Vite/React 18 package expectations;
- code-changing user or AI edits create hosted versions, and restoring does not delete later versions;
- the new hosted visual editing panel stages changes in chat and Apply invokes the agent;
- comments capture rendered-state screenshots and are scoped to code versions;
- Make kits combine executable packages, extracted Figma styles/variables and agent guidelines;
- hosted GitHub push is one-way and can overwrite changes made on GitHub;
- Copy as Design produces disconnected destination layers, now with improved variable/Auto Layout recovery;
- the public Figma MCP path can expose Make resources to an external agent, while the documented Figma write tool does not list Make;
- local-codebase Make uses `.figma/make`, local dev servers, Git commits/branches and provider-specific PR workflows;
- local-codebase Make is a limited Mac-only closed beta at this snapshot.

### Bounded inferences

- the hosted code/version graph is the editing authority because all documented hosted mutation paths converge there and every exit requires a separate refresh/export;
- an attachment or Design frame is compiler-like context rather than a retained source binding because no public contract carries its node identity through generated files and later changes do not synchronize;
- Make kit library context is a projection rather than canonical design-system state because it is extracted into simplified CSS/guidelines and does not write back;
- the local-codebase preview is evidence over repository files, not a separate artifact, because the development server runs from the checkout and Git carries accepted changes;
- “visual editing” in both regimes is agent-mediated unless a public deterministic patch contract is later disclosed.

### Unknown or deliberately unresolved

- hosted project database schema, renderer isolation, agent orchestration and version storage format;
- exact DOM/design-target-to-source mapping in either hosted editing or the local beta;
- revision/conflict semantics for multiple editors, queued hosted prompts or parallel local chats;
- transaction boundaries across code versions, packages, connector writes and Supabase state;
- whether every local visual-panel change receives a standalone automatic commit;
- fidelity and identity protocol for the advertised local-beta Figma Design return path;
- full duplicate/remix carryover behavior for hosted version graphs, comments and backend connections;
- open-beta/GA timing, Windows support and future pricing for local-codebase Make.

These unknowns are product-core questions. Adjacent public MCP documentation and runtime contracts do not justify inventing their implementation.

## Architecture-level conclusion

Figma Make reaches the closed-source evidence boundary because its public contracts now establish the decisive architecture without exposing the proprietary core:

- **Hosted authority:** Figma-owned React project files plus automatic Make code versions.
- **Local beta authority:** a real checkout plus local Git commits, branches and PRs.
- **Human/agent convergence:** prompt, plan, code, properties and annotations eventually mutate one of those two authorities.
- **Runtime:** hosted preview for sandbox projects; repository-configured local development server for the beta.
- **Design-system grounding:** executable npm packages, a simplified library-style projection and natural-language guidelines.
- **External agent boundary:** read/context through Figma MCP; no documented public Make write tool.
- **Delivery:** multiple destination-specific snapshots/forks with independent refresh and recovery clocks.
- **Source return:** behaviorally claimed in the local beta, but identity representation, mapping algorithm and conflict guards remain closed.

The implementation is not Source-level. Official docs reveal interfaces and failure boundaries, not the editor/agent/runtime source or a commit-pinned target mapping.

## Acceptance checklist

### Hosted Make

- record whether the file uses the new or legacy editor;
- inspect the exact hosted files and selected version, not only chat output;
- refresh and exercise the real preview across required states and viewports;
- confirm attachment/kit/package versions and inspect actual imports/props;
- pair a restored code version with compatible Supabase schema/data/secrets;
- review connector permissions and external writes separately;
- verify the actual GitHub repository, ZIP, Design file or published URL after exit;
- repeat destination verification after every explicit update/export.

### Local-codebase beta

- verify the exact repository, branch, dirty state and remote before opening Make;
- review and commit the `.figma/make` scripts as executable project infrastructure;
- confirm the preview belongs to the expected dev-server process and port;
- wait for background bootstrap work, then inspect status before the first prompt;
- review every generated commit and the full repository diff;
- run project-native checks and exercise the ordinary-user journey from a clean reload;
- inspect repeated/shared components for unintended broad changes;
- push only the intended branch and rely on the team's normal PR/deployment gates;
- treat Make screenshots, annotations and chat completion as evidence, never as merge acceptance.

## Primary sources

All sources below are first-party Figma documentation or announcements. They establish public product behavior, not the undisclosed core implementation.

### Product and evolution

- [Figma Make product page](https://www.figma.com/make/)
- [Config 2025 launch announcement](https://www.figma.com/blog/config-2025-press-release/)
- [Config 2025 recap: Figma Make](https://www.figma.com/blog/config-2025-recap/)
- [Build with more context and control: Make kits and attachments](https://www.figma.com/blog/introducing-make-kits-and-make-attachments/)
- [Figma Make, now on your local code](https://www.figma.com/blog/figma-make-now-on-your-local-code/)
- [Figma release notes](https://www.figma.com/release-notes/)

### Hosted creation, editing, versions and review

- [Explore Figma Make](https://help.figma.com/hc/en-us/articles/31304412302231-Explore-Figma-Make)
- [Create a Figma Make file](https://help.figma.com/hc/en-us/articles/31304485164695-Create-a-Figma-Make-file)
- [Edit a Figma Make file](https://help.figma.com/hc/en-us/articles/42009840449175-Edit-a-Figma-Make-file)
- [Edit the code of a functional prototype or web app](https://help.figma.com/hc/en-us/articles/33649966245783-Edit-the-code-of-a-functional-prototype-or-web-app)
- [Use plan mode in Figma Make](https://help.figma.com/hc/en-us/articles/40830441709719-Use-plan-mode-in-Figma-Make)
- [Preview a functional prototype or web app](https://help.figma.com/hc/en-us/articles/31304548273047-Preview-a-functional-prototype-or-web-app)
- [Add comments in Figma Make](https://help.figma.com/hc/en-us/articles/38701587731735-Add-comments-in-Figma-Make)
- [Troubleshoot in Figma Make](https://help.figma.com/hc/en-us/articles/31304610458647-Troubleshoot-in-Figma-Make)
- [Figma Make FAQs](https://help.figma.com/hc/en-us/articles/31722591905559-Figma-Make-FAQs)

### Hosted code/runtime and design-system context

- [Code in Figma](https://developers.figma.com/docs/code/)
- [Introduction to Figma Make code](https://developers.figma.com/docs/code/intro-to-figma-make/)
- [Working with React](https://developers.figma.com/docs/code/working-with-react/)
- [Iterate code with AI](https://developers.figma.com/docs/code/iterate-your-code-with-ai/)
- [Working with npm](https://developers.figma.com/docs/code/working-with-npm/)
- [Use packages and third-party libraries](https://developers.figma.com/docs/code/use-packages-and-third-party-libraries/)
- [Fetch data from external APIs](https://developers.figma.com/docs/code/fetch-data-from-external-apis/)
- [Bring a design-system package](https://developers.figma.com/docs/code/bring-your-design-system-package/)
- [Write design-system guidelines](https://developers.figma.com/docs/code/write-design-system-guidelines/)
- [Get started with Make kits](https://help.figma.com/hc/en-us/articles/39241689698839-Get-started-with-Make-kits)
- [Attach files to Figma Make prompts](https://help.figma.com/hc/en-us/articles/31304529835671-Attach-files-to-a-prompt-in-the-Figma-agent-and-Figma-Make)

### MCP and backend boundaries

- [Figma MCP server overview](https://developers.figma.com/docs/figma-mcp-server/)
- [Bring Make context to an external agent](https://developers.figma.com/docs/figma-mcp-server/bringing-make-context-to-your-agent/)
- [Figma MCP tools and prompts](https://developers.figma.com/docs/figma-mcp-server/tools-and-prompts/)
- [Figma MCP versus the coding agent](https://developers.figma.com/docs/figma-mcp-server/mcp-vs-agent/)
- [Create and use custom MCP connectors in Figma Make](https://help.figma.com/hc/en-us/articles/38147204302743-Create-and-use-custom-MCP-connectors-in-Figma-Make)
- [Manage connectors in Figma Make](https://help.figma.com/hc/en-us/articles/36343926263703-Manage-connectors-in-Figma-Make)
- [Add a backend to a functional prototype or web app](https://help.figma.com/hc/en-us/articles/32640822050199-Add-a-backend-to-a-functional-prototype-or-web-app)

### Delivery and lineage

- [Push from Figma Make to GitHub](https://help.figma.com/hc/en-us/articles/35463818346647-Push-from-Figma-Make-to-GitHub)
- [Beyond the basics: using Figma Make](https://help.figma.com/hc/en-us/articles/35710574222487-Beyond-the-basics-Using-Figma-Make)
- [Copy a Figma Make preview as design layers](https://help.figma.com/hc/en-us/articles/35060759685015-Copy-a-Figma-Make-preview-as-design-layers)
- [Publish, update or unpublish a Figma Make file](https://help.figma.com/hc/en-us/articles/31304586129559-Publish-update-or-unpublish-a-Figma-Make-file)
- [Create and update a template in Figma Make](https://help.figma.com/hc/en-us/articles/34716344138519-Create-and-update-a-template-in-Figma-Make)
- [Remix a functional prototype or web app](https://help.figma.com/hc/en-us/articles/33681473825303-Remix-a-functional-prototype-or-web-app)

### Local-codebase closed beta

- [Make in your local codebase](https://help.figma.com/hc/en-us/articles/40775535020695-Make-in-your-local-codebase)
- [Make in your local codebase: setup, gotchas and troubleshooting](https://help.figma.com/hc/en-us/articles/40789739982871-Make-in-your-local-codebase-Setup-gotchas-and-troubleshooting)
