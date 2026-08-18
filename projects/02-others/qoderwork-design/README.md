# QoderWork Design

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Qoder / Alibaba; global site copyright holder: BRIGHT ZENITH PRIVATE LIMITED |
| Category | Executable design workbench inside a desktop agent task system |
| Status | Active; Design Desk launched publicly with QoderWork Custom Desk on 2026-05-20 |
| Product surface | Design workspace in the standalone QoderWork desktop application |
| Supported desktop platforms | Windows 10+ and macOS 14+ |
| Account / execution boundary | Requires a Qoder account and draws from the shared Qoder Credits balance |
| Source availability | Product client, Canvas, renderer, Nudge and agent runtime are closed |
| Canonical documentation | https://docs.qoder.com/qoderwork/design |
| Canonical product page | https://qoderwork.com/ |
| Canonical implementation repository | N/A — no public QoderWork Design implementation repository was found in the official organization |
| Related public evidence repository | https://github.com/QoderAI/changelog-QoderWork |
| Pinned evidence revision | `96b7a25021f0f627fe9e66765bcd14976e6f320b` — changelog content only, not product source |

## Product boundary: a design-specific workbench on a general task substrate

QoderWork Design is not a separate vector-document editor and is not merely a mode inside Qoder IDE. QoderWork is a standalone desktop agent for file, browser and application work. **Design** is its first domain-specific workspace: switching the workspace changes the interface, toolchain and intended output while retaining the common QoderWork task, conversation, model, working-folder and artifact machinery.

The [Custom Desk launch post](https://qoder.com/blog/qoderwork-customdesk) describes that platform split directly:

- every desk has a dedicated interface;
- every desk has a domain toolchain of agents, renderers and review mechanisms;
- every desk has an output specification;
- all desks share the same agent layer and task system.

For Design, the dedicated interface is an infinite Canvas plus source, preview, style and plan views. The intended output is runnable code. That makes the workbench closer to an agent-authored frontend project with visual controls than to a canonical shape graph.

## The ordinary journey starts by contracting the output, then writes files

```text
new QoderWork task
       ↓
choose Design workspace
       ↓
brief + screenshots/links/voice
       +
optional working folder · style reference · fidelity · component library
       ↓
┌───────────────────── decision ─────────────────────┐
│ Run directly                                      │ Enter design planning
│ skip Questions/Plan                               │ structured Questions
│                                                   │         ↓
│                                                   │ Design Plan contract
└──────────────────────────┬────────────────────────┘
                           ↓
                  agent writes engineering files
                           ↓
           Canvas projection ↔ Design Files ↔ Preview
                           ↓
       queued prompt · lasso/annotation · Nudge · file edit
                           ↓
              current code artifact / local folder
                           ↓
                    Handoff to Qoder IDE
```

The [current Design guide](https://docs.qoder.com/qoderwork/design) exposes more choices than the original Seed description:

1. create a task and choose the Design workspace;
2. describe the intended result, optionally attaching screenshots, links or voice input;
3. optionally bind a local Working Folder, choose a style reference, choose wireframe/high fidelity and select a component library;
4. either run immediately or enter structured design planning;
5. in planning mode, answer product/audience/fidelity/asset questions, or choose **Let AI decide**;
6. review a Design Plan and choose **Run plan**, **Request changes** or **Cancel**;
7. watch components appear on Canvas and inspect the running result in Preview;
8. iterate through conversation, lasso/annotation, Nudge or direct file editing;
9. hand the current code artifact to Qoder IDE.

The planning stage is a user-controlled gate, not a mandatory compiler phase. **Run directly** skips both structured Questions and the Design Plan. Therefore a plan can constrain a planned run, but it cannot be treated as the universal source of truth for every Design artifact.

## The engineering files are the handoff authority

Qoder repeatedly describes the Design result as “the same runnable file” used by designer and engineer. The strongest public evidence behind that claim is the optional Working Folder path:

- **Work in a Folder** binds one QoderWork task to one explicitly authorized local directory;
- the Design agent writes engineering files into that directory;
- **Design Files** exposes the engineering files behind the Canvas;
- **Preview** runs the design as an interactive interface;
- the files can be edited directly in the workbench;
- **Handoff to Qoder** sends the current code artifact to Qoder IDE for continued work.

When a Working Folder is used, the durable artifact boundary is straightforward: inspect the local directory. It can be opened by an editor, placed under Git, tested independently and retained even if the QoderWork conversation is archived.

The Working Folder is optional. General QoderWork documentation says a task without one can still produce artifacts surfaced as conversation download cards and reopened later from task history. It does not publish where an unbound Design project's engineering files, Canvas state or running environment live on disk. “Same runnable file” is therefore strongest for a folder-bound task; it should not be expanded into a claim that every Canvas state is already a user-controlled repository.

## Five views expose one task through different authorities

| Surface / object | Public role | Authority it can establish | Boundary it does not establish |
|---|---|---|---|
| QoderWork task | Saved conversation, context, monitor and artifacts | one independently addressable work session | a source-control commit or atomic artifact snapshot |
| Working Folder | Explicitly authorized local directory | files read and written by the agent | Canvas layout, conversation or model state |
| Plan | Proposed direction and output contract before generation | reviewed intent for a planned run | mandatory execution path or proof that output conforms |
| Design Files | Engineering files behind the current Canvas | inspectable/editable source inside the workbench | published file-format or source-tree schema |
| Canvas | Infinite surface where components appear and regions can be selected | visual composition and grounded edit context | canonical vector graph or public node-identity model |
| Preview | Running interactive design | current runtime behavior such as navigation, hover and CTA interaction | deployability, accessibility, production data or cross-browser acceptance |
| Style References | Selected visual reference among a current documented set of 161 | generation direction | a published token system, licensed asset set or version-pinned design system |
| Nudge | Adjustable color, spacing, radius and appearance parameters | fast parametric correction of the current design | disclosed write target, schema, source diff or merge behavior |
| Qoder IDE handoff | Continued engineering entry point | current code artifact can move into the coding environment | documented transport, branch creation, synchronization or rollback protocol |

The architecture is file-centered without being file-only. Files are what can leave the workbench as engineering material; task and Canvas state supply intent, history and visual controls around them.

## Design Plan is a visible contract with an unpublished schema

In planning mode, the current UI shows a Contract panel containing at least:

- artifact type;
- platform;
- output;
- component library;
- fidelity;
- style;
- a list of expected Artifacts and a one-line goal for each.

The official screenshot description also exposes a `.design.json` link. Its example contract identifies a responsive, desktop-first landing page, HTML output, no library, high fidelity, a named visual direction and `index.html` as an artifact.

This is consequential public evidence: Qoder does not rely only on a prose prompt before generation; it can materialize an output contract that the user reviews. But the documentation does not publish the `.design.json` schema, sample bytes, validation rules, version, storage path or execution semantics. It also does not say whether **Request changes** performs a structured patch or a new model rewrite.

The honest model is:

```text
brief / structured answers
          ↓
reviewable Design Plan + visible contract
          ↓
agent execution conditioned by that contract
          ↓
files whose conformance still requires inspection
```

The plan is evidence of intended output, not evidence that all promised files, interactions or quality constraints were delivered.

## Output technology is selectable and has already evolved

The 2026-05-20 launch post described Design Desk's result as a working **React + Vite** project. Current documentation exposes a broader contract:

- **No library** is the default and is HTML-first unless the brief explicitly requests React or another framework;
- **shadcn/ui**, **Spark Design** and **Ant Design** are selectable React-library targets;
- **Wireframe** asks for low-fidelity structure with minimal styling;
- **High fidelity** is the default and asks for production-grade visual detail;
- Auto Style Reference can choose among 161 named references, while a user can lock a specific direction.

This is an evolution from one launch archetype toward selectable output stacks. It also makes verification stack-dependent: an `index.html` artifact, a React/Vite project and a component-library project do not share one build, dependency or accessibility contract.

No public source shows how component-library APIs are grounded, how package versions are selected, whether generated code is type-checked, or whether style references contain tokens, screenshots, prompts or code examples. A named library selection is a generation constraint, not proof of compatible or idiomatic use.

## Four correction paths converge visually but expose different guarantees

| Correction path | User target | Public execution semantics | What must be verified afterward |
|---|---|---|---|
| Follow-up prompt | semantic instruction in the same task | queued after the current step; Agent retains conversation context | actual file diff and runtime result |
| Canvas lasso + annotation | selected visual region plus stated intent | Agent adjusts from Canvas context instead of regenerating the whole frame | whether the intended region alone changed and responsive variants remain sound |
| Nudge | generated color, spacing, radius or theme parameter | value changes in real time without restating the brief | source write, scope, persistence and interaction with manual edits |
| Direct Design Files edit | explicit engineering file content | user edits source directly | Preview refresh, generated-control consistency and later Agent overwrite risk |

### Lasso is grounded context, not published source identity

Qoder says a user can select a region, annotate intent and have Agent adjust it without regenerating the whole frame. That is a meaningful targeting contract. The public documentation does not say that the lasso returns a stable DOM element, component identifier, file path, source range or AST node.

No public protocol establishes how a geometric region becomes agent context, how overlapping targets are resolved, or how the selection survives a layout change. The feature reduces prompt ambiguity; it does not by itself prove durable Canvas-to-source mapping.

### Nudge is a generated parametric editor with an unknown write path

Nudge exposes high-leverage design decisions after generation. The documented workspace screenshot shows groups for brand color, spacing scale, corner radius and appearance. This lets a user apply continuous or discrete visual corrections without another natural-language turn.

What matters technically is still undisclosed:

- whether controls bind to CSS custom properties, design tokens, a generated manifest, framework props or a sidecar model;
- whether every generated project receives the same parameter schema;
- whether one value changes a global system or a selected subtree;
- whether a direct file edit can invalidate or detach a Nudge control;
- whether Nudge writes source immediately, waits for save, or maintains overlay state;
- whether undo, conflict detection and validation share the file editor's history;
- whether exposed controls persist after handoff and reopen.

The visible control is a product fact. A token architecture or deterministic source-patch implementation would be an invention without product or source evidence.

### Direct file editing is precise, but later Agent work can still diverge

Design Files gives the user the strongest deterministic authority: edit a named engineering file. Yet the public docs do not specify dirty-file protection, concurrent Agent writes, autosave, merge behavior or whether generation reads external edits before its next step. A file-centered product still needs conflict semantics when human edits and Agent execution share the same folder.

## Canvas and Preview are projections of runnable code, with a closed renderer

The Canvas updates in place as components land. Preview lets a user click CTAs, hover elements and navigate as a running interface. This establishes two projections:

- Canvas optimizes spatial inspection, selection and design iteration;
- Preview optimizes runtime interaction.

Qoder does not publish the projection boundary. The following remain unknown:

- whether each design is served by Vite, a static-file server or another framework runner;
- whether Canvas frames use iframes, DOM mirroring, screenshots or a custom renderer;
- how partial writes and syntax errors are represented while components stream in;
- how ports, dependency installation, network access and process lifetime are managed;
- whether Preview and Canvas render the exact same build;
- how route state, viewport variants and external assets are isolated;
- what happens when the user stops generation mid-write.

An interactive Preview proves that something runs in the workbench. It does not prove a production build, deployment configuration, backend, data persistence or browser compatibility.

## Persistence has separate task, file, Canvas and memory clocks

The general QoderWork task model is unusually explicit. The [New Task guide](https://docs.qoder.com/qoderwork/new-task) says every task has independent conversation history, optional Working Folder, workspace/model selection, attachments, Task Monitor and artifacts. Finished tasks can be reopened months later; unsent prompts survive as Drafts. The [Task Management guide](https://docs.qoder.com/qoderwork/task-management) says tasks can be exported as Markdown, archived and restored, and that archiving does not touch produced files.

That does not establish a Design-specific version graph:

| Clock | Publicly established state | Recovery / portability | Unknown |
|---|---|---|---|
| Local files | generated and edited engineering files in an authorized Working Folder | ordinary filesystem access; user can add Git | automatic commits, snapshots, rollback and dirty-write protection |
| QoderWork task | conversation, context, monitor records and artifact cards | reopen, search, export conversation, archive/restore | exact local/cloud storage and point-in-time file restoration |
| Design Canvas / Plan | current visual surface, plan, style and generated controls | visibly associated with the task | serialization, version history, undo, branching and export |
| Awareness | cross-session preferences and memories in `~/qoderwork/awareness/main` | file-backed export/import and local index rebuild | whether or how Design-specific choices are written into memory |

Awareness is not artifact versioning. Its `SOUL.md`, `AGENTS.md`, `USER.md`, `MEMORY.md` and daily memory files personalize later work; they do not restore a prior source tree or Canvas.

The Handoff guide says an engineer can pull the “same branch,” but it does not document whether Design initializes Git, creates a branch, commits generated files, opens an existing repository branch or merely passes a folder path to Qoder IDE. Until that transport is observed, branch continuity is a product promise with an undisclosed mechanism.

## Local-first describes file authority, not zero data egress

QoderWork's [Viewing Results guide](https://docs.qoder.com/qoderwork/file-management) says file operations occur against explicitly authorized local directories and generated files are already present in the Working Folder. Deletions go to system trash rather than permanent deletion. The Windows app stores configuration under `%USERPROFILE%\.qoderwork` unless the user removes it during uninstall.

The privacy wording needs precision. The public product page says files never leave the device, while the documentation says text content needed for understanding and execution is sent to the LLM API provider. The evidence supports this narrower boundary:

- files are not manually uploaded into a separate cloud-drive workflow;
- filesystem reads and writes occur locally within authorized directories;
- task-relevant content can leave the machine as model input;
- the public docs do not expose field-level redaction, retention or provider-routing details for Design source.

This matters for screenshots, proprietary source, brand assets and design briefs. “Local file operation” is not equivalent to “all design content remains local.”

## Handoff removes format conversion but not acceptance work

The handoff target is the current code artifact, not a flattened design export. That avoids an explicit Figma-like vector-to-code conversion at the end of the Design workflow. If the files already live in the intended project folder, Qoder IDE can continue from those bytes.

The public contract still leaves delivery questions:

- whether Handoff opens, copies, syncs or checks out the artifact;
- what happens when Qoder IDE already has the folder open with changes;
- whether task context, Plan, annotations, Nudge controls and Canvas layout accompany the source;
- whether the handoff creates a Git commit or reviewable diff;
- whether the IDE can send later changes back to the Design Canvas;
- whether exported/downloaded code and folder-bound code have identical structure.

“No lossy export” is accurate for avoiding a separate visual-spec translation step. It is not evidence of bidirectional synchronization or production readiness.

## Ordinary-user failure atlas

| User expectation | Evidence-bounded break | Consequence |
|---|---|---|
| “The Design Plan always protects me from a guessed brief.” | Run directly bypasses Questions and Plan; Let AI decide bypasses user answers | speed and intent alignment are an explicit tradeoff |
| “`.design.json` is a stable open contract.” | only a UI link and example fields are public; no schema/version/bytes | it cannot yet be validated, generated independently or used as interchange |
| “Canvas is the canonical design document.” | Design Files are the handoff artifact; Canvas serialization is undisclosed | Canvas recovery and source recovery cannot be assumed equivalent |
| “A lasso selects the exact source component.” | only Canvas-context adjustment is documented | structural/source targeting and mutation scope remain unverified |
| “Nudge is deterministic token editing.” | parameter UI is public, write path and schema are not | a visible tweak may have opaque scope or interact badly with manual code edits |
| “Stopping generation is a safe rollback.” | stop is documented, transactional rollback is not | partially written or non-running files are a plausible state that must be inspected |
| “Preview success means the deliverable is ready.” | Preview exercises a workbench runtime only | builds, tests, accessibility, responsiveness and deployment still need acceptance |
| “Style reference is a reusable design system.” | named references guide generation; no public token/component/version contract | later runs may approximate rather than reproduce the direction |
| “Same file means it is already in my repository.” | Working Folder is optional | an unbound task artifact may remain inside QoderWork's artifact storage until exported/handoff |
| “Handoff preserves every design decision.” | only the current code artifact is explicitly handed off | Plan, annotations, Nudge and Canvas-only state may not accompany it |
| “The same branch is automatically safe.” | Git initialization, commit and conflict mechanics are undocumented | inspect repository status before and after handoff |
| “Task history versions my code.” | archive/export preserve conversation; files have a separate lifecycle | reopening a task does not publicly guarantee restoration of old file bytes |
| “Local-first means no content leaves the device.” | task-relevant text is sent to an LLM provider | sensitive source/brief policy needs separate review |
| “One task can span all project roots.” | general Working Folder contract allows one folder per task | multi-root work requires a containing directory or separate tasks |
| “Switching Standard/Premium reproduces a run.” | model choice can change for the next step; model/version is not pinned in the artifact | later iterations can differ without an artifact-level model provenance record |

## Public evolution and the limits of release evidence

| Date | Public event | What it establishes |
|---|---|---|
| 2026-02-12 | Qoder introduced QoderWork as a local desktop assistant | common task, local-file and execution substrate predates Design Desk |
| 2026-02-04 | official `changelog-QoderWork` repository received its formatting commit | public release-log repository existed, but contains no product source |
| 2026-03-05 | release `0.1.4` recorded create-skill plus fixes for history restoration, startup crash and post-refresh cards | the base task UI had documented persistence/rendering failures before Design launched |
| 2026-05-20 | Custom Desk launched Design, Slides and Writing desks | Design Desk introduced Questions, Plan, Nudge and working React/Vite output |
| Current 2026-08-11 docs | Design can default to HTML-first or target React libraries, offers wireframe/high fidelity, 161 references and optional planning | current product contract is broader and more configurable than the launch description |

The base-client `0.1.4` failures should not be misreported as current Design bugs: they predate Design Desk and are recorded here only because Design runs on the same QoderWork task substrate. The public changelog repository contains just two commits and one release file at the pinned revision. It does not record the May Design launch or the later HTML/library/planning changes, so no honest commit-by-commit product implementation history can be reconstructed from it.

## Open-source and commit-level evidence boundary

The official [QoderAI GitHub organization](https://github.com/QoderAI) exposed 31 public repositories when enumerated on 2026-08-11. They include SDK samples, cloud-agent components, skills, plugins, blogs and separate changelog repositories. None is identified by Qoder as the QoderWork Design client, Canvas, renderer, Nudge engine or agent backend.

The closest project-specific repository is [`QoderAI/changelog-QoderWork`](https://github.com/QoderAI/changelog-QoderWork). At pinned HEAD [`96b7a25021f0f627fe9e66765bcd14976e6f320b`](https://github.com/QoderAI/changelog-QoderWork/tree/96b7a25021f0f627fe9e66765bcd14976e6f320b):

- the repository contains `README.md` and `releases/0.1.4.md`;
- its full public history has two commits;
- HEAD is the 2026-03-05 `release: 0.1.4` commit;
- the [pinned release note](https://github.com/QoderAI/changelog-QoderWork/blob/96b7a25021f0f627fe9e66765bcd14976e6f320b/releases/0.1.4.md) documents a built-in skill and three base-client fixes;
- it carries no implementation code and exposes no license metadata.

This revision is useful commit-level evidence for the public release ledger and its incompleteness. It is not a pinned product build and must not be used to infer implementation choices.

## Facts, inferences and unknowns

### Established public facts

- Design is a QoderWork workspace over the common task/agent system.
- a Design task can be bound to a local folder where the agent writes engineering files.
- the current output contract can be HTML-first or target named React component libraries.
- structured planning is optional; a user can run directly.
- the Plan UI exposes contract fields and a `.design.json` link.
- Canvas, Design Files, Preview, Style References and Plan are separate views.
- lasso/annotation sends Canvas-grounded intent to Agent.
- Nudge exposes color, spacing, radius and appearance controls.
- Design Files can be edited directly and the current code artifact can be handed to Qoder IDE.
- QoderWork tasks preserve conversation/context/artifacts independently from local files.
- no official Design implementation source repository is public.

### Evidence-backed inferences

- engineering files, not a Canvas-only graph, are the durable handoff authority.
- `.design.json` is a plan/contract representation, but its authority over execution cannot exceed the optional planning path.
- Canvas and Preview must project a runnable file set, but their shared rendering implementation is unknown.
- Nudge must bind generated controls to some mutable design/runtime state, but no particular token or source-patch mechanism is established.
- task history, local files, Canvas state and Awareness form separate persistence domains without a documented atomic revision.
- folder binding gives a stronger ownership and verification boundary than an unbound task artifact.

### Material unknowns

- `.design.json` schema, version, storage path and validation/execution rules;
- generated project layout, package/version selection and build/test commands for each output target;
- Canvas document/frame/selection schema and serialization;
- Canvas-to-source target identity, if any;
- Nudge parameter discovery, binding, writeback, persistence and conflict semantics;
- renderer, preview server, sandbox, port and process architecture;
- stop/cancel rollback and partial-write behavior;
- autosave, undo, snapshots and Design-specific version history;
- Git initialization, branch, commit, diff and handoff transport semantics;
- behavior when local files change externally or concurrently;
- whether IDE edits ever flow back to Canvas;
- exact storage/retention split among local task data, cloud account history and LLM-provider requests;
- current downloadable QoderWork client version corresponding to the Design docs.

## Verification performed for this snapshot

The current Design, task, working-folder, settings, memory, installation, product, download and launch pages were retrieved from official Qoder properties on 2026-08-11. The Design documentation, public product page and public download page each returned HTTP 200. The official GitHub organization was enumerated through GitHub's public API, and `changelog-QoderWork` HEAD, tree, release bytes and complete two-commit history were verified directly.

QoderWork was not present in the Windows command path, uninstall registry or expected user installation/configuration paths on this machine. Installing it would alter the host, and completing the journey would require signing in and consuming account Credits, so no installation, account creation, generation or handoff was performed. The following checks remain explicitly access- or cost-blocked:

- inspect actual `.design.json` and generated HTML/React/Vite project bytes;
- compare Canvas, Design Files and Preview after direct source edits;
- observe Nudge source diffs, persistence and manual-edit conflicts;
- inspect lasso context payload and mutation scope;
- stop generation and inspect partial files/recovery;
- reopen/archive/delete a Design task and compare Canvas/file survival;
- trace Handoff to Qoder through folder, branch, commit and IDE state;
- test a real build, responsiveness, accessibility and deployed artifact.

The decisive public journey, artifact authority, output contract, runtime projections, control paths, persistence domains, security boundary, release history and unknown internals have been exhausted within the current authorized scope. The implementation remains closed, so the dossier is **Architecture-level / closed-source boundary reached**, not Source-level.

## Primary sources

- [QoderWork Design](https://docs.qoder.com/qoderwork/design)
- [QoderWork Custom Desk launch, 2026-05-20](https://qoder.com/blog/qoderwork-customdesk)
- [QoderWork introduction](https://docs.qoder.com/qoderwork/introduction)
- [New Task](https://docs.qoder.com/qoderwork/new-task)
- [Task Conversations](https://docs.qoder.com/qoderwork/chat-basics)
- [Task Management](https://docs.qoder.com/qoderwork/task-management)
- [Viewing Results / Working Folders](https://docs.qoder.com/qoderwork/file-management)
- [System Settings](https://docs.qoder.com/qoderwork/settings)
- [Awareness](https://docs.qoder.com/qoderwork/memory)
- [Windows Installation Guide](https://docs.qoder.com/qoderwork/install-windows)
- [QoderWork product page](https://qoderwork.com/)
- [QoderWork download page](https://qoderwork.com/download)
- [Original QoderWork launch, 2026-02-12](https://qoder.com/blog/qoder-work)
- [Official QoderAI GitHub organization](https://github.com/QoderAI)
- [Pinned QoderWork changelog repository](https://github.com/QoderAI/changelog-QoderWork/tree/96b7a25021f0f627fe9e66765bcd14976e6f320b)
- [Pinned QoderWork 0.1.4 release note](https://github.com/QoderAI/changelog-QoderWork/blob/96b7a25021f0f627fe9e66765bcd14976e6f320b/releases/0.1.4.md)
