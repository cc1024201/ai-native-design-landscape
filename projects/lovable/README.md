# Lovable

> Research status: **Architecture-level / closed-source boundary reached; distributed Vite packages and public MCP client repository inspected** · Last reviewed: **2026-08-11**

| Field | Verified value |
|---|---|
| Product / operator | Lovable, operated by Lovable Labs |
| Current category | Hosted full-stack application builder with planning, code generation, live preview, visual-to-agent refinement, managed backend and publishing |
| Lifecycle | Active; Preview Toolbar replaced Visual Edits on 2026-06-10; new projects default to TanStack Start with SSR |
| Primary working object | A Lovable Project containing generated application code, chat history and automatic code versions |
| External code authority | One active branch in a Lovable-created GitHub repository after GitHub connection |
| Delivery object | An explicitly published snapshot at a Lovable URL or custom domain; later project changes do not publish automatically |
| Data object | Lovable Cloud or connected Supabase state, which Preview and the published application ordinarily share |
| Current visual surface | Preview Toolbar: select elements, edit text inline, draw an annotation or pin a comment |
| Public source inspected | `lovable-tagger@1.3.3`, `lovable-tagger@1.1.13`, `@lovable.dev/lovite@0.0.2`, and [`lovablelabs/mcp`](https://github.com/lovablelabs/mcp/tree/0336e6db8026b0f02cb89d1451cc48ea3f469791) at `0336e6d` |
| Closed boundary | Hosted agent, current Preview Toolbar orchestration, source-rewrite service, project/version store, Git synchronizer, build runtime, Cloud control plane, publish service and hosted MCP implementation |
| Evidence snapshot | Official documentation, changelog, engineering post, registry tarballs and pinned public repository; no Lovable account, project, Git repository, Cloud database or deployment was mutated |

## The shortest accurate description

Lovable is not merely a prompt-to-landing-page generator and its Preview is not a design document. It is a hosted software workspace in which planning, agent writes, a code editor and preview-grounded requests converge on project source, while Git, publishing and backend data advance on separate clocks.

The product is easiest to misunderstand when all of those surfaces are called “the app.” There are at least five independently recoverable states:

```text
Lovable Project
  ├─ chat / plan / automatic code versions
  └─ current application source
       └─ temporary development runtime -> Preview Toolbar

GitHub repository (after connection)
  └─ one active branch <-> Lovable current source

Published website
  └─ explicitly selected/current code snapshot at Publish time

Cloud / Supabase
  └─ database + auth + storage + functions + secrets + logs
       └─ ordinarily shared by Preview and published website
```

A version revert rewinds project code, not database rows. A Git commit does not publish. Publish does not take a database snapshot. A passing Preview can already have modified the same data used by production. There is no documented transaction that advances or restores all five states together.

## Three ordinary journeys reveal the architecture

### Journey A: idea to a verified published application

The ordinary path established by [Plan mode](https://docs.lovable.dev/features/plan-mode), [Build mode](https://docs.lovable.dev/features/agent-mode), the [Preview Toolbar](https://docs.lovable.dev/features/preview-toolbar), [testing guidance](https://docs.lovable.dev/features/projects/preview) and [publishing contract](https://docs.lovable.dev/features/publish) is:

1. Describe the application in Plan mode when requirements or architecture need discussion. Plan mode may inspect the project and propose a plan, but it does not change code.
2. For a new product, optionally let design guidance produce a detailed design brief or several lightweight HTML/Tailwind directions. Refinements operate on those directions; Submit chooses one and starts the full build.
3. Approve the plan. Lovable switches to Build mode and implements it; the active plan lives in `.lovable/plan.md`, and an approved plan is archived under `.lovable/plan/` and in chat history.
4. Exercise the running Preview. Compilation is only a prerequisite. Ask Lovable to use browser testing when behavior, navigation, responsive layout or authenticated flows matter.
5. Refine the current result through a new Build prompt, code-editor save or Preview Toolbar action. Selected elements and annotations become context for the main chat rather than a second independent design artifact.
6. Review schema changes, permissions and backend side effects. Preview and the live site usually use the same backend, so test records are not automatically isolated.
7. Publish explicitly. Publishing deploys the current code snapshot; later edits remain unpublished until Publish is invoked again.
8. Verify the public URL, authentication, real data, loading/error/empty states, responsive paths, external integrations and permissions. A healthy private Preview is not delivery proof.
9. Connect GitHub and export operational data before treating the product as portable or recoverable outside Lovable.

The agent processes one Build task at a time. Additional prompts can be queued, reordered, edited, removed, paused or repeated; stopping preserves completed work rather than promising transactional rollback. A visible queue is therefore execution intent, not a multi-prompt atomic change set.

### Journey B: establish Git authority and continue with external developers

The [GitHub integration](https://docs.lovable.dev/integrations/github) has an unusually specific authority model:

1. Connect a workspace GitHub account or organization through the Lovable GitHub App.
2. Lovable creates a **new private repository** for the project. It cannot import an existing repository into an existing Lovable project.
3. One Lovable project maps to one repository. The repository's default branch is initially active and synchronizes both ways.
4. Create or select another branch in Lovable when isolation is needed. A new branch forks the currently active branch; Lovable edits only against one active branch at a time.
5. External developers push commits normally. Lovable receives them only when they land on the active branch, or after that branch is merged/switched into the active branch.
6. Inspect the actual remote branch and commit before assuming Preview state was synchronized. Git history is the maintainable code record; chat and Lovable versions remain separate recovery evidence.
7. Publish or let an external hosting workflow deploy the intended commit. Git synchronization alone does not refresh the Lovable production snapshot.

Repository rename is documented as safe, but renaming the connected GitHub account/organization, transferring or deleting the repository can break the link. Disconnecting stops synchronization while leaving both copies in place. Reconnect creates a new repository rather than reattaching the old one. Deleting the active branch makes Lovable fall back to a `lovable-fallback` branch.

The integration authors commits through the GitHub App and co-attributes the Lovable user. That makes the Git commit auditable, but it does not prove which prompt, Preview selection, Cloud mutation or published snapshot belongs to that commit.

### Journey C: expose or consume tools without confusing the three MCP directions

Lovable documents three distinct agent interfaces that share the term MCP:

1. **A generated app becomes an MCP server.** Lovable proposes tools, adds endpoints/tool code to the project and hosts the server. After the user reviews access and publishes, external clients call the live app and its real backend.
2. **An external AI client controls Lovable.** The hosted Lovable MCP research preview can create, inspect and modify Lovable projects, spend account credits, deploy, inspect history and execute database operations.
3. **Lovable's Build agent consumes external MCP/connectors.** Per-user connectors give the builder additional context or actions while generating the app; they do not automatically become capabilities of the deployed application.

These arrows have different identity, authorization, deployment and recovery boundaries. “MCP connected” does not say which system is the server, which account pays, or which data can be mutated.

## Plan and Build are different authority states

| Surface | May inspect | May mutate project code | Durable result | Important boundary |
|---|---|---|---|---|
| Plan mode | current project, context and requested architecture | No | chat discussion plus current `.lovable/plan.md`; approved plans are archived | approval switches to Build; a plausible plan is not implementation evidence |
| Design directions | brief, selected direction and refinements | Only lightweight direction artifacts before Submit | chosen visual direction and detailed brief | directions are not the finished application's behavior, data model or production code |
| Build mode | project files, logs and enabled tools | Yes | new current code plus an automatic Lovable version | one task executes at a time; stop retains completed mutations |
| Code editor | source files | Yes, on Save | manual save creates a version | syntax-valid code can still fail the user journey or production build |
| Browser testing by agent | running Preview and permitted interactions | Can lead to later Build changes | observation/tool trace plus any subsequent code version | browser testing generally must be requested; observation is not a rollback point |

Plan mode is therefore a contract-shaping surface, not a read-only clone of Build mode with a different label. Approving a plan authorizes a new mutation phase. Review must happen before approval if the plan broadens integrations, data access or deployment scope.

## Current Preview Toolbar: context first, source mutation second

Since 2026-06-10, the [Preview Toolbar](https://docs.lovable.dev/features/preview-toolbar) replaces the older Visual Edits interface.

| Toolbar mode | User gesture | What becomes agent input | When it becomes durable | Cost / queue semantics |
|---|---|---|---|---|
| Select elements | select one or several rendered elements, then add an instruction | element references plus natural-language request in the main chat | after Build generates and saves code | consumes credits; requests join the ordered queue |
| Edit text inline | edit rendered text, then press Send | pending text change | after Send and resulting project update | first 100 edits per user per 24 hours are free at this snapshot, then credits |
| Draw annotation | draw over the page and add a message | image/region evidence plus instruction | after the chat request changes source | consumes credits and queues in order |
| Add comment | pin a comment to an element | structured review thread; only sent to Build through `@Lovable` / Send to chat | comment thread persists independently; source changes only after agent handling | commenting is free until agent work is requested |

Two negative facts matter:

- A selected element or correct-looking inline edit is not yet durable code until the request is sent and the resulting version/diff is inspected.
- Current public documentation describes toolbar selections as chat context; it does not publish a stable file/range/AST/revision packet or a deterministic rewrite guarantee.

Toolbar requests execute in order rather than as one batch transaction. If an early request changes the component tree, later selections or comment anchors can be stale even though they remain visible in the queue.

## The visual mechanism changed three times

It would be inaccurate to describe the 2025 engineering implementation as the timeless current architecture.

| Era | Public product claim | Publicly evidenced mechanism | What must not be carried forward |
|---|---|---|---|
| 2025-03 Visual Edits | deterministic, no-AI edits for supported visual properties | JSX source ids, browser-side source/AST state, optimistic Tailwind/AST edits, generated source diff, cloud save and HMR | exact parser, identity schema and rewrite coverage were implementation details of that release, not a current Toolbar contract |
| 2026-04 AI-powered Visual Edits | visual edits expanded to dynamic database/API content and broader changes through AI | product behavior is documented; the new model/rewrite path remains closed | the earlier deterministic-only rule no longer described all edits |
| 2026-06 Preview Toolbar | element selection, inline text, annotations and comments flow through the main chat | current UI contract plus distributed source-coordinate tooling described below | a Toolbar selection cannot be declared a direct deterministic source patch without current evidence |

The [2025 engineering account](https://lovable.dev/blog/visual-edits) described an ephemeral cloud development server—more than 4,000 isolated Fly.io/Node containers at that snapshot—and a custom Vite plugin that assigned stable JSX locations during compilation. The full source was synchronized into the browser as an AST; supported Tailwind/JSX changes were applied optimistically client-side, rendered immediately and then saved back as generated JSX/TSX with a precise-line diff and HMR update.

The post names Babel and SWC as relevant parser/compiler libraries, not as a pinned production parser contract. The safe conclusion is that 2025 Visual Edits joined rendered elements to generated source coordinates and maintained a browser-side edit representation. The exact parser, compiler transform, conflict policy and current use of that path are not public.

## What the distributed packages actually prove

The hosted core is closed, but Lovable publishes small MIT Vite distributions. Their compiled code provides stronger evidence than UI prose while remaining only a partial boundary.

| Distribution snapshot | Registry evidence | Inspected behavior | Boundary |
|---|---|---|---|
| `lovable-tagger@1.3.3` | published 2026-07-15; SHA-1 `6ad4b7988d6a41ea546ab610873a9fbfba9c77a1`; integrity `sha512-5Zx+v3M1hvH4TZMLyk7U9tBT0i0yupTsjbm8gNqpXZPztXRAOKfkrUJ9LpW/UdUq6PUQEhE0i5vwxH4mnDX4Rg==` | redirects the development JSX runtime; attaches cleaned `fileName`, line, column and display name to DOM nodes through `Symbol.for("__jsxSource__")`; exposes `window.sourceElementMap` from `file:line:column` to sets of `WeakRef`; projects watched Tailwind v3/v4 data into `src/tailwind.config.lov.json`; bypasses tagging during SSR | no virtual override/save path; no hosted selection packet, model request, revision check or persistence code |
| `lovable-tagger@1.1.13` | older package pinned by current `lovite@0.0.2`; SHA-1 `825eef5bbb463deb3153fa79e4beba898db7c4cd` | same general JSX-to-DOM source map plus an in-memory Vite `virtualOverrides` layer; listens for `lovable:override`, `lovable:clear-override` and `lovable:clear-all-overrides`, invalidates the affected module and emits JS/CSS HMR updates | proves an ephemeral preview override channel existed in this distribution; it does not prove that current Toolbar requests still use it |
| `@lovable.dev/lovite@0.0.2` | published 2026-07-15; SHA-1 `e590198256f144eec0a512e8706416a4112f9dac`; integrity `sha512-gRtG6HRCtC4zNnQ3S+xhkxGHgMymKYjb4gqcuuxB0tDjMTmJX6txTTXwe+q1hJIev5JOmJIkEUIVnGYEqu7WvQ==` | adds the tagger in development, aliases `@` to `src`, deduplicates React/query packages, detects `LOVABLE_SANDBOX=1` or `DEV_SERVER__PROJECT_PATH`, and enforces sandbox host `::`, port `8080` and `strictPort` while removing caller headers/CORS/proxy settings | pins tagger `1.1.13`, not latest `1.3.3`; package graphs expose migration ambiguity rather than one current hosted-runtime truth |

### The current tagger's identity model

The inspected `1.3.3` development runtime establishes this narrow mapping:

```text
JSX development call
  └─ source = fileName + lineNumber + columnNumber
       ├─ DOM node[Symbol.for("__jsxSource__")] = sourceInfo
       └─ window.sourceElementMap["file:line:column"]
            └─ Set<WeakRef<DOM node>>
```

For host elements, the ref callback registers or updates the source record. For custom components, it tags the rendered output only if an inner host element has not already supplied more specific source information. The file cleaner removes known development-server/sandbox prefixes. Server-side rendering passes through without tagging.

The package README still mentions a visible `data-component-id` style concept, but the inspected distribution uses a non-attribute Symbol and global map. The shipped code, not stale prose, is the stronger evidence for this version.

The tagger also reduces Tailwind configuration/CSS into a Lovable JSON projection and watches relevant inputs. That can ground design-system controls, but it is not a complete style AST and does not prove which tokens the current Toolbar exposes or edits.

### The old virtual override layer

In `1.1.13`, the Vite plugin keeps an in-memory path-to-content map. An override event normalizes a path, stores replacement content, invalidates the Vite module and sends a JavaScript or CSS HMR update. Clear events remove one or all replacements and retrigger updates.

This explains how an earlier visual operation could produce an immediately correct Preview before persistence. It also sharpens the acceptance boundary: a live module override is not durable project source. The latest tagger removes this feature while `lovite@0.0.2` still pins the older graph, so public distributions show two coexisting package paths, not the exact current cloud composition.

### What package inspection does not establish

It does **not** establish:

- that every current TanStack Start or older React/Vite project loads this exact package/version;
- that a Preview Toolbar selection exposes `file:line:column` to the user or model;
- how multiple DOM nodes at one JSX source location are disambiguated;
- whether current AI-powered edits use a deterministic rewriter, a model, or a hybrid for any given change;
- how baseline revision, concurrent writes, queued selection staleness or save conflicts are checked;
- how the hosted project store turns a temporary runtime change into an automatic version.

Both npm packages point at `github.com/lovablelabs/lovable` subdirectories, but that repository was not publicly accessible at this snapshot and the packages contain no `gitHead`. The reproducible evidence is the registry version plus tarball SHA/integrity, not a fabricated source commit.

## Project objects and the five clocks

| Object | Public contents / identity | Authority | What it does not restore or prove |
|---|---|---|---|
| Workspace | members, roles, billing, GitHub App, policies and projects | collaboration and account scope | no application revision |
| Project | chat, current code, knowledge, integration settings and version history | current Lovable work context | not an atomic snapshot of external Git, published alias or backend data |
| Design direction | lightweight HTML/Tailwind exploration before full build | chosen visual intent after Submit | not application behavior, backend or production source |
| Plan | `.lovable/plan.md`, discussion and approved archive | approved implementation intent | approval is not a completed diff |
| Automatic Lovable version | code snapshot for an agent/code-editor change, with preview/diff/message linkage | hosted code recovery point | revert does not restore database data or every external side effect |
| Current code | generated and manually edited project files | Preview build input and Git synchronization input | not automatically published |
| Active Git branch | one repository branch selected in Lovable | external maintainable source after connection | commits on inactive branches do not immediately enter Lovable |
| Preview runtime | temporary cloud development app for latest current code | behavioral development surface | not permanent, isolated data staging or public release |
| Preview share link | public view-only access for seven days, optionally comments | temporary review access | not stable hosting or editor access |
| Published snapshot | explicitly deployed code at Lovable domain/custom domain | current public delivery | later code changes and DB restore are separate |
| Cloud / Supabase | database, auth, storage, realtime, functions, secrets, logs and jobs | runtime state and user data | code version revert does not rewind it |
| Comment thread | page/element anchor, replies and send-to-agent context | review record | structural edits can detach/retarget the visual anchor; it is not source identity |

The version UI can preview, diff, jump to the originating message, bookmark and revert a code state. Very old versions may remain previewable but no longer revertible; revert is full-code-state rather than selective. A remixed project cannot revert to versions before the remix boundary.

## Runtime and rendering have two stack eras

Lovable's current [FAQ](https://docs.lovable.dev/introduction/faq) and [TanStack Start upgrade guide](https://docs.lovable.dev/features/upgrade-to-tanstack-start) establish two generated-runtime eras:

| Era | Default runtime | Rendering / delivery consequence | Migration boundary |
|---|---|---|---|
| Older projects | React + Vite with Tailwind | client application; documented crawler prerendering for verified bots | can migrate in place with confirmation; retain a code version for rollback |
| New projects since 2026-05-13 | TanStack Start + Tailwind | SSR-capable full-stack React application | existing published site remains on the old code until the migrated project is republished |
| Enterprise new projects since 2026-06-22 | TanStack Start default | same direction under enterprise rollout | organization policy and integrations still need project-level verification |

Some ownership/deployment documentation still describes the standard output as Vite + React. That is valid for the older project population but not the complete current default. Architecture claims must be project/version-specific rather than selecting whichever official page is most convenient.

The Preview is a private development server that can pause and resume. Users can disable live Preview to retain the most recently completed result while Build continues. A seven-day share link is view-only and can allow guest comments, but Lovable documents no permanent Preview URL.

Preview and published code ordinarily address the same backend. Consequently Preview is code staging, not data staging. A browser test that creates, edits or deletes a record may already be a production data action.

## Git, export and self-hosting

GitHub is the primary code escape hatch, but portability has layers:

| Layer | Portable path | What remains to reconstruct |
|---|---|---|
| Frontend/full-stack code | two-way GitHub repository; clone and deploy externally | environment values, build/runtime compatibility, domains and provider-specific functions |
| Database schema | reviewed migrations under `supabase/migrations/` and database export | correct order, extensions, policies, generated types and application compatibility |
| Database rows | Cloud export up to documented limits | storage objects, secret values, usable password hashes and a consistent cut with code |
| Auth/storage/realtime/functions | Supabase-equivalent services or custom implementations | identity migration, buckets, policies, function runtime, webhooks and operational tooling |
| Published URL | external host or Lovable Publish | domains, TLS, redirects, analytics and release automation |

Plain PostgreSQL is not a complete Lovable Cloud replacement because generated apps can depend on Supabase-compatible auth, storage, realtime and edge functions. Moving from Cloud to one's own Supabase has no one-click migration; the user exports data and rebuilds schema/services in a new project.

Cloud database export includes schema and data, is rate/size limited, and excludes storage files, edge-function code, secrets and usable passwords. Removing Cloud is permanent, so export and an independently tested replacement must precede the operation. Pausing Cloud disables database/auth/storage/function availability while storage billing can continue.

## Code versions and data backups are independent recovery systems

| Operation | Code effect | Data / backend effect | Delivery effect |
|---|---|---|---|
| Lovable version revert | restores all project code to selected recoverable version | does not restore database rows; edge functions are redeployed from restored code | published site changes only through subsequent publish behavior |
| Git revert / branch switch | changes external code history and, when active, synchronizes into Lovable | no automatic database rollback | external CI or later Lovable Publish may deploy separately |
| Publish | builds/deploys current code snapshot | uses existing backend state | updates live Lovable site; later edits remain private |
| Unpublish | leaves editor project/code intact | backend can remain | removes public website URL; app-as-MCP endpoint also goes offline |
| Database backup restore | restores schema and rows from a daily backup | permanent data operation; can recreate a schema incompatible with current code | site stays deployed but can fail against restored schema |
| Cloud pause | code remains | DB/auth/storage/functions become unavailable | Preview and published app can lose data-backed behavior |

Lovable documents daily database backups retained for roughly fourteen days. Restore is schema-and-data, not a selective row undo, and can mismatch the current application. Recovery must therefore choose a compatible code version/commit and database backup deliberately, then verify migrations, functions, auth and live behavior.

The former Test/Live environment beta was removed for new Cloud projects on 2026-03-24; existing participants retain it. A new ordinary project should not be assumed to have isolated test data merely because older screenshots or docs mention two environments.

Cloud region is fixed after enablement. That makes region choice an architectural decision, not a later deploy toggle.

## The three MCP arrows in detail

### 1. Generated application as MCP server

The [Agent integrations](https://docs.lovable.dev/features/agent-integrations) flow turns application features into external tools:

- the app must be published and backed by Lovable Cloud or Supabase;
- Lovable proposes tool schemas and adds their implementation/endpoints to project code;
- the user reviews access configuration, publishes, then connects an external client;
- tool calls execute against the live published application and its real backend rather than a copy;
- sign-in is the default and backend authorization/RLS must enforce access—hiding a control in the UI is not security;
- tool/schema changes are not live until republish, and clients may need to refresh discovery;
- unpublishing takes the MCP server offline;
- no built-in rate or spending cap is documented, so write actions need idempotency and application-level limits.

TanStack Start apps use the published web address as the integration base. Older React/Vite projects route through a Supabase Edge Function and may require a function redeploy. Domain/runtime migration therefore changes agent-client configuration even when tool names stay constant.

### 2. Hosted Lovable MCP controlled by external clients

The [Lovable MCP server](https://docs.lovable.dev/integrations/lovable-mcp-server) is a research preview at `https://mcp.lovable.dev`. OAuth grants account-level access, and public tool descriptions include workspace/project management, `send_message`, code/files/diffs/history, knowledge/skills, connectors, analytics, uploads and Cloud SQL operations. `query_database` can read, write and change schema.

Calls spend real Lovable credits, may change live projects/data and can deploy. The safe unit of review is therefore workspace + project + active branch + database + publish target, not just the prompt sent by the external client.

The official Apache-2.0 [`lovablelabs/mcp`](https://github.com/lovablelabs/mcp/tree/0336e6db8026b0f02cb89d1451cc48ea3f469791) repository does **not** contain the server implementation. It contains `server.json`, endpoint metadata, Claude plugin configuration and workflow commands. It proves the hosted endpoint and recommended client behavior, not authorization, tool execution or persistence internals.

### 3. Lovable Build consuming external tools

[Chat connectors](https://docs.lovable.dev/integrations/chat-connectors) and external MCP integrations are per-user capabilities available to Lovable while building. They can supply files, issues, designs or remote actions to the agent. They do not automatically ship inside the generated application, and another collaborator may not have the same connector authorization.

A connector result is input evidence or an external side effect. It is not a code version unless Build writes project source, and it is not production functionality unless the app separately implements and deploys the needed integration.

## Collaboration, comments and cross-project context

Project access and published-website access are separate. A collaborator who can edit a project does not automatically define who can use the deployed site, and a public site visitor does not gain editor access.

[Project comments](https://docs.lovable.dev/features/project-comments) are pinned to an element in the current page structure. Replies and resolution persist as a thread, but reordering, adding or removing elements can lose or retarget the visual anchor. Sending a thread to `@Lovable` transfers page, element and comment context into Build; it does not prove a stable source coordinate or automatically change code.

Guest review can use a seven-day Preview link and comment without full project access when enabled. That link is temporary and should not be treated as a production URL or long-term audit archive.

Cross-project references let Lovable read another project's code, files, assets or chat history and recreate/adapt them in the current project. The referenced project remains read-only and does not become a live dependency. Later changes in the source project do not automatically synchronize the copy.

## Security, privacy and agent authority

Lovable Cloud combines several production authorities: database, auth, storage, realtime, edge/runtime functions, AI, email/jobs, secrets and logs. Granting Build permission to enable, read or modify Cloud therefore exceeds a source-code edit. Current permission controls offer Always, Ask and Never modes; defaults should be reviewed before allowing autonomous schema or live-data operations.

Secrets belong in the platform's secret/environment facilities, not prompts, client code, screenshots, comments or Git. A correct source diff cannot recover a leaked third-party credential or reverse an external API call.

The [data opt-out policy](https://docs.lovable.dev/features/business/data-opt-out) announces a change effective **2026-09-09**: Free/Pro customer prompts, files, code, generated outputs and usage may be used for model training unless the account opts out, while Business/Enterprise are excluded by default. At this 2026-08-11 snapshot that date is still future. Lovable states that end-user data stored in application databases/storage is not used for this training. Product-plan and effective-date context must remain attached to the claim.

## Failure and recovery map

| Failure / mistaken assumption | Observable symptom | What may already be durable | Correct recovery |
|---|---|---|---|
| Plan mistaken for implementation | convincing plan, unchanged Preview/code | plan/chat only | approve intentionally, observe Build, inspect version/diff and test |
| Design direction mistaken for finished app | polished direction but no real behavior/backend | selected brief/direction | Submit, complete the build, then test ordinary journeys |
| Inline text not sent | Preview text looked edited but reload/version unchanged | pending toolbar state | press Send, wait for save, reload and inspect code/version |
| Toolbar target staled by earlier queued task | later request changes wrong element or fails | earlier code version | pause queue, reselect against latest Preview and submit a narrower request |
| Comment anchor moved | pin points to wrong/missing element | thread text | use page/thread context, re-anchor and verify source change separately |
| Preview assumed published | editor is correct, public site is old | current project code/version | Publish explicitly and verify public URL |
| Preview test changed production data | test account/record appears live | shared database mutation | clean/reconcile data with authorized tools; add explicit test isolation strategy |
| Version revert assumed to restore data | old UI with new/incompatible rows/schema | restored code plus newer DB | choose compatible DB backup/migrations; validate before reopening traffic |
| Database restore mismatches code | runtime query/auth errors after restore | backup-restored schema/data | restore/migrate compatible code and functions, then exercise real flows |
| External commit landed on inactive branch | GitHub shows change, Lovable does not | remote commit | merge/switch into active branch, then inspect synced Preview |
| Git connection broken by transfer/rename | sync stops or repository unavailable | both last copies may remain | repair supported account/repo identity or deliberately connect a new repository |
| Disconnect assumed reversible to same repo | reconnect offers new repository | old repo and hosted project diverge | choose authority, preserve history and connect a new repo; do not claim resumed old sync |
| Live override mistaken for saved source | HMR Preview correct, reload/version wrong | transient runtime state | inspect actual project file and automatic version; regenerate/save if absent |
| Package version treated as cloud truth | inferred override path contradicts current behavior | only the local distribution evidence | pin statement to package version; leave hosted composition unknown |
| MCP direction confused | wrong account/app is exposed or mutated | live project/data/tool endpoint | identify server/client, OAuth subject, tool scope and publish state before retry |
| External Lovable MCP over-authorized | credits, code, deployment or DB changed unexpectedly | remote side effects | revoke OAuth, audit project/history/DB/deploy, rotate secrets and recover each clock separately |
| App-as-MCP write retried | duplicate rows/actions | live backend mutation | implement idempotency keys, authorization, quotas and audit trails |
| TanStack migration published without runtime review | SSR/build/integration regression | migrated code version | revert code or fix against migration diff; republish only after production-equivalent tests |
| Cloud removed before complete export | missing storage/auth/secrets/functions | partial DB/code export | restore only from independent backups; platform removal is documented as permanent |

## Ordinary-user acceptance gate

A Lovable task is not complete until the evidence chain covers the intended clock:

1. The correct workspace, project, plan/Build mode, Cloud region, Git repository and active branch are visible.
2. The approved plan/design direction does not silently broaden integrations, data access, deployment or collaboration scope.
3. The actual current files/version contain every sent toolbar, code-editor and Build change; no correct-looking edit remains only pending or in a live override.
4. The Preview is reloaded from durable source and the ordinary interaction works, including responsive, loading, empty, error, auth and permission paths.
5. Tests, browser checks, logs and production build checks ran against the same reviewed code state.
6. Backend schema, RLS/authorization, functions, secrets and test data are reviewed independently from source UI quality.
7. If Git-connected, the intended active branch and remote commit contain the reviewed diff and no inactive-branch work is missing.
8. Publish completed for the intended code snapshot, and the public URL/domain—not only Preview—passes the journey.
9. App-as-MCP or external MCP access is tested under the intended user identity, server/client direction and least privilege, with write idempotency.
10. Recovery is concrete: record a compatible Lovable version/Git commit, published state and database backup/migration point without claiming one restores the others.

## Public-source and distribution evidence

| Date | Evidence | What it establishes |
|---|---|---|
| 2025-03-13 | [Visual Edits engineering post](https://lovable.dev/blog/visual-edits) | historical browser-side AST/source-location, optimistic edit, cloud-save and HMR architecture |
| 2026-04-02 | [Lovable changelog](https://docs.lovable.dev/changelog) | Visual Edits became AI-powered and expanded to dynamic data/API content |
| 2026-06-10 | [Lovable changelog](https://docs.lovable.dev/changelog) | Preview Toolbar replaced Visual Edits and moved visual targeting into the current main-chat workflow |
| 2026-07-13 | [`lovablelabs/mcp@0336e6d`](https://github.com/lovablelabs/mcp/commit/0336e6db8026b0f02cb89d1451cc48ea3f469791) | current inspected public repository head; endpoint/client/setup content, not server implementation |
| 2026-07-15 | [`lovable-tagger@1.3.3`](https://registry.npmjs.org/lovable-tagger/1.3.3) | current inspected source-coordinate/Tailwind distribution and registry integrity |
| 2026-07-15 | [`@lovable.dev/lovite@0.0.2`](https://registry.npmjs.org/%40lovable.dev%2Flovite/0.0.2) | current inspected sandbox Vite wrapper, including its exact dependency on old tagger `1.1.13` |
| historical package retained for comparison | [`lovable-tagger@1.1.13`](https://registry.npmjs.org/lovable-tagger/1.1.13) | inspected virtual override/HMR path absent from `1.3.3` |

The npm tarballs are compiled source distributions, not a source-repository checkout. Because the declared core repository is unavailable and the package metadata lacks `gitHead`, commit-level provenance ends at the public MCP client repository; package claims are pinned to immutable registry hashes instead.

## Fact, inference and unknown

| Status | Statement |
|---|---|
| Fact | Plan mode does not change code; approval moves work into Build and the active plan is represented in `.lovable/plan.md`. |
| Fact | Current Preview Toolbar selections, annotations and sent inline text enter the main chat/build flow, while comments remain separate until sent to Lovable. |
| Fact | `lovable-tagger@1.3.3` maps JSX development source coordinates to DOM nodes through a Symbol and `window.sourceElementMap`; it contains no old virtual override feature. |
| Fact | `lovable-tagger@1.1.13` contains in-memory file overrides and Vite HMR events, and current `lovite@0.0.2` pins that older package exactly. |
| Fact | GitHub connection creates a new private repository and synchronizes one active branch; existing repositories cannot be imported or reattached through the documented flow. |
| Fact | Lovable versions restore code, not database data; Preview and published code ordinarily share the same backend. |
| Fact | New projects default to TanStack Start/SSR, while older React/Vite projects can migrate and remain on their old published code until republished. |
| Fact | The public `lovablelabs/mcp` repository configures clients for a hosted remote server and includes no server implementation. |
| Inference | Current hosted Preview likely uses source-coordinate instrumentation or an evolved equivalent to ground at least some element context, but package availability alone does not prove the exact runtime/version. |
| Inference | Removing virtual overrides from the newest tagger while `lovite` pins an older version suggests an active migration or multiple runtime paths, not a reliable chronology for every hosted project. |
| Inference | A sent Toolbar request can converge on durable project code through Build even if its initial element reference is session-local; durability comes from the resulting source/version, not the selection itself. |
| Unknown | Exact current element-selection payload, screenshots/DOM/style fields, source-coordinate use and repeated-element disambiguation. |
| Unknown | Current deterministic-versus-model routing rules for inline text, style, structure and dynamic content edits. |
| Unknown | Baseline revision, conflict resolution and atomicity across Toolbar queue, code editor, Build, collaborators and Git synchronization. |
| Unknown | Hosted project/version storage, sandbox scheduling/snapshotting, build cache and publish implementation. |
| Unknown | Closed agent prompts, model selection, context compaction, plan-to-build transformation and browser-test policy. |
| Unknown | Hosted Lovable MCP authentication internals, tool transaction semantics, audit completeness and database rollback behavior. |

## Primary sources

### Product journey, planning and visual refinement

- [Documentation index for language models](https://docs.lovable.dev/llms.txt)
- [Build mode](https://docs.lovable.dev/features/agent-mode)
- [Plan mode](https://docs.lovable.dev/features/plan-mode)
- [Chat and task queue](https://docs.lovable.dev/features/projects/chat)
- [Design guidance and directions](https://docs.lovable.dev/features/design-guidance)
- [Preview Toolbar](https://docs.lovable.dev/features/preview-toolbar)
- [Preview and browser testing](https://docs.lovable.dev/features/projects/preview)
- [Code mode and manual saves](https://docs.lovable.dev/features/code-mode)
- [Project comments](https://docs.lovable.dev/features/project-comments)
- [Project history and versions](https://docs.lovable.dev/features/projects/history)
- [Current changelog](https://docs.lovable.dev/changelog)
- [Historical Visual Edits engineering post](https://lovable.dev/blog/visual-edits)

### Git, runtime, publish and ownership

- [GitHub integration](https://docs.lovable.dev/integrations/github)
- [Publishing](https://docs.lovable.dev/features/publish)
- [Advanced settings and unpublish](https://docs.lovable.dev/features/advanced-settings)
- [Deployment, hosting and ownership](https://docs.lovable.dev/tips-tricks/deployment-hosting-ownership)
- [External deployment and self-hosting](https://docs.lovable.dev/tips-tricks/external-deployment-hosting)
- [TanStack Start upgrade](https://docs.lovable.dev/features/upgrade-to-tanstack-start)
- [FAQ and generated stack](https://docs.lovable.dev/introduction/faq)

### Cloud, database, permissions and policy

- [Lovable Cloud](https://docs.lovable.dev/features/cloud)
- [Database](https://docs.lovable.dev/features/database)
- [Security guidance](https://docs.lovable.dev/features/security)
- [Lovable security overview](https://lovable.dev/security)
- [Business data opt-out and dated policy](https://docs.lovable.dev/features/business/data-opt-out)

### MCP and integrations

- [Integration directions](https://docs.lovable.dev/integrations/introduction)
- [Chat connectors consumed during Build](https://docs.lovable.dev/integrations/chat-connectors)
- [Generated app agent integrations](https://docs.lovable.dev/features/agent-integrations)
- [Hosted Lovable MCP research preview](https://docs.lovable.dev/integrations/lovable-mcp-server)
- [Pinned public MCP client/setup repository](https://github.com/lovablelabs/mcp/tree/0336e6db8026b0f02cb89d1451cc48ea3f469791)
- [Pinned MCP manifest](https://github.com/lovablelabs/mcp/blob/0336e6db8026b0f02cb89d1451cc48ea3f469791/server.json)
- [Pinned Apache-2.0 license](https://github.com/lovablelabs/mcp/blob/0336e6db8026b0f02cb89d1451cc48ea3f469791/LICENSE)

### Distributed package snapshots

- [`lovable-tagger@1.3.3` registry metadata](https://registry.npmjs.org/lovable-tagger/1.3.3)
- [`lovable-tagger@1.1.13` registry metadata](https://registry.npmjs.org/lovable-tagger/1.1.13)
- [`@lovable.dev/lovite@0.0.2` registry metadata](https://registry.npmjs.org/%40lovable.dev%2Flovite/0.0.2)

All live-product, package, pricing, retention and policy claims are snapshot-dated. Public distributions illuminate source-coordinate and sandbox edges; they do not open the hosted platform or justify filling its unknowns with historical implementation details.
