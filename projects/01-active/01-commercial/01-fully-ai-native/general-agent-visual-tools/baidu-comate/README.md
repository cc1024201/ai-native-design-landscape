# Baidu Comate

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Baidu |
| Category | Agentic coding IDE with design-to-code, runtime selection and visual source editing |
| Status | Active |
| Product boundary in this dossier | Comate AI IDE and its bundled Comate extension; editor plugins and public skill repositories are treated as adjacent surfaces |
| Source availability | Product implementation closed; current compiled Windows distribution inspectable; public `BaiduComate` repositories contain plugins and skills rather than the AI IDE implementation |
| Decisive artifact question | When Figma/Lanhu content or a rendered page element enters Comate, which representation is temporary evidence, which mechanism can address source, and what actually becomes durable? |
| Evidence used | Current official documentation and release history, current official update feed, read-only extraction of the official Windows installer, and pinned public GitHub trees |

## Product thesis: two visual entry planes converge on workspace files

Comate presents design-to-code and visual page editing inside one AI IDE, but the current client implements them as different pipelines:

| Entry plane | Upstream object | What Comate materializes | Target-return strength | Durable implementation |
|---|---|---|---|---|
| Normal Figma selection | External Figma node(s) | Generated HTML/JSON/Markdown, thumbnail, assets, preview path, optional tokens and conversion rules | Semantic design/component context; no Figma-node-to-source binding | Files created or changed in the opened workspace by Agent |
| Figma Make | Exportable Figma Make project | Extracted project archive plus a prompt to inspect it as a codebase | File/codebase context, not native design-node identity | Extracted files and later workspace changes |
| Lanhu selection | Selection made in Comate's built-in browser | Publicly documented D2C selection handoff | Exact packet and version contract remain undisclosed | Files later changed in the workspace |
| Running-page selection | Current DOM element | Element HTML, framework/name heuristic, DOM path, rectangle and optional source path | Can carry `file:line:column:tag` and navigate to code; absent or stale coordinates fall back to semantic location | Either direct source rewrite for supported style/text operations, or Agent-authored workspace changes for general edits |

The decisive shared authority is therefore not a design document or the current browser DOM. It is the project working tree:

```text
external design snapshot ─┐
                          ├─> structured context / edit intent ─> workspace files ─> rebuilt preview
running DOM + source hint ┘
```

That convergence is stronger than a screenshot-only coding prompt. It is still not one roundtrip design/code graph: the Figma selection, temporary conversion cache, preview DOM, source coordinates, working tree, Agent checkpoint and deployment all have separate lifecycles.

## Version boundary: one installer exposes three clocks

Comate's public and packaged version identifiers should not be collapsed into one chronology.

| Clock | Current inspected value | Meaning |
|---|---|---|
| AI IDE download feed | Product version `3.4.1`; build `43244cc09579652e7ae4164e605a38caae7f17e7-264590618`; timestamp 2026-08-05 22:47:41 +08:00 | Current downloadable Windows application artifact on 2026-08-11 |
| Public AI IDE update document | Latest listed release `3.2.0` dated 2026-07-22; document updated 2026-07-27 | Public product-level release narrative; it trails the current feed |
| Bundled Comate extension | Package version `4.11.1`; bundled changelog latest heading `4.11.0` dated 2026-07-27 | Extension/runtime feature line packaged inside the AI IDE, not the desktop product version |
| Editor base | VS Code `1.108.2`, Electron `39.2.7` | Upstream shell/runtime baseline, not a Comate feature version |

The feed's long build value is useful as an immutable distribution pin. It is not established as a public source commit. Likewise, a feature appearing under extension `4.x` and AI IDE `3.x` does not prove two different implementations; it proves only that the shipped product composes independently versioned layers.

## Ordinary-user journey A: Figma becomes Agent-readable project context

The evidence-backed normal Figma journey is:

1. Open an existing project or create one in Comate AI IDE.
2. Add a Figma selection. The chat-side handler receives its URL, name, thumbnail, exported files and conversion configuration.
3. Comate switches to Agent, selects the Figma-to-code capability, downloads the selection material and uploads the thumbnail as image context.
4. The engine writes supported selection files and assets into a temporary F2C directory and ensures the chosen conversion rule is available under the workspace's `.comate/f2c/` directory.
5. The query serializer turns the selection into explicit Figma fields for the model, and the chat inserts the bundled `figma2code` system Skill.
6. The Skill tells Agent to inspect the actual project's framework, routing, build and component conventions, optionally preview the generated HTML, copy required assets, and then write implementation code into the project.
7. The user reviews Changes and the running Preview, then continues or restores file state through the ordinary Agent workflow.

The durable transition is step 6. Before Agent changes workspace files, the Figma material is a generated context bundle—not an implementation and not a live binding to the Figma document.

### The normal Figma packet is explicit but lossy

The bundled chat client stores a normal selection as a `FIGMA` context with:

- the Figma URL as identity;
- selection name;
- only exported `html`, `json` and `md` text-file records in the chat payload;
- conversion configuration;
- a separately uploaded thumbnail image;
- an automatic `$[figma2code](SELECT_SKILL:figma2code)` mention.

The engine then materializes a per-selection temporary directory derived from the Figma file key and node id. It writes text forms (`md`, `html`, `json`) and supported assets (`svg`, `png`, `jpg`), and serializes the model-facing context approximately as:

```xml
<figma>
  <name>selected design name</name>
  <url>figma URL</url>
  <htmlGeneratedByFigmaNode>contents of index.html</htmlGeneratedByFigmaNode>
  <assetsPath>temporary assets directory</assetsPath>
  <previewPath>temporary preview.html</previewPath>
  <designTokenPath>temporary designToken.md</designTokenPath>
  <imageUrl>design thumbnail URL</imageUrl>
</figma>
```

This is better grounded than an image alone because layout HTML, local asset paths, a visual reference and optional tokens can travel together. It is lossy because the packet does not preserve a public native Figma graph, revision id, constraint semantics, interaction model or a target application source location.

### The system Skill is the design-to-code contract

The packaged `figma2code/SKILL.md` makes the implementation sequence concrete:

1. Offer the user a preview of the generated HTML; the user may skip it.
2. Inspect the real repository stack, component registration, routes and build system.
3. Analyze the design and any Code Connect evidence.
4. Copy all required image assets in one operation.
5. Generate code in the project.

It also imposes two important constraints: do not invent unavailable resources, and do not install dependencies. Generated output must fit the existing project rather than silently changing its dependency boundary.

The inputs named by the Skill include `htmlGeneratedByFigmaNode`, the design image, selection name, `assetsPath`, `previewPath`, `designTokenPath`, `image2designMode` and `designTokenMode`. The Skill explicitly says `previewPath` is for opening in a browser and should not be read as source. That separates a rendered reference from the material Agent is meant to reason over.

### Multi-selection shares configuration rather than creating a versioned design set

The engine can serialize several Figma contexts, but the inspected query path takes conversion settings such as the default rule, design-token mode and image-to-design mode from the first Figma context. Each normal context is expected to contain an `index.html` record.

Consequences:

- multiple selected nodes can be supplied, but they do not form one documented atomic design snapshot;
- later contexts can be interpreted under the first context's configuration;
- a missing or renamed `index.html` is a structural failure point in the inspected serializer;
- the URL-derived temporary directory is a cache location, not a durable design version.

### Code Connect is semantic reconciliation, not source identity

The bundled Code Connect reference recognizes explicit markers in generated Figma HTML:

```html
<!-- [START: ComponentName] -->
<div connect-component="ComponentName" connect-props="...">
```

It also permits visual inference of reusable controls. Explicit markers take precedence. Agent then reads matching component documentation only from `.comate/components`; if a document is missing, it falls back to the generated Figma HTML.

This creates a useful semantic join:

```text
Figma-export marker/name
  -> .comate/components metadata/documentation
  -> candidate repository component and props
```

It does **not** establish that a Figma node owns a file, source range or AST node. A marker can improve component reuse while still being stale, incomplete or absent.

### Tokens and image-to-design add further non-atomic inputs

Design-token context is optional. The image-to-design reference invokes `@baidu/f2c-skill@latest` through `npx` and first points npm at Baidu's internal HTTP registry, then writes `design.md` in the project root.

That path is not publicly reproducible as a pinned open dependency:

- `@latest` is mutable;
- the configured registry is internal and uses HTTP in the packaged instruction;
- the generated `design.md` advances separately from Figma, assets and project code;
- the main Skill text refers to `image2md.md`, while the shipped reference is named `image2design.md`.

The naming discrepancy is packaging evidence, not proof that the feature fails in every authenticated run. It is nevertheless a concrete contract drift risk.

### Figma Make and legacy F2C are distinct bundled routes

Figma Make context follows another path: Comate downloads and extracts a project archive under a temporary `.comate/f2c-make/<name>` location, then asks an exploration Agent to inspect it as a codebase. That is closer to importing generated source than translating a normal Figma selection.

The distribution also contains `@comate-plugin/f2c` version `0.8.0`, an older plugin route that validates Figma URL/token input, calls a remote processing API, writes `.comate-f2c/config.json` and supports batch adoption of generated files. Co-bundling does not prove that the legacy plugin and current system Skill are both active for the same user action. They should not be merged into one imagined pipeline.

The public AI IDE release history places Lanhu selection in the built-in browser and describes sending it into a D2C task. The current public material does not expose a Lanhu packet comparable to the inspected Figma serializer, so this dossier records the product journey but leaves its exact data model unknown.

## Ordinary-user journey B: a running page can return toward source

The official Preview guide says Comate can recognize and start frontend projects, display the running page in the IDE, select an element, attach it to chat and let Zulu modify the implementation with live feedback. The current compiled client exposes a richer mechanism beneath that journey.

1. Start/open Preview from the file action, Preview entry or Zulu instruction.
2. Activate element selection and click a rendered DOM node.
3. The injected picker classifies the element as React, Vue or plain HTML using runtime heuristics, derives a component name, captures `outerHTML`, rectangle and a DOM path, and searches the element/ancestors for an optional source annotation.
4. A normal chat action packages the selection for Agent. Ctrl/Cmd-click or explicit navigation can instead ask the extension to open the annotated source location.
5. A visual editor can stage style, text, image and semantic-description changes against the live DOM.
6. Depending on the operation, Comate either rewrites supported files directly and asks Agent to validate, or submits the full element edit ledger to Agent for source implementation.
7. The user must inspect the actual diff and reload/rebuild Preview to verify persistence.

### The selected-element packet preserves several independent location signals

| Signal | Construction | What it can establish | Limit |
|---|---|---|---|
| `componentType` | Runtime React/Vue heuristic, otherwise HTML | Framework-shaped context | A heuristic classification, not repository provenance |
| `componentName` | Runtime component/name inference | Search term for Agent | Names can be minified, wrapped, duplicated or absent |
| `domPath` | Up to 20 ancestors using `tag#id` or `tag.class...` | Current runtime route to an element | Invalid after DOM change; classes and ids can be generated |
| `html` / `outerHTML` | Current selected DOM subtree | Rendered structure and content | Runtime expansion can differ from source templates |
| `rect` | Current viewport geometry | Visual target area | Layout state, not source identity |
| `sourcePath` | Closest selected element or ancestor's `data-comate-source-path` | Optional `file:line:column:tag` starting point | Can be missing, inherited, stale or broader than the selected child |

For chat, the picker emits a `select-element` knowledge item carrying the HTML and metadata. A separate preview-query transform tells Agent to use component type/name, DOM path and optional source path to locate the code, remove preview-only data attributes and output the full modified code.

The prompt also tells Agent to focus on code modification without needing to consider runtime-effect verification. That is a concrete gap between implementation and acceptance: official product prose promises a live-preview loop, but the element-repair prompt does not itself require a clean runtime validation.

### Source navigation is real but the coordinate is advisory

The client reads `data-comate-source-path` from the selected element and, if absent there, walks ancestors. The visual editor expects this shape:

```text
<file-path>:<line>:<column>:<element-tag>
```

The extension-side navigation handler supports Windows drive letters, resolves relative paths against the workspace, checks that the file exists, opens it and reveals the line/column. If the target workspace is not open, it can open that workspace in a new window.

This is stronger target-return evidence than a serialized DOM range: a successful packet can directly identify an authored file and coordinate. It is still not deterministic identity:

- the annotation is optional;
- ancestor lookup may return a parent component's location for a child DOM node;
- the installed picker reads the attribute, but no producer for it was found in the inspected product files;
- the shipped product contains no original source maps that explain framework coverage or injection timing;
- no repository revision, file hash or source-text precondition accompanies the coordinate;
- the batch-edit prompt itself says line/column is a highest-priority **search starting point**, not an exact location.

The defensible boundary is therefore **optional source-addressed return**, not “every rendered element maps reliably to source.” The exact build-tool adapters, annotation coverage and invalidation rules remain closed.

### Visual editing has both direct-write and Agent-write persistence paths

The preview injector maintains an in-memory edit ledger. Each staged record can include:

- edit id and description;
- selected and parent source paths;
- file path, line, column and element tag;
- DOM path, rectangle and serialized element;
- original/final style, text and image states;
- undo/redo state for the current preview session.

If no source annotation exists, the record uses `unknown`, line/column zero and a synthetic source identity. The live page can still look edited, but that visual state is not durable source.

The packaged browser host then exposes two persistence strategies.

#### Supported batch style/text edits can write source directly

For style changes with a parseable source path, the host groups edits by file and supports JavaScript/JSX/TypeScript/TSX/MJS and HTML:

- JS-family files are parsed with Babel; the first same-tag JSX opening element whose source range covers the hinted line is selected, its literal `className` is updated, the file is regenerated, optionally formatted and written back.
- HTML style updates use line- and tag-oriented matching to replace or add a class attribute, then write the file.
- Text changes similarly use AST/location heuristics for JS-family files and line/text replacement for HTML.

After writing, Comate sends the applied-change records to Agent with a validation request. The validation prompt explicitly warns that the modification path is only a reference and may not be fully correct because props, component composition and special cases can change the real implementation logic.

This route gives Comate a genuine non-Agent source writer for a narrow class of edits. Its targeting remains heuristic: same tag plus line coverage, literal-class handling and whole-file regeneration can fail or affect the wrong representation when code is dynamic.

#### General element edits are delegated to Agent

The “batch all” route aggregates style, text, image and semantic-description records into a detailed prompt. It tells Agent to treat source location as the strongest starting signal, reconcile DOM/source differences, preserve unrelated props/events/structure, avoid opportunistic refactors and modify complete files.

The inspected handler does not directly write those general changes; it emits a query event for Agent. Images and semantic instructions therefore remain on the Agent-authored path, and unsupported or uncertain targets can be abandoned rather than guessed.

The resulting model is:

```text
preview DOM experiment + edit ledger
  ├─ supported style/text + usable source hint
  │    -> AST/line heuristic rewrite -> workspace file -> Agent validation
  └─ general/compound/semantic edit
       -> Agent location and implementation -> workspace file
```

In both branches, the clean rebuilt runtime—not the overlay or ledger—is the acceptance artifact.

## Agent, Spec and Mission organize execution but do not merge the artifact clocks

Comate exposes several execution surfaces around the same workspace.

### Agent

Agent can inspect and modify multiple files, run terminal operations, consume explicit `@` context and use Skills. Rules and project context constrain execution. These are orchestration inputs; they are not alternate copies of the application.

### Spec

The current Spec documentation describes a single-round feature workflow:

1. Agent drafts **Doc** and **Tasks**.
2. The user confirms them.
3. Agent implements the code.
4. Product View separates **Doc**, **Tasks**, **Changes**, **Preview**, **Verify** and **Summary**.

The documented flow is model-directed and can skip stages. `Verify` is still marked as pending implementation, and the public guide says confirmed Doc/Tasks cannot then be revisited in the same round. Spec is therefore a planning and review envelope, not an immutable transaction joining requirements, design snapshot, code, runtime and delivery.

### Mission

Mission centers longer work on tasks, workspaces, progress, diffs and front-end browser preview. It improves visibility over multi-step execution, but its task graph is not evidence that external Figma state, temporary conversion files or preview annotations were versioned with each task.

### Rules, Skills and Memory

- Rules provide explicit user/project constraints.
- Skills package reusable execution knowledge; `figma2code` is a system Skill in the inspected build.
- Memory is project-only in the current public guide and stored under `.comate`; the user and system can create, update or delete entries.

These improve continuity and repeatability. Memory can outlive a chat, while a Skill can change between product builds. Neither should be treated as the current source tree or a design revision.

## Persistence and recovery: nine clocks, no global rewind

| Clock | Durable unit | Advance / restore | Boundary |
|---|---|---|---|
| Native Figma/Lanhu design | Provider-owned document, nodes and history | Provider-native editing/versioning | Comate consumes a selection; no reverse synchronization is established |
| Normal Figma cache | Temporary F2C directory containing text, preview, assets and tokens | Re-download/recreate by URL-derived selection key | Temporary and overwritten; not joined to a Git commit or Figma revision |
| Figma conversion rule | `.comate/f2c/<rule>.mdr` | Fetched from `/api/figmaRule/...` when missing | Rule can persist while the product/service implementation changes |
| Code Connect metadata | `.comate/components/*` metadata/docs | Repository/user maintenance and upload | Semantic reconciliation aid, not a node-to-source map |
| Plan/spec/task state | Doc, Tasks, Mission progress and Summary | Product workflow | Intent/progress can diverge from files and runtime |
| Project memory | `.comate` memory entries | User/automatic create, update and delete | Project guidance, not application state |
| Workspace implementation | Project files and Git state | Direct visual writer, Agent, editor, terminal and Git | The actual durable implementation authority |
| Conversation/checkpoint | Prompt/tool history and recoverable file state | Continue, undo/restore/checkpoint behavior | Does not rewind external design, temp cache, preview DOM or deployment atomically |
| Preview runtime | Dev server, DOM, overlay and in-memory edit ledger | HMR, reload, restart, undo/redo | Source hints and DOM paths can stale; ledger disappears independently of files |

The practical recovery unit is the working tree or an ordinary Git commit. A conversation rollback can help recover Agent changes, but no inspected contract provides a transaction across Figma selection, conversion rule, `.comate` metadata, direct AST rewrite, Agent output, runtime DOM and remote delivery.

## Failure atlas: where the apparent loop can break

| Breakpoint | Observable symptom | Mechanism | Required verification |
|---|---|---|---|
| Version clocks diverge | Feed, docs and extension report different latest versions | Desktop, extension and documentation release independently | Pin the exact installer/build and state which clock supports each claim |
| Figma selection is accepted but no implementation appears | Thumbnail/context exists; working tree is unchanged | Selection materialization precedes Agent file writing | Inspect Changes and Git diff, not the presence of Figma context |
| Several Figma contexts use the wrong mode/rule | Later selections are interpreted unexpectedly | Serializer takes configuration from the first Figma context | Test mixed-rule/mixed-mode selections separately |
| Figma text bundle lacks `index.html` | Serialization fails or loses HTML grounding | Inspected normal path dereferences the `index.html` record | Inspect downloaded file names before generation |
| Design looks right but components are duplicated | New markup bypasses existing components | Code Connect markers/docs absent or stale; Skill falls back to HTML | Audit `.comate/components` and generated imports/props |
| Image-to-design cannot reproduce | `npx`/registry step fails or output changes | Mutable `@latest` plus internal registry | Pin/package the dependency in an approved environment or treat output as non-reproducible |
| Selected page element has no source coordinate | Navigation unavailable; Agent searches semantically | No `data-comate-source-path` on element/ancestors | Inspect packet, then manually confirm the target file |
| Navigation opens a parent or stale line | Cursor lands near but not on intended implementation | Ancestor inheritance, HMR or concurrent edits | Re-select after rebuild and verify tag/component/diff |
| Direct style edit rewrites the wrong JSX | Correct tag on hinted line is not the intended semantic node | First matching tag/line heuristic and literal-class handling | Review whole-file diff and shared-component scope |
| Live page looks correct but reload loses it | Overlay/DOM changed; source did not | Edit ledger precedes durable write, or Agent/direct rewrite failed | Hard reload from clean files and retest |
| Direct edit writes source but behavior regresses | Agent validation or runtime test is incomplete | Source rewrite and runtime acceptance are separate | Run build/tests and exercise real interaction states |
| General element edit changes too much | Shared component/props are altered outside intent | Agent reconciles a runtime record against source | Require tight diff review and multi-instance checks |
| Spec appears complete without verification | Summary/Changes exist; runtime still fails | `Verify` is documented as pending and flow can skip stages | Perform explicit browser and artifact acceptance |
| Checkpoint restore leaves mismatched context | Files roll back but Figma cache/DOM/memory does not | Independent persistence clocks | Reopen/re-export/reselect and audit `.comate` state |

## Evolution: separate additions explain today's composite workflow

| Date / line | Public or bundled change | Architectural significance |
|---|---|---|
| 2025-03-06 · extension 3.4 | Zulu public beta, cross-file edits, streaming diff, images and page/game preview | General multi-file Agent and preview plane precede current Figma Skill |
| 2025-05-19 · extension 3.8 | Restore code to a conversation-history version | File recovery becomes a distinct clock |
| 2025-06-03 · extension 3.9 | Figma-to-frontend through a slash command | Early design entry is command-oriented |
| 2025-09-15 · AI IDE 0.3.0 | Element quick change and Figma selection inside Preview | Visual targeting enters the IDE surface |
| 2025-12-22 · AI IDE 0.10.0 | Checkpoint rollback to prompts/tool calls | Recovery granularity grows independently of design state |
| 2026-02-11 · AI IDE 0.13.0 | Visual element editing, real-time preview, multi-level undo and unified apply/restore | Runtime edit ledger and source application become explicit product concepts |
| 2026-03-23 · extension 4.2 / AI IDE 1.3.0 | System Figma2Code, Lanhu browser selection and iOS rules | Design ingestion moves from slash command toward Skill-mediated conversion |
| 2026-03-30–04-13 · extension 4.3 / AI IDE 1.4.0 | Multiple Figma uploads, Android defaults, Mission and multi-workspace | Multi-context and task/workspace orchestration expand together but remain separate |
| 2026-06-29 · AI IDE 2.4.0 | Goal, Memory GA, Changes/inline review and inline external/Figma context | Persistent guidance and visual context become first-class review inputs |
| 2026-07-22 · AI IDE 3.2.0 | Extensions, plugins, Skills and Mission project management | Extensibility becomes a public AI IDE layer |
| 2026-07-27 · extension 4.11.0 | Long-chat lazy loading, Skill deduplication and terminal approvals | Current extension line focuses on orchestration robustness |
| 2026-08-05 · desktop 3.4.1 | Current official Windows feed artifact | Newer downloadable shell than the current public AI IDE changelog ceiling |

The history supports a composite interpretation: preview, rollback, Figma conversion, Mission, Memory and extension Skills arrived as different capabilities. Their current co-location does not prove they share one canonical artifact or revision graph.

## Closed-source boundary: a compiled client is inspectable, not open source

### Current official Windows artifact

On 2026-08-11 the official [AI IDE update feed](https://comate.baidu.com/api/aiIde/updates/stable/win32/x64/user/latest.json) returned:

| Property | Pinned value |
|---|---|
| Product version | `3.4.1` |
| Build identifier | `43244cc09579652e7ae4164e605a38caae7f17e7-264590618` |
| Installer | `Comate-win32-x64-user-setup.exe` |
| Installer size | `177,509,272` bytes |
| Installer SHA-256 | `fd3fb5a92e0cc5dfd8212b9a442d6083f0210969666a5b4d453ce171098ae501` |
| Feed timestamp | 2026-08-05 22:47:41 +08:00 |

The installer was downloaded from the official CDN, hash-verified and extracted read-only. It was not installed, launched or authenticated. The complete extraction contained 3,738 files totaling 693,511,003 bytes; `resources/app` contained 3,661 files totaling 351,180,327 bytes.

The bundled `baiducomate.comate` extension identifies itself as version `4.11.1`, publisher `BaiduComate`, license `UNLICENSED`, with main entry `dist/extension.js`. Its repository value is the placeholder `repository`. The package contains compiled JavaScript, product assets and documentation but no original product TypeScript/TSX or source maps.

| Compiled artifact | Size | SHA-256 | Evidence exposed |
|---|---:|---|---|
| `dist/extension.js` | 12,332,151 bytes | `78C13A7638D3D9A33D1EB20C4BCB377A4367978D443B867C41CF9A2A041BE8F8` | IDE commands, preview navigation and host integration |
| `dist/chat.js` | 6,559,641 bytes | `D139852F5EA95514745D3E629EB81ACBE6850D526165CC1C7D4A9A2F36D57702` | Figma context construction and chat handoff |
| `dist/panel.js` | 740,617 bytes | `3A7CB7986B5123B037C4DB2C499E8D6730B88C5F00EF20AC95C7775C84B26D8D` | Panel/client surface |
| `dist/comate-engine/server.js` | 10,241,634 bytes | `7D1EABD24E63854AEE3CAFAC6074D6ED22C7854034C3E5E7D9BAA6F15F980E76` | Figma storage/serialization, Skill and preview-context transforms |
| `@comate/preview-browser/static/comate-preview-injector.js` | 613,349 bytes | Shipped inside the pinned installer | Element picker, source-hint reader and visual edit ledger |

The `@comate/preview-browser` package is marked private and points to an internal Baidu `icode.baidu.com` SSH repository. Its bundle includes Babel parsing/traversal/generation, Prettier and Playwright-based browser control. That supports inspection of the shipped rewrite behavior, not public audit of original modules, tests or build-time instrumentation.

The base application package points to Microsoft VS Code and its MIT license. That upstream license does not make the `UNLICENSED` Comate extension, Baidu services or internal preview repository open source.

### Public GitHub stops at adjacent plugins and skills

The official [BaiduComate GitHub organization](https://github.com/BaiduComate) exposed four public repositories in the 2026-08-11 snapshot:

| Repository | Pinned tree | What it contains | Boundary |
|---|---|---|---|
| `fun-comate` | [`75a75035...`](https://github.com/BaiduComate/fun-comate/tree/75a75035a5242c1f9afd7daf3e61e63ed746fd21) | Apache-2.0 plugin/Skill package | Open extension content, not AI IDE source |
| `mission-flow` | [`8e057fe6...`](https://github.com/BaiduComate/mission-flow/tree/8e057fe68cec9a9b00dbe9cbf17ecbabc861480b) | Plugin commands, hooks and Skills | Adjacent Mission workflow; no repository license metadata in the pinned snapshot |
| `senior-dev-engineer` | [`503d46b1...`](https://github.com/BaiduComate/senior-dev-engineer/tree/503d46b1b689206ed3a3649d9c2139376ce17ede) | Small plugin/Skill package | Role instructions, not Agent engine |
| `software-dev-team` | [`07bfa814...`](https://github.com/BaiduComate/software-dev-team/tree/07bfa8142c01de9b6c82e3552b63aa7a8dc4a074) | Agents, plugin manifest and Skills | Team orchestration content, not product runtime |

Searches of the official Baidu and Baidu BCE GitHub organizations did not identify a public Comate AI IDE implementation repository in this snapshot. The pinned commits provide commit-level evidence for the open plugin ecosystem only. Commit-level provenance for Figma conversion, source annotation, preview rewrite, Agent orchestration and remote services is unavailable publicly and should remain explicitly unknown.

## Facts, inferences and material unknowns

### Directly established

- Official docs expose AI IDE Preview, element selection, Spec, Mission, Agent context, Rules, Skills, Memory and release history.
- The current official feed provides a hash-pinned desktop `3.4.1` artifact whose bundled Comate extension is separately versioned `4.11.1`.
- The normal Figma path materializes HTML/text/assets/thumbnail context, attaches the system `figma2code` Skill and directs Agent to write into the existing project.
- Code Connect uses markers and `.comate/components` evidence for semantic component reconciliation.
- The Preview picker emits runtime identity, DOM path, HTML and optional `data-comate-source-path`; source navigation can open a real file at line/column.
- Supported style/text batch handlers can directly rewrite JS-family or HTML files and then ask Agent to validate; the general element-edit route delegates source mutation to Agent.
- Workspace files are the shared implementation authority. Figma/Lanhu documents, conversion caches, memory, task state and preview DOM remain separate.
- The current public GitHub organization contains adjacent plugins/Skills, not the inspected product implementation.

### Evidence-backed inferences

- Comate implements **dual visual convergence with optional source-addressed return**: design context enters semantically, while a running element can carry a real source coordinate back toward the workspace.
- Direct visual rewriting and Agent implementation form a hybrid mutation architecture rather than one universal code-generation path.
- Because the source annotation producer and revision precondition are not exposed, coordinates should be treated as advisory search evidence even when navigation succeeds.
- Code Connect can reduce duplicate component generation without making the Figma node and repository component one versioned object.
- Spec/Mission improve intent and progress control but do not create an atomic artifact across design, source, runtime and delivery.

### Material unknowns

- Server-side model orchestration, prompt selection, telemetry, authenticated feature flags and Figma/Lanhu conversion services.
- The producer for `data-comate-source-path`, supported framework/build adapters, injection timing, coverage and stale-target rejection.
- Original unminified source, source maps, product tests and public commit provenance for the inspected bundles.
- A public compatibility schema or revision id for normal Figma context, design tokens, conversion rules or multi-selection.
- A native Lanhu packet and any reverse update from workspace code to Figma or Lanhu.
- Atomic rollback across direct AST rewrites, Agent changes, `.comate` state, temporary F2C data, preview DOM and deployment.
- A stable public deployment artifact/version/rollback contract comparable to the inspected local workspace plane.
- Which legacy and current co-bundled routes are enabled for every authenticated account in desktop `3.4.1`.

## Acceptance checklist for the real visual journey

1. Pin the desktop feed build, bundled extension version and current public-doc ceiling separately.
2. Record the exact Figma/Lanhu selection and upstream revision before importing it.
3. Inspect the generated Figma HTML, assets, token file, rule and thumbnail rather than trusting the selection badge.
4. Confirm whether multiple selections unintentionally share the first context's conversion configuration.
5. Audit Code Connect markers and `.comate/components` documentation against the actual repository components.
6. Verify that Agent or the direct writer changed the intended workspace files; review the real Git diff.
7. For Preview edits, record whether `sourcePath` exists and whether it came from the selected node or an ancestor.
8. Re-select after HMR or concurrent changes; do not reuse a stale DOM path/line coordinate.
9. For direct style/text changes, inspect whole-file formatting, class behavior, shared components and every repeated instance.
10. Hard-reload/restart the frontend so no in-memory overlay or DOM mutation can mask a missing source change.
11. Exercise interaction, responsive, data, theme and error states absent from the static design or selected DOM node.
12. Test file recovery, then separately inspect `.comate` memory/rules, conversion cache, chat and external design state.
13. Treat Spec Summary or Agent completion as execution evidence—not browser/artifact acceptance.
14. Validate the final delivered artifact/URL independently; local Preview success does not establish deployment state.

## Primary sources and evidence pins

### Official product documentation

- [Comate AI IDE product manual](https://cloud.baidu.com/doc/COMATE/s/xlnvqe047)
- [Preview and element debugging](https://cloud.baidu.com/doc/COMATE/s/8mc4sla81)
- [AI IDE quickstart](https://cloud.baidu.com/doc/COMATE/s/imc32fjdz)
- [Spec](https://cloud.baidu.com/doc/COMATE/s/Qmkoux53d)
- [Mission](https://cloud.baidu.com/doc/COMATE/s/Smowccwio)
- [Agent overview](https://cloud.baidu.com/doc/COMATE/s/9mm5qvpb4)
- [`@` context](https://cloud.baidu.com/doc/COMATE/s/tmmbnpezt)
- [Memory](https://cloud.baidu.com/doc/COMATE/s/smiss5jka)
- [Rules](https://cloud.baidu.com/doc/COMATE/s/Zm9l4agw3)
- [Skills](https://cloud.baidu.com/doc/COMATE/s/Nmma28iqe)
- [AI IDE update history](https://cloud.baidu.com/doc/COMATE/s/2mjzerjsp)
- [Comate 4.0 product document](https://cloud.baidu.com/doc/COMATE/s/xmm4hx69k)
- [Official AI IDE download page](https://comate.baidu.com/zh/download/ai-ide)

### Distribution and public repository pins

- [Official current Windows update feed](https://comate.baidu.com/api/aiIde/updates/stable/win32/x64/user/latest.json) — returned desktop `3.4.1` on 2026-08-11
- [BaiduComate GitHub organization](https://github.com/BaiduComate)
- [`fun-comate` pinned tree](https://github.com/BaiduComate/fun-comate/tree/75a75035a5242c1f9afd7daf3e61e63ed746fd21)
- [`mission-flow` pinned tree](https://github.com/BaiduComate/mission-flow/tree/8e057fe68cec9a9b00dbe9cbf17ecbabc861480b)
- [`senior-dev-engineer` pinned tree](https://github.com/BaiduComate/senior-dev-engineer/tree/503d46b1b689206ed3a3649d9c2139376ce17ede)
- [`software-dev-team` pinned tree](https://github.com/BaiduComate/software-dev-team/tree/07bfa8142c01de9b6c82e3552b63aa7a8dc4a074)

No authenticated live design-to-code or preview-edit task was executed for this snapshot. Runtime behavior beyond public documentation and the hash-pinned shipped-client boundary remains unknown rather than inferred.
