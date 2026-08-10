# Google Antigravity

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Google |
| Category | Multi-surface agentic development platform with visual verification |
| Status | Active; Antigravity 2.0, the IDE, CLI, Python SDK and Gemini API managed agent are separately versioned surfaces |
| Product boundary in this dossier | The Antigravity family is kept together because Google says the surfaces use the same agent harness; their conversations, machines and mutation authorities are not treated as one state |
| Core source availability | 2.0, IDE, CLI and the Go `localharness` runtime are closed; the Python SDK control/adapter layer is Apache-2.0; the Gemini API exposes a managed remote agent |
| Decisive artifact question | When a plan, diff, screenshot, recording, local worktree and remote sandbox all appear in one workflow, which object is review evidence and which object is the implementation that can actually be recovered? |
| Evidence snapshot | Antigravity 2.0 `2.6.0`, IDE `2.1.1`, CLI `1.1.11`, Python SDK `0.1.10`; public SDK source pinned to commit `6db963cbe4587a7934fd6c2e007976a1b97ed655` |

## The shortest accurate description

Google Antigravity is not one IDE and it is not one persistent agent session. It is a family of agent surfaces that Google describes as sharing an agent harness:

- the original IDE combines an editor with an Agent Manager;
- Antigravity 2.0 is a separate desktop command center without an embedded IDE;
- the CLI runs the harness from a local shell;
- the Python SDK wraps a local compiled harness process;
- the Gemini API Antigravity Agent runs in a Google-hosted Linux environment.

Across those surfaces, plans, diffs, diagrams, screenshots, recordings and walkthroughs make work reviewable. They do **not** replace the mutation authority. For local work, the authority is the current project folder or conversation worktree and its intended Git state. For the managed API, it is the remote environment filesystem. A green task, polished walkthrough or accepted plan does not prove that either authority contains the intended result.

That distinction is the spine of this dossier.

## One harness claim, five surfaces, three mutation authorities

| Surface | Human entry point | Execution location | Conversation relationship | Working authority |
|---|---|---|---|---|
| Antigravity 2.0 | standalone desktop command center | local machine, with tools acting under project settings and permissions | native 2.0 conversations, task groups and schedules | bound project folders in Local Mode, or a per-conversation Git worktree in New Worktree Mode |
| Antigravity IDE | Editor View plus Agent Manager | local workspace with editor, terminal and browser tools | its own IDE experience; Google says the IDE remains available while its Agent Manager is planned for removal | the opened workspace and its Git state |
| Antigravity CLI | `agy` in a terminal | local shell or supported remote shell session | history is scoped to the current working directory; a CLI conversation is not shared with 2.0 by default and must be explicitly imported | files under the active CLI project/workspace and the user's Git checkout |
| Python SDK | application code using `Agent`, `Conversation` or `Connection` | a local closed `localharness` subprocess plus Python-hosted tools/hooks | caller supplies or resumes a `conversation_id`; SDK state is not automatically a 2.0 task | configured local workspaces, caller-owned tools and configured save/app-data directories |
| Gemini API Antigravity Agent | Interactions API with agent id `antigravity-preview-05-2026` | Google-hosted Linux sandbox | interaction context and environment identity are separate; the environment can be reused across interactions | files and packages in the selected remote environment, optionally exported as an environment snapshot |

The three mutation authorities are therefore:

1. **Direct local folders.** Local Mode, a normal IDE checkout, CLI cwd and SDK workspace configuration can all expose the user's real files directly.
2. **Isolated Git worktrees.** Antigravity 2.0 can create a worktree per conversation; subagents can also receive isolated workspace branches/worktrees.
3. **Managed remote environments.** The Gemini API agent mutates a hosted filesystem whose lifetime is independent of the local checkout and of an individual interaction record.

“Same harness” is a statement about the agent core, not a guarantee of shared memory, identical tools, identical sandboxing or one reversible transaction across these authorities.

## Product evolution changed the center of gravity

### November 2025: editor plus manager

The initial public platform paired an **Editor View** with a **Manager Surface**. Agents could plan, edit, use a terminal, control a browser and report through artifacts such as task lists, plans, screenshots and recordings. Inline artifact comments and a knowledge base were already part of the review model.

The product thesis was “agent-first development inside and around an IDE.”

### May 2026: 2.0 became a separate command center

Google introduced Antigravity 2.0 on 2026-05-19 as a standalone desktop application with no IDE. A **Project** can include several folders plus project-specific resources, permissions and settings. Users can run foreground or asynchronous work, delegate to subagents, attach hooks and schedule recurring tasks.

This is not an in-place redesign of the old window. Google explicitly calls 2.0 a completely separate application. The IDE remains available, while the IDE's Agent Manager is announced for eventual removal; Google's launch guidance recommends using the two applications together during the transition. That announced future removal is not recorded here as already completed.

### Current snapshot: separately moving release trains

The 2026-08-11 docs and changelog expose four separate release trains:

| Release train | Current version in this snapshot | Consequence |
|---|---:|---|
| Antigravity 2.0 | `2.6.0` | command-center behavior, hooks, schedules, permissions and task-state fixes move independently |
| IDE | `2.1.1` | editor/browser behavior can persist even as 2.0 replaces the Agent Manager role |
| CLI | `1.1.11` | terminal modes, sandbox and permission fixes are CLI-specific |
| Python SDK | `0.1.10` | open Python APIs and the bundled closed runtime binary are distributed together per platform |

A claim from one train must not silently be projected onto another. The clearest example is Windows sandbox support: current 2.0 documentation says its terminal sandbox preview is not yet on Windows, while CLI documentation describes a Windows AppContainer backend. Those are surface-specific contracts, not a single contradiction-free platform switch.

## Ordinary frontend journey in Antigravity 2.0

The ordinary local journey is a reviewable repository mutation loop, not a canvas-to-code roundtrip:

1. **Create or open a Project.** Bind one or more local folders. The Project scopes resources, settings and permissions; it is not documented as a portable project-file format.
2. **Choose the mutation mode.** Local Mode operates directly on the bound folders. New Worktree Mode gives the conversation an isolated Git worktree where supported.
3. **Set the authority boundary.** Project permissions determine file, command, URL, browser, MCP and unsandboxed access. Global settings can be inherited and project settings can narrow or augment behavior.
4. **Describe a goal.** A user can start naturally or use commands such as `/goal` and `/grill-me` to clarify intent.
5. **Review the approach.** Planning Mode can produce an implementation plan and pause before changes. Fast Mode reduces those review stops.
6. **Let the agent mutate and execute.** The agent reads and edits files, runs commands, delegates bounded work and may keep background tasks active.
7. **Invoke browser work explicitly.** In 2.0, `/browser` is the explicit instruction to use the browser; the launch documentation warns that otherwise the agent may ignore browser work.
8. **Inspect evidence.** Screenshots, browser recordings, diffs and the final walkthrough show what the agent claims it changed and tested.
9. **Comment at the milestone.** Inline artifact feedback can reject, approve or refine the plan/diff/evidence and trigger more work.
10. **Accept the repository result.** The user still has to inspect the current files, run the relevant checks, review the Git diff and integrate the worktree or commit. No artifact substitutes for that acceptance.

For a frontend task, the decisive loop is therefore:

```text
goal
  -> plan artifact and approval
  -> file/command/subagent actions
  -> running application
  -> explicit browser inspection
  -> screenshot/recording/walkthrough
  -> human comments
  -> more file actions
  -> final diff + real runtime + intended Git state
```

The last line, not the walkthrough, is the deliverable.

## A Project is a scope container, not the source of truth

The Project model solves a real command-center problem: one task may need an application repository, a design-system repository, documentation and local resources. Google documents a Project as a collection of folders plus environment, scope, settings and permissions.

That produces two materially different file semantics.

### Local Mode

The conversation writes the bound folders directly. This is the shortest path to the user's current working tree, but it also means:

- uncommitted user changes and agent edits can share one checkout;
- stopping the conversation does not imply rollback;
- a successful artifact review says nothing about unrelated dirty files;
- recovery depends on the file contents, Git and whatever local history the user already has.

### New Worktree Mode

For Git-backed folders, Antigravity creates a separate worktree for the conversation. This reduces interference between parallel tasks and creates a clearer review boundary. It does not by itself merge, commit or deliver the result.

The mixed-folder rule matters: if one Project contains Git and non-Git folders, New Worktree Mode creates worktrees for eligible Git folders while non-Git folders remain the existing direct folders. One conversation can therefore be isolated in one part of the Project and mutate shared state in another. “Worktree Mode” is not an all-or-nothing transaction across the Project.

### Default project security is a starting policy

The documented default allows read/write access to Project folders and asks before terminal commands. Access outside those folders is separately configurable. Because Project settings can inherit global permissions, accepting a Project is not enough to understand the effective policy; the global layer, project layer, active hooks, MCP configuration and sandbox state must also be inspected.

## Artifacts are review contracts and evidence objects

Antigravity uses “artifact” broadly. The public docs include:

| Artifact | What it contributes | What it does not establish |
|---|---|---|
| implementation plan | proposed technical sequence and a review pause | that any file has changed or the plan still matches later edits |
| code diff | reviewable file changes at a milestone | that the current worktree still equals the reviewed diff or that the runtime is correct |
| diagram | explanation of architecture or intended flow | executable implementation state |
| image or screenshot | visual observation from a point in time | source identity, interaction coverage or final-build freshness |
| browser recording | focused evidence of an interaction | exhaustive test coverage, commit binding or durable DOM-to-source mapping |
| walkthrough | end-of-task narrative plus selected evidence | successful integration, delivery or future recoverability |

In Planning Mode with review requested, the agent can pause on a plan or diff. The CLI artifact viewer likewise lets a user approve, reject and comment on artifacts before physical filesystem writes. That makes artifacts consequential control objects: feedback can prevent or redirect mutation.

They remain separate from implementation authority for three reasons:

1. an artifact can describe a proposed write before it exists;
2. files can change after the artifact was produced;
3. screenshots and recordings preserve pixels and actions, not the complete authored source state.

The safe reading is: artifacts are **review checkpoints and evidence**, while files and Git are **the local result**.

## Browser verification is strong evidence with a narrow identity domain

The browser subagent can open local pages, act in tabs and capture screenshots or recordings. The IDE documentation describes a separate Chrome profile for agent-controlled browsing, and settings can disable browser tools. Antigravity 2.0 makes browser use explicit through `/browser` because automatic tool choice is not guaranteed.

This closes an important observation loop: the agent can see the application it just ran instead of treating a successful build as visual acceptance. It does not publicly close a source-return loop.

No current public Antigravity contract in this evidence set carries a clicked rendered element back as a stable authored file, line, component, source-map location or repository revision. A screenshot is an image artifact; a recording is a media artifact. Browser actuation can help the agent search and repair code, but the public identity ends at the page/tab/visual evidence boundary.

For an ordinary frontend task:

- a correct screenshot can still come from a stale dev server;
- a recording can omit responsive, keyboard, error and loading states;
- a visual repair can land in the wrong shared component;
- the selected browser state is not documented as transactionally bound to the diff artifact.

Acceptance therefore requires a clean or understood runtime, the current diff and direct inspection of the changed source—not merely the browser artifact.

## The public identity model is plural

Antigravity exposes several identifiers, each with a different scope. Treating them as one “project session id” hides recovery failures.

| Object | Public role | Scope / authority boundary |
|---|---|---|
| Project | groups local folders, resources, permissions and settings | command-center scope; not documented as the canonical content artifact |
| Folder / workspace path | physical local mutation target | files remain authoritative whether or not a conversation is recoverable |
| Worktree | isolated Git checkout for a conversation or subagent | isolates eligible Git folders, not every non-Git resource in a mixed Project |
| Conversation | ordered agent interaction and tool lifecycle | can resume within a surface, but is not automatically shared across 2.0, CLI, IDE and API |
| `conversationId` / cascade id | hook, transcript and SDK conversation key | identifies agent state; it is not a repository revision |
| Trajectory | main-agent or subagent execution stream | SDK usage is tracked per trajectory; the main trajectory id corresponds to the conversation id |
| Task | asynchronous unit monitored from a conversation | completion is control state, not proof of a file or Git result |
| Artifact | plan, diff, diagram, image, recording or walkthrough | review/evidence state under an artifact directory, not the implementation authority |
| Knowledge entry | retained product context | can inform later work but can drift from current source |
| Schedule | recurring trigger that starts work/conversations | creates future executions; it is not a snapshot of their outputs |
| Sidecar | managed background process with lifecycle/log/data directories | operational state that may support agents; not automatically versioned with the repository |
| Interaction | Gemini API request/response context | can be stored or continued independently from the remote filesystem environment |
| Environment | Gemini API hosted Linux filesystem and installed packages | remote mutation authority; can outlive one interaction and later be snapshotted or deleted |
| Trigger run | event-driven execution using an environment | shares environment state but has its own invocation/result lifecycle |

The most important non-equivalence is:

```text
conversation identity != worktree revision != artifact revision != remote environment state
```

## Subagents isolate context more reliably than they isolate every resource

Antigravity 2.0 can invoke concurrent subagents. The public subagent contract establishes:

- a subagent starts with a clean context rather than the parent's full conversation history;
- the parent delegates through an `invoke_subagent` tool and receives results back;
- workspace behavior can inherit, share or branch according to configuration;
- subagents inherit the main security/tool envelope and cannot silently gain greater privileges;
- approval prompts from a subagent surface in the main UI;
- built-in research, browser and self-oriented helpers are complemented by custom agents under `.agents/agents/` or global configuration;
- nesting is bounded to a documented maximum depth of ten;
- an idle subagent can be reawakened with retained context;
- killing a subagent cleans up its associated worktree, while its transcript remains as JSONL.

This separates **reasoning context** from the parent, but it does not create an atomic multi-agent commit. A subagent can share a workspace, branch into another worktree, ask for permission, leave a transcript and return a summary on different clocks. The parent still has to reconcile the actual files.

The official known-issues note that an invalid or misspelled unmapped tool can hang a subagent. Current 2.0 changelog fixes also include descendant task termination and lost built-in helper recovery. Those are evidence that “subagent finished” and “all delegated execution is quiescent” have required explicit lifecycle repairs.

## Async tasks, schedules and sidecars extend the runtime beyond the chat turn

Antigravity 2.0 supports asynchronous tasks and schedules. A schedule creates future conversations; it does not keep one chat turn alive forever. At the 2.0 launch, scheduled work had a fixed model constraint, so schedule behavior should be checked against the current release rather than inferred from interactive model selection.

Sidecars are a second persistence plane. They are background processes described by `sidecar.json`, with restart/lifecycle management and dedicated data, logs and event directories under:

```text
~/.gemini/antigravity/sidecar_data/<sidecarId>/
  data/
  logs/
  events/
```

Sidecars are disabled unless explicitly enabled in `~/.gemini/config/config.json`. Built-in sidecar capabilities include scheduling and commands such as creating a conversation or sending it a message.

This means “close the task window” is not a universal stop operation. The user may also need to account for:

- running child tasks;
- subagent descendants;
- scheduled future conversations;
- enabled sidecar processes;
- a local dev server or browser profile started during verification.

## Permissions, hooks and sandboxing form a layered control plane

### Resource permissions

The documented permission vocabulary is action over target: file read/write, URL read/execute, command execution, unsandboxed execution and MCP access. Matching decisions follow **Deny > Ask > Allow**. Project-folder file access is generally allowed by default; non-workspace paths, commands, MCP and browser actuation can require confirmation depending on settings.

`read_url` and `execute_url` are intentionally separate. Fetching page content or allowing network use from a sandbox is not equivalent to actuating a browser against that origin.

### Hooks

Hooks can observe or intervene at `PreTool`, `PostTool`, `PreInvocation`, `PostInvocation` and `Stop` lifecycle points. Hook programs receive JSON on stdin and write JSON decisions on stdout. The payload can include:

- `conversationId`;
- `workspacePaths`;
- an `artifactDirectoryPath`;
- the persistent transcript path under `<app_data_dir>/brain/<conversationId>/.system_generated/logs/transcript.jsonl`.

Pre-tool decisions can allow, deny, ask or force an ask; post-invocation and stop hooks can continue or terminate an agent loop. This makes hooks more than logging. A bad hook can prevent an action, force a prompt, prolong a run or block shutdown.

Current changelog fixes are unusually useful architectural evidence: invalid hook configurations had been silently accepted, a stop hook could loop indefinitely, hook model calls could time out, and malformed configurations could prevent startup. The control plane is executable state with its own failure surface.

### SDK hooks and policies

The open Python layer makes a related distinction:

- **capabilities** decide whether a tool is exposed to the model at all;
- **policies** leave a tool visible but decide whether a call may execute;
- **inspect hooks** observe without blocking;
- **decide hooks** block for an allow/deny decision;
- **transform hooks** can replace interaction or error data.

At startup, `Agent.__aenter__` rejects write tools or MCP servers when neither a safety policy nor a deciding hook is present. This guard exists in the open wrapper, before the closed harness is used for the conversation.

### Sandbox is not one platform-wide switch

The 2.0 docs describe a terminal sandbox preview on macOS and Linux, with Windows support still forthcoming. The CLI docs separately describe Linux `nsjail`, macOS `sandbox-exec` and Windows AppContainer backends and say sandboxing is not enabled by default. The effective protection must therefore be verified per surface, operating system and release.

## MCP configuration is powerful and carries secret/configuration risk

Antigravity 2.0 exposes an MCP Store and reads global or workspace configuration from paths including:

```text
~/.gemini/config/mcp_config.json
.agents/mcp_config.json
```

The schema supports local stdio and remote servers, headers, OAuth and disabled tools. OAuth tokens are stored separately under `~/.gemini/antigravity/mcp_oauth_tokens.json`, but custom headers can still put a bearer token directly in configuration. A repository-level `.agents/mcp_config.json` must therefore be reviewed before trust is granted or the file is committed.

There is also visible schema/version drift. One CLI documentation path says remote servers require `serverUrl` instead of legacy `url` or `httpUrl`, while a later changelog says the schema was updated to accept `url`. The safe conclusion is not that either spelling universally wins; it is that the installed release and its effective validation result are authoritative for a particular run.

The 2.0 and CLI changelogs record fixes for admin MCP-policy bypass, OAuth refresh, startup failure on duplicate tool names and MCP timeouts. A connected server appearing in the UI does not establish that its permissions, authentication and tool namespace are functioning as intended.

## Persistence is a set of clocks, not one version history

| State | Persistence / recovery contract | Important break |
|---|---|---|
| Local Mode files | ordinary filesystem and Git behavior | agent and user changes can coexist; stopping a run does not roll files back |
| Conversation worktree | isolated Git worktree for eligible folders | needs explicit review/integration; mixed non-Git folders may still be shared |
| 2.0 transcript | JSONL under the app-data `brain/<conversationId>` tree | transcript recovery does not restore a deleted worktree or rewind files |
| Artifact directory | path supplied to hooks for plans, diffs and media | public docs do not promise one atomic revision tying every artifact to the current checkout |
| Knowledge | retained application context | can survive longer than the source fact it summarizes and has no public Git-revision binding |
| Project settings | global/project configuration hierarchy | effective behavior can change without application-source changes |
| CLI history | resumable and scoped to cwd/project association | CLI conversations are not in 2.0 by default; `/fork` clones conversation context, not the Git checkout |
| CLI project import | explicit `@conversation` pull into 2.0 | transfer is opt-in and should not be read as continuous shared memory |
| SDK in-memory history | `Conversation` owns steps, turn indices, compaction indices and usage | history can be size-limited or cleared while the connection continues |
| SDK save directory | caller-specified, or a temporary `antigravity_*` directory when omitted | a temporary directory is not a durable application artifact contract |
| SDK app data | defaults to `~/.gemini/antigravity` | app state can outlive one Python process but is still separate from repository history |
| Subagent transcript/worktree | transcript remains JSONL; killed-agent worktree is cleaned | narrative evidence may survive after its mutation checkout is gone |
| Sidecar data/logs/events | separate per-sidecar directories | background operational state is not automatically committed or captured with the app |
| Browser profile | separate Chrome profile managed by the product | cookies/session state can affect evidence and is not application-source state |
| Managed API interaction | stored/continued by interaction id when the API mode permits | interaction context is decoupled from environment filesystem state |
| Managed API environment | active; idles after 15 minutes, is snapshotted/stopped, and is retained offline for seven days | TTL or explicit deletion can remove the remote authority; local files are not automatically updated |
| Environment snapshot | complete remote filesystem downloadable as a tar through the Files API | a downloaded archive is another fork that must be inspected and integrated |
| Trigger run | execution sharing a configured environment | repeated runs can observe mutated shared environment state |

There is no public suite-wide “rewind this project” operation that restores conversation, artifacts, local folders, worktrees, sidecars, browser state and a remote environment together.

## CLI continuity is explicit and narrower than it looks

Google says the CLI uses the same agent core and can synchronize settings with 2.0. Conversation continuity is deliberately opt-in:

- CLI history is associated with the current working directory and project;
- resume commands can reopen that local history;
- `/fork` creates another conversation branch but does **not** create a Git branch, stash or checkout;
- a user explicitly imports a CLI conversation into 2.0 with an `@conversation` reference.

This is context transfer, not file synchronization. If the CLI and 2.0 point at different checkouts or revisions, importing the conversation does not reconcile them. Git and the filesystem remain the authority.

## The Python SDK opens the control layer, not the harness core

The official `antigravity-sdk-python` repository is Apache-2.0, but its own README states that cloning the repository is insufficient. Runtime execution depends on a precompiled binary included in platform-specific PyPI wheels.

The current source has a clear three-layer API:

```text
Agent
  owns config, tools, hooks, triggers and policies
    -> Conversation
       owns history, turns, compaction indices and usage
         -> Connection
            owns wire protocol, localharness process, idle/wakeup and disconnect
```

That division is not just documentation. The pinned code implements it:

- `Agent` constructs the hook runner, applies policies and creates one `Conversation` per agent context;
- `Conversation` accumulates steps and tracks turn, compaction and usage state;
- `LocalConnectionStrategy` discovers and launches `localharness`, performs the handshake and carries JSON-encoded protobuf events over a localhost WebSocket;
- the conversation id becomes the harness cascade id, while main and subagent token usage are tracked by trajectory id.

### Local process protocol

At commit `6db963cbe4587a7934fd6c2e007976a1b97ed655`, the Python adapter:

1. discovers the runtime through `ANTIGRAVITY_HARNESS_PATH`, the installed distribution, package resources or `PATH`;
2. serializes a protobuf `HarnessConfig`;
3. starts `[localharness]` with piped stdin, stdout and stderr;
4. writes a four-byte little-endian length plus the serialized config;
5. reads a length-prefixed output containing a localhost port and API key;
6. opens `ws://localhost:<port>/` or `127.0.0.1` with `x-goog-api-key`;
7. exchanges JSON representations of protobuf input/output events;
8. closes the WebSocket and stdin before waiting for the binary, allowing the Go side to finish shutdown serialization.

This exposes process and transport boundaries. It does not expose the model loop, planning implementation, closed tool orchestration or persistence internals inside `localharness`.

### Workspace and safety defaults

`LocalAgentConfig` defaults the workspace list to the current working directory and the app-data directory to `~/.gemini/antigravity`. If no `save_dir` is supplied, it creates a temporary `antigravity_*` directory.

The source distinguishes tool exposure from call policy. `CapabilitiesConfig` defaults to subagents enabled, autonomous mode and no explicit enable/disable list; its documentation says the harness default is all tools exposed. `BaseLocalAgentConfig` supplies `confirm_run_command()` as the default policy, and its class documentation says all tools are enabled while shell execution is gated.

The same pinned repository README instead says `Agent` is read-only by default and that `CapabilitiesConfig()` enables all tools. Because `Agent` requires a caller-supplied config and the actual default factories contradict that wording, this dossier records an **intra-release documentation mismatch**. For safety, callers should set `enabled_tools` or `disabled_tools` and policies explicitly rather than relying on either prose default.

### Capability is not permission

The open enum includes directory listing/search, file find/view/create/edit, command execution, questions, subagents, image generation, web search, URL reading and a finish tool. Removing a tool from capabilities strips it from model context. Denying it with policy leaves it visible but rejects execution. This difference matters for both safety and agent behavior: a denied tool may still consume a model attempt and retry path.

### Hooks are public interception points

The SDK exposes session, turn, tool, interaction and compaction hooks. A pre-tool deciding hook runs before execution and can reject a call; post-tool hooks observe results; transform hooks can shape interaction/error data. The `0.1.10` changelog adds context-aware hook state and tool-call ids, making multi-step correlation possible in the wrapper.

The hook layer still cannot provide atomicity for arbitrary external tools. A pre-call policy checks proposed data; the external resource can change before or during execution, and a post-call observation is not rollback.

## Distribution truth: every runnable SDK wheel includes a closed binary

The pinned `pyproject.toml` says the release process places a platform-appropriate Go binary at `google/antigravity/bin/localharness` and packages it as wheel data. PyPI `0.1.10`, uploaded 2026-08-05 UTC, provides five platform wheels and no source distribution or universal pure-Python wheel:

| Wheel platform | SHA-256 |
|---|---|
| macOS 11+ ARM64 | `e1e009a8a0b93d8a94aa49738a5074d2599700afc686ca421f5b913c33e5bae7` |
| manylinux 2.17 ARM64 | `50dc44d2b22789e83c71020ffc26a95165dd6bb1162aabd68e35c22afc88bc8e` |
| manylinux 2.17 x86-64 | `de1c66ce0a0ac6da4514fedd2aeb067aa68c0b47f2b380f4773643ccd6850e2a` |
| Windows AMD64 | `0940242a1067d82d19d21e89cb3215f01079cc09687b0ff92654be09d744a093` |
| Windows ARM64 | `be2b34d19f33ea9da4df9bb947477837614d8e35643e9383134ddfd454c3a543` |

The compiled boundary existed at the first public `0.1.0` commit; it is not a later packaging shortcut. Therefore this project cannot be classified Source-level merely because the Python API, schemas, adapters and hooks are public.

The CLI has a parallel supply-chain boundary: the ordinary installation path retrieves a closed executable through Google's installer flow. An installed command proves that a binary was obtained; it does not provide inspectable CLI or harness source. No installer or wheel was executed during this research pass.

## The Gemini API surface moves authority to a managed environment

The Gemini API exposes a preview managed agent with id `antigravity-preview-05-2026`, documented as using the Antigravity harness and defaulting to Gemini 3.6 Flash. The caller creates an Interactions API request with `environment="remote"` or reuses an environment id.

### Environment state and interaction context are deliberately separate

An environment owns the remote Linux filesystem, installed packages and working state. An interaction owns model conversation/context. The caller can:

- create a fresh environment;
- reuse an existing environment id across interactions;
- seed it from a repository, Cloud Storage or inline files within documented size limits;
- allow unrestricted outbound network by default or configure an allowlist;
- use proxy-injected credentials without writing them into files or environment variables;
- list, inspect or delete environments;
- download the complete environment snapshot as a tar archive.

The environment has four cores and 16 GB of memory in the current preview documentation. It idles after fifteen minutes, is snapshotted and stopped, and can remain recoverable offline for seven days before deletion. These are remote-runtime lifecycle facts, not a promise of local repository delivery.

### Custom functions cross back to the client

When the agent calls a custom function, the interaction returns `requires_action`. The client executes the function and resumes using the prior interaction plus environment identity. Remote MCP uses Streamable HTTP. These are explicit authority crossings: the managed agent proposes a call, but caller code or a remote MCP server performs it.

### Managed-agent limitations bound the visual claim

The preview currently documents no structured output and no `computer_use`; background execution requires stored interactions. The hosted agent can use code, filesystem and web tools, but this API is not the same browser-recording surface as the local desktop product.

For API work, the durable center is the remote environment until its result is exported or committed elsewhere. An interaction response, background-complete state or function result is evidence/control state, not a local-file mutation.

## Failure atlas

| Boundary | User-visible failure | Why the apparent success is insufficient |
|---|---|---|
| Project mode | user expects isolation but a non-Git folder is edited directly | mixed Projects can combine worktrees with shared direct folders |
| Local Mode | agent completes while unrelated or user edits share the checkout | task completion has no rollback or clean-tree guarantee |
| Worktree | isolated task looks finished but is never integrated | the worktree is a mutation authority, not automatic delivery |
| Planning | approved plan diverges from later implementation | plan and file clocks are separate |
| Artifact review | diff/screenshot was correct when rendered but files change later | no public atomic artifact-to-repository revision contract |
| Browser invocation | frontend task finishes without visual verification | 2.0 requires explicit `/browser` intent when browser use matters |
| Browser evidence | recording proves one happy path only | no source identity or exhaustive state coverage is carried by pixels |
| Conversation state | reopened task remains marked running or disappears | current changelog includes fixes for stale running state and disappearing scheduled conversations |
| Stop hooks | agent never becomes fully idle | current releases had to bound stop-hook continuation loops and model-hook timeouts |
| Hook configuration | malformed/invalid policy silently fails or blocks startup | hook and config validation have required multiple release fixes |
| MCP | server appears configured but policy/auth/schema fails | admin-policy bypass, OAuth, timeouts, duplicate names and key spelling have all changed |
| Permissions | a broad or zero-token pattern authorizes more than intended | CLI `1.1.11` fixed an empty/zero-token allowlist that could match every command and a request-review auto-approval defect |
| Subagents | parent stops while descendants/tasks continue | descendant termination and helper restoration required explicit 2.0 fixes |
| Subagent tools | custom agent hangs on an invalid tool name | documented unmapped-tool known issue |
| CLI fork | user expects filesystem isolation after `/fork` | the command forks conversation state, not Git state |
| 2.0/CLI handoff | imported conversation references another checkout state | context transfer does not reconcile files or revisions |
| SDK install | source clone imports but cannot execute | runnable SDK requires the platform wheel's compiled `localharness` |
| SDK defaults | caller trusts “read-only” prose | pinned README and default config/source documentation disagree; explicit capabilities/policies are required |
| SDK shutdown | host exits before harness serialization completes | adapter shutdown deliberately closes transport and waits up to minutes for the Go process |
| Remote environment | useful files disappear after inactivity/TTL | environment retention is bounded and independent from interaction history |
| Remote networking | task reaches an unintended external service | outbound access is unrestricted unless an allowlist is configured |
| Remote/client function | interaction waits in `requires_action` | client execution and a resume call are required to continue |
| Snapshot | downloaded tar is treated as delivered code | the archive is a new fork and still needs diff, tests, review and integration |

The changelog is evidence of repaired failure classes, not proof that every neighboring race or configuration edge is impossible in the current build.

## Direct facts, bounded inferences and material unknowns

### Directly established

- Antigravity 2.0 is a standalone application separate from the IDE.
- The IDE remains available, while removal of its Agent Manager is announced as a future transition.
- A Project can bind multiple folders and has project-specific settings, resources and permissions.
- Local Mode writes current folders; New Worktree Mode creates conversation worktrees for eligible Git folders.
- Plans, diffs, diagrams, screenshots, recordings and walkthroughs are reviewable artifacts.
- Browser use in 2.0 can be invoked explicitly with `/browser`.
- CLI and 2.0 use the same harness claim but do not share conversations by default.
- `/fork` in the CLI does not create Git isolation.
- subagents have separate context, bounded nesting, inherited security and their own lifecycle/transcripts.
- hooks can make pre-tool and stop/continuation decisions.
- the public Python SDK launches a bundled compiled `localharness` and communicates with it over a local authenticated WebSocket after a protobuf handshake.
- PyPI publishes only platform wheels for `0.1.10`; each contains the runtime binary.
- the managed API agent operates in a remote environment whose filesystem lifetime is distinct from interaction context.
- remote environment snapshots can be downloaded as tar archives.

### Evidence-backed inferences

- The product family is best understood as one agent-harness lineage over several clients, not one synchronized application state. This follows from Google's shared-core claims plus explicit conversation and environment separation.
- A plan/diff/walkthrough is a control or evidence object rather than the implementation source of truth, because the same docs allow it to exist before, during or after independent filesystem writes.
- Native browser evidence improves frontend acceptance but does not create durable target-return identity, because no public browser/artifact schema in this evidence set includes authored file/range/component/revision identity.
- Worktree Mode reduces interference but cannot provide Project-wide isolation when non-Git folders remain direct.
- The open SDK is an adapter/control-plane release rather than an open implementation of the Antigravity agent core, because every runnable distribution requires the closed compiled runtime.
- A managed API interaction can report success while the only recoverable implementation still lives in the remote environment; environment export or another delivery action is needed.

### Material unknowns

- the internal planner, model routing, context assembly, browser perception and tool-selection implementation inside the closed harness;
- the durable schema and retention policy for 2.0 plans, diffs, knowledge and media artifacts beyond the exposed paths and UI behavior;
- whether a browser observation is internally correlated to an exact tool-call/filesystem revision even though no public contract exposes such a binding;
- atomicity or conflict handling across several folders in one Project, especially mixed Git/non-Git projects;
- the exact merge/cleanup guarantees for every worktree and subagent termination failure mode;
- the compatibility contract between IDE, 2.0, CLI and SDK conversation stores across future versions;
- how the hosted Gemini API harness differs internally from the local `localharness` binary beyond documented tools and limits;
- whether individual-tier telemetry data is retained or used under terms beyond the documented toggle; enterprise protections must not be generalized to consumer use;
- long-term migration and export guarantees if the preview managed-agent or 2.0 storage formats change.

## Evidence boundary

This dossier reaches the closed-source boundary because it establishes the current product topology, ordinary local and managed journeys, mutation authorities, review artifacts, public identity model, worktree/project semantics, permission/hook/sandbox layers, persistence clocks, distribution boundary and observed failure classes without inventing hidden implementation details.

The public Python repository is inspected to its current immutable commit, but it does not raise this dossier to Source-level. Its executable agent loop is supplied by the bundled closed Go binary; the desktop, IDE and CLI cores are also closed, and the managed API is a service contract.

No account-authenticated destructive operation, installer, wheel or remote agent execution was used. Current product claims come from official public documentation, changelogs, package metadata and immutable official source.

## Acceptance checklist for a real Antigravity frontend task

1. Record the exact surface and version: 2.0, IDE, CLI, SDK or Gemini API.
2. Record the actual mutation authority: direct folder, specific worktree or remote environment id.
3. Inspect every Project folder; do not assume non-Git folders gained worktree isolation.
4. Review global and project permissions, hooks, MCP files, sandbox state and browser access.
5. Preserve or understand pre-existing dirty work before Local Mode writes.
6. Review the implementation plan as intent, then separately review the resulting current diff.
7. Invoke browser work explicitly when the journey requires it.
8. Test the real responsive, interaction, loading, error and accessibility states—not only the recorded happy path.
9. Confirm that screenshots/recordings came from the current build and intended checkout.
10. Wait for descendants/background tasks to stop; account separately for schedules and sidecars.
11. For CLI forks or 2.0 imports, verify the filesystem and Git revision instead of trusting conversation continuity.
12. For SDK use, set capabilities and policies explicitly and pin the platform wheel/hash.
13. For managed API work, record the environment id and TTL, then export or commit the remote result before relying on it.
14. Run the repository's deterministic checks and inspect the final rendered result.
15. Commit, merge, publish or deliver the actual authority; retain artifacts as evidence, not as a substitute.

## Primary sources and evidence pins

### Product topology and evolution

- [Introducing Google Antigravity 2.0](https://www.antigravity.google/blog/introducing-google-antigravity-2)
- [Initial agentic development platform announcement](https://developers.googleblog.com/en/build-with-google-antigravity-our-new-agentic-development-platform/)
- [Google I/O 2026 feature deep dive](https://www.antigravity.google/blog/google-io-2026-feature-deep-dive)
- [Antigravity overview](https://www.antigravity.google/docs/overview)
- [Current Antigravity changelog](https://www.antigravity.google/changelog)
- [Google Antigravity for enterprises](https://www.antigravity.google/blog/google-antigravity-for-enterprises)

### Projects, artifacts and local control

- [Projects and Local/New Worktree modes](https://www.antigravity.google/docs/projects)
- [Settings and project hierarchy](https://www.antigravity.google/docs/settings)
- [Agent settings](https://www.antigravity.google/docs/agent-settings)
- [Artifacts](https://www.antigravity.google/docs/artifacts)
- [Artifact review](https://www.antigravity.google/docs/artifact-review)
- [Implementation plans](https://www.antigravity.google/docs/implementation-plan)
- [Walkthroughs](https://www.antigravity.google/docs/walkthrough)
- [Screenshots](https://www.antigravity.google/docs/screenshots)
- [Permissions](https://www.antigravity.google/docs/permissions)
- [Hooks](https://www.antigravity.google/docs/hooks)
- [Subagents](https://www.antigravity.google/docs/subagents)
- [Sidecars](https://www.antigravity.google/docs/sidecars)
- [MCP](https://www.antigravity.google/docs/mcp)
- [IDE browser subagent](https://www.antigravity.google/docs/ide/browser)

### CLI

- [Introducing the Antigravity CLI](https://www.antigravity.google/blog/introducing-google-antigravity-cli)
- [CLI overview](https://www.antigravity.google/docs/cli/overview)
- [CLI projects](https://www.antigravity.google/docs/cli/projects)
- [CLI conversations and `/fork`](https://www.antigravity.google/docs/cli/conversations)
- [CLI modes](https://www.antigravity.google/docs/cli/modes)
- [CLI artifacts](https://www.antigravity.google/docs/cli/artifacts)
- [CLI subagents and tasks](https://www.antigravity.google/docs/cli/subagents)
- [CLI sandbox](https://www.antigravity.google/docs/cli/sandbox)

### Python SDK: immutable source boundary

- Repository: [`google-antigravity/antigravity-sdk-python`](https://github.com/google-antigravity/antigravity-sdk-python)
- Current inspected commit: [`6db963cbe4587a7934fd6c2e007976a1b97ed655`](https://github.com/google-antigravity/antigravity-sdk-python/commit/6db963cbe4587a7934fd6c2e007976a1b97ed655)
- Annotated `v0.1.10` tag object: [`2e8c3a772c9ecabfc54773f23595c189a0cd6305`](https://github.com/google-antigravity/antigravity-sdk-python/releases/tag/v0.1.10), resolving to the inspected commit
- First public `v0.1.0` commit: [`29fd4c9a19707be38a0ec2bcb00a4e156b004aa5`](https://github.com/google-antigravity/antigravity-sdk-python/commit/29fd4c9a19707be38a0ec2bcb00a4e156b004aa5)
- [README binary boundary](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/README.md#L14-L19)
- [`pyproject.toml` bundled `localharness`](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/pyproject.toml#L58-L67)
- [`Agent` safety initialization](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/google/antigravity/agent.py#L62-L115)
- [`LocalAgentConfig` defaults](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/google/antigravity/connections/local/local_connection_config.py#L87-L145)
- [`CapabilitiesConfig` and built-in tools](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/google/antigravity/types.py#L235-L388)
- [`localharness` process and handshake](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/google/antigravity/connections/local/local_connection.py#L1147-L1252)
- [Conversation layer ownership](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/google/antigravity/conversation/README.md#L11-L50)
- [Hook type contracts](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/google/antigravity/hooks/hooks.py#L83-L131)
- [SDK `0.1.10` changelog](https://github.com/google-antigravity/antigravity-sdk-python/blob/6db963cbe4587a7934fd6c2e007976a1b97ed655/google/antigravity/CHANGELOG.md#L10-L80)
- [PyPI `google-antigravity` 0.1.10 files](https://pypi.org/project/google-antigravity/0.1.10/#files)
- [Introducing the Google Antigravity SDK](https://www.antigravity.google/blog/introducing-google-antigravity-sdk)

### Managed Gemini API agent

- [Antigravity Agent in the Gemini API](https://ai.google.dev/gemini-api/docs/antigravity-agent)
- [Agent execution environments](https://ai.google.dev/gemini-api/docs/agent-environment)
