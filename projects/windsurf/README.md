# Windsurf

> Research status: **Architecture-level / historical closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Exafunction / Codeium; acquired by Cognition in 2025 |
| Category | Historical agentic IDE and local-to-cloud agent transition |
| Historical boundary | Windsurf Editor through **2026-06-01** |
| Successor | Renamed to Devin Desktop on **2026-06-02** |
| Status | Historical product identity; implementation continues under the successor |
| Source availability | Closed editor and agent core; adjacent demo and editor plugins are public |
| Last Windsurf-branded stable inspected | `2.3.15`, build `c46c49e94b4d3f41181204d59809d8f1b2c48d68` |

## Why this remains a separate historical dossier

Windsurf had an independently attributable product life before its direct rename. Cognition's acquisition announcement said the transaction included the Windsurf product, intellectual property, trademark and business; its later retrospective says the products did not overlap at acquisition: Devin was a cloud coding agent, while Windsurf was an IDE. Windsurf then absorbed local and cloud agents into Windsurf 2.0 before the combined desktop product took the Devin name.

This directory therefore answers a bounded historical question:

> What was the Windsurf Editor's own local artifact loop, how did Integrated Browser context reach Cascade, and what changed when the IDE became a plural-agent command center?

The cutoff is exact rather than thematic:

| Release event | Date | Version / build | Meaning in this dossier |
|---|---|---|---|
| Last official stable with a Windsurf filename and product identity | 2026-05-27 | `2.3.15` / `c46c49e...` | Final distribution inspected here |
| Windsurf became Devin Desktop | 2026-06-02 | `3.0.12` / `a335ac3d...` | Current implementation leaves this historical boundary |

Current Devin Desktop internals, cloud-session architecture and later releases belong to the successor's dossier. They are not silently projected backward into Windsurf.

## Product thesis: a shared local checkout before a plural-agent control plane

The original Windsurf proposition was unusually concrete: the developer and Cascade operated on the same local codebase. The official demo asked a user to let Cascade reason over multiple files, observe human edits, run terminal commands, inspect diffs and continue repairing side effects. The working artifact was not a separate design document. It was the application source and runtime already open in the IDE.

Late Windsurf added a second proposition. Windsurf 2.0 introduced an Agent Command Center, Spaces and cloud Devin sessions beside local Cascade sessions. The interface could organize several agents, but the mutation authorities remained plural:

- a local agent changed the user's checkout or an IDE-created worktree;
- a cloud Devin changed a separate repository clone inside its own VM and returned a branch or pull request;
- a Space grouped sessions, PRs, files and context without claiming that those filesystems had become one;
- the application preview remained a runtime-observation surface for repair, not a second source of truth.

The historical architecture is therefore best understood as a transition from **shared-checkout collaboration** to **Git-mediated coordination across local and cloud machines**.

## The ordinary-user loop: point at the running defect, repair source, reload

A representative local journey was:

1. Open an existing repository in Windsurf and let its index make unopened files searchable to Cascade.
2. Start the application and open it in the Integrated Browser.
3. Activate element selection and click the rendered target.
4. Windsurf captures structural DOM context, final styles, geometry and optionally a clipped screenshot.
5. That packet is attached to Cascade, which searches the repository and edits project files in Code mode.
6. The user reviews the diff, reloads or lets hot reload update the running page, and reselects the element if another pass is needed.
7. The durable result is accepted source in the intended checkout/worktree and, when appropriate, a Git commit—not the selected DOM node or chat message.

Three different forms of evidence meet in this loop:

| Evidence | What it establishes | What it does not establish |
|---|---|---|
| Runtime element packet | Which rendered structure and computed appearance the user meant | Which authored component, file or revision produced it |
| Repository search and index | Candidate implementation locations and surrounding semantics | A deterministic reverse binding from the DOM node |
| Source diff plus clean reload | What code actually changed and whether the rebuilt behavior improved | Broader correctness outside the exercised state |

This distinction is decisive. Windsurf made visual targeting materially richer than a standalone screenshot, but the final return from runtime to source was still an agent search-and-edit operation.

## Integrated Browser: the historical packet is inspectable

The official `2.3.15` Windows archive contains the compiled extension and main-process implementation used by the Integrated Browser. No installation or account login was performed; the package was inspected statically.

### Selection is implemented through Electron and Chrome DevTools Protocol

The compiled main process follows this path:

1. Resolve the relevant browser/webview target and attach Electron's `webContents.debugger`.
2. Attach to the target session and enable the CDP `DOM`, `CSS`, `Overlay`, `Debugger` and `Runtime` domains.
3. Install a small pseudo-element pointer-event guard and call `Overlay.setInspectMode` with `searchForNode`.
4. On `Overlay.inspectNodeRequested`, translate the backend node id into a frontend node id.
5. Query the document, box model, matched CSS rules, outer HTML, ancestors, attributes, inner text and full computed style.
6. Adjust the selected rectangle for BrowserView bounds and zoom.
7. Optionally capture the clipped rectangle as an image and attach the serialized element context to chat.

Relevant CDP calls visible in the shipped bundle include:

- `DOM.getDocument`
- `DOM.pushNodesByBackendIdsToFrontend`
- `DOM.getBoxModel`
- `DOM.getOuterHTML`
- `DOM.resolveNode`
- `CSS.getMatchedStylesForNode`
- `CSS.getComputedStyleForNode`
- `Runtime.callFunctionOn`

The mechanism is therefore not inferred from a marketing screenshot. It is an inspectable runtime extraction pipeline in the final Windsurf-branded build.

### What Cascade actually receives

The model-facing formatter begins with `Attached Element Context from Integrated Browser` and can carry:

- a compact element label from tag, id and classes;
- an ancestor-based HTML path;
- element attributes;
- selected computed styles;
- top, left, width and height;
- inner text, trimmed to 100 characters plus an ellipsis;
- outer HTML;
- expanded computed CSS assembled from inline, matched and inherited rules;
- an optional clipped screenshot of the selected rectangle.

The historical settings expose the packet's variability:

| Setting / behavior | Historical default | Consequence |
|---|---:|---|
| `chat.sendElementsToChat.enabled` | `true` | Element context can be sent directly into Cascade |
| `attachCSS` | `true` | Computed-style sections and expanded CSS are included |
| `attachImages` | `true` | A quality-90 clipped screenshot can accompany the structured text |
| Console-log cap | `1000` entries | Runtime logs are a separate bounded context stream |

With CSS attachment disabled, the packet description is reduced to HTML path and attributes. In this build the formatted element context does not include the page URL.

### The packet stops before source identity

Neither the model-facing text nor the inspected internal attachment contains:

- authored file path;
- source line or range;
- module or component identity;
- source-map location;
- framework fiber identity;
- repository commit or dirty-state revision;
- a durable id that survives reload or hot-module replacement.

An ancestor path describes a position in the current DOM, not a source address. Computed CSS describes the browser's resolved cascade, not necessarily the rule that should be edited. A reused component, loop-rendered element, generated class or portal can map one visual target to several plausible source locations.

The accurate mechanism is:

```text
rendered target
  -> CDP DOM/CSS/geometry extraction
  -> optional clipped screenshot
  -> Cascade context
  -> indexed repository search and reasoning
  -> source diff
  -> rebuilt runtime verification
```

It is **rich runtime grounding followed by heuristic source search**, not source mapping.

## Cascade and the local artifact authority

Cascade's two user-visible modes separate mutation from discussion:

- Code mode can inspect and edit the codebase, invoke tools and maintain a plan/todo sequence.
- Chat mode answers questions and proposes approaches without serving as the file-mutation path.

Official Cascade documentation describes a limit of 20 tool calls per prompt; `Continue` starts another prompt credit. This makes a long repair a sequence of bounded agent turns, not one atomic operation.

### Indexing makes the repository searchable, not transactionally bound

Windsurf's context engine uses repository indexing and retrieval so unopened files can contribute context. Documented boundaries include:

- initial indexing can take roughly 5–10 minutes;
- a 5,000-file workspace is documented at roughly 300 MB of RAM;
- ignored Git paths are excluded from indexing;
- `.codeiumignore` can prevent Cascade from viewing, editing or creating in matched paths;
- remote-repository indexing was an organization feature rather than the local artifact itself.

Index state is a search projection. It can lag a new checkout or ignore relevant generated/configuration files. It neither preserves the workspace nor proves that the retrieved candidate caused the rendered element.

### Human and agent edits converge only in files

The official demo deliberately has a human edit `static/js/config.js` while Cascade is open, then asks Cascade to reason about that action. This establishes the core shared-state contract: both parties work against the same project files.

That convergence still has ordinary engineering risks:

- an agent can broaden a change beyond the selected element;
- a developer can modify the same file during an agent turn;
- hot reload can show a state that is not reproducible after a clean start;
- ignored, untracked or environment files may be absent from agent context;
- a visually correct result can leave tests or other routes broken.

The source diff and rebuilt application—not chat completion—close the loop.

## Checkpoints, worktrees and Git solve different recovery problems

Windsurf exposed multiple kinds of “version,” but none was a universal rewind.

### Cascade checkpoints

Cascade can create named checkpoints and revert code changes to an earlier step. The documented revert applies across the code changes associated with that point and is itself irreversible from the checkpoint UI.

A checkpoint is useful for an agent-led edit sequence, but public documentation does not establish that it captures Git metadata, ignored/untracked files, running processes, database state, browser state, deployments or cloud-agent files. Git remains the reviewable durable history.

### Conversation-scoped worktrees

By late 2025 Windsurf supported worktree sessions. A worktree is selected when the Cascade conversation starts; the conversation cannot later be moved into or out of that worktree. Documented behavior includes:

- one conversation receives its own worktree under `~/.windsurf/worktrees/<repo>`;
- untracked files such as `.env` do not appear automatically;
- relative links to files outside the repository can break;
- a `post_setup_worktree` hook can restore setup;
- the IDE retains at most 20 and uses least-recently-used cleanup;
- deleting the conversation deletes its associated worktree;
- the user must explicitly merge intended changes back to the main working branch.

Worktrees isolate concurrent mutation. They do not publish, merge or protect uncommitted work automatically.

## Rules, memories and workflows are context layers, not file history

Late Windsurf had several persistence surfaces with similar user-facing language but different authority:

| Surface | Historical location / scope | Durable role | Important break |
|---|---|---|---|
| Workspace files | User repository | Product artifact and implementation authority | Can be dirty, externally edited or on the wrong branch |
| Git branch/commit | Repository | Reviewable version and integration boundary | Does not include untracked/runtime state by default |
| Worktree | `~/.windsurf/worktrees/<repo>` | Isolated conversation checkout | Conversation deletion/cleanup can remove it; merge is manual |
| Cascade conversation | IDE account/workspace surface | Turn and tool history | Resuming context does not restore files |
| Checkpoint | Conversation-associated recovery point | Revert agent code changes | Not documented as whole-environment snapshot |
| Automatic Memory | `~/.codeium/windsurf/memories/` | Cascade-generated workspace context | Local, Cascade-only, not committed or cross-workspace |
| Global rule | `~/.codeium/windsurf/memories/global_rules.md` | Always-available user instruction | Separate from project history; documented 6,000-character cap |
| Workspace rules | `.windsurf/rules/*.md` | Repository-shareable scoped instructions | Trigger and path scope can omit a relevant rule; 12,000-character cap |
| `AGENTS.md` | Directory-scoped repository file | Hierarchical agent instruction | Applies by location, not as global runtime state |
| Workflow | `.windsurf/workflows/*.md` or user-global workflow directory | Manual slash-command step template | A sequence of prompts, not a transaction or rollback |
| Code index | Local retrieval state | Search/context projection | Can be incomplete, stale or exclusion-filtered |
| Browser runtime | Process/webview state | Current visual evidence | Volatile across reload, HMR and navigation |
| Deploy manifest | `windsurf_deployment.yaml` | Provider/project handoff metadata | Does not contain the deployed site or local history |
| Hosted preview | Netlify / `.windsurf.build` state | Shareable running output | Separate retention, ownership and revision clock |

Automatic Memory is explicitly local to the workspace and Cascade. Current lineage documentation recommends Rules or `AGENTS.md` for knowledge that must be durable and reviewable. A previous-conversation mention retrieves relevant summaries/checkpoints rather than replaying an entire filesystem state.

Workflows are Markdown recipes with a documented 12,000-character limit and manual slash-command invocation. They can standardize a repair sequence, but a partially executed workflow may leave partial file or external state.

## App Deploys create a second artifact clock

Cascade could invoke App Deploys to publish a preview through Netlify under a public `.windsurf.build` address. The product wrote `windsurf_deployment.yaml` with provider-facing project/framework metadata and uploaded code to a managed provider account.

This adds a distinct delivery path:

```text
local source + configuration
  -> Cascade deploy tool
  -> provider project and public preview
  -> optional ownership claim
```

Official documentation treats this as a preview path, not the recommended production-hosting boundary. Unclaimed previews may be deleted; claiming transfers ongoing control. A successful URL therefore proves that one upload ran, not that it matches the latest local commit, contains the right secrets or is permanently owned.

## Windsurf 2.0: one command center, still several machines

Windsurf 2.0, announced on 2026-04-15, reframed the IDE around parallel agents:

- Agent Command Center presented local and cloud work in a Kanban-like surface.
- Spaces grouped sessions, pull requests, files and shared context around a task.
- Devin could run in its own cloud VM with desktop, browser and computer-use tools.
- A local planning session could hand implementation to a cloud Devin.
- The returned pull request could be reviewed and touched up locally in Windsurf.

Cognition explicitly stated that local and cloud agents were not the same agent. Local agents operated on the user's machine; cloud Devin sessions ran in Cognition infrastructure. The control surface coordinated them, while Git/PR state remained the durable rendezvous.

That transition explains the later rename. Devin Desktop was introduced as the next generation of Windsurf, kept the full IDE backwards-compatible and made the Agent Command Center the default. Existing Windsurf work was retained, but the current product identity and post-cutoff implementation are outside this historical dossier.

## Failure atlas

| Apparent success | Actual failure boundary | Evidence needed before acceptance |
|---|---|---|
| The selected element reached Cascade | Packet has runtime structure but no authored source identity | Inspect the proposed file/range and explain why it owns the target |
| The clipped screenshot looks correct | It covers one rectangle, viewport and runtime moment | Reload cleanly and test responsive, state and route variants |
| Cascade says the edit is complete | Agent status is not an artifact diff | Review changed files, shared-component scope and tests |
| Hot reload shows the fix | HMR may retain stale state or the target path may have changed | Restart/rebuild and reselect the element |
| Computed CSS identifies the style | Final cascade can originate from inherited, generated or runtime rules | Trace the authored declaration and regression scope |
| A checkpoint exists | It is not a documented repository/environment snapshot | Commit intended work and test checkpoint recovery separately |
| A worktree session is done | Changes can remain isolated or be removed with cleanup | Preserve, diff and explicitly merge/commit |
| Memory remembers the preference | Memory is local Cascade context, not shared source | Put durable policy in Rules or `AGENTS.md` |
| A workflow ran several steps | Markdown steps are not atomic | Inspect intermediate file and external side effects |
| Code index found a candidate | Retrieval is not reverse mapping | Validate ownership against the actual render path |
| Command Center shows a finished cloud card | Local and cloud files may be on different revisions | Inspect the exact PR head and reconcile local changes |
| A Space contains the right files/PR | Grouped context is not a shared filesystem | Record machine, branch and revision for each session |
| A public deploy URL opens | Provider state can be stale, unclaimed or temporary | Bind the deployment to a commit and ownership account |

## Distribution inspection: the editor core is shipped, not open

### Hash-pinned historical archive

The final Windsurf-branded Windows x64 archive inspected for this snapshot is:

```text
Windsurf-win32-x64-2.3.15.zip
build: c46c49e94b4d3f41181204d59809d8f1b2c48d68
Content-Length: 317,544,064 bytes
ETag: "41cf761acd8bdeea3643b693b162fdd8-38"
SHA-256: 95BE58BE5D74F4A672E662554F8A3F344BD3C5CF0A8E199BC5F3DB43B9190A2E
```

The ZIP contains 9,765 entries and expands to 980,066,779 bytes. Metadata establishes:

- product name/application id `Windsurf` / `windsurf`;
- user-data folder `.windsurf` and server folder `.windsurf-server`;
- VS Code base `1.110.1`;
- product build/commit `c46c49e...` on the stable channel;
- bundled Windsurf extension `0.2.0`, publisher `codeium`;
- proprietary Windsurf Editor and extension licenses, both reserving rights to Exafunction.

### Core-bundle hashes and source-map boundary

| Shipped file | SHA-256 |
|---|---|
| `extensions/windsurf/dist/extension.js` | `BF94CD158CBDB4F1A6DE6BA5CBDA3F1FF090334CB1EBDD4C21A6D950C5483EF0` |
| `out/main.js` | `6409717519B4CE85692E30283B1B6AF2A3662FC0DA8F6AB505F8A63AD6761873` |
| Sessions workbench bundle | `88AA047193F188B7A50A60E9660EFC599CFF1422AAC80CC58998E90EFE91E7F6` |
| Main workbench bundle | `9C958EEC4E45A8F6BE726AC9D8C130C2C4D3789049D45C79FBA9D79FB7C1F903` |

The archive includes 628 `.map` files elsewhere, but none under `extensions/windsurf/` or the application `out/` tree. The historical package therefore permits bounded static inspection of compiled behavior; it does not provide original core source, source maps, tests or commit history.

## Public repositories expose intended use and client edges

The official Exafunction organization does not publish the Windsurf Editor core.

| Repository / pin | What is public | What it cannot prove |
|---|---|---|
| `Exafunction/windsurf-demo@c1feea806...` | MIT demo application, tests and scripted Cascade tasks | Editor, Cascade, preview picker or persistence implementation |
| `Exafunction/windsurf.nvim@821b570b...` | MIT Neovim client, auth/config/completion integration and binary updater | Windsurf IDE or hosted agent core |
| `Exafunction/codeium@59093464...` | Minimal release/license repository | Open implementation; its license says code and release artifacts use Codeium Terms of Service |

The pinned Neovim client is instructive about the boundary. Its open Lua updater resolves platform, downloads a separately released `language_server_*` binary, checks its embedded source-control stamp and then executes it. At this pin it selects language server `1.20.9` with stamp `2deb37376016b8eb5f2895a7b7a5f46aa57fb6d6`. The transport/client is visible; the service binary it downloads is not thereby open source.

The demo pin is product evidence rather than implementation evidence. Its documented tasks establish Windsurf's intended shared-codebase loop—multi-file edits, awareness of human edits, terminal execution, diff review and iterative repair—but cannot substitute for the proprietary editor bundles.

## Evolution of the historical architecture

| Period | Established change | Architectural consequence |
|---|---|---|
| Original Windsurf agentic IDE | Human and Cascade work in the same local codebase | Workspace files are the common artifact |
| July 2025 | Cognition acquires the Windsurf product/IP/brand and says it will integrate the IDE into its products | Independent IDE lineage enters a cloud-agent company |
| July–December 2025 | Voice, named checkpoints, deeper browser support, planning, workflows/rules, Codemaps, worktrees, parallel agents, multipane UI, hooks and system rules arrive | Local execution gains more observation, context and isolation clocks |
| January 2026 | Plan/Megaplan/Arena-style agent selection expands | Planning and model/agent choice become explicit surfaces |
| 2026-04-15 | Windsurf 2.0 adds Agent Command Center, Spaces and Devin in Windsurf | One UI coordinates local checkout/worktrees and separate cloud VMs |
| 2026-05-27 | Windsurf `2.3.15` ships | Last inspectable stable under the Windsurf name |
| 2026-06-02 | Devin Desktop `3.0.12` replaces the product name | Current implementation moves to the successor identity |

## Facts, inferences and material unknowns

### Directly established

- Windsurf was an independently identified agentic IDE before Cognition acquired its product, IP, trademark and business.
- The final Windsurf-branded stable archive is `2.3.15` / `c46c49e...`; the first Devin-branded release is `3.0.12` / `a335ac3d...`.
- The historical Integrated Browser uses Electron debugging plus CDP DOM/CSS/Overlay/Runtime calls to capture a selected element.
- Its chat packet includes DOM path, attributes, geometry, HTML, computed styling and optional clipped screenshot.
- The inspected packet does not include authored file/range/component/source-map/repository revision identity.
- Cascade and the user converge on local source files; worktrees provide optional conversation isolation and require explicit integration.
- Memories, Rules, workflows, checkpoints, index, browser state, Git and deployments are separate persistence or delivery domains.
- Windsurf 2.0 placed local and cloud agents in one control surface while official product material kept their machines and execution authorities distinct.
- The official editor/extension distribution is proprietary; public repositories expose a demo and adjacent clients, not the editor core.

### Evidence-backed inferences

- Historical Preview is a **runtime evidence compressor**: it turns a click into a bounded, model-readable DOM/CSS/geometry packet so repository search begins from a much narrower hypothesis.
- Source correction remains heuristic because runtime identity ends before authored source identity.
- The local source tree and Git are the durable center; chat, checkpoint, index, browser and deploy state support that center but do not replace it.
- Windsurf 2.0's command center is a control-plane convergence layer. Git branches and PRs, not the board or Space, reconcile changes across local and cloud machines.
- The direct rebrand reflects an architectural merger already underway: the local IDE supplied interactive artifact access while cloud Devin supplied isolated autonomous execution.

### Material unknowns

- Original source, tests, source maps and commit history for Cascade, the Integrated Browser picker, workbench modifications and hosted services.
- The precise model-routing, retrieval-ranking, prompt assembly and agent-planning implementation in the final Windsurf build.
- A stable internal runtime-to-source binding that is absent from the inspected outgoing packet, if any existed elsewhere.
- Checkpoint serialization, coverage of untracked/external files and conflict handling under simultaneous human/agent edits.
- Conversation, Memory, index and cloud-session retention guarantees for historical accounts.
- Atomic revision binding among a selected browser element, local dirty tree, worktree, checkpoint and deployed preview.
- Exact rollout/feature-flag availability of every Windsurf 2.0 capability between April 15 and the June 2 rename.
- Server-side implementation and data model behind Agent Command Center and Spaces.

## Acceptance checklist for a historical Windsurf journey

1. Pin the exact Windsurf release, repository, branch/commit and local environment before evaluating behavior.
2. Wait for indexing and inspect ignore rules; do not assume unopened, ignored or generated files are available to Cascade.
3. Preserve the exact element packet only as runtime evidence and reselect after navigation, HMR or rebuild.
4. Trace the proposed implementation file and shared-component scope; an HTML path is not a source address.
5. Review the actual diff and run a clean build/restart before accepting a visual repair.
6. Exercise responsive, interaction, data and error states outside the selected screenshot rectangle.
7. Treat a Cascade checkpoint as a separate recovery mechanism; commit intended work in Git.
8. For a worktree session, restore required untracked configuration, protect work before conversation cleanup and merge explicitly.
9. Put shared durable guidance in repository Rules or `AGENTS.md`, not only automatic Memory.
10. Inspect partial side effects after a stopped/failed workflow or exhausted tool-call turn.
11. When local and cloud agents cooperate, record the machine, branch and revision for each session and verify the returned PR head.
12. Bind a public deploy to the exact commit/configuration and claim it when durable ownership matters.

## Primary sources and evidence pins

### Lifecycle and product transition

- [Cognition acquisition of Windsurf](https://cognition.com/blog/windsurf)
- [Windsurf 2.0](https://devin.ai/blog/windsurf-2-0)
- [Devin in Windsurf](https://cognition.com/blog/devin-in-windsurf)
- [Introducing Devin Desktop](https://cognition.com/blog/introducing-devin-desktop)
- [One year of building together](https://cognition.com/blog/one-year-of-building-together)
- [Devin Desktop FAQ and Windsurf migration](https://docs.devin.ai/desktop/devin-desktop-faq)
- [Desktop release history](https://docs.devin.ai/desktop/releases)

### Historical Windsurf behavior retained in official documentation

- [Windsurf Previews](https://docs.windsurf.com/windsurf/previews)
- [Cascade](https://docs.devin.ai/desktop/cascade/cascade)
- [Context awareness and indexing](https://docs.devin.ai/desktop/context-awareness/windsurf-overview)
- [Ignore behavior](https://docs.devin.ai/desktop/context-awareness/windsurf-ignore)
- [Memories](https://docs.devin.ai/desktop/cascade/memories)
- [Workflows](https://docs.devin.ai/desktop/cascade/workflows)
- [Worktrees](https://docs.devin.ai/desktop/cascade/worktrees)
- [App Deploys](https://docs.devin.ai/desktop/cascade/app-deploys)

### Distribution and repository pins

- [Official Windsurf `2.3.15` Windows x64 archive](https://windsurf-stable.codeiumdata.com/win32-x64-archive/stable/c46c49e94b4d3f41181204d59809d8f1b2c48d68/Windsurf-win32-x64-2.3.15.zip)
- [Exafunction GitHub organization](https://github.com/Exafunction)
- [Official tutorial app tree `c1feea806...`](https://github.com/Exafunction/windsurf-demo/tree/c1feea80633494dc66f1ce025b6152f126bd7ceb)
- [Neovim client tree `821b570b...`](https://github.com/Exafunction/windsurf.nvim/tree/821b570b526dbb05b57aa4ded578b709a704a38a)
- [Neovim binary updater at the pinned commit](https://github.com/Exafunction/windsurf.nvim/blob/821b570b526dbb05b57aa4ded578b709a704a38a/lua/codeium/update.lua)
- [Codeium release/license repository tree `59093464...`](https://github.com/Exafunction/codeium/tree/5909346446152aa1fa853d4c487f83debfdb2886)

No authenticated Windsurf session, Cascade edit, cloud handoff or deployment was executed for this snapshot. Product behavior is bounded to official lifecycle/documentation evidence, the pinned official demo/client repositories and static inspection of the hash-pinned final Windsurf-branded distribution.
