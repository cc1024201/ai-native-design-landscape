# Devin

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Cognition; shipped desktop licenses identify Exafunction, Inc. |
| Category | Autonomous cloud software-engineering agent plus local multi-agent IDE and visual verification surfaces |
| Status | Active; current inspected Devin Desktop stable release <code>3.6.27</code> dated 2026-08-01 |
| Product boundary in this dossier | Devin Cloud, Devin Desktop, Devin CLI and their handoff/control surfaces are kept in one directory because Cognition explicitly unified them under the Devin brand; their machines and artifact authorities remain separate |
| Source availability | Cloud agent and local agent/editor implementation closed; current desktop and CLI distributions inspectable; public handoff, release, deployment and extension repositories are adjacent source, not the product core |
| Decisive artifact question | When work crosses a local checkout, a local preview, a fresh cloud VM, a PR and a video recording, which object is the implementation, which object is evidence, and what can actually be recovered? |
| Evidence used | Current official docs and API schemas, official release feeds, read-only inspection of the current Windows portable archive, and public repositories pinned to commits |

## Product thesis: “Desktop” names three different surfaces

The word **Desktop** is overloaded in the current Devin product family. Resolving that collision is necessary before reasoning about architecture or persistence.

| Surface | What it is | Execution authority | Durable center |
|---|---|---|---|
| Cloud session Desktop | The graphical tool inside a remote Devin session, formerly presented as Interactive Browser/Browser and now able to expose the full session desktop | A fresh Cognition-hosted Linux or Windows session VM | The resulting repository branch/PR and session records; the VM is working state |
| Devin Desktop | The local Mac/Windows/Linux IDE formerly named Windsurf, with local agents, worktrees, previews, remote cloud sessions and ACP agents | The user's local checkout or a local Git worktree for local agents; a separate cloud VM for cloud Devin | Local files/Git for local work; cloud branch/PR for delegated work |
| Installable Devin app | The <code>app.devin.ai</code> Progressive Web App announced on 2026-03-07 | The same remote web product opened in an installed browser shell | Server-side cloud sessions; the PWA installation is not a local IDE or session VM |

The architecture is therefore not “one desktop that follows the user.” It is a control plane over plural machines:

~~~text
organization snapshot ─> fresh cloud VM ─> session branch/PR ─> recorded visual evidence

local checkout/worktree ─> local Preview context ─> local or ACP agent ─> local files
           │
           └─ conversation/plan handoff ─> another fresh cloud VM ─> branch/PR

Agent Command Center + Space = organization and context layer, not one shared filesystem
~~~

[Devin Desktop's FAQ](https://docs.devin.ai/desktop/devin-desktop-faq) says the 2026-06-02 rebrand unifies Devin Cloud, Desktop, CLI and Review. It also says the classic editor remains and local-only agents are supported. Brand convergence and command-center convergence are product facts; execution-state convergence is not.

## Ordinary-user journey A: a cloud session produces a PR and visual proof

The evidence-backed remote journey is:

1. Configure an organization environment, preferably with a version-controlled YAML blueprint.
2. Start a cloud session from the web app, Devin Desktop, CLI, an integration or the Sessions API.
3. Devin boots a fresh copy of the organization's active environment snapshot.
4. Devin edits and runs the repository using shell, embedded IDE and the graphical Desktop/Browser. A user can inspect the same session, stop the agent, edit in the embedded IDE and then resume.
5. Devin creates a branch and PR as the reviewable implementation result.
6. For an eligible PR, the testing workflow checks how to run the app, derives a focused plan from the diff and project, starts the application, exercises one flow with Computer Use and records the screen.
7. The processed recording is attached to a session message for human review.
8. The reviewer separately examines the PR, automated checks and real application behavior before merging.

The decisive artifact transition occurs at the repository branch and PR, not when a session says it is finished and not when a recording renders successfully:

~~~text
prompt + snapshot baseline
  -> mutable session working tree
  -> branch / commit / PR
  -> focused visual run
  -> recording attachment
~~~

[Testing & Video Recordings](https://docs.devin.ai/work-with-devin/testing-and-recordings) explicitly calls the recording a quick sanity check around one primary end-to-end flow and directs exhaustive coverage to existing test suites and CI. A recording proves that one observed run happened; it is neither a complete behavioral specification nor a deterministic replay.

### Computer Use is a screenshot/action loop, not source mapping

[Computer Use](https://docs.devin.ai/work-with-devin/computer-use) exposes a 1024 × 768 graphical desktop and mouse, keyboard, scroll, drag and screenshot actions. Current documentation supports:

- Linux as the default session platform;
- Windows sessions configured from a Windows blueprint;
- browser applications, Electron/native desktop applications and terminal UIs on the chosen platform;
- Windows-native WPF/WinForms applications on Windows sessions;
- no macOS session support.

The mechanism is an observe/action loop over rendered state. It can validate interactions that do not reduce to a request API, but its target is a screen coordinate or browser state—not an authored file, AST node or design-document identity.

Chrome inside the session listens for CDP connections on port <code>29229</code>. A Playwright script can attach to the existing browser instead of launching a new one, so cookies, <code>localStorage</code> and authentication tokens created by that script remain available to later browser/Computer Use actions in the same browser. That continuity is useful for test setup; it does not turn browser state into a repository version.

### The recording is a delivery object with its own failure path

The structured test sequence is setup, focused plan, recorded execution, processing and attachment. Its boundaries matter:

- the feature is offered for sessions where Devin creates a PR, although the user can request a recording at other points;
- connectivity, secrets, login walls and application startup can block the run;
- the app can crash or video processing can time out;
- if processing fails, raw recordings remain on the session machine and must be requested before that machine becomes unavailable;
- Skills under <code>.agents/skills/</code> can make repeated setup/testing instructions durable in the repository.

The video and PR advance on separate clocks. There is no public transaction proving that an attachment was recorded from the exact final commit later merged, that the test covered every changed behavior, or that an edited video preserves every failure encountered during the run.

## A snapshot is a boot baseline, not cloud-file history

[Environment configuration](https://docs.devin.ai/onboard-devin/environment) defines the cloud machine model precisely:

1. configuration is built into a frozen, bootable snapshot;
2. each session boots a fresh copy;
3. session changes do not persist back into the snapshot;
4. each organization has exactly one active snapshot;
5. changing configuration builds a new snapshot for later sessions.

A snapshot can include cloned repositories, tools, dependencies, shell configuration and startup commands. Enterprise golden snapshots can also provide copied machine templates, including browser cookies. Those facts do not make a snapshot a checkpoint for a session's later code edits.

| Layer | What it records | What it can restore or reproduce | What it does not restore |
|---|---|---|---|
| Blueprint | Declarative environment instructions in YAML | Rebuildable environment intent | A completed session working tree |
| Active snapshot | Frozen bootable machine baseline | A clean starting machine for new sessions | Mutations made inside an earlier session |
| Session VM | Current repository, processes, browser and GUI state | The running session while it remains available | Organization baseline or another session |
| Git branch/PR | Committed repository change and review metadata | Reviewable/mergeable implementation state | Browser cookies, uncommitted VM files or recording process |
| Recording attachment | Processed visual evidence for one run | Human review of the captured flow | Source state, full test coverage or deterministic rerun |

The active snapshot is therefore closer to a machine image used for boot than to undo history.

### The public Sessions API is a control ledger, not a VM filesystem contract

The current [v3 Get Session schema](https://docs.devin.ai/api-reference/v3/sessions/get-organizations-session) exposes identifiers and control metadata including:

- session, organization, parent and child-session identities;
- origin such as web app, API, CLI or desktop;
- status and status detail;
- title, tags, mode, timestamps and consumed ACUs;
- optional validated structured output;
- pull requests as <code>pr_url</code> plus <code>pr_state</code>.

The schema does not expose a session filesystem manifest, working-tree hash, browser-state revision, recording-to-commit binding or machine snapshot digest. A client can poll whether work is running, suspended, waiting or finished; that is not evidence that the intended files exist or that the PR contains them.

## Ordinary-user journey B: local Preview sends runtime context to an agent

[Devin Desktop Previews](https://docs.devin.ai/desktop/previews) proxy a local development server into either the built-in browser pane or an external Chromium browser. The user can select an element or capture console errors and place that evidence into the current agent's pending message context. The same user-facing route supports Devin Local, remote agents and ACP agents.

The ordinary local repair loop is:

1. Open a repository in Devin Desktop and start its local development server.
2. Open the server through Preview.
3. Click **Send element**, then select the rendered target.
4. Review the pending element and optional screenshot in the agent message box.
5. Ask the chosen local/remote/ACP agent to locate and change project code.
6. Inspect the actual file diff.
7. rebuild or hard-reload the application and re-run the interaction.

The durable result is whatever the agent actually writes to the local checkout/worktree or its own remote branch. Selection itself changes no source.

### The shipped element packet is structured runtime evidence

Read-only inspection of the current Windows portable archive found the model-facing formatter in the shipped workbench bundle. It produces:

~~~text
Attached Element Context from Integrated Browser
Element: tag#id.class
URL: ...
HTML Path: ancestor > path > selected
Outer HTML:
  ...
Dimensions:
  top / left / width / height
CSS:
  computed style text
~~~

The attachment object also retains ancestors, attributes, computed-style data, dimensions and inner text for the host. Its model description calls it structured browser element context with HTML path, outer HTML, dimensions and computed styles.

When <code>chat.sendElementsToChat.attachImages</code> is enabled—the inspected default is <code>true</code>—the host also captures a JPEG-quality-90 screenshot clipped to the selected element's bounds. Console logs, viewport/area screenshots and an experimental full-page capture are separate attachment routes.

The picker uses Electron browser contents and Chromium DevTools Protocol domains <code>DOM</code>, <code>Overlay</code>, <code>CSS</code>, <code>Runtime</code> and <code>Page</code>, plus an injected <code>window.__vscode_helpers</code> helper for element lookup. It tracks iframe/frame inspection and can offset bounds into the containing view.

For non-local/non-file pages, the current workbench asks for confirmation before attaching page content to chat. That is a data-egress guard; it is not a source-validation step.

### HTML path precision stops at the rendered document

The inspected <code>HTML Path</code> is built by joining ancestor tag names, ids and classes. The packet contains no:

- authored file path or line/column;
- module, component definition or AST identity;
- source-map location;
- repository, branch, worktree or file revision;
- stable element id intended to survive HMR or structural edits.

The packet is therefore rich enough to ground a search and compare visual intent, but not to deterministically return the runtime node to source. Duplicate markup, utility-class churn, conditional rendering, portals, iframes, minification and HMR can all leave a plausible-looking packet that points toward the wrong implementation site.

### ACP carries Preview events, not a source-binding protocol

The current bundled Windsurf/Devin extension advertises <code>cognition.ai/browserPreview</code> and <code>cognition.ai/browserPreviewOpen</code> in its ACP handshake. Its compiled protocol surface recognizes:

- <code>_cognition.ai/browserPreview/capture</code> for queued preview captures;
- <code>_cognition.ai/browserPreview/opened</code> for an opened preview;
- a pending-capture list tied to an agent session;
- opening a preview URL beside the editor through the simple-browser API.

This explains how local, remote and third-party ACP agents can share the same Preview UX. The event bridge transports a capture or URL into a session; it does not add file/range identity to the element packet and does not acknowledge that an agent later changed the correct source.

## Agent topology: one command center, several mutation authorities

Current Devin Desktop documentation exposes at least four agent routes:

| Agent route | Machine | File authority | Relevant persistence |
|---|---|---|---|
| Devin Local | User's machine; same agent harness family as Devin CLI | Current local workspace or selected local Git worktree | Files/Git, persistent plan files, rules/Skills/hooks/MCP config and session records |
| Cascade | User's machine | Current workspace or a Cascade worktree | Files/Git, conversation state, memories/workflows where supported, named checkpoints |
| Cloud Devin | Separate hosted VM booted from a snapshot | Cloud session checkout and eventual branch/PR | Server session, branch/PR, queued messages and attachments |
| ACP agent | Local or remote process chosen by its provider | Whatever workspace/transport that provider is granted | Provider-specific; Devin Desktop supplies the client/session surface rather than one universal storage contract |

[Devin Local](https://docs.devin.ai/desktop/devin-local) is bundled with Desktop but fetched from the server and gated by account/team settings. It supports Normal, Plan and Ask modes, subagents, OS-level sandboxing and fine-grained permissions. A Plan is written to <code>~/.devin/plans/plan-&lt;session&gt;.md</code>, so planning can survive a UI restart or be handed to another session.

The same page explicitly says Devin Local does not persist Cascade-style memories between sessions and does not support Cascade workflows; Skills, rules and <code>AGENTS.md</code> are the recommended durable substitutes. Project MCP configuration lives at <code>.devin/config.json</code>, a gitignored local override can live at <code>.devin/config.local.json</code>, and user configuration lives under <code>~/.config/devin/</code>.

[Cascade](https://docs.devin.ai/desktop/cascade/cascade) remains documented with Code/Chat modes, plans/todos, tool calls and named checkpoints. The June rebrand FAQ said the existing Cascade agent would remain through July; current August documentation still describes it. This establishes a transition/co-bundling surface, not guaranteed entitlement or future availability for every account.

### Worktrees isolate mutation but do not complete delivery

[Desktop worktrees](https://docs.devin.ai/desktop/cascade/worktrees) give each selected conversation an isolated Git worktree. Devin Local can create or choose a worktree and exposes a **Merge** action to bring changes into the main workspace.

The important limits are:

- worktree mode must be chosen at session start; an existing conversation cannot later move;
- worktrees remain under the legacy <code>~/.windsurf/worktrees/&lt;repo_name&gt;</code> path;
- <code>.env</code> and other untracked files/packages are absent unless a setup hook copies or creates them;
- relative paths outside the repository can break;
- Desktop automatically removes least-recently-used worktrees above 20 per workspace;
- deleting a Cascade conversation automatically deletes its associated worktree;
- a successful run still requires explicit review and merge into the intended branch.

A worktree is isolation and recoverable Git state only to the extent its changes are committed or preserved. It is not a durable queue, a deployment, or an automatic merge.

### Cascade checkpoints are local recovery, not global versioning

Cascade can revert code changes to a conversation step and can name a checkpoint of the current project state. Its docs warn that reverts are irreversible.

The public contract does not expose checkpoint serialization, Git ancestry, treatment of untracked/external files, or atomicity with running processes, Preview state, remote cloud sessions and PRs. A checkpoint can be useful local recovery without becoming a suite-wide version graph.

### Command Center and Spaces organize work; they do not unify files

[Agent Command Center](https://docs.devin.ai/desktop/agent-command-center) presents local and cloud agents on one Kanban board. Sessions are greyed out and read-only while their agent is running. The center can show work that is running, blocked or ready for review, but those columns are control states rather than artifact verification.

[Spaces](https://docs.devin.ai/desktop/spaces) group sessions, PRs, files and shared context around a task. New sessions can inherit Space context, and returning to a Space restores the view. A Space may simultaneously contain a local prototype and multiple cloud sessions, each with its own machine.

Restoring a view or inheriting context does not restore a filesystem, prove that every session saw the same revision, or merge results. The Space is the coordination envelope.

## Handoff crosses machines through context and Git, not live memory

The built-in [handoff workflow](https://docs.devin.ai/work-with-devin/devin-handoff) lets Devin CLI package conversation context and the current Git branch, then create a cloud session. The cloud session still starts in a fresh VM.

The official page also links an MIT-licensed open adapter for Claude Code, Codex, Cursor and other coding agents. At commit [<code>24a60e0...</code>](https://github.com/club-cog/devin-handoff/tree/24a60e0b3030a162bedf709f0922d4b73f440004), that adapter makes the transfer concrete:

1. read <code>origin</code> and reduce it to an owner/repository slug;
2. read the current branch name;
3. run <code>git diff HEAD</code> and truncate it to 102,400 bytes;
4. combine task, optional context, repository, branch and diff into the new session prompt;
5. tag the session <code>handoff</code>;
6. create a v1 or organization-scoped v3 session and return its URL;
7. optionally poll status and print a PR.

~~~text
local conversation summary
  + origin slug
  + branch name
  + first 100 KiB of tracked diff
    -> prompt to Sessions API
    -> fresh cloud VM
    -> cloud branch / PR
~~~

This is a lossy context bridge:

- <code>git diff HEAD</code> omits untracked files;
- the byte limit can truncate a large diff without preserving later hunks;
- a local commit that has not been pushed is not contained in the diff and may not be reachable by the cloud clone;
- local processes, databases, browser sessions, secrets not registered with Devin and generated build state are not transferred;
- the adapter has no transaction that freezes the local branch while the cloud session starts.

These limits are established for the pinned open adapter. The closed built-in Devin CLI implementation may package context differently beyond what its documentation states.

### The pinned open adapter currently disagrees with the v3 PR schema

The same pinned script comments that v3 nests a PR under <code>pull_requests[0].url</code> and reads that field. The current official v3 schema defines each item as:

~~~text
pull_requests[].pr_url
pull_requests[].pr_state
~~~

Static comparison therefore predicts that v3 polling can finish successfully but print no PR URL. This is a commit/schema mismatch, not a live authenticated reproduction. It also illustrates why a control-plane “finished” state and a retrievable delivery artifact must be verified separately.

## Persistence and recovery: fourteen clocks, no suite-wide rewind

| Clock | Persistence center | Recovery value | Boundary |
|---|---|---|---|
| Environment blueprint | Versioned YAML/configuration | Rebuild environment intent | Does not contain later session edits |
| Active snapshot | Organization machine image | Boots future cloud sessions from a known baseline | Exactly one active snapshot; session changes do not flow back |
| Cloud session VM | Hosted machine working state | Continue/take over while session survives | Separate from local machine and later sessions |
| Cloud branch/PR | Git provider | Review, merge, revert through Git | Does not include all VM/browser/process state |
| Session/messages/API | Cognition server | Resume conversation/control state; inspect status | Status is not a file or test proof |
| Server send queue | Cloud session service | Queued messages survive Desktop reload and appear in web app | Queue delivery is not artifact mutation |
| Session browser state | Existing cloud Chrome profile | Cookies/local storage/auth survive later actions in that session | Session-scoped unless deliberately included in environment setup |
| Video attachment/raw recording | Session message and session machine | Review processed evidence or request raw file | Independent of Git version and can fail processing |
| Local main workspace | User filesystem/Git checkout | Canonical local implementation | Agent session metadata does not rewind it |
| Local worktree | Git worktree under a legacy Windsurf path | Isolated edit/build/test and later merge | Missing untracked setup, auto-cleanup and explicit merge |
| Cascade checkpoint | Closed local conversation mechanism | Revert project code to a step | Irreversible revert; scope/serialization unpublished |
| Devin Local plan | <code>~/.devin/plans/</code> Markdown | Reopen or hand a plan to another session | Plan is intent, not applied files |
| Rules/Skills/MCP/hooks | Workspace/user configuration files | Reusable context and procedures | Can drift independently from session/branch |
| Space and Command Center | Desktop/server coordination UI | Regroup sessions/PRs/context and restore the view | Does not prove shared revision or merge machines |

The Windows rebrand adds another migration layer rather than replacing all old paths. Current FAQ documentation says <code>%APPDATA%\Windsurf\</code> is retained read-only while <code>%APPDATA%\Devin\</code> is read/write; extensions move from <code>~/.windsurf/extensions/</code> to <code>~/.devin/extensions/</code>; several user/MCP/Skill/CLI paths remain under <code>~/.codeium/</code>; and <code>.devin/</code> workspace paths take precedence over <code>.windsurf/</code> fallbacks. Compatibility reads are not a single migration transaction.

## Failure atlas: where the apparent end-to-end loop breaks

| Boundary | Ordinary-user symptom | Evidence needed before acceptance |
|---|---|---|
| Surface-name confusion | Installing the PWA is mistaken for installing the local IDE, or opening cloud Desktop is mistaken for accessing local files | Record which client, machine and repository checkout owns the task |
| Snapshot misunderstanding | A later session boots clean and “loses” tools/files created only in the earlier VM | Put environment setup in a blueprint/Skill and implementation in Git |
| Manual cloud takeover | Human edits while Devin is still acting, then resume overwrites or ignores part of the intervention | Stop the agent first, inspect the diff and explicitly describe manual changes on resume |
| Platform mismatch | A Linux default session cannot run a Windows-only build; a macOS-only app cannot run at all | Pin platform/blueprint and validate on the real delivery platform |
| Browser authentication | Login walls, VPN or expired credentials block the focused run | Verify secrets and the actual authenticated browser session |
| Recording confidence | A short edited video looks correct while CI, edge states or a later commit fail | Bind review to the final PR head; run deterministic suites and independent interaction checks |
| Recording processing | Video attachment never appears | Inspect session error, retry and retrieve raw recording while the VM remains available |
| Preview structural drift | The selected tag/class path describes an old HMR tree or a repeated component | Re-select after rebuild; inspect the actual repository diff and every reused instance |
| Preview/source gap | Rich HTML/CSS/screenshot context makes the agent sound precise but identifies no file | Search and validate authored source; never treat the selected packet as source proof |
| Worktree setup | The app fails only in the agent worktree because <code>.env</code>, packages or external relative paths are missing | Run setup hook, inspect worktree status and reproduce from a clean environment |
| Worktree cleanup | Deleting a conversation or exceeding the worktree limit removes uncommitted work | Commit/preserve intended changes before cleanup and confirm the merge target |
| Checkpoint scope | A Cascade revert restores code but not Preview/browser/cloud/PR state | Validate each persistence clock separately after revert |
| Space context | A new session understands the project narrative but works from another revision or machine | State the repository, branch, commit and worktree explicitly |
| Handoff loss | Untracked files, later diff hunks or unpushed commits are absent in cloud | Commit/push or attach required state; audit the generated handoff context |
| Handoff polling | Cloud work completes but the open adapter prints no v3 PR | Query the current session schema/result and inspect <code>pr_url</code> directly |
| Remote ACP disconnect | Desktop shows a disconnected banner or capture/queue state without agent progress | reconnect, confirm session status and verify file/PR mutation independently |
| Feature transition | Docs describe Cascade/Devin Local or a Preview feature that the current account/build does not expose | Pin client build, authentication, team flags and observed capability |

## Evolution: the composite architecture arrived in layers

| Date | Public change | Architectural consequence |
|---|---|---|
| 2026-02-24 | Devin 2.2 announced full Desktop Testing with Computer Use and edited recordings | Visual verification became a structured PR-adjacent delivery step; the announcement described Linux, while current docs now include Windows sessions |
| 2026-03-07 | The web app became installable as a PWA | A third “desktop app” form appeared without changing cloud execution authority |
| 2026-04-10 | Browser parity improvements, richer ACP methods including browser attachment, and a reconnecting VNC screen | Browser control, protocol integration and remote-desktop transport became separately visible layers |
| 2026-06-02 | Windsurf became Devin Desktop | The local IDE and cloud agent moved under one brand and command center while retaining legacy paths and separately governed machines |
| 2026-08-01 | Current official Desktop stable <code>3.6.27</code> and CLI manifest/release <code>3000.3.27</code> | Desktop shell and CLI distribution remain independently versioned |

This sequence explains why current docs still contain Windsurf paths, Cascade concepts, Devin Local, cloud Desktop, browser Preview and ACP names together. Historical naming is compatibility evidence, not proof that all components share one runtime.

## Distribution inspection: current code is inspectable but not open source

### Official Windows portable artifact

The official [Desktop releases page](https://docs.devin.ai/desktop/releases) listed stable <code>v3.6.27</code> on 2026-08-01. The Windows x64 portable archive was inspected read-only without installation, launch or authentication.

| Property | Inspected value |
|---|---|
| Official archive | [<code>Devin-win32-x64-3.6.27.zip</code>](https://windsurf-stable.codeiumdata.com/win32-x64-archive/stable/0becb483ee8498d49deadf6aefe8c24f58b8007e/Devin-win32-x64-3.6.27.zip) |
| Compressed size | 371,411,732 bytes |
| SHA-256 | <code>09014F9E0AAD2812EA333E271B45F386C5BBB60CE9DFB00B81AA12EDCC1C6013</code> |
| Archive contents | 12,164 entries; 1,171,364,508 uncompressed bytes |
| Product metadata | application <code>devin-desktop</code>; data folder <code>.devin</code>; VS Code base <code>1.126.0</code>; Electron <code>42.2.0</code> |
| Distribution build id | <code>0becb483ee8498d49deadf6aefe8c24f58b8007e</code> |
| Bundled core extension | package name <code>windsurf</code>, display name Devin, version <code>0.2.0</code>, publisher <code>codeium</code> |

The build id appears in both the CDN path and <code>product.json</code>. It pins a distribution build; no public repository establishes it as a checkout of the proprietary product source.

The archive composes an upstream-derived editor shell with proprietary product layers:

- <code>package.json</code> points to Microsoft's VS Code repository and the base metadata names MIT;
- <code>resources/app/LICENSE.txt</code> instead identifies Windsurf Editor, copyright 2026 Exafunction, all rights reserved, and links product terms;
- the bundled Windsurf extension has its own all-rights-reserved license;
- extension commands retain both <code>windsurf.*</code> and <code>devin.*</code> aliases;
- the extension includes large closed binaries such as a language server and <code>devin.exe</code>.

Upstream shell metadata does not open the product extension, agent harness or cloud services.

### Core bundle hashes and source-map boundary

| Shipped bundle | SHA-256 |
|---|---|
| <code>out/vs/workbench/workbench.desktop.main.js</code> | <code>CD1018630494EBDF4EF61AE15790AD225931CE5290C2FFB27D7E379152999693</code> |
| <code>out/vs/sessions/sessions.desktop.main.js</code> | <code>F1BC318D0A637B923BB3CA99228E73D990F7A791FCE7326276B2E0DC689B57E7</code> |
| <code>extensions/windsurf/dist/extension.js</code> | <code>F0179263F1513B595C2C6A206036D5BF50AD9F080881FD07C45AB91D8982035B</code> |
| <code>out/main.js</code> | <code>70FA088C7AD76AADDF6C80B82231EB47E3CF1A191A2438D3FE2FC45BA1C0F69A</code> |

The archive contains 1,094 <code>.map</code> files, almost entirely under dependencies, so “the archive has source maps” would be misleading. The proprietary <code>extensions/windsurf/</code> subtree has zero TypeScript/TSX/source-map entries, and the application <code>out/</code> subtree has zero source maps. Compiled-string and control-flow inspection can establish the shipped packet/protocol behavior above, but cannot provide original symbol provenance, tests or commit history.

## Public repositories expose edges, not the product implementation

The official [Cognition GitHub organization](https://github.com/CognitionAI) publishes useful adjacent components. None of the inspected repositories supplies the source for the cloud agent, Devin Local, Cascade, Desktop's Windsurf extension or the web application.

| Public repository | Pinned commit | What the pin establishes | Boundary |
|---|---|---|---|
| [<code>CognitionAI/devin-cli</code>](https://github.com/CognitionAI/devin-cli/tree/bd4163ed29e934b898f185752182c91aacac20f7) | <code>bd4163ed29e934b898f185752182c91aacac20f7</code> | A 54-byte README plus an hourly Python/GitHub Actions release bot that reads the binary manifest and creates asset-less GitHub releases | CLI binary source is absent; binaries come from <code>static.devin.ai</code> |
| [<code>club-cog/devin-handoff</code>](https://github.com/club-cog/devin-handoff/tree/24a60e0b3030a162bedf709f0922d4b73f440004) | <code>24a60e0b3030a162bedf709f0922d4b73f440004</code> | MIT-licensed Skill/plugin and shell adapter for creating/polling cloud sessions | Open context bridge, not cloud/local agent engine |
| [<code>CognitionAI/devin-extension</code>](https://github.com/CognitionAI/devin-extension/tree/36437282f7f131d066022369ece7fd24c721c079) | <code>36437282f7f131d066022369ece7fd24c721c079</code> | Marketplace listing for a Devin VS Code extension | Listing/package edge, not current Desktop source |
| [<code>CognitionAI/qa-devin</code>](https://github.com/CognitionAI/qa-devin/tree/86b769b0dcf14b18e4685b3e3248d29bc289fc51) | <code>86b769b0dcf14b18e4685b3e3248d29bc289fc51</code> | Public QA scenarios that drive Devin/browser/integrations | Test consumer, not implementation |
| [<code>CognitionAI/devin-outpost-k8s</code>](https://github.com/CognitionAI/devin-outpost-k8s/tree/992f807dac0d33d578ff46eb7aa10ffbc93699b4) | <code>992f807dac0d33d578ff46eb7aa10ffbc93699b4</code> | MIT-licensed reference Kubernetes operator for Outposts | Deployment edge, not hosted agent/web/Desktop source |

The current [CLI manifest](https://static.devin.ai/cli/current/manifest.json) returned version <code>3000.3.27</code> with platform URLs and SHA-256 values on 2026-08-11. The pinned release automation explicitly says no binaries are attached to GitHub releases. Public version metadata and hashes improve supply-chain traceability without making the binary source-available.

Commit-level conclusions must therefore stop at the open adapters and distribution automation. The decisive cloud execution, visual-control, local-agent and persistence implementations have no public commit provenance in this snapshot.

## Facts, inferences and material unknowns

### Directly established

- The current suite includes a cloud graphical session Desktop, a local Devin Desktop IDE and an installable web PWA with different execution authorities.
- Cloud sessions boot fresh copies of an organization snapshot; session changes do not persist back to that snapshot.
- Cloud Computer Use supports current Linux and Windows sessions, operates rendered GUI state and can share an existing Chrome profile through CDP port <code>29229</code>.
- The PR testing workflow produces a focused recording attachment and explicitly positions it as a quick sanity check rather than exhaustive coverage.
- Current v3 session responses expose control/status/PR metadata, not a filesystem or recording-to-commit version contract.
- Current local Preview packages HTML path, outer HTML, geometry, computed CSS and optional clipped screenshot; the inspected packet carries no authored source identity.
- Devin Local, Cascade, cloud Devin and ACP agents can appear in one command center while mutating local workspace, local worktree or cloud VM state.
- Spaces group sessions, PRs, files and context; they do not claim to merge those machines or revisions.
- The open handoff adapter transfers a bounded text/diff prompt into a fresh cloud session and has a static PR-field mismatch with the current v3 schema.
- The current Desktop distribution is proprietary and compiled; public repositories expose adjacent interfaces and automation rather than the product core.

### Evidence-backed inferences

- Devin implements **Git-centered convergence across plural machines**: local and cloud work become comparable only when materialized into explicit repository state.
- Snapshot, session, Space, plan, checkpoint, browser profile, recording and Git solve different continuity problems; none is a global rewind.
- Local Preview is a heuristic runtime-context mechanism. Its structural detail can improve agent search without becoming source mapping.
- Computer Use plus recording is an execution-evidence pipeline. Its strength is observed end-to-end behavior; its weakness is coverage, source identity and reproducibility.
- Agent Command Center is a control-plane convergence layer rather than a shared mutation authority.
- Handoff quality is bounded by what is serialized and what the cloud clone can reach; conversational continuity can conceal missing filesystem state.

### Material unknowns

- Cloud agent planning/orchestration, model routing, VM lifecycle implementation, browser-control internals and recording processor source.
- The exact retention window and recovery guarantees for session VMs, raw recordings, browser profiles, queues and archived sessions.
- A public atomic binding among cloud snapshot, session filesystem, Git commit, focused test plan and final video.
- Original source, source maps, test suites and commit history for the inspected Desktop workbench fork, Windsurf extension, Devin Local and CLI binary.
- How the closed built-in CLI handoff differs from the pinned open Skill when carrying conversation, diff, untracked files or unpushed commits.
- Stable source identity or revision preconditions for Preview element capture.
- Cascade checkpoint format, scope, external-file coverage and behavior under concurrent/manual edits.
- Whether current Cascade documentation reflects universal August availability after the FAQ's July transition statement.
- Exact Space context serialization, version pinning and conflict behavior across local/cloud sessions.
- Account/team feature flags and authenticated capabilities for every current Desktop build.

## Acceptance checklist for the real journey

1. Name the exact surface: cloud session Desktop, local Devin Desktop or installed PWA.
2. Pin Desktop/CLI build, session platform, repository, branch, commit and environment snapshot/config separately.
3. Put repeatable cloud setup in a blueprint or repository Skill; do not rely on mutations made only inside one session VM.
4. Before manual takeover, stop the cloud agent; after editing, inspect the diff and explain the intervention on resume.
5. Treat session status as control information; verify the actual branch/PR and requested files.
6. Bind visual testing to the final PR head and record which build, data, secrets and browser state were exercised.
7. Run deterministic tests/CI and inspect unrecorded edge states; do not accept an edited sanity video as complete proof.
8. Retrieve raw recording evidence promptly when processing fails.
9. For local Preview, save the exact element packet/screenshot only as runtime evidence and re-select after HMR/rebuild.
10. Review the authored-file diff, shared-component scope and real clean-reload behavior before accepting a Preview-led repair.
11. For worktree sessions, restore required untracked configuration through an explicit hook and protect intended work before cleanup.
12. Merge intentionally into the correct local branch; a completed worktree session is not delivery.
13. Test Cascade checkpoint recovery separately from Git, running application, browser, cloud and PR state.
14. In a Space, state the machine/revision for every session instead of assuming shared files from shared context.
15. Before handoff, commit/push or explicitly attach every required file; inspect large-diff truncation and untracked omissions.
16. Query the current Sessions API/PR field directly when the open handoff poller prints no PR.
17. Verify final deployment and ordinary-user behavior independently of the local Preview and session recording.

## Primary sources and evidence pins

### Cloud product, environment and API

- [What is Devin?](https://docs.devin.ai/get-started/devin-intro)
- [Session tools](https://docs.devin.ai/work-with-devin/devin-session-tools)
- [Computer Use](https://docs.devin.ai/work-with-devin/computer-use)
- [Testing & Video Recordings](https://docs.devin.ai/work-with-devin/testing-and-recordings)
- [Environment configuration and snapshots](https://docs.devin.ai/onboard-devin/environment)
- [Declarative environment blueprints](https://docs.devin.ai/onboard-devin/environment/blueprints)
- [Golden snapshots](https://docs.devin.ai/product-guides/snapshots)
- [Hand off to cloud Devins](https://docs.devin.ai/work-with-devin/devin-handoff)
- [v3 Get Session schema](https://docs.devin.ai/api-reference/v3/sessions/get-organizations-session)
- [v3 API release notes](https://docs.devin.ai/api-reference/release-notes)
- [2026 release notes](https://docs.devin.ai/release-notes/2026)

### Devin Desktop and local-agent surfaces

- [Welcome to Devin Desktop](https://docs.devin.ai/desktop/getting-started)
- [Devin Desktop FAQ and Windsurf migration](https://docs.devin.ai/desktop/devin-desktop-faq)
- [Devin cloud sessions inside Desktop](https://docs.devin.ai/desktop/devin)
- [Devin Local](https://docs.devin.ai/desktop/devin-local)
- [Devin Desktop Previews](https://docs.devin.ai/desktop/previews)
- [Cascade](https://docs.devin.ai/desktop/cascade/cascade)
- [Desktop worktrees](https://docs.devin.ai/desktop/cascade/worktrees)
- [Agent Command Center](https://docs.devin.ai/desktop/agent-command-center)
- [Spaces](https://docs.devin.ai/desktop/spaces)
- [Desktop releases](https://docs.devin.ai/desktop/releases)

### Distribution and repository pins

- [Official Desktop <code>3.6.27</code> Windows x64 archive](https://windsurf-stable.codeiumdata.com/win32-x64-archive/stable/0becb483ee8498d49deadf6aefe8c24f58b8007e/Devin-win32-x64-3.6.27.zip)
- [Current CLI binary manifest](https://static.devin.ai/cli/current/manifest.json)
- [Cognition GitHub organization](https://github.com/CognitionAI)
- [CLI release-automation tree <code>bd4163ed...</code>](https://github.com/CognitionAI/devin-cli/tree/bd4163ed29e934b898f185752182c91aacac20f7)
- [Open handoff adapter tree <code>24a60e0b...</code>](https://github.com/club-cog/devin-handoff/tree/24a60e0b3030a162bedf709f0922d4b73f440004)
- [VS Code extension listing tree <code>36437282...</code>](https://github.com/CognitionAI/devin-extension/tree/36437282f7f131d066022369ece7fd24c721c079)
- [Public QA tree <code>86b769b0...</code>](https://github.com/CognitionAI/qa-devin/tree/86b769b0dcf14b18e4685b3e3248d29bc289fc51)
- [Outpost operator tree <code>992f807d...</code>](https://github.com/CognitionAI/devin-outpost-k8s/tree/992f807dac0d33d578ff46eb7aa10ffbc93699b4)

No authenticated cloud session, local-agent run, Preview edit or handoff was executed for this snapshot. Runtime claims stop at current official documentation, public API contracts, pinned adjacent source and the hash-pinned shipped-client boundary.
