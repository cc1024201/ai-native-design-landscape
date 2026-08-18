# Firebase Studio

> Research status: **Architecture-level / sunset transition and source-visible migration boundary reached / v1.0** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Google / Firebase; evolved from Project IDX |
| Current category | Sunsetting agentic cloud IDE and prompt-to-Firebase application builder |
| Lifecycle | New user signup and workspace creation disabled since **2026-06-22**; existing workspaces usable until shutdown on **2027-03-22** |
| Primary development artifact | Ordinary application files and local Git history inside a Google Cloud Linux VM, with a repository-carried `.idx/dev.nix` environment description |
| Adjacent authorities | Gemini/Prototyper chat, VM-local state, Firebase project/configuration, Firestore/Auth data, API keys/secrets and App Hosting/Hosting/Cloud Run releases |
| Main agent surfaces | App Prototyping agent for Next.js generation; Gemini Ask, Agent and Agent (Auto-run) modes in Code view |
| Runtime / editor | Code OSS-based browser IDE over a full cloud VM; Nix-configured tools; Web/Android previews, Firebase emulators and terminal access |
| Source availability | Closed Studio/Prototyper/hosted-workspace core; Apache-2.0 official/community templates and an MIT Firebase CLI migration path are public |
| Evidence ceiling reached | Current product, sunset, migration, workspace, agent, deployment and data contracts plus pinned template and CLI source; hosted agent orchestration, preview targeting and Studio service implementation remain closed |

## Executive finding: the application is portable; the workspace is not

Firebase Studio has always placed an unusually real artifact behind a prompt surface. The [App Prototyping agent](https://firebase.google.com/docs/studio/get-started-ai) produces a Next.js codebase, each of its responses commits changes to local Git, and the user can cross into a full Code OSS-based IDE and terminal. A generated app is therefore more than a hosted visual draft.

The 2027 shutdown reveals why that statement is still incomplete. “The Firebase Studio project” is actually five authorities with different survival rules:

1. **Application files and Git** can leave through GitHub or a ZIP and remain editable anywhere.
2. **Workspace configuration** is partly portable through `.idx/dev.nix`, but the Google-hosted VM and Studio UI are not.
3. **Agent history** lives under `/home/user/.idx/ai` and is excluded from the normal project export unless separately collected.
4. **Firebase services and production data** belong to a Firebase/Google Cloud project and survive Studio's shutdown.
5. **Deployments and domains** belong to App Hosting, Firebase Hosting or Cloud Run and have release clocks independent of the editor.

On **2027-03-22**, Google says all remaining Firebase Studio data will be permanently deleted. It also says deployed applications, Cloud Firestore, Authentication, App Hosting and the other core Firebase services will continue to run. The correct recovery unit is therefore not “download the code.” It is a verified bundle of code, history, agent context where needed, cloud-resource ownership, secrets, data/rules, release configuration and a working post-Studio deployment path.

## Journey A: Prototyper turns a brief into versioned source

### 1. Blueprint before implementation

The ordinary no-code path accepts natural language plus an optional image. The agent first returns a proposed app name, features and style guidance as an editable blueprint. Only after the user approves **Prototype this app** does implementation begin.

That approval boundary matters. The blueprint is intent, not proof that any file, Firebase resource or deployed application exists. The current Prototyper supports Next.js web applications; broader framework support belongs to Code-view templates rather than this prompt-first path.

### 2. Generation writes a real workspace

The agent writes application files, starts a preview and can wire AI functionality through Genkit and the Gemini Developer API. If the user chooses automatic key creation, Studio:

- creates or associates a Firebase project;
- creates a Gemini API key in that project;
- writes `GEMINI_API_KEY` into the workspace `.env` file;
- later transfers the value to App Hosting configuration when publishing.

This is a genuine code artifact with an attached credential and cloud-project relationship. It is not yet safe production delivery: Google's guide explicitly requires validation of model output and warns against untested generated code and PII/user data in chat.

### 3. Refinement mixes semantic, visual and source edits

Prototyper can:

- accept another natural-language request;
- draw shapes, text or images over the preview with **Annotate**;
- target a rendered icon, button, image or text region with **Select**;
- attempt an automatic error repair;
- switch into Code view for direct file editing.

The public contract establishes useful rendered-target grounding but does not expose the selected element packet, injected marker, source-map coordinate, AST target, repeated-instance behavior or stale-preview guard. Every accepted Prototyper response is committed to the local branch, so the eventual write has a Git identity; the mechanism that turns a selected pixel/element into that write remains closed.

Firebase Studio therefore does not establish a ninth source-inspected target-return family. It combines a closed visual-intent bridge with a strong, separately observable Git result.

## Journey B: Code view is a managed developer computer

The [current overview](https://firebase.google.com/docs/studio) describes a Code OSS-based IDE running on a full Google Cloud VM. Code view can open an imported repository, template-generated project or Prototyper result and gives the user ordinary files, Source Control, a terminal, extensions and framework tooling.

Gemini has three materially different authority modes:

| Mode | File authority | Command authority |
|---|---|---|
| Ask | explains or plans without proposing a write | no implied execution |
| Agent | proposes file changes; the user can update directly or inspect a detailed diff | terminal commands require a separate Run confirmation |
| Agent (Auto-run) | automatically applies proposed file changes | terminal commands still request confirmation |

Gemini can generate/refactor code, manage dependencies, create and run Docker workflows, run tests and interpret command output. The resulting files—not the chat message, tool status or preview—are the implementation artifact.

Git semantics differ by surface:

- Prototyper commits its changes to the local branch after every response.
- Direct Code-view edits require the user to stage and commit them.
- Publishing a branch to GitHub is explicit and should follow a secret review.
- Prototyper prompts are visible in its Git log, while full chat records remain a separate sidecar.

This gives Firebase Studio a stronger recovery center than a canvas-only builder, while preserving the usual distinction between an agent turn and a reviewed commit.

## The VM is reconstructible only where configuration is declared

### Nix-carried environment

Firebase Studio uses `.idx/dev.nix` to define:

- Nix packages and system tools;
- OpenVSX extensions;
- environment variables for local workspace servers;
- lifecycle hooks such as dependency installation;
- Web/Android preview commands and working directories;
- optional Docker, Pub/Sub, MySQL, PostgreSQL, Redis and Spanner services.

Because this file can live in Git, it is a portable environment *description*. It is not a snapshot of every VM file, installed user extension, shell state, credential or running service. A Nix configuration error can prevent the normal environment from starting; Studio offers a basic Code OSS Recovery environment so the user can repair `dev.nix` and rebuild.

### Preview is a process projection

The Web preview runs the command declared in `idx.previews`; Flutter workspaces can also expose an Android emulator. Studio distinguishes:

- hot reload, which preserves more runtime state and can mask initialization failures;
- full reload, which reloads the application;
- hard restart, which restarts the preview system and application server.

Files autosave by default one second after typing stops and then trigger hot reload. Autosave is persistence, not version history; HMR is runtime feedback, not build or release evidence.

The troubleshooting contract says the Studio page embeds a `cloudworkstations.dev` origin and requires third-party cookies for secure cross-origin communication. A preview transport failure can therefore be browser/session infrastructure rather than application failure.

### Sharing gives another person the whole machine

[Workspace sharing](https://firebase.google.com/docs/studio/share-your-workspace) grants collaborators complete access to the VM filesystem, including private keys and access tokens. Multiple users editing the same file can overwrite one another and Studio currently provides no merge-conflict notification for that live collaboration path.

This is not a Figma-style CRDT contract. It is shared authority over one remote computer, with Git remaining the safer durable reconciliation layer.

## Artifact topology: six ledgers under one UI

| Authority / projection | What it contains | Version or promotion mechanism | What it does not prove |
|---|---|---|---|
| workspace files | application source, tests, Firebase rules/config, `.idx/dev.nix`, `.env` and local tool state | autosave and explicit file writes | a saved file is not committed, portable, built or deployed |
| local Git | Prototyper response commits, manual Code-view commits and user branches | commit/branch/revert; optional GitHub push | it omits untracked secrets, complete VM state, live data and release state |
| agent ledger | Prototyper and Gemini chat files under `/home/user/.idx/ai`; prompt traces also appear in Prototyper Git history | separate threads; delete or `/clear` operations | normal project ZIP does not contain full chat history |
| planning IR | app blueprint and, in exported Prototyper projects, possible `docs/blueprint.md` and `docs/backend.json` | agent-written reference files | the open migration source explicitly says `backend.json` is not live infrastructure, Terraform state or deployment configuration |
| Firebase project | API keys, Firestore, Authentication, service configuration, IAM/billing and possibly App Hosting backend | Firebase/Google Cloud control planes | project association is not application correctness; code rollback does not rewind records/users/services |
| release destinations | temporary Studio preview, App Hosting rollout/domain, Hosting channel/production or Cloud Run service | destination-specific deploy and rollback | a green preview, deploy command or old URL does not prove the intended build/data/rules are live |

The UI can make these ledgers feel continuous. Their receipts and rollback scopes remain separate.

## Firebase integration begins after generation and can mutate live control planes

The Prototyper's initial blueprint does not add Firestore or Authentication. During iteration, the user can ask for them. The agent then modifies application/configuration files and can write and deploy Cloud Firestore Security Rules. Google's guide tells the user to inspect those rules in the Firebase console and test with multiple identities.

One Firebase project is associated with the Prototyper publication path at a time. The user can ask the agent to switch to a specific project ID, or use Code/GitHub workflows to target another App Hosting backend. This association controls credentials and resources; it is not merely a label on the workspace.

Important split-brain cases include:

- local emulators versus live Firestore/Auth;
- repository rules versus console-edited rules;
- code configuration versus project IAM and enabled services;
- `.env` in the VM versus App Hosting environment/secrets;
- development records versus production users and data.

Deploying rules from project files overwrites the currently deployed console rules. Publishing also does not automatically create every required Firestore index: the official acceptance flow asks users to exercise all production queries, follow missing-index errors and re-test authorization.

## Delivery is four different products, not one Publish state

| Destination | Intended use | Receipt | Critical gate |
|---|---|---|---|
| Studio Web preview | active development process inside the workspace | current preview URL plus clean full/hard reload | can disappear when workspace sleeps/shuts down; public access lasts only while enabled and active |
| Firebase App Hosting | dynamic Next.js/Angular application | completed rollout, exact `*.hosted.app`/custom domain and observability | Cloud Billing/Blaze required; backend, environment variables, data/rules and URL must be verified separately |
| Firebase Hosting | static content or SPA | named channel or production deployment | dynamic application behavior may not fit; a Gemini “publish” request is only the start of the flow |
| Cloud Run | containerized application | deployed service/revision and `*.run.app` or mapped domain | project/billing/authentication and domain migration are independent |

App Hosting can roll back a deployed build through its Rollouts page. That operation does not claim to rewind Firestore records, Auth users, project settings, API keys, agent chat or the Studio workspace. Conversely, restoring code through Git does not change the currently served rollout.

## Versioning and recovery: Git is central, but never universal

The current evidence establishes these recovery mechanisms:

- each Prototyper response creates a local commit;
- **Restore to a previous point** uses Git-oriented rollback behavior;
- the Source Control graph can branch from an older application version;
- direct Code edits can use normal Git;
- App Hosting keeps separate deployment rollouts;
- agent chats survive workspace resets as separate threads until deleted;
- `/clear` removes chat history and its Restore button;
- the workspace can be exported to GitHub or ZIP.

No mechanism atomically rewinds source, chat, `.env`, Firebase rules, live records/users, cloud services and deployment. The release notes even record a past fix that inserted a history message after a Git revert so stale chat changes would not be re-applied—direct evidence that conversation state and repository state required explicit reconciliation.

## Sunset migration is the product's decisive technical journey

### Fixed timeline

| Date | Event |
|---|---|
| 2026-03-19 | sunset announced; migration tools began rolling out |
| 2026-06-22 | new user signup, workspace creation, import-based creation and duplication disabled |
| 2027-03-22 | Firebase Studio shuts down; remaining Studio data is permanently deleted |

Google promises critical security patches and Gemini model updates for existing workspaces during the transition. It does not promise new product development or a recoverable archive after the deadline.

### Route A: preserve the prompt-first experience in Google AI Studio

**Move now → Prepare for AI Studio → Move to Google AI Studio** converts and opens the code in a new AI Studio workspace. This is the recommended route for Prototyper-heavy users.

Delivery then forks:

- To retain an existing App Hosting URL/custom domain, secure the Gemini key as an App Hosting environment variable, create/sync a GitHub repository from AI Studio and connect that repository to the existing backend.
- To accept a new URL, import the Firebase project into AI Studio and publish to Cloud Run; custom-domain remapping can take time and create downtime.

The transfer is a code/workspace conversion. The migration guide does not claim that Firebase Studio chat threads become native AI Studio threads.

### Route B: make source local in Google Antigravity

The recommended code-first path is:

1. Zip and Download the workspace.
2. Extract it locally and open it in Antigravity.
3. Use the migration agent or run `npx firebase-tools@latest studio:export PATH`.
4. rebuild and preview locally;
5. publish through Firebase CLI/agent skills to the existing App Hosting backend where appropriate.

The CLI guide says its transformation is optimized for Next.js, Flutter and Angular. Other workspace types may not have every artifact updated.

### Route C: leave Google's development tools

A ZIP or GitHub export produces standard application source that can be developed elsewhere. `firebase init apphosting` can connect it to the existing backend named `studio` to retain the URL, or the app can move to another host and accept a new URL. Firestore and Authentication continue regardless of the chosen development/hosting surface.

### The migration unit an owner should actually collect

Before shutdown, a defensible migration receipt should include:

- a reviewed Git remote and exact commit, including `.idx/dev.nix`, rules/configuration and lockfiles;
- a separate archive of `/home/user/.idx/ai` if agent history matters;
- an inventory of ignored/untracked files and safely re-created secrets rather than a committed `.env`;
- Firebase project ID, ownership/IAM, billing account and enabled APIs;
- Firestore schema/data, indexes and deployed rules; Authentication providers, authorized domains and users;
- App Hosting/Hosting/Cloud Run backend, exact production URL/domain and last known-good rollout;
- a cold local build plus ordinary-user authentication/data journeys in the destination environment;
- a post-migration deploy from the new tool to prove the future release path.

Only the workspace creator can use **Move now**. There is also current documentation skew: the migration FAQ suggests a shared collaborator may duplicate a workspace, while the workspace guide says duplication has been disabled since 2026-06-22. A collaborator should not rely on duplication; coordinate owner migration or perform a manual export and deliberately replace the original owner's backend/API-key bindings.

## Public source boundary: templates and migration tooling, not the Studio core

### Official template layer

The Apache-2.0 [`firebase-studio/templates`](https://github.com/firebase-studio/templates/tree/d7a65bce3668c44d20780ad5a197bedf906c20c2) repository is pinned here at verified commit `d7a65bce3668c44d20780ad5a197bedf906c20c2` (2026-04-27).

Its React/Vite template demonstrates the public bootstrap contract:

- [`idx-template.json`](https://github.com/firebase-studio/templates/blob/d7a65bce3668c44d20780ad5a197bedf906c20c2/react-vite/idx-template.json) declares user-visible metadata and a language parameter;
- [`idx-template.nix`](https://github.com/firebase-studio/templates/blob/d7a65bce3668c44d20780ad5a197bedf906c20c2/react-vite/idx-template.nix) runs Vite scaffolding, copies `.idx/dev.nix`/AI rules and prepares a lockfile;
- [`dev.nix`](https://github.com/firebase-studio/templates/blob/d7a65bce3668c44d20780ad5a197bedf906c20c2/react-vite/dev.nix) selects Node 20, defines creation hooks and starts a Web preview on `$PORT`.

The separate Apache-2.0 [`firebase-studio/community-templates`](https://github.com/firebase-studio/community-templates/tree/1382e5b49d0868e929274f7f7f59136ceb984786) snapshot is pinned at `1382e5b49d0868e929274f7f7f59136ceb984786`.

These repositories explain how a workspace is seeded. They do not publish the workspace scheduler, Code OSS fork/integration, Prototyper planner, visual target packet, Gemini context service, collaboration backend or preview gateway.

### Source-visible shutdown adapter

The more consequential open slice is MIT [`firebase/firebase-tools`](https://github.com/firebase/firebase-tools/tree/v15.26.0). At the 2026-08-11 snapshot:

| Distribution fact | Pinned value |
|---|---|
| npm version | `firebase-tools@15.26.0` |
| annotated Git tag | `v15.26.0` → commit `7ee389e32dcd7ff3de93daa707ada271704913d7` |
| npm `gitHead` | `7ee389e32dcd7ff3de93daa707ada271704913d7` |
| npm tarball SHA-256 | `a2d5ff6a10dda17fd5005ee39c7267ec9cbba4f136f8ded07c7133afa08fcbbf` |

[`src/commands/studio-export.ts`](https://github.com/firebase/firebase-tools/blob/7ee389e32dcd7ff3de93daa707ada271704913d7/src/commands/studio-export.ts) accepts a ZIP or directory, extracts a single top-level export when present and invokes the migration pipeline.

[`src/firebase_studio/migrate.ts`](https://github.com/firebase/firebase-tools/blob/7ee389e32dcd7ff3de93daa707ada271704913d7/src/firebase_studio/migrate.ts) then:

1. detects Flutter, Angular, Next.js or `OTHER` from project files;
2. recovers project ID from `metadata.json`, `studio.json` or `.firebaserc`, and app name from `docs/blueprint.md`;
3. rewrites README guidance and retains the previous README underneath it;
4. creates/updates `.firebaserc` and App Hosting `firebase.json`;
5. attempts to upload `GEMINI_API_KEY` from `.env` as an App Hosting secret;
6. installs Firebase and Genkit agent skills, writes `.agents` rules/workflows and configures optional Firebase/Dart MCP servers;
7. adds `.vscode` tasks/launch settings and removes Studio-only `.modified` and `.idx/mcp.json` files;
8. optionally launches Antigravity.

The migration source sharpens several acceptance boundaries:

- App Hosting backend discovery failure falls back to the name `studio`; verify the chosen backend instead of trusting the default.
- secret upload catches failure, logs a warning and lets migration continue; a success exit is not a secret-availability receipt.
- the generated MCP configuration calls `firebase-tools@latest`, so future runs are not pinned to the migration package revision.
- `OTHER` receives generic `npm run dev` assumptions while the public guide already warns of incomplete transformation.
- the generated agent instruction explicitly says `docs/backend.json` is only a blueprint and may diverge from live resources.
- no code in this adapter exports Firestore records, Auth users, full chat history or App Hosting rollout history.

This is a real commit-level implementation boundary, but it is a **migration adapter around ordinary files and cloud references**, not source for Firebase Studio itself. Architecture-level is therefore the highest justified dossier grade.

## Data, model-context and permission boundaries

Firebase Studio enables code completion and codebase indexing by default. `.aiexclude` can hide paths from indexing, chat and inline modification; `.gitignore` paths are excluded from Gemini automatically. An empty `.aiexclude` blocks its entire subtree, and unlike `.gitignore`, negation rules are not supported.

The current product notice says:

- to prevent prompts/responses from being used for model training, do not use Prototyper or Gemini assistance in Studio;
- to prevent code from being used for model training, turn off code completion and code indexing;
- never place PII or user data in agent chat;
- review the License Log for generated-code citations;
- inspect files before GitHub publication and exclude secrets;
- treat a shared workspace as full VM access, not limited project collaboration.

An auto-generated Gemini key stored in `.env` is particularly sensitive because a public preview, shared workspace, Git push and migration each cross different trust boundaries. Migration should rotate or re-home the key in App Hosting/Secret Manager and prove the old key has been invalidated where appropriate.

## Failure map for the final ordinary-user journey

| Apparent success | Missing evidence | Required check |
|---|---|---|
| blueprint accepted | no implementation yet | inspect generated files, dependencies and first Git commit |
| Prototyper response complete | model may have changed wrong/shared code or only repaired the visible case | review diff/commit and run relevant tests |
| hot preview looks correct | retained state, wrong environment or HMR can hide startup defects | hard restart, cold build and repeat the real journey |
| emulator flow passes | production indexes, rules, auth domains, records and credentials differ | exercise roles/queries against intended production resources |
| local commit exists | not backed up and does not include ignored secrets/chat/cloud state | push reviewed commit and inventory external authorities |
| Publish clicked | billing/service setup or rollout can still fail | verify completed destination revision and exact domain |
| App Hosting rollback succeeds | database/users/rules and Studio files did not roll back | test data compatibility and separately reconcile source/config |
| ZIP downloaded | default project export omits full agent history and never contains live Firebase data | collect `.idx/ai`, cloud inventories and safe secret restoration separately |
| migration CLI exits successfully | secret/backend/unsupported-framework warnings may have been non-fatal | audit generated diff, backend ID, secret, local build and new deploy |
| deployed app still runs after 2027-03-22 | future source edit/release capability may already be lost | prove the destination repository, developer environment and deploy path before shutdown |

## Evolution explains the final split

| Date | Architectural change |
|---|---|
| 2023-08-08 | Project IDX introduced a Code OSS browser environment on a full Google Cloud Linux VM, initially with Codey/PaLM 2 assistance |
| 2024-05-14 | IDX entered public beta without a waitlist and expanded framework, collaboration and Firebase integration |
| 2025-04-09 | Firebase Studio launched in preview, combining IDX, Gemini in Firebase, Genkit, a Next.js App Prototyping agent and Firebase delivery |
| 2025 | Prototyper gained stronger visual refinement, Git-oriented rollback, Firebase rules/data integration and Gemini 2.5 models |
| 2026-03-19 | Google moved the prompt-first Firebase path toward AI Studio and the code-first agent path toward Antigravity; Studio sunset announced |
| 2026-06-22 | creation/signup/duplication stopped; the product became an existing-workspace migration surface |
| 2026-08-05 | `firebase-tools@15.26.0` shipped the pinned `studio:export` transformation inspected here |
| 2027-03-22 | scheduled service shutdown and permanent deletion of remaining Studio data |

## What remains unknown

- the Prototyper plan/tool protocol and hosted model routing;
- the exact preview Select/Annotate target packet and source-reconciliation algorithm;
- the Studio-specific Code OSS fork, extension host and workspace orchestration source;
- whether every agent response is committed atomically with all its terminal/file side effects;
- concurrent agent/direct-edit conflict and stale-write rules outside ordinary Git;
- complete serialization of blueprint, Restore points and chat-to-commit relationships;
- the exact AI Studio conversion algorithm and which Studio-only metadata it discards;
- a formal, machine-verifiable manifest covering code, chat, Firebase resources, secrets, data and deployment in one migration;
- any supported recovery path for a workspace left behind after 2027-03-22.

## Practical acceptance checklist

For an existing Studio project, “complete” now means both product acceptance and exit readiness:

1. Record workspace owner, Firebase project ID, repository remote/commit and production backend/domain.
2. Review/push all intended code and environment/rules configuration without secrets.
3. Export agent history separately if it carries decisions not represented in source/docs.
4. Inventory and secure `.env`, Gemini/API keys, IAM and billing.
5. Verify Firestore records/indexes/rules, Auth providers/users/domains and other enabled services.
6. Choose AI Studio, Antigravity or another developer environment and produce a cold local build there.
7. Run the actual signed-in/data-bearing user journey, not only the Studio preview.
8. Deploy a new revision from the destination tool to the intended existing or replacement URL.
9. Verify rollback and incident access in Firebase/Google Cloud without relying on Studio.
10. Retain immutable migration receipts before the shutdown deadline.

## Evidence ledger

The following live documents were retrieved and hashed on 2026-08-11. Hashes identify this research snapshot; Google may update the pages later.

| Evidence snapshot | SHA-256 |
|---|---|
| Studio overview | `c9b21c0f1e6a02b7c166f332c2af581efb22e7d08c46fcc1eec24ad9f6d59129` |
| App Prototyping guide | `bf6233e68ebd14a07b97cdd23a892dd2b723707fbc77c2fc67224afc5149c2fc` |
| Gemini in Code view | `a05785bda01cf0aa00bff5e957533dcf4d6939e67f10bb1d5366facdf1d95b67` |
| Workspace guide | `031c5455e619943d2f799f02ed66b546da47fddefa11c9b5dfbb38f15da1c923` |
| Preview guide | `091dfa9b201d9362b332dff2260294d03dbffa14d3b18a01b4fce1cc81eb3d41` |
| GitHub export guide | `7cdfd568ee06b5369281b0a328456453b1ff25b873a985c7ccf29593ae2b1d0d` |
| Deployment guide | `f2ab5ed570e7321d9938813a360e4b58c4bb86fe7b744b3712954fe5823fed9c` |
| Sunset/migration guide | `3c75117be0523a814e9c454e0f5863d3ad1f83618175e17546115ea26106dae5` |
| Troubleshooting guide | `9cae5e3dcf158c34175aaf200b36dab81d9fe06476a6f76f387cca3b418d108c` |
| Release notes | `76f020d2a92a83da66327bdba11048805817a7757d0da044f3f27015ec9dfa44` |
| 2025 launch post | `db522fce6515d0367e7a40532abbf1f44a1a9a78997b628eb2c991f6aa2ab90d` |
| 2026 sunset post | `dc3645bfa679942c1bf855531104d3d56756bf9b4981ade88c2ed9957ed6bf9d` |

Pinned source-file hashes:

| Source artifact | SHA-256 |
|---|---|
| official React/Vite `idx-template.nix` at `d7a65bc` | `1983cc366310336980e88690fe6d05672d80b58e89c12dbe6c8982c9ad6d2b7d` |
| official React/Vite `dev.nix` at `d7a65bc` | `1c471681f4e1dba4171f8976df8e1c52ae2d2f112eac916c6db27c84f0cdd025` |
| `studio-export.ts` at `7ee389e` | `2138e35759c1733b89b66b1174de609e1af3a05d141f7c655e9f43ee92b88fb0` |
| `migrate.ts` at `7ee389e` | `a8e15e48446190d19fd44d5ed74d434e75e30b111fa33f2cfb915d096f3b7763` |
| generated migration instructions at `7ee389e` | `c2f878a641eb2eb480057d0f666d50d70afc38fae4b80023fdffa95ecd74ca9b` |

## Primary sources

- [Firebase Studio overview](https://firebase.google.com/docs/studio)
- [Get started / current lifecycle](https://firebase.google.com/docs/studio/get-started)
- [App Prototyping agent](https://firebase.google.com/docs/studio/get-started-ai)
- [Gemini in Code view](https://firebase.google.com/docs/studio/try-gemini)
- [Configure Gemini and `.aiexclude`](https://firebase.google.com/docs/studio/set-up-gemini)
- [Workspace model and Nix recovery](https://firebase.google.com/docs/studio/get-started-workspace)
- [Customize a workspace](https://firebase.google.com/docs/studio/customize-workspace)
- [Preview and autosave behavior](https://firebase.google.com/docs/studio/preview-apps)
- [GitHub export and commit behavior](https://firebase.google.com/docs/studio/github)
- [Workspace sharing](https://firebase.google.com/docs/studio/share-your-workspace)
- [Publishing and production verification](https://firebase.google.com/docs/studio/deploy-app)
- [Sunset and migration guide](https://firebase.google.com/docs/studio/migrating-project)
- [Troubleshooting and restore behavior](https://firebase.google.com/docs/studio/troubleshooting)
- [Firebase Studio release notes](https://firebase.google.com/support/release-notes/firebase-studio)
- [Official custom-template contract](https://firebase.google.com/docs/studio/custom-templates)
- [Project IDX announcement](https://developers.googleblog.com/introducing-project-idx-an-experiment-to-improve-full-stack-multiplatform-app-development/)
- [Project IDX public beta](https://developers.googleblog.com/start-building-with-project-idx-today/)
- [Firebase Studio launch](https://firebase.blog/posts/2025/04/introducing-firebase-studio)
- [Firebase Studio sunset announcement](https://firebase.blog/posts/2026/03/announcing-ai-studio-integration)
- [Pinned official templates](https://github.com/firebase-studio/templates/tree/d7a65bce3668c44d20780ad5a197bedf906c20c2)
- [Pinned community templates](https://github.com/firebase-studio/community-templates/tree/1382e5b49d0868e929274f7f7f59136ceb984786)
- [Pinned Firebase CLI migration implementation](https://github.com/firebase/firebase-tools/tree/7ee389e32dcd7ff3de93daa707ada271704913d7)
