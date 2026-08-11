# GitHub Spark

> Research status: **Architecture-level / closed-source boundary reached; official template source and MIT SDK distributions inspected** · Last reviewed: **2026-08-11**

| Field | Verified value |
|---|---|
| Product / operator | GitHub Spark, operated by GitHub |
| Lifecycle at this snapshot | **Transitioning / export window**: since 2026-08-04 Spark accepts no new users and permits no new apps; existing users may continue using existing apps, and GitHub instructs them to create a repository before 2026-08-31 |
| Public end date | No complete shutdown date for already-created apps is stated in the inspected official documentation |
| Historical category | Hosted prompt-, visual- and code-driven full-stack application builder with managed data, authentication, inference and deployment |
| Ordinary user now | An existing Spark owner preserving code and reconstructing dependencies outside the hosted Workbench, not a new app creator |
| Generated application | An opinionated TypeScript / React application using the Spark SDK and runtime contracts |
| Portable code authority | A newly created private GitHub repository whose `main` branch synchronizes two ways with Spark |
| Separate hosted authorities | Workbench versions, Codespace filesystem, deployed Azure Container Apps revision, Cosmos DB data, inference service and publish access settings |
| Public source inspected | [`github/spark-template`](https://github.com/github/spark-template/tree/8f859fd0f9d868bc5b09eb6564ec7d31916eb009) at `8f859fd0f9d868bc5b09eb6564ec7d31916eb009`, tag `v0.46.15`, MIT; 120 commits |
| Public package inspected | `@github/spark@0.46.15` plus the template lockfile's `@github/spark@0.43.1`, both MIT npm distributions |
| Closed boundary | Workbench UI and version store, generating agent, `spark-designer`, source-save/reconciliation logic, file synchronizer, managed KV/DB servers, Git synchronizer, authentication, inference routing, deployment and publish control planes |
| Evidence snapshot | Current official docs/changelog, pinned official template, registry metadata and unpacked SDK distributions; no Spark, repository, Codespace, data store or deployment was mutated |

## The shortest accurate description now

At the 2026-08-11 snapshot, GitHub Spark is no longer an open-ended app builder. It is a hosted system in a forced transition: existing owners still have a Workbench and running apps, but the documented preservation path is to create a GitHub repository before 2026-08-31.

That repository is a source-code exit, not a complete Spark backup:

```text
existing Spark
  ├─ Workbench iterations / current generated source
  │    ├─ live development preview
  │    └─ synced Codespace
  │
  ├─ newly created private repository
  │    └─ main <-> Spark current source + prior Spark commits
  │
  ├─ explicitly published Azure Container Apps revision
  ├─ Azure Cosmos DB key-value data
  ├─ app access + data-access policy
  └─ hosted LLM inference contract

repository export preserves the code lane
but does not atomically capture the other four hosted lanes
```

A prior Workbench version, a repository commit, a deployed revision, a database state and a successful model response are different facts. No public contract snapshots or restores them as one release.

## What an existing owner should preserve before 2026-08-31

The immediate user journey now outranks historical feature exploration:

1. Open every existing app's Workbench and use **… → Create repository** before the documented deadline.
2. Confirm where GitHub created the private repository. The default is the owner's personal account, but an organization administrator can force repository creation into the organization.
3. Clone it independently, fetch `main`, inspect the complete commit graph and verify that pre-repository Spark changes are present. Do not treat a success toast as repository evidence.
4. Run the checked-out project with the documented `npm run dev` path and produce a clean build. Record the Node/package lock versions and every dependency on `@github/spark`, `window.spark`, `/_spark/*` or generated AI prompts.
5. Inventory the hosted capabilities that Git cannot carry: KV/collection data, GitHub-auth assumptions, publish visibility, data-access setting, secrets, LLM calls, the current public URL and the exact deployed version.
6. Design and execute a separate data migration. The inspected public documentation exposes a Data tab and application APIs but no repository export that includes Cosmos rows.
7. Replace or directly validate every generated AI path. GitHub Models was fully retired on 2026-07-30, while current Spark documentation still describes it as the app inference provider.
8. Deploy the reconstructed application on an independently controlled runtime, exercise the real ordinary-user journey and verify authentication, data, permissions, error states and model behavior.
9. Keep the Spark deployment only as migration evidence until the replacement's source commit, data cutoff and public release are all recorded.

This is a preservation checklist, not proof that a repository-only Spark is portable. The public template can build a static application/proxy shell, but the managed services behind `/_spark/*` remain separate.

## The historical build journey explains what must now be separated

Before the transition notice, the documented ordinary path was:

1. Describe an app in natural language, optionally attach a Markdown brief, image, mock, sketch or screenshot, then start generation.
2. Spark generates a TypeScript / React app and opens a live interactive preview.
3. Iterate by prompt, select a suggested task or invoke **Fix All** for detected errors.
4. Refine visually by targeting a rendered element, changing its controls, editing theme tokens or adding assets.
5. Open the code tree for direct edits with Copilot completions, or open the synced GitHub Codespace and use Copilot modes there.
6. Inspect and edit KV values through the Data tab; inspect and edit generated AI prompts through the Prompts tab.
7. Publish explicitly, choose audience and separately choose read or write data access, then verify the deployed site.
8. Create a private repository for collaboration, history and standard GitHub workflows.

The loop combined a simple surface with plural authorities. Generation completion only unlocked Preview. A healthy Preview did not prove the published revision, shared data safety or inference availability. Repository creation came late in the tutorial even though it is now the required exit.

## Six clocks, none of them a complete backup

| Clock / object | How it advances | What is durable there | What it does not prove or restore |
|---|---|---|---|
| Workbench iteration graph | Prompt, visual request, code edit, Codespace sync or Restore | Hosted current source and prior visible versions | Exact backing store and transaction semantics are closed; no public end date guarantees future access |
| Codespace filesystem | Workbench/file synchronizer and direct development edits | Current cloud-development files while the Codespace exists | A dirty filesystem is not necessarily a repository commit, deployment or data snapshot |
| Repository `main` | Create repository, Spark two-way sync, direct commits and merged pull requests | Portable source and the documented full Spark commit history | Only `main` is documented as live-synced; code does not include KV rows, access settings or a deployed revision |
| Published app | Explicit Publish action | One managed revision deployed to Azure Container Apps; UI can identify which version is live | Later Workbench/Git changes need not be deployed, and publish is not a database backup |
| Cosmos DB KV store | Application writes, Data-panel edits and generated features | Shared hosted application records | Repository revert and Workbench Restore do not document a corresponding data rewind |
| Inference service | Generated `spark.llm` / `/_spark/llm` calls | No user-owned model state is established by public source | GitHub Models retired before this snapshot; public evidence gives no replacement or migration contract |

Publish also stores visibility and data-access choices, but those are an authorization plane rather than source. Private, organization-wide and all-GitHub-user visibility are distinct from read versus write access to the shared app data.

## The public template is an orchestration shell around closed services

The official [`github/spark-template`](https://github.com/github/spark-template/tree/8f859fd0f9d868bc5b09eb6564ec7d31916eb009) is genuine product-adjacent source, but it is not the Workbench or hosted runtime implementation.

### Generated project anatomy

At pinned commit `8f859fd0f9d868bc5b09eb6564ec7d31916eb009`:

- the app uses React 19, TypeScript, Vite 7.3.5, Tailwind CSS 4 and a broad Radix/component dependency set;
- [`vite.config.ts`](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/vite.config.ts) installs the Spark Vite plugin and a Phosphor icon-import proxy;
- [`src/main.tsx`](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/src/main.tsx) imports `@github/spark/spark` before rendering the app;
- [`src/vite-end.d.ts`](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/src/vite-end.d.ts) declares injected `GITHUB_RUNTIME_PERMANENT_NAME` and `BASE_KV_SERVICE_URL` globals;
- [`spark.meta.json`](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/spark.meta.json) contains only `templateVersion: 1`, not an app export manifest;
- [`package.json`](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/package.json) accepts `@github/spark >=0.43.1 <1`, while the pinned lockfile resolves `0.43.1` rather than the repository tag's matching `0.46.15` package.

The repository tag, package semver range and installed lock version therefore describe three related but non-identical versions. A migration must inspect the exported app's actual lockfile instead of assuming the newest SDK.

### Codespace boot reveals the missing platform pieces

The pinned [devcontainer](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/.devcontainer/devcontainer.json) requests Node 22 on Bookworm, 32 GB storage, 8 GB memory and four CPUs. Its startup scripts then:

1. query the repository's **latest** GitHub Release at boot;
2. download the first release asset and install an SDK, CLI and service bundle from it;
3. run Vite, `spark-server`, `spark-designer`, `spark-file-syncer` on port 13000 and a static preview under Supervisor;
4. optionally hydrate `/workspaces/spark-template` from `SNAPSHOT_SAS_URL` with AzCopy;
5. set Git reflog expiry to 500 years;
6. symlink a packaged post-commit hook and run a static-preview build.

The [Supervisor configuration](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/.devcontainer/spark.conf) names those services, but their implementation is delivered in the release bundle rather than the tracked template. [`refreshTools.sh`](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/.devcontainer/refreshTools.sh) selects a mutable “latest” release instead of pinning one asset hash. Consequently, a pinned template commit alone cannot reproduce the original Workbench runtime.

The template's [`.gitignore`](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/.gitignore) excludes `.spark-workbench-id`, `.file-manifest`, `.devcontainer/` and installed `packages`. A created application repository preserves app code, but several Workbench-local identities and runtime materials are deliberately outside ordinary Git content.

## Visual editing uses build-time coordinates, then crosses a closed save boundary

The MIT `@github/spark` distribution exposes a concrete target-return path for development mode:

```text
.tsx / .jsx source
  -> Vite pre-transform in serve mode
  -> source start/end attributes on rendered JSX
  -> React-internal preview selection
  -> structured element packet to parent Workbench
  -> transient DOM text / class / token update
  -> closed spark-designer + source reconciliation
  -> source file / Workbench version / optional Git main sync
```

### Build-time tag injection

`sparkVitePlugin()` enables its agent notifier, source tagger, heartbeat and designer host only when `SPARK_WORKBENCH_ID` is present. The `tag-source` plugin is a pre-transform applied only during Vite `serve` and only to `.tsx` and `.jsx` files. It parses with Recast and a Babel TypeScript parser, then adds:

| Source case | Injected development attribute | Meaning |
|---|---|---|
| JSX outside a path containing `components` | `data-loc`, `data-loc-end` | repository-relative `file:startLine:startColumn` and end coordinate |
| JSX in a path containing `components` | `data-component-loc`, `data-component-loc-end` | component-file start and end coordinate instead of the ordinary `data-loc` pair |
| Element with any direct `JSXExpressionContainer` child | `data-dynamic="true"` | conservative non-direct-edit marker; this includes more than repeated lists |
| Named `@phosphor-icons/react` import rendered as JSX | `data-icon` | imported icon name |

The code assumes `/workspaces/spark-template` as its source root, with `SPARK_DIR` only as a test override. Files outside the two transformed extensions, parser failures, uninstrumented runtime DOM and non-React nodes cannot produce the same location packet.

### Preview selection packet

The injected designer host requires a private React `__reactFiber*` field on the selected DOM element and reads `__reactProps*`. Its outgoing payload contains:

- rendered tag/component type;
- component start/end file, line and column when present;
- ordinary element start/end file, line and column when present;
- primitive React props, excluding a few instrumentation/children fields;
- `instanceCount`;
- bounding rectangle;
- whether the text is directly editable;
- current text and class string.

Non-dynamic nodes whose direct React child is a string become `contentEditable`; on blur the host sends an element-updated event. Component overlays are purple and ordinary element overlays blue. Keyboard overlay buttons provide an alternate selection path.

Incoming Workbench messages can optimistically change a CSS custom property, set a style property or replace/append a class on every DOM element with a matching `data-loc`. These operations change the development DOM. The SDK does **not** contain the durable source rewrite that must make the change survive refresh; the named `spark-designer` service and Workbench are closed.

### Important inspected edge cases

- `data-dynamic` is set for any direct JSX expression child, so the editability guard is deliberately broader than “this came from a loop.”
- files under any path containing the substring `components` receive component coordinates but no ordinary `data-loc`; the exposed token/class update handlers address only `data-loc`.
- `instanceCount` splits `data-loc` on `:` and interpolates the resulting array into an attribute selector. JavaScript stringifies that array with commas, while the actual attribute uses colons. The inspected `0.43.1` and `0.46.15` bundles both contain this code, so the field is likely zero for normally tagged elements; this code-level defect was not confirmed in a live Workbench.
- parent/child bridge calls use `postMessage(..., '*')`, and the receiver handles `event.data` without validating origin or source. These plugins are gated to the development Workbench path and are not evidence of the production site's messaging boundary.
- no public field carries a Git blob SHA, baseline source hash, AST node id or Workbench revision. Exact patch conflict handling and repeated-instance disambiguation remain closed.

This is deterministic target return from rendered React to development source coordinates. It is not proof that every visual action is saved deterministically or that those coordinates survive concurrent source edits.

## Data is a shared hosted authority, not a repository file

Official documentation identifies the store as Azure Cosmos DB exposed as a managed key-value service. The combined key and payload must be less than 512 KB or the app receives HTTP 413. By default, one published app's store is shared across all its users.

The public SDK sharpens that contract:

- `KVClient` lists keys and performs encoded-key GET, POST and DELETE requests below `/_spark/kv`; collections are passed as a query parameter;
- values are JSON encoded inside text responses/bodies;
- `getOrSetKey` first reads, then posts with `X-Spark-Initial: true`; whether the closed server makes competing initializations atomic is unknown;
- delete sends the Workbench deletion event without checking the HTTP status;
- in development, update/delete events are posted to the parent so the Data panel can refresh;
- `useKV` changes local React state optimistically and does not await `setKey` or `deleteKey`; its functional updater derives from local component state, not a server revision;
- the document wrapper generates ULID ids and applies Zod schemas, but an update is a read–merge–write without a visible compare-and-swap token;
- collection query, sorting and limit are applied client-side after `getAll`; fetching a collection error is caught and returned as `[]`, which can resemble a legitimately empty store.

The SDK exposes convenience semantics, not the Cosmos implementation. It publishes no record version, transaction, conflict policy, pagination contract or bulk export. Two app clients can overwrite one another's read–modify–write result, and a UI success can precede server failure when an optimistic hook ignores the returned promise.

Publish-time “read access” prevents other users from creating, editing or deleting app content through the hosted app policy. It does not turn the shared store into per-user data, copy the rows into Git or document a database restore point.

## The generated runtime is only partly portable

The inspected Vite plugin defines `BASE_KV_SERVICE_URL` as `/_spark/kv`, injects the runtime name and a random development session id, serves on port 5000, and configures:

- `/_spark/llm` → `https://models.github.ai/inference/chat/completions` during development, authenticated with `GITHUB_TOKEN`;
- every other `/_spark/{service}` → GitHub API `/runtime/{app}/{service}`;
- a build plugin that emits `proxy.js` and a small package manifest;
- a production proxy that serves the static single-page application and `/_spark/status`.

The emitted proxy does not implement the authenticated KV, DB, user or model services. Those endpoints remain GitHub-hosted platform contracts. Running the repository locally can prove that the front end compiles; it cannot by itself reproduce the historical published app.

The SDK's agent plugin is similarly narrow: it watches Vite build activity and posts build-started, success or failure events to a local agent server with bounded retries. It is not the generating Spark agent, its prompt policy or source writer.

## GitHub Models retirement creates an unresolved runtime contradiction

Four official/public facts coexist at the snapshot:

1. [GitHub Models was fully retired on 2026-07-30](https://github.blog/changelog/2026-07-01-github-models-is-being-fully-retired-on-july-30-2026/), including its playground, catalog, inference API and BYOK endpoints for existing customers.
2. Current [Spark concepts](https://docs.github.com/en/copilot/concepts/spark) and the [build tutorial](https://docs.github.com/en/copilot/tutorials/spark/build-apps-with-spark) still say generated AI features use GitHub Models and that publishing includes LLM inference.
3. `@github/spark@0.46.15`, published before retirement, marks `spark.llm` deprecated and says calls will stop after the Models retirement.
4. The same package's development proxy still sends `/_spark/llm` to the retired Models inference endpoint.

No inspected official Spark page or SDK declares a replacement provider or automatic migration. It would be too strong to claim that every already-deployed AI app is broken without exercising one, because the closed hosted runtime could route differently from the public development plugin. It is equally unsafe to trust the current tutorial. Every existing AI-dependent Spark therefore needs direct live verification and an explicit replacement plan.

The Spark **builder agent** uses GitHub Copilot infrastructure and is a different system from a generated application's `spark.llm` call. Copilot availability does not repair an exported app's inference endpoint.

## Repository creation moves code authority, but only on `main`

The official repository contract is specific:

- **Create repository** creates a new private repository, personal by default unless an organization policy redirects creation;
- it adds all changes made before repository creation, giving the repository a commit record since the Spark began;
- Spark and the repository's `main` branch synchronize in both directions;
- Codespace changes also automatically return to Spark;
- issues, pull requests, Actions, Dependabot and Copilot cloud agent can operate after repository creation.

Only `main` is documented as the two-way synchronized branch. Work on another branch becomes Spark state only when the intended changes reach `main`; an unmerged pull request is not the Workbench's current app. Conversely, a Workbench change can move `main` without publishing a new ACA revision.

The 2025-09-05 changelog added a visible deployed-version indicator and Restore button, while later release notes mention work to prevent manual commits from being lost. Those are evidence that multiple code clocks caused real product friction; they do not publish a cross-clock transaction or conflict algorithm.

For the current exit, the repository's remote commit graph is stronger preservation evidence than a Workbench-only version. It still needs a separate dependency/data/deployment migration record.

## Publish governs deployment and access, not source history

Publishing is explicit. The user selects:

- private visibility;
- visibility to one GitHub organization; or
- visibility to all GitHub users, subject to administrator restrictions;

and separately chooses read or write access to app data. The app link is described as undiscoverable except to people who receive it, but eligible viewers still authenticate with GitHub. A rename changes the generated URL while GitHub reroutes the older URL.

All Sparks are documented as deployed on Azure Container Apps. The UI can indicate that Workbench iterations have advanced beyond the deployed state. Thus a current repository commit, visible Workbench preview and public URL may legitimately show three different revisions.

There is no public deployment export, ACA configuration bundle or guarantee that repository creation recreates the managed URL. The export deadline should therefore trigger an independent deployment, not merely a Git mirror.

## Failure and recovery map

| Break | User-visible symptom | What survives | Evidence-bounded recovery |
|---|---|---|---|
| Repository not created by deadline | App code remains only in a time-bounded hosted Workbench | Existing app may still open today; future access duration is unstated | Create and independently clone the repository before 2026-08-31 |
| GitHub Models dependency | AI action errors or stops responding after retirement | Source and non-AI UI may remain | Find `spark.llm` / `/_spark/llm`, choose a supported provider and verify the full deployed path |
| Safari preview incompatibility | “Live preview is interrupted” and reconnect prompts | Source is not necessarily damaged | Use Chrome, Edge or Firefox, then retest rather than editing source blindly |
| KV entry exceeds 512 KB combined | HTTP 413 | Smaller records remain | Split or reduce the record; verify persisted data, not only optimistic UI |
| External library conflicts with Spark stack | Workbench or local build fails | Prior source/version or Git commit | Revert/repair dependency and run a clean build; compatibility is not guaranteed |
| Visual DOM patch is not durably reconciled | Preview appears changed, refresh/source does not | Original source and perhaps Workbench version | Inspect source/Git diff after the action; the SDK's DOM update is not save proof |
| Source changes after element selection | Coordinate targets a stale line or different expression | Current files and old selection packet | Reselect on a rebuilt preview; closed saver conflict behavior cannot be assumed |
| Repeated instance count miscomputed | Scope indicator may show zero even for repeats | Location attributes remain | Review every rendered instance and resulting diff; treat code defect as unconfirmed until live-tested |
| Concurrent KV document writes | One user's update silently replaces another | Last server value | Add application-level versioning/transactions in the replacement store; SDK exposes no CAS |
| Collection read fails | SDK returns `[]`, resembling an empty collection | Original server data may still exist | Distinguish fetch/log errors from true empty state before writing replacement data |
| Work lives only on a non-`main` branch | Spark Preview does not reflect it | Git branch/PR | Review and merge the intended commit to `main`, then confirm Workbench sync separately |
| Workbench Restore or Git revert is used as release recovery | Source rewinds while deployment/data do not | Each independent clock | Record and restore code, deployment and data explicitly; no atomic rollback is documented |
| Repository builds but managed calls fail | Static UI loads; `/_spark/*` requests fail | Portable front-end source | Replace or reproduce auth, KV/DB and inference services before declaring migration complete |

## Acceptance gate for a preserved Spark

An existing app is not preserved merely because GitHub created a repository. The minimum evidence is:

- remote repository URL, owner and visibility recorded;
- `main` cloned at an exact commit with the expected historical graph;
- clean dependency install and production build outside the Workbench;
- all `@github/spark`, `window.spark`, `/_spark/*`, auth and AI dependencies inventoried;
- KV/collection data counted, exported through an app-specific path and reconciled in the replacement store;
- read/write and audience policy recreated intentionally;
- model calls migrated and verified after 2026-07-30;
- an independently deployed URL exercised through the ordinary user journey;
- loading, empty, error, auth and concurrent-update paths checked;
- old and new deployment versions, migration cutoff and rollback plan recorded.

The evidence snapshot for this dossier did not have access to an existing Spark, so none of those app-specific acceptance items is claimed as completed here.

## Product and implementation chronology

### Product lifecycle

| Date | Public event | Architectural consequence |
|---|---|---|
| 2025-07-23 | Public preview for Copilot Pro+ | Prompt, visual and code editing shipped with managed data, inference, auth, hosting and repository creation |
| 2025-08-06 | Reliability, seed-data and iteration improvements | Generated-data initialization and Workbench iteration were still active stabilization areas |
| 2025-09-05 | Organization sharing, `npm run dev`, deployed-version indicator and visible Restore | Development, Workbench history and release state became more explicitly separate |
| 2025-09-17 | Read-only data access and editor-sync/LLM JSON fixes | Publish audience and data mutation permission became separate controls |
| 2025-09-30 | Copilot Enterprise public preview | Codespaces and enterprise policy became part of the control boundary |
| 2025-12-10 | DPA coverage, agent/manual-edit and repository-creation improvements | Organization repository placement and preservation of manual commits became explicit product concerns |
| 2026-07-01 | Full GitHub Models retirement announced for 2026-07-30 | Generated app inference required migration, but current Spark docs did not publish a replacement |
| 2026-08-04 | No new users and no new app creation | Product entered transition; existing owners were directed to repository export |
| 2026-08-31 | Official “save your app code” deadline | Repository creation is time-critical; no complete existing-app shutdown date is stated |

### Pinned template history

| Commit | Date | What it establishes |
|---|---|---|
| [`d634b8f`](https://github.com/github/spark-template/commit/d634b8f35fc709048a2cf6f780c5432c9dd824e4) | 2025-05-06 | Repository setup predates public preview |
| [`e093b45`](https://github.com/github/spark-template/commit/e093b4537bf5be805947477edb0d5c1693fe20bd) | 2025-05-21 | File synchronizer moved into the template runtime topology |
| [`930371b`](https://github.com/github/spark-template/commit/930371bfc2e4834c302a0914bf18d56fe355c7fd) | 2025-06-04 | Remote snapshot hydration became a boot path |
| [`1696fc5`](https://github.com/github/spark-template/commit/1696fc5ab28c3c437299a06d7756ba53bec698de) | 2025-06-30 | Reflog retention was extended to 500 years |
| [`80cc690`](https://github.com/github/spark-template/commit/80cc69086d98d01b93f76152eab49353b22e8134) | 2025-07-09 | Post-commit static preview build was installed |
| [`9e2caee`](https://github.com/github/spark-template/commit/9e2caee2e14502ab3e77cfe28ba10eb6f3f3346c) | 2025-07-31 | New package set landed after public preview |
| [`db98f58`](https://github.com/github/spark-template/commit/db98f582765a79a37a1872e3c3e2780c5eaaadd1) | 2025-08-14 | Template Spark dependency moved to the 0.36 line |
| [`a4b76ae`](https://github.com/github/spark-template/commit/a4b76aee7e7f7b843414624fc1a5646dd9503169) | 2025-12-02 | Template moved to Vite 7 |
| [`8f859fd`](https://github.com/github/spark-template/commit/8f859fd0f9d868bc5b09eb6564ec7d31916eb009) | 2026-06-18 | Pinned HEAD/tag snapshot contains security dependency fixes |

This history establishes real Git/Codespace/runtime concerns. It does not open the Workbench backend or prove which mutable release bundle served a particular historical app.

## Distribution evidence

| Distribution | Snapshot | Integrity / provenance | Boundary |
|---|---|---|---|
| `github/spark-template` | commit/tag `8f859fd0f9d868bc5b09eb6564ec7d31916eb009` / `v0.46.15`; 120 commits | MIT repository; commit dated 2026-06-18 | App scaffold and development orchestration, not hosted implementation |
| `@github/spark@0.46.15` | latest registry version at review; published 2026-07-08 | SHA-1 `32aa267a5c3ccad35e0ffcc7e60c225f899081b3`; integrity `sha512-GuGd8rCrH2YQZ2gOW265gzh6nk5InoF4J8aZQP8/sGmOLIf9P5mCufkBMlQLL6UI2D240Twq12fiD5eIT0U4Vw==`; MIT | Readable compiled SDK/Vite/designer/runtime edges; no repository field and its `gitHead` is not attributable to the public template |
| `@github/spark@0.43.1` | version frozen by pinned template lockfile; published 2025-12-01 | SHA-1 `93dafcf3377f324b944c3c6d119ab4cffd51154d`; integrity `sha512-zzFBm70sy5t1YnrzcM391IE8CUE17SrSuWk423snUsFium8QnVPTRbgGsjK7U7dOZazHdRUI65SwHJ1ig7hZlw==`; MIT | Actual template dependency snapshot differs from matching tag/latest package |
| Spark release tool bundle | selected dynamically by `.devcontainer/refreshTools.sh` | first asset of the repository's latest release at boot | Contains closed services/SDK/CLI material; not reproducibly pinned by the template commit |

The package source maps name modules, but the inspected maps do not embed the original custom GitHub TypeScript sources. Claims above therefore derive from readable MIT compiled code and declarations, not a falsely attributed source repository.

## Fact, inference and unknown ledger

| Class | Statement |
|---|---|
| Fact | Since 2026-08-04 Spark accepts no new users and permits no new app creation; existing users are directed to create repositories before 2026-08-31. |
| Fact | No inspected official page states the final shutdown date for already-created apps. |
| Fact | Create repository makes a new private repository, transfers prior Spark commit history and synchronizes the repository's `main` branch in both directions. |
| Fact | Published code runs on Azure Container Apps; app data uses Azure Cosmos DB KV with a combined key/payload limit below 512 KB and is shared by default. |
| Fact | Current Spark documentation still describes GitHub Models inference after the separate GitHub Models service retired for all customers on 2026-07-30. |
| Fact | `@github/spark@0.46.15` deprecates `spark.llm`, still proxies development LLM calls to Models and exposes build-time JSX source-coordinate tagging only in Workbench serve mode. |
| Fact | The public designer host returns file start/end coordinates, primitive React props, geometry, editability, text and class, then applies some incoming changes only to the live DOM. |
| Fact | The public template downloads mutable latest release tooling and runs closed `spark-server`, `spark-designer` and `spark-file-syncer` services. |
| Fact | The SDK KV hook is optimistic, document update is read–merge–write and client queries fetch then filter/sort/limit locally. |
| Inference | Repository creation is the strongest publicly documented code-preservation path, but it cannot be a complete app backup because data, deployment, inference and access state live outside Git. |
| Inference | The malformed `instanceCount` selector likely returns zero for ordinary colon-delimited locations in both inspected package versions; no live Workbench confirmed the symptom. |
| Inference | A deployed app could use closed server-side inference routing different from the public Vite development proxy; direct testing is required rather than declaring all existing apps broken. |
| Unknown | Final access/shutdown date for existing Workbenches and published apps after the repository deadline. |
| Unknown | Exact repository export behavior after 2026-08-31 and whether GitHub will offer another migration mechanism. |
| Unknown | Workbench version schema, restore atomicity, source-patch algorithm and conflict policy across visual edits, agent writes, Codespace edits and `main`. |
| Unknown | Exact current model and prompt routing for the generating Spark agent. |
| Unknown | Replacement, migration or compatibility contract for generated application inference after GitHub Models retirement. |
| Unknown | Cosmos DB server transaction, consistency, tenancy, backup, retention and bulk-export semantics. |
| Unknown | Deployment revision retention, independent export, rollback and relationship to Workbench Restore. |
| Unknown | Closed release-bundle source, exact per-app bundle revision and reproducibility of historical Codespaces. |

## Primary sources

### Current lifecycle and product contract

- [About GitHub Spark](https://docs.github.com/en/copilot/concepts/spark)
- [Building and deploying AI-powered apps with GitHub Spark](https://docs.github.com/en/copilot/tutorials/spark/build-apps-with-spark)
- [Prompting tips for GitHub Spark](https://docs.github.com/en/copilot/tutorials/spark/prompt-tips)
- [Troubleshooting common Spark issues](https://docs.github.com/en/copilot/how-tos/troubleshoot-copilot/troubleshoot-spark)
- [GitHub Spark product page](https://github.com/features/spark) — retained as historical/current marketing evidence; the dated documentation notice governs availability at this snapshot
- [Responsible use of GitHub Copilot agents](https://docs.github.com/en/copilot/responsible-use/agents)

### Product history

- [Public preview for Copilot Pro+](https://github.blog/changelog/2025-07-23-github-spark-in-public-preview-for-copilot-pro-subscribers/)
- [Reliability, seed data and performance updates](https://github.blog/changelog/2025-08-06-spark-improvements-enhanced-reliability-seed-data-and-performance-updates/)
- [Organization sharing, local development, deployment visibility and Restore](https://github.blog/changelog/2025-09-05-new-spark-sharing-option-and-improved-local-dev-experience/)
- [Read-only Sparks with controlled data access](https://github.blog/changelog/2025-09-17-share-read-only-sparks-with-controlled-data-access/)
- [Copilot Enterprise public preview](https://github.blog/changelog/2025-09-30-github-spark-in-public-preview-for-copilot-enterprise-subscribers/)
- [DPA, agent and repository-creation improvements](https://github.blog/changelog/2025-12-10-github-spark-improvements-dpa-coverage-dedicated-sku/)
- [GitHub Models full retirement](https://github.blog/changelog/2026-07-01-github-models-is-being-fully-retired-on-july-30-2026/)

### Pinned public implementation edges

- [Pinned official template tree](https://github.com/github/spark-template/tree/8f859fd0f9d868bc5b09eb6564ec7d31916eb009)
- [Pinned template package manifest](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/package.json)
- [Pinned devcontainer boot](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/.devcontainer/postStartCommand.sh)
- [Pinned closed-service Supervisor topology](https://github.com/github/spark-template/blob/8f859fd0f9d868bc5b09eb6564ec7d31916eb009/.devcontainer/spark.conf)
- [`@github/spark@0.46.15` registry metadata](https://registry.npmjs.org/%40github%2Fspark/0.46.15)
- [`@github/spark@0.43.1` registry metadata](https://registry.npmjs.org/%40github%2Fspark/0.43.1)
- [`@github/spark@0.46.15` published package contents](https://unpkg.com/browse/@github/spark@0.46.15/)

All availability, retirement, package and deployment claims are snapshot-dated. The public template and SDK establish important source-coordinate, data-client and runtime edges; they do not justify treating the closed Workbench or managed platform as open source.
