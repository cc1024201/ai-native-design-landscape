# v0

> Research status: **Architecture-level / closed-source boundary reached; public Platform API SDK implementation inspected** · Last reviewed: **2026-08-11**

| Field | Verified value |
|---|---|
| Product / operator | v0, operated by Vercel Inc. |
| Current category | Full-stack application and agent builder; repository-native agent, browser IDE and visual refinement surface |
| Lifecycle | Active; generally available since 2024 and rebuilt as the “new v0” in February 2026 |
| Primary working object | The current application files in a **Chat-specific Vercel Sandbox**; after GitHub connection, the repository branch is explicitly the durable source of truth |
| Project object | A Vercel Project owns production URL, deployments, domains, environment variables and integrations; several Chats can target it, but each Chat has an isolated VM/working state |
| Human surfaces | Prompt/chat, live Preview, code editor, Design Mode, annotations, terminal, Git/PR panel and deployment panel |
| Agent surfaces | Native v0 agent; web/browser/Bash/MCP tools; Platform API v1 and beta v2; current OAuth v0 MCP server |
| Public SDK snapshot | [`vercel/v0-sdk`](https://github.com/vercel/v0-sdk/tree/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86) at `8450ffe6ceded12412c8326ac9cd7c0b2bc08f86`; Apache-2.0; 249 commits |
| Current npm snapshots | v2 package `v0@3.0.4`; legacy v1 package `v0-sdk@0.16.7` |
| Closed boundary | Hosted agent, model routing, Design Mode element grounding/source rewrite, VM orchestration, Git synchronizer, collaboration service and deployment control plane |
| Evidence snapshot | Official product/docs/changelog/legal pages, pinned official SDK source and npm distributions; no account, Chat, repository, integration or deployment was mutated |

## The shortest accurate description

Current v0 is not primarily a mockup generator. It is a hosted software workspace that gives one conversation an isolated, persistent development VM, lets an agent and human edit the same current files, and can promote those files through GitHub and Vercel.

Its decisive architecture is therefore three clocks, not one “v0 file”:

```text
Chat
  ├─ message / tool history
  └─ per-Chat Sandbox
       ├─ current files
       ├─ dev server + Preview
       ├─ editor / Design Mode / agent / terminal
       └─ volatile processes and session state

GitHub repository
  └─ Chat working branch -> commits -> PR -> base branch

Vercel Project
  └─ env + integrations + domains -> preview/production deployments
```

The Chat is the work context. The VM files are the current editable state. Git becomes durable code authority when connected. A Vercel deployment is a separately built delivery artifact. No public transaction rewinds all three together.

## Two ordinary journeys establish where authority lives

### Journey A: create a new application, refine it visually, then publish it

The ordinary path described by the [Quickstart](https://v0.app/docs/quickstart), [agent guide](https://v0.app/docs/agentic-features), [Sandbox guide](https://v0.app/docs/sandbox) and [deployment guide](https://v0.app/docs/deployments) is:

1. Start a Chat or choose a Project, then describe an app in natural language. Attach screenshots, files, a Figma frame, a template or a saved design-system skill when useful.
2. Answer any clarifying question or approve a plan rather than treating the first prompt as a complete specification.
3. v0 creates or resumes the Chat's isolated Sandbox, writes source files, installs dependencies, runs a development server and streams tool work into the conversation.
4. Exercise the live Preview. Ask the agent to use its browser, inspect logs and run tests; do not accept a screenshot as behavior proof.
5. Refine through one of three inputs that touch the same current file set:
   - another natural-language message;
   - direct browser code editing;
   - Design Mode or annotation selections over the running Preview.
6. Add databases, APIs or other services through Vercel integrations and environment variables. Re-test real loading, empty, error and permission states.
7. Publish. If no Vercel Project exists, v0 creates one; the latest current app state is built as a Vercel deployment and assigned to the Project's production URL.
8. Verify the public URL, build logs, runtime data, auth and custom domain. A healthy Sandbox Preview is not production evidence.
9. Connect GitHub before treating the result as maintainable source. Once connected, Git—not a hidden v0 copy—is the documented source of truth.

The path can produce a real full-stack app, but “Publish succeeded” proves only a particular deployment build. It does not prove that later Chat files, a Git branch, the production alias and an external database all describe one atomic revision.

### Journey B: import a real repository and deliver one reviewed change

The “new v0” made existing-code work first-class. The [Git Import](https://v0.app/docs/git-import) and [GitHub](https://v0.app/docs/github) contracts establish this flow:

1. Install the Vercel GitHub App with access to the repository and select the source repository, base branch and monorepo root.
2. If the user has write access, v0 works against the original repository. With read-only access, it clones the repository into the user's GitHub account for a fork-style contribution.
3. Attach an existing Vercel Project when available so the Chat receives its development configuration, integrations and environment variables; otherwise create a separate Project deliberately.
4. v0 creates a Chat-specific working branch such as `v0/main-abc123`. The protected base branch is not edited directly.
5. The branch is checked out into the Chat's VM. Human code edits, agent file operations, terminal commands and Preview all act on that working tree.
6. Every message that changes code is automatically committed to the working branch. Inspect the file diff, tests, browser behavior and the actual branch/commit—not merely the agent summary.
7. Open a pull request from v0. If the base moved, review the merge and any agent-assisted conflict resolution before accepting it.
8. Merge through GitHub. Start a new Chat/branch for subsequent work rather than silently continuing on the merged feature branch.
9. Verify the Git-triggered Vercel deployment and production behavior. The merged commit is code authority; the deployment id and production alias are delivery evidence.

Once connected, official documentation says v0 stores no separate durable copy of the code and deletion of the GitHub repository can make it unrecoverable. The Sandbox still contains a working filesystem, but it is a checkout/runtime cache rather than a competing repository history.

## The actual artifact and identity model

“Project,” “Chat,” “version,” “message,” “branch,” “Preview” and “deployment” are different objects.

| Object | Public identity / contents | Authority | Important non-authority |
|---|---|---|---|
| Workspace / scope | personal or Vercel team scope, membership and policy | who can create, share, spend, connect tools and administer resources | not an application revision |
| Vercel Project | `vercelProjectId`, production URL, domains, environment variables, integrations and deployment policy | runtime configuration and delivery destination shared by associated Chats | not the complete Chat prompt/tool history |
| v0 Chat | Chat id, privacy, metadata, messages, current files, linked Vercel Project and optionally Git branch | one conversational workstream and its current app state | not a globally atomic snapshot of every Chat targeting the Project |
| Sandbox | one Chat-owned VM filesystem, processes, dev server, tools and current environment | editable/run state during development | not production and not a Git backup |
| Message | message id, role, ordered parts, attachments, usage and finish state | provenance for a requested/agent action; v2 restore anchor | not necessarily a code mutation or deploy |
| Browser Chat version | generated code snapshot created when a message changes code | linear non-Git recovery point in the hosted UI | direct file edits do not create one |
| Git working branch | repository, base ref, branch name and commits | durable source truth after Git connection | does not own Vercel env values or production alias |
| Preview access | VM dev-server URL and, in API v2, a short-lived preview token | access to the current development runtime | not a durable public URL or release |
| Deployment | deployment id, Vercel Project id, build and immutable deployment output | one built delivery result | production alias can later point elsewhere |
| Design-system skill | user/team skill name plus sources, starter app and `v0.json` | reusable generation/setup guidance | existing apps do not update automatically |
| Template | a published Chat snapshot with stable listing URL | fork seed for another user's independent Chat | template updates do not synchronize existing forks |

### The word “Project” changed meaning across public interfaces

The browser product's current [Projects](https://v0.app/docs/projects) page describes one cohesive app that shares a Vercel deployment target, domains, environment variables and settings across multiple Chats. Folders merely organize Chats.

Legacy Platform API v1 also exposed a separate v0 `projectId`. Platform API v2 deprecates that organizing resource: callers group Chats with metadata, read `vercelProjectId`, and use the Vercel API for environment and deployment administration.

These statements can coexist only if the boundaries remain explicit:

- the current Vercel Project is the shared infrastructure/delivery object;
- each Chat has an isolated VM and current file state;
- a Git-backed Chat normally represents one working branch;
- public docs do not specify a single shared-filesystem transaction across several non-Git Chat VMs.

## Design Mode is a source-update request, not a second design document

The [current Design Mode contract](https://v0.app/docs/design-mode) is precise about the save boundary.

### What happens before Apply

- Design Mode overlays controls on the running app in Preview.
- It is available only on the latest Chat version using the latest preview runtime, and not in read-only Chats or mobile viewports.
- The user selects a rendered element and can change typography, color, background, spacing, border, opacity, radius, shadow and literal text.
- Tailwind-aware values are offered when the project uses Tailwind, bounded by classes and tokens v0 can detect.
- Structural requests can be attached as natural-language instructions; v0 adds a screenshot of the selected element.
- Undo, redo, reset and before/after operate on **pending** Design Mode edits. Leaving with unapplied work triggers a warning.

The Preview can therefore look correct while the source and durable history are unchanged.

### Apply crosses the boundary

On Apply, v0 serializes the pending edits, instructions and screenshots into the Chat and generates an updated source version. That new version is diffable and recoverable like another v0 edit.

The public contract does **not** expose:

- a stable source id, file/range, AST node or source-map packet for the selected DOM element;
- whether a simple style change is rewritten deterministically or always participates in an agent/model pass;
- how selection survives conditional rendering, portals, repeated records or a source refactor;
- a Git commit id created specifically by Apply;
- an atomic join between pending DOM changes and concurrent direct, agent or collaborator edits.

It is therefore accurate to call Design Mode **rendered-element-to-source regeneration**, not proven bidirectional AST editing. Git diffs establish what source changed after Apply; they do not establish how the element was grounded internally.

### Annotations are a separate, lower-commitment channel

The June 2026 [changelog](https://v0.app/changelog) added Annotations Mode: click Preview elements, place numbered comments, then submit the batch to the agent. An annotation is review context, not a mutation or saved code checkpoint until a later generation changes files.

## Four histories coexist, and only one is Git

### Browser Chat versions

The [Versions guide](https://v0.app/docs/versions) says:

- a new version is created when a message updates code;
- direct code/file edits do not create versions;
- restoring an old version copies it forward as a new latest version, keeping the history linear;
- deployment uses the latest version, so an older state must first be restored.

Direct editing can be saved into current files without creating a comparable recovery point. The current editor documentation exposes save/reset behavior, while the May 2026 changelog says the VS Code editor autosaves by default; neither claim turns each keystroke into a version.

### Legacy Platform API v1

The still-published `v0-sdk` package addresses first-class Chat versions. It can initialize from files/repository/ZIP, update files on a specified `versionId`, fork from a version and deploy a selected version.

### Beta Platform API v2

The [v1→v2 migration contract](https://v0.app/docs/api/v2/guides/migrating-from-v1-to-v2) removes version resources:

- a Chat is the durable workspace and current file state;
- Messages record what happened and expose ordered parts for file reads/edits, search, Bash, tool calls and agent actions;
- `GET/PATCH /v2/chats/{chatId}/files` reads or replaces current files;
- `restore-message` moves current files back to the state associated with an assistant Message and creates new Messages recording that restore;
- old v1 Chats cannot be reused; migration downloads one chosen v1 version and creates a new v2 Chat from its ZIP.

This is a state migration, not history-preserving identity transfer. Old Chat/version ids may be kept only as metadata.

### Git and deployments

When Git is connected, code-changing messages create repository commits on the Chat branch. Git supplies branching, blame, PR review and merge history that hosted Chat versions do not replace.

Deployments add another immutable build id and a mutable production URL. Restoring a Chat version does not by itself revert Git main, an already-built deployment, a database migration, environment variables or domain routing.

## The Sandbox is the convergence plane during work

The current [Sandbox guide](https://v0.app/docs/sandbox) establishes a VM-backed runtime that replaced the old browser-only `next-lite` preview.

Inside one Chat:

- the code editor, v0 agent, Bash tool, terminal and dev server read/write one filesystem;
- Node.js plus `pnpm`, `npm`, `yarn` and `bun` are available;
- framework detection starts Next.js, Vite or a generic Node server;
- repository dependencies and background watchers run as real processes;
- files persist when the user leaves and later returns;
- an active Sandbox session can run for up to 24 hours, then idle instances stop and resume on demand.

Isolation boundaries are equally important:

- a new Chat gets a new VM; files and processes do not leak across Chats;
- another user reaches the VM only through Chat sharing/authorization;
- production always runs on different Vercel infrastructure;
- connected Vercel Project environment variables are available both to the application **and to agent tools** inside the Sandbox;
- outbound Sandbox Network Policy defaults to `allow-all` unless a team owner narrows it.

The Preview is thus materially closer to `npm run dev` than the old simulated renderer, including server routes and real services. It remains a development environment: production build configuration, deployment policies, data, domains, caching and auth can still differ.

## Native agent control and external interfaces

### Native agent tools

The agent can combine:

- file reads and edits;
- web search with cited sources;
- browser use against its Preview or external references;
- automatic runtime/build diagnosis and “Fix with v0” deployment-log repair;
- Bash in the Sandbox;
- Marketplace and user-supplied MCP tools.

Progress cards and screenshots are useful evidence, but the durable evidence remains changed files, test output, branch commits and a reachable deployment.

### Bash permission is layered, not binary

The [Terminal commands guide](https://v0.app/docs/terminal-commands) documents three modes:

| Mode | Default action | Residual boundary |
|---|---|---|
| Ask | confirms every command outside the built-in read-only allow list | explicit user/team allow and deny rules still combine |
| Auto | silently runs allow-listed inspection and asks for other commands | current default; network, writes, remote Git and package execution normally ask |
| Full | runs otherwise unrestricted commands without asking | system deny rules still block operations such as recursive force deletion |

Rules are scoped to user and team and combine so any deny wins; `ask` can still require confirmation in Full mode. A command starts in a fresh shell at the project root, so shell-local state is not implicitly preserved.

### v0 consumes MCP and also exposes v0 through MCP

These are opposite directions:

1. **v0 as MCP client.** The [MCP integrations guide](https://v0.app/docs/MCP) lets the agent call Marketplace or bring-your-own remote tools. Auth can be none, headers, bearer or OAuth. Integration execution can be disabled, manual or auto; new native integrations default to manual and dangerous operations retain approval. MCP tools help the agent during generation; the generated app does not inherit those tools.
2. **v0 as MCP server.** The current beta v2 [MCP server guide](https://v0.app/docs/api/v2/guides/mcp-server) exposes `https://v0.app/api/mcp` over OAuth. Its seven endpoint-backed capabilities create/list/get Chats, list/send Messages, resolve a pending task and fetch Preview access.

An older v1 page still documents `https://mcp.v0.dev` with an API key. That is a compatibility trap, not evidence that both endpoints have the same auth, tools or lifecycle; new integrations should follow the v2 OAuth guide while it remains explicitly beta.

## Platform API v2: current files and agent traces, not the whole product implementation

The pinned [`openapi.json`](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/openapi.json) contains 44 operations across:

- Chat creation from prompt, files, ZIP or GitHub repository, plus sync/async/streaming modes;
- Chat get/list/update/delete/duplicate, current files, ZIP download and Message-based restore;
- Message list/get/send/stop/resolve, including explicit streaming and async variants;
- Preview access, Vercel Project creation and deployment trigger;
- configured MCP servers;
- trusted Preview hosts;
- usage, activity and webhooks.

It does not publish the server implementation behind those endpoints.

### Auth and client composition

The Apache-licensed [`src/index.ts`](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/src/index.ts) wraps generated methods. With no explicit auth it reads `V0_API_KEY`; if absent in server-side Vercel code, [`vercel-oidc.ts`](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/src/vercel-oidc.ts) obtains a project-scoped Vercel OIDC token.

OIDC can access only resources associated with the Vercel Project that minted the token. Design-system skills are not available under that project principal; team/user API keys are required for scope-owned skills.

### Streaming is reconstructed client-side

Sync, async and SSE are separate v2 endpoints. The handwritten [`stream/result.ts`](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/src/stream/result.ts) accumulates state and JSON-diff patches into replayable snapshots, exposes a final Promise, and can relay the result as SSE.

This proves how the SDK reconstructs transport state. It does not reveal model streaming, tool scheduling, VM file commits or server persistence.

### Preview access is capability-bearing and intentionally proxied

`getPreview` can return a short-lived URL plus token. The SDK's [`preview-proxy.ts`](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/src/preview-proxy.ts):

- attaches the token as `x-v0-preview-token` only to the exact Preview origin;
- strips authorization, cookies, forwarded/proxy and Vercel infrastructure headers;
- strips upstream cookies/cache headers from the response and forces `private, no-store`;
- handles server-requested token refresh through a caller-owned cache callback;
- normalizes caller-controlled paths and checks origin again so a scheme/host escape cannot receive the token.

Commit `30b7dde…` added that path-escape defense plus regression tests. This is public adapter security evidence, not the closed Preview service implementation.

## Git is the durable source return path

The Git integration solves a different problem from Design Mode: it does not map a clicked pixel to an AST node, but it makes every accepted source change auditable as ordinary repository files and commits.

| Transition | Durable evidence | Remaining race |
|---|---|---|
| prompt / Design Mode → current files | Chat generation, file diff and working Preview | pending/direct edits can exist without a version or commit |
| code-changing message → Chat branch | signed/automatic Git commit and remote branch status | public docs do not define atomicity between Chat record, VM write and remote push |
| Chat branch → base branch | pull request, checks, review and merge commit | base can move; conflict resolution is another agent/user-authored change |
| base branch → Vercel | Git-triggered deployment id and build logs | deployment may fail or policy may block it after merge |
| deployment → production | alias/domain points to chosen deployment | data migrations, external services and env changes have their own clocks |

The July 2026 changelog records both signed v0 commits and fixes for silent team auto-push failures. That history is evidence that a green Chat generation and a remote branch update are separate acceptance checkpoints.

## Inputs become code; most provenance does not remain live

| Input | How v0 uses it | Durable result | Provenance break |
|---|---|---|---|
| Natural-language brief | agent plans, writes, runs and repairs files | current Chat files, then Git/deployment if promoted | prompt is intent/provenance, not executable authority |
| Figma link | extracts visual structure, tokens, colors and spacing as generation context | newly generated application code | no documented Figma node/component/variable identity or reverse sync |
| Screenshot / image / reference URL | visual context for generation or browser comparison | source/assets chosen by the agent | pixels and external DOM are not retained as source mappings |
| GitHub repository | real clone/working branch in a VM | normal repository commits and PR | VM/process state and Chat trace are not part of Git |
| Files or ZIP | seeds a new Chat current state | new hosted files; v1→v2 migration uses this path | original Chat/version history is not transferred |
| Template | forks a published Chat seed | independent Chat/app lineage | later template updates do not migrate forks |
| Design-system sources | agent builds and verifies an adapter skill/starter | scoped skill plus `v0.json` and starter app | consuming apps are copies until explicitly migrated |
| MCP / Marketplace data | tools provide generation-time context or actions | external system changes plus generated code | the generated app cannot call the generation MCP without its own integration |

## Design Systems 2.0 is an adapter with its own version clock

The [Design Systems 2.0 guide](https://v0.app/docs/design-systems-2) accepts package/source repositories, real consumer apps, Storybook/docs, Figma references, notes and private-package credentials.

The import process:

1. inspects current sources and asks for missing setup;
2. builds a starter app to verify components, providers, fonts, CSS, tokens and package installation;
3. saves a user- or team-scoped **skill**;
4. records reusable setup in `v0.json`, documented as the source of truth for what the skill applies;
5. uses the reviewed starter as the starting point for later apps.

The skill is an adapter, not a copy of all upstream documentation. Pinning package versions and Git refs is the only documented way to reduce drift. Updating the skill re-checks its starter but does not update existing projects; each app needs a deliberate agent-authored migration and ordinary code review.

## Collaboration is shared context plus independent branches, not proven CRDT editing

The [Sharing](https://v0.app/docs/sharing) and [Teams](https://v0.app/docs/teams) contracts expose Private, team, Unlisted and Public visibility, plus Can view / Can edit permissions.

Boundaries that matter:

- a Vercel team Owner can open, edit or delete a team-owned Private Chat by direct URL even without an invitation;
- collaborators on a Git-backed Chat normally need repository access, unless the team enables “Allow v0 to Act on Behalf of Members”;
- v0 recommends View + Duplicate for independent experiments instead of several people writing one Chat history;
- duplicating into the same Project retains infrastructure context but creates a distinct Chat/branch; duplicating into a new Project drops that configuration;
- multiple Chats can update the same Project production URL, so the last deliberate deployment wins;
- no public CRDT, file-lock, multi-user cursor or transaction protocol for simultaneous direct edits is documented.

Public and Unlisted Chats expose the full prompt history to their audience. Public templates and code can be copied by others.

## Security and data boundaries

### Secrets are scoped, but tools in the scope can read them

Vercel Project environment variables avoid pasting secrets into prompts and can be environment-specific. In the Chat Sandbox, however, the docs explicitly make connected variables available to the running app and agent tools. Pre-installed agents and terminal commands should therefore be treated like processes on a developer machine with those credentials.

Narrow:

- GitHub App repository access;
- Sandbox network policy, whose default is allow-all;
- Bash user/team rules and permission mode;
- MCP server scopes and Manual/Auto execution;
- Vercel Project environment targets;
- deployment policy and production access;
- Chat visibility.

### Current legal terms are plan-sensitive

The current [Vercel Terms](https://vercel.com/legal/terms), [AI Product Terms](https://vercel.com/legal/ai-product-terms) and [Privacy Notice](https://vercel.com/legal/privacy-notice) are stronger evidence than a generic API marketing sentence.

- Users must not place sensitive personal information such as health, financial-account or government-id data in AI inputs.
- Hobby and trial-Pro content may be used for model training subject to account data preferences; paid Pro is opted out by default and can opt in; Enterprise is opted out.
- Public Customer Content—including Chats, templates and code—may be viewed and copied.
- Outputs may be incomplete, unsafe, non-unique or unsuitable and require independent review.
- Connected third-party services and model providers remain separate legal/security boundaries.

The v1 API overview's broad claim that code “is not used for training” must therefore not be generalized across every current plan and setting.

## Open-source and distribution truth

### What is public

At snapshot date, [`vercel/v0-sdk`](https://github.com/vercel/v0-sdk) was an Apache-2.0 monorepo with 249 commits. The current tree contains:

- generated `v0` v2 client/types from a checked-in OpenAPI schema;
- handwritten auth, stream reconstruction and Preview proxy helpers;
- `@v0-sdk/react` transport/SWR helpers that call an application-owned proxy rather than exposing a secret in the browser;
- AI-tool and example applications.

### What is not public

No source repository was found for the hosted v0 web product, agent planner/model routing, Design Mode DOM grounding, Sandbox coordinator, Git synchronization service, collaboration backend or deployment orchestration. The SDK calls these services; it does not implement them.

### Two npm lines expose two API generations

On 2026-08-11:

| Package | API generation | Distribution evidence |
|---|---|---|
| [`v0@3.0.4`](https://registry.npmjs.org/v0/3.0.4) | beta v2 current-file/Message model | Apache-2.0; 23 entries; 158,214-byte tarball / 908,930 bytes unpacked; SHA-1 `3e9cfc1686d33a4de5fdfee571ed929441002e22` |
| [`v0-sdk@0.16.7`](https://registry.npmjs.org/v0-sdk/0.16.7) | legacy v1 Project/version model | Apache-2.0; 7 entries; 16,598-byte tarball / 142,578 bytes unpacked; SHA-1 `16658fe46e20ce57013a1f2aad4cd641c2cfec31` |

The repository README still recommends `v0@canary`, while npm marks `3.0.4` as `latest` and the docs still label v2 beta/not production-ready. A version number or stable npm tag does not remove that stated API stability boundary.

## Failure map and correct recovery

| Failure | Observable symptom | What may already be durable | Correct recovery |
|---|---|---|---|
| Pending Design Mode edits abandoned | Preview looked right, source unchanged | nothing beyond session state | return before navigation, Apply deliberately, then inspect the source diff |
| Direct editor change has no Chat version | current file changed but version picker cannot recover it | current VM file, possibly later Git sync | save/commit explicitly; do not assume every editor save created a version |
| Chat generation passed but branch did not update | correct Preview, missing remote commit | VM and Chat history | inspect remote branch/commit; retry sync without regenerating unrelated code |
| Base branch moved | PR conflicts or stale checks | working branch commits | merge/rebase deliberately, review the conflict-resolution diff and rerun checks |
| Sandbox expired or resumed badly | dead Preview, missing process, stale dependency state | persistent files and perhaps Git commits | restart Preview/process, reinstall as needed, verify files before asking for regeneration |
| Preview passed but deployment failed | dev app works, Vercel build/logs fail | current files/branch commit | use build logs and production build locally/agentically; fix the same branch and redeploy |
| Deployment policy blocks publish | Publish unavailable or rejected | source and perhaps PR | satisfy team policy or use the authorized deployment path; do not bypass governance |
| Environment value missing/wrong target | preview or production integration fails | code/deployment can already exist | inspect Development/Preview/Production scopes separately and rotate leaked secrets |
| Repository deleted after connection | Chat cannot reconstruct code | prompt history and perhaps deployments | restore repository from independent backup; official docs warn v0 has no competing source copy |
| Restore misunderstood as global rollback | Chat looks older while Git/deploy/data remain newer | all other clocks | restore or revert Git, deployment alias, env and data separately with explicit ids |
| Figma conversion loses behavior/identity | visual approximation with wrong components/state | generated code | split frames, supply design-system sources and manually verify behavior; no round-trip claim |
| Design-system skill drifts | new apps use changed setup; old apps remain old | each app's pinned code | update/re-check skill, then migrate every consumer through reviewed Git changes |
| MCP/Bash performs an unintended action | external data or repo changes beyond source diff | remote action may already be irreversible | default writes to manual/ask, inspect exact tool/command, rotate tokens and use provider audit/recovery |
| Private Chat assumed private from team owner | Owner opens it by direct URL | Chat remains team-owned | use the correct ownership/scope and understand administrative access before adding sensitive context |
| v1/v2 client mixed | missing Project/version method, incompatible Chat id or wrong MCP auth | old Chat/version remains intact | pin the API/package generation; migrate selected files through ZIP and retain old ids only as metadata |

## Ordinary-user acceptance gate

A v0 task is not finished until the evidence chain matches the requested destination:

1. The intended Chat, Vercel Project, repository, base branch, working branch and scope are visibly correct.
2. Requirements, attachments, selected design system and external tools are scoped to this task.
3. The agent or human changed only intended files; direct and pending visual edits are no longer hidden session state.
4. The actual interaction works in Preview, including loading, empty, error, auth and responsive states.
5. Tests/linters/builds were run in the same file state being reviewed.
6. When Git-backed, the expected remote commit and PR contain the reviewed diff.
7. Merge checks pass against the current base; any conflict resolution is reviewed as new code.
8. The target Vercel deployment completed and its immutable deployment id is recorded.
9. The production URL/domain, environment variables, integrations and real data work from an ordinary user's browser.
10. Recovery is real: a known Chat/Message or Git commit can be restored without pretending it also rewinds deployment, environment or data.

## Commit-level evidence from the public SDK

| Date | Commit | What it establishes |
|---|---|---|
| 2025-07-16 | [`8a4b337`](https://github.com/vercel/v0-sdk/commit/8a4b33766ebaf773167f276ebe4cc50c558f9037) | initial public v1 SDK lineage |
| 2025-07-17 | [`20ceed7`](https://github.com/vercel/v0-sdk/commit/20ceed703ce288da62813f15857081879feb5ed7) | file-first `chats.init()` entered the public client rather than prompt-only creation |
| 2025-08-24 | [`ad9ee1b`](https://github.com/vercel/v0-sdk/commit/ad9ee1ba7f0f0cda5c8c40ee467fba71121c3b34) | public React adapter package added |
| 2025-08-28 | [`451c8b1`](https://github.com/vercel/v0-sdk/commit/451c8b1869141529950f3a36eb719aa2eb6e252f) | streaming support entered the SDK lineage |
| 2025-09-02 | [`98d3b44`](https://github.com/vercel/v0-sdk/commit/98d3b440fdbcbdb7b95d4dbc557133ec148e02f7) | React layer moved toward headless client composition |
| 2026-07-21 | [`9801eb4`](https://github.com/vercel/v0-sdk/commit/9801eb499b4c769011736f3d97e132331f8b9c2b) | daily v2 OpenAPI regeneration workflow added |
| 2026-07-30 | [`f0c88f6`](https://github.com/vercel/v0-sdk/commit/f0c88f660850abd7e8b9352fea5d12ba12f3c0d4) | repository-scale v2 rewrite removed first-class Project/version client code and introduced Chat files, Messages, Preview proxy and VM-oriented examples |
| 2026-07-31 | [`30b7dde`](https://github.com/vercel/v0-sdk/commit/30b7dde6a984c19eae13b87c11dad63167cf1a66) | Preview proxy host-escape/token-leak regression fixed and tested |
| 2026-07-31 | [`75a1d73`](https://github.com/vercel/v0-sdk/commit/75a1d73aa2765f96583656fdedd2799850b5f528) | example clone added an application-owned auth seam around API and Preview proxy routes |
| 2026-08-07 | [`8450ffe`](https://github.com/vercel/v0-sdk/commit/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86) | current pinned `v0@3.0.4` release |

## Fact, inference and unknown

| Status | Statement |
|---|---|
| Fact | Each current Chat runs an isolated VM whose editor, agent, terminal and Preview share one filesystem. |
| Fact | Connecting GitHub makes the repository the documented source of truth and gives each Chat a working branch with automatic commits for code-changing messages. |
| Fact | Design Mode keeps visual changes pending until Apply serializes them into a source-generating Chat version. |
| Fact | Browser versions, v1 API versions, v2 current-file/Message restore, Git commits and Vercel deployments have different semantics. |
| Fact | Platform API v2 and its OAuth MCP server are explicitly beta; the Apache SDK exposes transport/contracts, not the hosted implementation. |
| Fact | A connected Project's environment variables are available to the app and agent tools in the Chat Sandbox. |
| Inference | The closed Design Mode runtime must maintain some session-level relationship between a rendered element and sufficient context for the agent/source rewriter, but no stable public source-identity packet is established. |
| Inference | In a Git-backed Chat, the VM acts as a working checkout/cache over repository authority even though product documentation sometimes describes Projects as sharing one app/file system. |
| Inference | Message parts and Git commits can support an audit trail, but completeness depends on closed server logging, tool integrations and out-of-band repository actions. |
| Unknown | Exact DOM-to-source grounding, mutation serialization schema and deterministic-versus-model rewrite rules in Design Mode. |
| Unknown | Atomicity and conflict policy across direct editor writes, agent writes, collaborator input, Chat state and remote Git push. |
| Unknown | Non-Git cross-Chat file convergence behind the browser Project abstraction. |
| Unknown | Closed agent prompts, model routing, planning, context compaction and automatic error-repair algorithms. |
| Unknown | Sandbox snapshot/storage implementation, retention after Chat deletion and disaster-recovery guarantees. |
| Unknown | Whether every UI restore/Design Mode Apply in every Git state maps 1:1 to a signed remote commit. |

## Primary sources

### Product, ordinary journeys and artifacts

- [What is v0?](https://v0.app/docs)
- [Quickstart](https://v0.app/docs/quickstart)
- [Introducing the new v0, 2026-02-03](https://vercel.com/blog/introducing-the-new-v0)
- [Projects](https://v0.app/docs/projects)
- [Folders](https://v0.app/docs/folders)
- [Code editing](https://v0.app/docs/code-editing)
- [Design Mode](https://v0.app/docs/design-mode)
- [Versions](https://v0.app/docs/versions)
- [Sandbox](https://v0.app/docs/sandbox)
- [Agentic features](https://v0.app/docs/agentic-features)
- [Terminal commands and permissions](https://v0.app/docs/terminal-commands)
- [Git Import](https://v0.app/docs/git-import)
- [GitHub workflow](https://v0.app/docs/github)
- [Deployments](https://v0.app/docs/deployments)
- [Figma import](https://v0.app/docs/figma)
- [Design Systems 2.0](https://v0.app/docs/design-systems-2)
- [Templates](https://v0.app/docs/templates)
- [MCP integrations consumed by v0](https://v0.app/docs/MCP)
- [Sharing](https://v0.app/docs/sharing)
- [Teams and roles](https://v0.app/docs/teams)
- [Security](https://v0.app/docs/security)
- [Current changelog](https://v0.app/changelog)

### Platform API, MCP and public source

- [Platform API overview](https://v0.app/docs/api)
- [Platform API v2 overview](https://v0.app/docs/api/v2)
- [v1→v2 migration](https://v0.app/docs/api/v2/guides/migrating-from-v1-to-v2)
- [v2 current-file update](https://v0.app/docs/api/v2/reference/chats/update-chat-files)
- [v2 Design System skills](https://v0.app/docs/api/v2/guides/design-systems)
- [Current OAuth v0 MCP server](https://v0.app/docs/api/v2/guides/mcp-server)
- [Legacy v1 MCP server page](https://v0.app/docs/api/platform/mcp)
- [Pinned SDK repository](https://github.com/vercel/v0-sdk/tree/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86)
- [Pinned Apache-2.0 license](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/LICENSE)
- [Pinned v2 OpenAPI schema](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/openapi.json)
- [Pinned SDK auth/stream composition](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/src/index.ts)
- [Pinned Preview proxy](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/src/preview-proxy.ts)
- [Pinned stream accumulator](https://github.com/vercel/v0-sdk/blob/8450ffe6ceded12412c8326ac9cd7c0b2bc08f86/packages/v0-sdk/src/stream/result.ts)
- [npm metadata for `v0@3.0.4`](https://registry.npmjs.org/v0/3.0.4)
- [npm metadata for `v0-sdk@0.16.7`](https://registry.npmjs.org/v0-sdk/0.16.7)

### Legal

- [Vercel Terms of Service](https://vercel.com/legal/terms)
- [AI Product Terms](https://vercel.com/legal/ai-product-terms)
- [Privacy Notice](https://vercel.com/legal/privacy-notice)

All live-product, package, policy and API claims are snapshot-dated. The hosted product remains closed; its unknown mechanisms are not back-filled from SDK method names or marketing language.
