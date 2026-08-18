# Atoms

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | MetaGPT LLC / Atoms; related open-source work now lives under FoundationAgents |
| Category | Multi-agent business and full-stack application workspace with visual editing |
| Status | Active |
| Current public scope | Research, product planning, architecture, application development, data analysis, deployment, SEO and advertising |
| Source availability | Hosted product, orchestration, visual editor, cloud and versioning core are proprietary; the related MetaGPT framework is MIT |
| Previous product names | MGX / MetaGPT X / MetaGPTX |
| Primary open-source reference | [`FoundationAgents/MetaGPT`](https://github.com/FoundationAgents/MetaGPT) |

## The system to understand

Atoms is no longer adequately described as a prompt-to-app generator. Its current public entry point calls the product an eight-specialist AI team that can research a market, shape a product, build and deploy it, and then operate SEO and advertising workflows. The application builder remains the decisive design artifact path for this landscape, but it now sits inside a wider **research → plan → build → launch → grow** loop.

The product lineage is direct. The official [brand story](https://atoms.dev/mgx-is-now-atoms) says that MGX became Atoms and changed its ambition from “Vibe Coding” to a “Vibe Business Team”; the separate [MetaGPT-to-Atoms history](https://atoms.dev/metagpt) says the open MetaGPT framework was productized as MGX and then evolved into Atoms. The current Atoms Terms also list Atoms, METAGPT X and MGX together while reserving the platform architecture, features, interface and proprietary algorithms to MetaGPT LLC.

This creates an important evidence boundary:

- current Atoms behavior can be established from the live public product, official help, changelog, product pages and terms;
- MetaGPT source can establish real role, routing, plan, message, file and Git mechanisms in the related open framework;
- MetaGPT source does **not** establish the implementation of Atoms Cloud, Race Mode, Theme, Visual Editor, hosted project/version state, deployment or the current eight-agent product.

The dossier is therefore organized around the product's actual authority changes: who receives a request, how competing agent teams collapse to one result, how a rendered target becomes either a direct edit or an agent request, and how enabling a real backend changes the available version model.

## Ordinary-user critical path

The official [AI app-builder flow](https://atoms.dev/usecases/ai-app-builder) exposes four headline stages—describe, review the plan, let agents write code, and deploy. The operational path is longer because the user must also choose an execution regime, verify live state and deliberately promote a result.

| Stage | Ordinary action | State that actually changes | Evidence needed before continuing |
|---|---|---|---|
| 1. Choose a regime | Start in Engineer, Team, Deep Research or Race Mode; decide whether the project needs Atoms Cloud or an external backend | chat mode, participating roles, credit/runtime envelope and possibly the project's future version constraints | selected mode is visible; backend choice and integration restrictions are understood before expensive work starts |
| 2. State the product | Describe users, flows, business logic, visual direction, constraints and edge cases | the chat requirement and agent working context | the brief names the ordinary user journey, not merely pages or visual style |
| 3. Review intent | Read and adjust the generated product specification, architecture, database schema or human-review task list | approved plan and structured task context | scope, roles, data entities, permissions and main flows match intent before implementation |
| 4. Build | Let Mike coordinate the relevant specialists, or let Alex act alone in Engineer Mode | generated project files, assets, backend definitions and a new build attempt | agent completion is accompanied by inspectable files, build status and a runnable preview |
| 5. Inspect the running artifact | Use App Viewer, responsive views, Console and Terminal; open the preview separately if the embed is stale | preview deployment and runtime observations, not yet production truth | the main journey works, errors are understood, stored data and protected paths behave correctly |
| 6. Refine | Edit selected elements in Visual Editor, change Theme variables, target files with `#`, or send a selected component to Chat | direct source-backed styling/content changes or a new agent-led code build | rendered change survives reload and is present in source/version state rather than only the current frame |
| 7. Reconcile state | Inspect the Database Block or external Supabase project; test auth, records, uploads, APIs and payments | database schema, records, object storage, credentials and external integration state | data persists, access rules hold, code/schema versions are compatible and payment tests follow the documented deployed/Test Mode path rather than App Viewer alone |
| 8. Preserve a milestone | Keep a project version where supported, Remix, export ZIP, or manually Push to GitHub | hosted history, a forked chat/project, a file snapshot or a Git commit | exact project/version/commit is recorded; each copy is treated as a separate authority |
| 9. Release | Publish the chosen build, optionally sync schema/data, and connect or update a domain | production deployment, production database/schema and domain routing | production URL serves the intended revision and the ordinary journey is re-tested there |

The central acceptance rule is simple: a finished agent message, a plan, a generated version and a loaded preview are four different claims. None alone establishes a usable release.

## One coordinator, eight current specialists

Direct observation of [`atoms.dev/ai-agents`](https://atoms.dev/ai-agents) on 2026-08-11 showed **eight specialists**. The public page says Mike runs the plan end to end and requests approval at important steps; it assigns each other agent a bounded responsibility.

| Agent | Current public role | Product authority advertised at the surface |
|---|---|---|
| Mike | Team Leader | coordinates the workflow, delegates work and asks for human approval |
| Emma | Product Manager | turns the idea into a specification and bounded scope |
| Bob | Architect | designs the system blueprint and technical structure |
| Alex | Engineer | builds frontend, backend, integrations and deployment |
| David | Data Analyst | analyzes data and produces decision-oriented results |
| Iris | Deep Researcher | validates demand and produces sourced research |
| Sarah | SEO Specialist | creates and improves search-oriented content |
| Adrian | Ads Specialist | creates, tracks and optimizes advertising campaigns |

This list is visibly evolving. The current [Your Agents Team](https://help.atoms.dev/en/articles/12129380-your-agents-team) and [Communicating with Agents](https://help.atoms.dev/en/articles/12174308-communicating-with-agents) articles still enumerate seven roles and omit Adrian, while the live product and dedicated AI-agents page show eight. The discrepancy is recorded rather than normalized away: the live surface is the stronger current observation, while the help pages remain useful for role behavior.

The user can address a specialist directly. The help material recommends `@Alex` for quick implementation or fixes and `@David` for data work. It does not publish the hosted routing packet, role memory schema, task ownership record or arbitration logic, so named characters should not be mistaken for proof of eight independent long-lived processes.

## Four execution regimes

The [Mode Switching Guide](https://help.atoms.dev/en/articles/12129385-mode-switching-guide) makes “multi-agent” a selectable operating policy rather than a property of every request.

| Mode | Active path | Best-supported use | Consequence |
|---|---|---|---|
| Engineer | Alex only | simple sites, prototypes, demos and focused implementation | lower coordination and credit cost; no claim that the broader team participated |
| Team | multiple specialists | complex product, research, data and cross-discipline work | richer intermediate artifacts and more credits |
| Deep Research | Iris-led research | sourced business, market or academic reports | report is its own artifact and can later be converted into a site, presentation or document |
| Race | multiple model/team paths for one request | expensive, consequential or open-ended builds and revisions | parallel candidates exist temporarily and must collapse to one chosen baseline |

Modes can change during a chat. New chats remember the selected Engineer/Team setting, and a Remix inherits the source chat's mode. That makes the mode part of execution provenance even though no export schema for it is public.

## Race Mode is a temporary branch-and-select system

Race Mode is Atoms' most distinctive orchestration mechanism. The current [Race Mode help article](https://help.atoms.dev/en/articles/12129504-race-mode), [brand story](https://atoms.dev/mgx-is-now-atoms) and app-builder page establish the following product contract:

1. one prompt is submitted to multiple model or agent-team paths;
2. candidate outcomes are generated in parallel;
3. the user compares the results or stops the race early;
4. one result is selected as the project to continue;
5. unselected results are discarded to save storage.

The durable operation is therefore **selection**, not parallel generation. Until a candidate is chosen, there is no single project baseline. After selection, the losing candidates are intentionally unavailable as normal project history. This is closer to a temporary branch tournament than to a persistent variant graph.

The mode has sharp boundaries:

- it is restricted to the Max plan in the current help material and consumes more credits than a standard run;
- a depleted credit balance can interrupt generation;
- Supabase- or Stripe-integrated projects cannot use it;
- the same help page says it works for all project types and sizes, but that statement is narrower than it sounds because stateful integrations remain excluded;
- candidate ranking, automated checks, model routing, isolation, storage and conflict semantics are proprietary.

Atoms publishes benchmark and cost-improvement claims for Race Mode. Those are vendor evaluations rather than independently reproduced acceptance evidence here. For a real project, the chosen candidate still needs source review, runtime testing, data verification and release validation.

## Visual refinement splits at the selected component

### Theme constrains generation globally

The April 2026 [Theme and Visual Editor announcement](https://atoms.dev/blog/introducing-theme-and-visual-editor) describes Theme as a project design system made from global palette, typography and spacing variables, with fourteen curated starting templates at that snapshot. Its purpose is to keep later generated pages inside a stable visual envelope and let a small variable change affect the wider site.

Public evidence does not expose the Theme file format, token identifiers, cascade rules, component binding, migration behavior or revision relationship to application code. Theme is therefore established as durable project context at the product boundary, not as an inspectable design-token implementation.

### Visual Editor has a direct lane and an agent lane

After a build, the user chooses **Design** under App Viewer, clicks a rendered element and receives controls for text, typography, colors, borders, spacing or layout. Official material says those changes appear immediately and can be hard-coded during review without another prompt.

For a deeper layout, logic or component change, **Add to Chat** carries the selected element into the language-driven coding workflow. The same target therefore supports two different mutation paths:

| Path | User intent | Observable result | Publicly unknown boundary |
|---|---|---|---|
| Direct control | deterministic text/style/layout adjustment | immediate rendered change and a claimed hard-coded update | selected-node packet, source coordinate, AST rewrite, repeated-instance scope, save timing and revision guard |
| Add to Chat | semantic refactor or behavioral change grounded in the selected component | a new agent-led code-changing build | target serialization, context lifetime, code-file resolution, model patch policy and conflict handling |
| File reference | `#`-reference a file from Chat or the Editor file tree | agent request narrowed to a named file | whether a later generated move/rename invalidates the reference and how concurrent edits are checked |

The product proves rendered-element targeting and code-changing refinement. It does **not** publish a file/range/component/source-map identity for the selected element. A precise click is not yet evidence of deterministic source return.

## App Viewer is the verification surface, not the artifact authority

The [App Viewer guide](https://help.atoms.dev/en/articles/12129698-app-viewer) establishes a browser-rendered preview with desktop, tablet and mobile widths, a separate-tab escape, Console, Terminal progress and an AI-assisted **Resolve** action for some errors.

Its recovery sequence is operationally revealing:

- wait for the agent cycle and preview deployment;
- refresh if the preview takes more than roughly two minutes;
- inspect Console and Terminal rather than treating a blank frame as missing source;
- use **Resolve** when offered, which starts another mutation cycle;
- report unsupported failures from the relevant agent message.

The preview is a projection of the current build. It is not a repository commit, database snapshot or production release. A Resolve cycle that clears a console error is useful evidence, but it does not prove authentication, permissions, payments, data durability or the ordinary user's end-to-end journey.

## Backend choice changes the source-of-truth graph

Atoms exposes three materially different persistence regimes. They should not be described as one generic “backend” feature.

### Browser-only state is disposable

The current [Supabase guide](https://help.atoms.dev/en/articles/12129788-supabase-connect) explicitly motivates the integration by saying an unconnected Atoms team may store state only in browser memory, which can disappear on refresh or close. A visually working local prototype can therefore be non-durable by construction.

### Supabase is an external data authority

After authorization, the user selects a Supabase organization/project and asks the agents to generate features against it. Supabase then owns durable authentication, tables, Edge Functions and secrets. The guide says generated Edge Functions can be opened in the Supabase dashboard; requested API keys are stored in Supabase's Edge Functions Secrets Manager and injected at runtime.

This path has two independent authorities:

- Atoms project source and conversation drive generation;
- the selected Supabase project owns live schema, users, records, functions and secrets.

Real-time data visibility in the generated app does not create a code/data transaction. Schema edits in Supabase, agent-written functions, Atoms versions and a published deployment can advance on different clocks.

### Atoms Cloud is a managed, agent-shaped backend

The [Atoms Cloud architecture post](https://atoms.dev/blog/introduce-atoms-cloud) describes a built-in platform with:

- OIDC-wrapped authentication and token-based sessions;
- a managed Postgres object-relational database;
- object storage;
- serverless compute and deployment;
- Stripe integration;
- internal SDKs used by generated applications and agents.

Agents request resources, propose a data model, generate and evolve HTTP/CRUD APIs, and coordinate preview and production deployments. Users can inspect entities and fields in the Database Block, request schema changes in chat, and use the current database as application source of truth. Atoms handles provisioning and the mapping from the proposed data model to tables.

The provider identity, control-plane APIs, migration engine, tenancy model, backup implementation and internal SDK source remain undisclosed. “Postgres and standard HTTP APIs” improves conceptual portability; it does not prove that a ZIP export reconstructs auth, storage, serverless functions, secrets, policies, payment state or deployment.

## Atoms Cloud trades recoverable history for schema consistency

The most consequential Atoms-specific version rule appears in the [Atoms Cloud help article](https://help.atoms.dev/en/articles/13036940-atoms-cloud): to keep database structure aligned with code, **history versions are disabled and only the latest build is retained**.

That changes the user contract:

| Project regime | Recoverable center | Branch/rollback affordance | Main break |
|---|---|---|---|
| Standard project | hosted chat/project files plus version history | version restore, preview version switching and Remix from a selected historical point are documented | history can become long and expensive; restoring code does not establish external data or publication rollback |
| Race candidate set | temporary candidate projects | choose one or stop; losing results are discarded | parallel exploration is intentionally not durable history |
| Atoms Cloud project | latest build plus managed database/schema | help center disables history versions to avoid code/schema conflicts | ordinary version rollback is sacrificed; public recovery transaction for code, schema and records is absent |
| Supabase-backed project | Atoms files/history plus external Supabase state | code versions and external platform tools remain separate | restoring Atoms cannot be assumed to rewind tables, users, functions, secrets or records |
| Git-connected project | manually synchronized repository commits | Git branch/commit history outside Atoms | only pushed milestones are durable there; hosted data, chat, deployment and integrations are not Git objects |

The Cloud architecture post also says each requested change triggers a new “version build.” This is not enough to override the help-center rule. A build version may exist for deployment while user-accessible historical restoration is disabled; the public documents do not expose the relationship. The safe conclusion is that **latest Cloud build and live database are the working authorities, with rollback semantics unknown**.

Stripe exposes documentation drift rather than one stable regime. The Cloud architecture post presents Stripe as part of Atoms Cloud, but the live canonical [Stripe Connect guide](https://help.atoms.dev/en/articles/12129347-stripe-connect) still describes an MGX-era path through Supabase Edge Functions and says payment cannot be tested in Preview because Stripe needs a public webhook; the app must be deployed and Stripe Test Mode used. A newer search-indexed Cloud-specific article was not retrievable at a live canonical URL on 2026-08-11, so its stronger project-creation restriction is not treated as a current contract here. The exact routing between new Cloud-backed payments and the still-published Supabase path remains unresolved.

## The project is six ledgers, not one file

| Ledger | Typical contents | Mutators | Durable authority |
|---|---|---|---|
| Conversation and plan | brief, agent messages, approvals, tasks, reports and mode provenance | user, Mike and specialists | hosted project/chat history; useful orchestration evidence, not executable truth |
| Generated project | source files, assets, routes, dependencies and Theme context | agents, Visual Editor, Editor and imported/external file changes | current hosted files/version, or a reviewed Git commit after synchronization |
| Candidate set | Race Mode model/team outcomes and summaries | parallel teams, scorer and human selection | only the selected candidate becomes the continuing baseline |
| Data and services | Postgres/Supabase schema and rows, auth users, object storage, functions, secrets and Stripe state | agents, runtime users, external dashboards and platform services | the selected backend and payment providers, independently of code history |
| Preview/build | build image or functions, preview URL, Console/Terminal status and validation observations | build/deployment pipeline and Resolve cycles | evidence for the current build only; may be replaced by the next cycle |
| Delivery and archive | production deployment, domain, App World share, ZIP export and Git repository | Publish/Update, DNS, Share, Push/Pull and external collaborators | exact production deployment/domain for delivery; ZIP or Git commit for portable code, each on its own clock |

No public transaction joins all six. In particular, a project restore cannot be assumed to rewind production rows, Stripe, Supabase, DNS, a pushed Git commit or an already published URL.

## Remix, history and Git create different kinds of forks

### Remix starts a new chat lineage

The [Remix guide](https://help.atoms.dev/en/articles/12129010-remix) describes an exact copy of a selected project state into a new chat, available from App World, the current Project or a historical version. It is useful both as a public-template fork and as a way to keep code while resetting an overlong conversation.

The guide says chats beyond roughly ten versions make future requests slower and more expensive because more history must be processed. Remix shortens that context without discarding the current code. It is free for projects not connected to Atoms Cloud; Cloud-connected Remix consumes credits.

The copy boundary is not fully independent. The official disk-recovery article warns users not to delete a chat used as the base for a Remix because doing so can break the Remix. That warning means “exact copy” should not be interpreted as proof that every referenced file and storage object is eagerly duplicated.

### GitHub is a manually promoted archive

The [GitHub Connect guide](https://help.atoms.dev/en/articles/13222322-github-connect) is unusually explicit about authority: Atoms is the **active workspace**, while GitHub is the **final archive and collaboration hub**. After authorization the user manually creates or connects a repository, then chooses when to **Push** stable milestones and **Pull** remote work. The feature is documented as Pro+.

This is not automatic continuous source of truth. Work performed after the latest Push remains only in Atoms; a remote collaborator's commit remains outside until Pull. The public contract does not establish merge strategy, dirty-workspace checks, force-push protection, branch ownership or atomicity between a Git operation and an Atoms version.

### ZIP export preserves files, not the hosted system

The [Share guide](https://help.atoms.dev/en/articles/12129279-share) exports a complete ZIP of the current chat's code and assets and separately controls Public, Secret-link and Private sharing. An App World card can name a specific version. This is a portable file snapshot, not evidence that Cloud data, auth, secrets, managed infrastructure, chat history, preview deployment or domain configuration are inside the archive.

The current [Terms of Service](https://atoms.dev/terms-of-service) make no ownership claim over generated code, applications, custom implementations or user business logic and permit commercial use, modification, distribution and open-sourcing. The same Terms reserve the hosted platform implementation and allow account-associated material to be deleted after termination. Legal permission to use generated code and operational recovery of a hosted project are separate guarantees.

## Publish is an explicit promotion with a data decision

Atoms Cloud automatically deploys a preview after an agent development cycle. Production is separate. The Cloud architecture post says Publish promotes the frontend and backend APIs to a production environment with its own database/domain configuration; the current schema is synchronized and the user can optionally choose which data to sync.

The release evidence chain should therefore be:

1. identify the selected project build or Git commit;
2. inspect build status and application-level logs;
3. exercise the main journey in preview, including auth and stored records;
4. publish deliberately and record the production URL;
5. confirm which schema and data were promoted;
6. test the same journey against production services and payment test/live mode as appropriate;
7. verify domain resolution independently.

The [domain guide](https://help.atoms.dev/en/articles/13362391-connect-and-manage-domains) distinguishes the generated `*.atoms.world` subdomain, custom-domain DNS verification and the chosen primary domain. DNS can lag publication, and changing a domain does not rebuild the application. A correct preview plus a configured domain is still not proof that the production alias serves the intended build.

## What open MetaGPT explains—and what it does not

### Reproduction boundary

The related official repository was inspected outside this workspace at the immutable commit below.

| Item | Pinned evidence |
|---|---|
| Repository | [`FoundationAgents/MetaGPT`](https://github.com/FoundationAgents/MetaGPT) |
| Revision | [`11cdf466d042aece04fc6cfd13b28e1a70341b1f`](https://github.com/FoundationAgents/MetaGPT/tree/11cdf466d042aece04fc6cfd13b28e1a70341b1f) |
| Branch / commit time | `main` · 2026-01-21T18:12:32+08:00 |
| Package declaration | `setup.py` declares `1.0.0` |
| Latest remote release tag observed | `v0.8.2` |
| License | MIT |
| Current official remote HEAD checked | the same `11cdf466…` revision on 2026-08-11 |

This repository contains real MGX-named environment and role machinery. It does not contain the current Atoms web application or Cloud/Visual Editor implementation. Its default software-company entry point also hires five roles—Team Leader, Product Manager, Architect, Engineer2 and DataAnalyst—not the current eight-specialist hosted team. The open Product Manager remains named Alice while the product uses Emma. The divergence prevents accidental source substitution.

### Source-visible orchestration model

The default `Team` uses `MGXEnv`, publishes the human idea as a `Message`, runs non-idle roles concurrently for bounded rounds and archives changed project files through Git. `MGXEnv` makes Mike the message-routing coordinator:

- direct user messages can bypass Mike when an addressed role is idle;
- ordinary role messages are also routed to Mike;
- Mike republishes a task to a named specialist through `publish_team_message`;
- the leader pauses after delegating and waits for the response;
- messages retain sender, recipients, cause and optional structured instruction content.

`RoleZero` supplies a plan, a tool-command map, a bounded think/act loop, memory and an `ask_human` escape when work is uncertain or exhausts its loop. This is concrete evidence for the **shape** of coordinated, interruptible roles in MetaGPT. It is not evidence that Atoms deploys these Python classes unchanged or that every current named agent is a `RoleZero` process.

### Open artifact model

`ProjectRepo` wraps a Git repository and gives explicit repositories to PRDs, system design, tasks, code summaries, class/sequence views, source, tests and test outputs. `Team.serialize` stores team and context state in `team.json`; `Environment.archive` commits changed project files through `GitRepository.archive`.

This creates two open-framework authorities:

- generated files and Git commits are the software artifact;
- serialized team/context and message memory support agent recovery and orchestration.

The current hosted product adds databases, Cloud resources, previews, Race candidates, Theme, shares and production delivery. No public schema proves how those hosted ledgers map onto MetaGPT's local repositories or `team.json`.

### Implementation map at the pinned commit

| Path | Source-visible responsibility | What it establishes—and does not |
|---|---|---|
| [`metagpt/software_company.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/software_company.py#L14-L74) | constructs the default team, supports recovery, applies a budget and runs rounds | real five-role open workflow; not the current eight-agent roster |
| [`metagpt/team.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/team.py#L32-L138) | owns environment, roles, budget, project start, serialization and archive-triggering run loop | project idea, team/context recovery and bounded execution; no hosted version graph |
| [`metagpt/environment/mgx/mgx_env.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/environment/mgx/mgx_env.py#L11-L88) | routes direct/public messages through Mike and records history | concrete coordinator and direct-chat policy; no Race Mode or remote transport |
| [`metagpt/environment/base_env.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/environment/base_env.py#L124-L247) | registers roles, routes by address, concurrently runs active roles and archives a project | in-process environment semantics; no proof of hosted isolation or scaling |
| [`metagpt/roles/di/team_leader.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/roles/di/team_leader.py#L23-L90) | builds team context and delegates a complete task message to a named role | leader handoff and pause semantics; no current UI approval record |
| [`metagpt/roles/di/role_zero.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/roles/di/role_zero.py#L55-L130) | binds planner, tools, editor/browser and human interaction to a dynamic role | open plan/tool agent foundation; hosted model/tool policy remains unknown |
| [`metagpt/schema.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/schema.py#L232-L330) | defines routed `Message` records with structured optional content | explicit agent-message envelope; no Atoms network/API contract |
| [`metagpt/schema.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/schema.py#L457-L585) | defines dependent tasks, results and a topologically ordered plan | open task-state model; no proof of current product persistence |
| [`metagpt/utils/project_repo.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/utils/project_repo.py#L44-L148) | organizes docs, resources, source and tests around one Git workdir | source/document artifact taxonomy; no Cloud resource export |
| [`metagpt/utils/git_repository.py`](https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/metagpt/utils/git_repository.py#L114-L131) | stages and commits changed files | local Git durability; not Atoms GitHub Connect synchronization |

### Commits that changed the open orchestration conclusion

| Commit | Date | Change | Why it matters |
|---|---|---|---|
| [`1b57395d`](https://github.com/FoundationAgents/MetaGPT/commit/1b57395d0ee4d407e7cb5b0c4e890b119add086a) | 2024-04-25 | introduced the MGX environment, Team Leader prompts/role, thinking command and tests | pins the public birth of the Mike-centered MGX routing layer before the commercial launch |
| [`c6b28643`](https://github.com/FoundationAgents/MetaGPT/commit/c6b28643bdd27d5079c287365240a31fa78b08a8) | 2024-06-04 | added the leader's named team-message delegation tool | establishes explicit handoff rather than implicit shared-chat reaction |
| [`744a4bc4`](https://github.com/FoundationAgents/MetaGPT/commit/744a4bc4feee560f3a3854f6f0adb9882822a391) | 2024-07-27 | made the leader pause after publishing a team task | shows delegation as a wait-for-response control point |
| [`68f9267b`](https://github.com/FoundationAgents/MetaGPT/commit/68f9267b891174817405fbe9f45f0243662c483f) | 2024-10-12 | switched the MGX environment to public chat routing | explains why messages can be team-visible while still passing through the leader |
| [`d925d138`](https://github.com/FoundationAgents/MetaGPT/commit/d925d1381ae133b9b2d19a8b742b452ff9edca95) | 2024-10-12 | removed fixed SOP logic from `MGXEnv` | moves the open design from a hard-coded stage chain toward dynamic role/tool behavior |
| [`2c22a94a`](https://github.com/FoundationAgents/MetaGPT/commit/2c22a94aa42820760e0fe09936647e2fd63b8570) | 2025-03-02 | placed TeamLeader, Engineer2 and DataAnalyst in the default software-company roster | aligns the open entry point more closely with the MGX role family without becoming product source |

## Product evolution changed both scope and authority

| Date / period | Established event | Architectural consequence |
|---|---|---|
| 2023 | MetaGPT emerged as the open multi-agent framework | roles, messages, plans, documents and generated repositories form the public foundation |
| 2024-04 | MGX environment and Team Leader entered the open repository | coordinator-mediated multi-agent routing became source-visible |
| 2025-02-19 | MetaGPT README announced commercial MGX / MetaGPT X | hosted natural-language programming became a distinct product boundary |
| 2025-06-18 | changelog added Supabase Edge Functions | application state expanded beyond browser/source files into external backend functions and secrets |
| 2025-09-08 | changelog introduced BON / Race Mode and homepage Supabase connection | one request could create disposable parallel candidates while stateful projects gained another authority |
| 2025-11-13 | Human-in-the-Loop review was added | an editable, approved task list became an explicit gate before execution |
| 2026-01-12 | Atoms Cloud architecture was published | managed auth, Postgres, storage, APIs, payments and preview/production deployment became one agent-targeted platform |
| by 2026-03 | official brand material moved MGX to Atoms; changelog added version restore and preview-version switching for supported projects | product scope widened to a business team while ordinary projects gained stronger recovery |
| 2026-04-02 | Theme and Visual Editor launched | global design constraints and selected-element direct refinement became first-class product paths |
| 2026-05-18 | changelog added a PostgreSQL table/data management interface with CSV import/export | users gained a visible data-plane inspection and mutation surface |
| 2026-06-01 | Visual Editor multi-select entered the changelog | one visual operation could intentionally address several rendered targets |
| 2026-08-11 observation | current public surface showed eight agents, including Adrian | the system now spans post-launch growth and no longer matches seven-agent help pages or the five-role open default |

The evolution is not just additive. Each new control plane changes what must be preserved: Race Mode adds candidate selection, Visual Editor adds selected-target intent, Cloud adds live data and release environments, and growth agents add external operational effects.

## Failure and recovery map

| Failure | User-visible signal | Supported recovery | Residual risk |
|---|---|---|---|
| Preview slow or blank | App Viewer does not load after the agent cycle | refresh, inspect Console/Terminal, open a new tab, use Resolve where offered | refreshed preview can still be stale or behaviorally incomplete |
| Generated runtime error | red Console output or failed version build | Resolve starts another agent repair; unsupported cases go to feedback/support | repair completion is another build claim, not full regression proof |
| Race cannot finish | credits/resource warning or interrupted teams | check balance, stop, choose an available partial result or return to standard mode | losing candidates are discarded; integrated Supabase/Stripe projects cannot race |
| Cloud code/schema drift | product disables history versions | continue from latest build and inspect Database Block; external support may be required | no public atomic rollback of code, schema and records |
| Browser-only data disappears | state vanishes on refresh/close | connect Atoms Cloud or Supabase and rebuild the persistence path | pre-connection state may not migrate automatically |
| Payment appears correct only in preview | Stripe webhook cannot reach the preview runtime documented by the current guide | deploy the application, keep Stripe in Test Mode and verify the transaction in Stripe | the live guide still describes an MGX/Supabase path while the Cloud post describes built-in payments; current path selection is not reconciled |
| Project filesystem/cache error | corruption warning or storage exhaustion | refresh/network check, clear cache, free disk, Remix a known-good version or contact support | disk deletion is irreversible; deleting a Remix base can break descendants |
| Long, expensive chat | more history is processed on every request | Remix current code into a fresh chat | mode is inherited, conversational decisions not copied as equivalent active context, Cloud Remix costs credits |
| Git milestone missing | remote repository lacks recent Atoms work | manually Push; Pull remote changes before continuing | merge/conflict/branch safeguards are unpublished and Git omits hosted data/services |
| Published site stale | production URL differs from current preview | explicitly Publish/Update and verify the production URL | deployment, schema/data sync and domain changes are separate operations |
| Domain not live | DNS verification or propagation pending | correct A/TXT records, verify, wait for propagation, set primary domain | DNS success does not prove application revision or backend behavior |
| Account termination or storage cleanup | hosted access/material becomes unavailable | export and Push important code milestones before loss | Terms allow associated data deletion; ZIP/Git cannot reconstruct every hosted ledger |

## Evidence boundary

Established product facts:

- Atoms is the current direct continuation of MGX / MetaGPT X and is positioned as an eight-specialist business/product team.
- Engineer, Team, Deep Research and Race are distinct execution regimes.
- Race Mode creates parallel outcomes, requires selection and discards losing candidates.
- App Viewer, Theme, Visual Editor, file targeting, direct controls and Add to Chat are public refinement paths.
- Atoms Cloud exposes OIDC auth, Postgres, object storage, serverless deployment, Stripe and internal SDK-backed agents; the live Stripe help page simultaneously documents an older MGX/Supabase Edge Function path.
- standard versions, restore/preview switching, Remix, ZIP, Git Push/Pull, preview and Publish are different persistence or delivery operations.
- Atoms Cloud disables user history versions and retains the latest build to reduce code/schema conflicts.
- the related MetaGPT source contains real MGX routing, planning, file and Git mechanisms at the pinned commit.

Not publicly established:

- hosted service language/framework topology, queues, databases and model-provider routing;
- whether the eight named agents are independent processes, prompt roles or dynamically instantiated subagents;
- Race candidate isolation, scorer implementation, automated validation corpus and selection-state schema;
- Visual Editor target packet, DOM instrumentation, framework coverage, AST/source-map resolver, direct-edit writeback and concurrency guard;
- Theme representation and exact binding to generated components/source;
- hosted project, version, build, preview, share and deployment schemas;
- Atoms Cloud provider identities, provisioning APIs, migrations, backup/PITR, tenancy and cross-environment transaction semantics;
- which current projects receive Cloud-native Stripe versus the still-documented Supabase Edge Function path, and the migration boundary between them;
- code/schema/data rollback for Cloud projects and the exact meaning of a “version build” when history is disabled;
- GitHub merge policy, branch model, force/dirty safeguards and transaction boundary with an Atoms version;
- a lossless export/import path for Cloud auth, rows, storage, functions, secrets, Stripe, domains and agent history.

## Research gaps

1. Capture an authenticated ordinary-user build from brief through plan approval, Visual Editor direct change, source inspection, reload, version receipt and production publish.
2. Compare the actual selected-element payload for direct controls and Add to Chat across static elements, repeated components and responsive variants.
3. Establish whether direct Visual Editor edits always produce a project version, how multi-select broadens scope and what happens under concurrent source change.
4. Record the exact standard-project restore graph, then test the documented Atoms Cloud history-disabled boundary without risking live data.
5. Export one ordinary project and one Cloud project to determine exactly which files, manifests and service bindings survive ZIP and GitHub sync.
6. Observe Push/Pull conflict handling with independent remote commits and identify branch/revision guards.
7. Trace preview and production deployments to immutable build identifiers and test schema/data promotion receipts.
8. Reconcile the live eight-agent roster with the seven-agent help pages and determine whether mode/execution provenance is exported.

## Primary sources

### Current identity, scope and ordinary journey

- https://atoms.dev/
- https://atoms.dev/ai-agents
- https://atoms.dev/usecases/ai-app-builder
- https://atoms.dev/mgx-is-now-atoms
- https://atoms.dev/metagpt
- https://atoms.dev/blog/atoms-raises-31m-series-a-and-a-plus
- https://atoms.dev/terms-of-service
- https://help.atoms.dev/en/articles/12129380-your-agents-team
- https://help.atoms.dev/en/articles/12174308-communicating-with-agents
- https://help.atoms.dev/en/articles/12129385-mode-switching-guide

### Visual editing, runtime and orchestration

- https://atoms.dev/blog/introducing-theme-and-visual-editor
- https://help.atoms.dev/en/articles/12129698-app-viewer
- https://help.atoms.dev/en/articles/12129504-race-mode
- https://help.atoms.dev/en/articles/12175569-how-to-modify-files-or-content
- https://help.atoms.dev/en/articles/12174667-changelog

### Backend, persistence and delivery

- https://atoms.dev/blog/introduce-atoms-cloud
- https://help.atoms.dev/en/articles/13036940-atoms-cloud
- https://help.atoms.dev/en/articles/12129788-supabase-connect
- https://help.atoms.dev/en/articles/12129347-stripe-connect
- https://help.atoms.dev/en/articles/13222322-github-connect
- https://help.atoms.dev/en/articles/12129010-remix
- https://help.atoms.dev/en/articles/12129279-share
- https://help.atoms.dev/en/articles/13362391-connect-and-manage-domains
- https://atomshelpcenter.pre.mgx.dev/en/articles/12136407-how-to-fix-disk-storage-cache-issues-for-project-errors

### Open foundation and immutable history

- https://github.com/FoundationAgents/MetaGPT/tree/11cdf466d042aece04fc6cfd13b28e1a70341b1f
- https://github.com/FoundationAgents/MetaGPT/blob/11cdf466d042aece04fc6cfd13b28e1a70341b1f/LICENSE
- https://github.com/FoundationAgents/MetaGPT/releases
- https://github.com/FoundationAgents/MetaGPT/commit/1b57395d0ee4d407e7cb5b0c4e890b119add086a
- https://github.com/FoundationAgents/MetaGPT/commit/c6b28643bdd27d5079c287365240a31fa78b08a8
- https://github.com/FoundationAgents/MetaGPT/commit/744a4bc4feee560f3a3854f6f0adb9882822a391
- https://github.com/FoundationAgents/MetaGPT/commit/68f9267b891174817405fbe9f45f0243662c483f
- https://github.com/FoundationAgents/MetaGPT/commit/d925d1381ae133b9b2d19a8b742b452ff9edca95
- https://github.com/FoundationAgents/MetaGPT/commit/2c22a94aa42820760e0fe09936647e2fd63b8570
