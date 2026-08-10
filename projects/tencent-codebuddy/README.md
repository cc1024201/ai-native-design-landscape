# Tencent CodeBuddy IDE

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Tencent Cloud / CodeBuddy |
| Category | Agentic coding IDE with design-to-code and runtime visual-edit handoffs |
| Status | Active |
| Product boundary in this dossier | CodeBuddy IDE; CodeBuddy Code CLI is treated only as an adjacent integration surface |
| Source availability | IDE implementation closed; official compiled distribution inspectable; official CNB repository contains documentation and samples rather than the IDE/CLI product source |
| Decisive artifact question | When a user selects a design or edits a running page, which state is only visual context and which state becomes the durable implementation? |
| Evidence used | Current official docs and release notes, pinned public documentation history, and a read-only extraction of the current official Windows installer without installing or signing in |

## Product boundary: the “design” workflow is three different handoffs

CodeBuddy marketing presents one path from idea and design to code and deployment. The current product exposes at least three technically different visual inputs inside that path:

| Handoff | Upstream authority | What crosses into the IDE | Immediate destination | Durable implementation authority |
|---|---|---|---|---|
| Figma selection | The external Figma file | Generated HTML, exported resources, an optional screenshot and selection metadata | Figma context in the Agent conversation | Files in the opened project after Agent implements the request |
| Preview DOM selection/edit | The current browser DOM | Selected `outerHTML`, a synthetic HTML range, optional DOM-editor style deltas and a prompt | `webSelection` context for a code action | Files in the opened project after Agent materializes the change |
| Miora selection | The page behind Tencent's configured `https://miora.design/` bridge | Downloaded asset files exposed by `window.mioraIDEBridge` | Ordinary file attachments in chat | The downloaded files and whatever project files Agent later creates or changes |

These paths share Agent and the project workspace, but they do not share one design-document model:

- Figma remains the native design authority; CodeBuddy creates a local context snapshot from it.
- Preview is a rendering of current project code; direct DOM-style manipulation is initially ephemeral.
- Miora exports files, not a publicly documented editable graph or source binding.
- Agent writes the application. The visual inputs guide that write; they are not themselves proof that the application changed.

The Chinese [product introduction](https://www.codebuddy.cn/docs/ide/Introduction) describes IDE, plugin and CLI forms, while the current English [introduction](https://www.codebuddy.ai/docs/ide/Introduction) foregrounds IDE and CLI. That regional/documentation divergence should not be used to infer that every form exposes the same Figma, Preview, checkpoint or deployment contract. This dossier therefore keeps the IDE journey separate from the adjacent CLI protocol.

## Ordinary-user journey: visual evidence converges on project files

The evidence-backed IDE journey is:

1. Open an existing project or working folder and start a Craft/Agent task.
2. Give Agent ordinary project context through open files, `@` mentions, Git, terminal output, rules and documentation.
3. Optionally add a visual input:
   - authenticate to Figma, select design content and add it to the conversation;
   - open the built-in Preview, select a rendered component and describe a change;
   - adjust supported CSS controls in the DOM Editor before applying the requested change;
   - or use the bundled Miora bridge to export selected assets into chat.
4. Agent edits local project files. The task result exposes **Artifacts**, **All Files**, **Changes** and **Preview** as different views of the run.
5. Inspect the diff and the live Preview. Preview errors can be sent back to Agent as context.
6. Continue refining, or use the automatic checkpoint to revert the file-changing conversation.
7. Deliver through a project-specific route such as EdgeOne Pages, CloudBase, Cloud Studio or Lighthouse.

The critical transition is not “selection succeeded.” It is:

```text
external design or running DOM
  -> bounded conversation context
  -> Agent search and reasoning
  -> project-file mutation
  -> refreshed runtime and diff
  -> human verification
```

Only the project-file mutation and its resulting runtime close the implementation loop. A Figma export, green Agent message, selected DOM node or successful Preview style experiment is intermediate evidence.

## Figma handoff: a design selection becomes a local context bundle

The official [Figma guide](https://www.codebuddy.ai/docs/ide/User-guide/Figma) documents the product flow: open Figma from Craft Agent, authorize access, choose a file, select components or areas, add the selection to the conversation, prompt the Agent and inspect the generated code in Preview. It requires access to the relevant Figma file/team and does not promise a live bidirectional binding.

The current Windows distribution exposes how that handoff is materialized.

### Built-in Figma runs in a persistent isolated webview

CodeBuddy opens `https://www.figma.com` in an Electron `<webview>` using the persistent `persist:genie-webview` partition. The webview enables context isolation, disables Node integration and injects a CodeBuddy preload bridge.

The preload bridge:

- observes `figma.currentPage.selection` and polls selected node ids to detect a changed selection;
- converts the current selection with `@tencent/design-to-code` when the host asks for HTML;
- exports a screenshot from the first selected node;
- exposes those operations through `codeBuddy.figma` to the IDE host.

Selection polling controls whether the Add action is enabled. It does not continuously synchronize the design into application source.

### Export creates HTML, an asset cache and an optional screenshot

In the inspected build, the active export path performs these steps:

1. Read lightweight traits for the current selection: node id, type, name, visibility and child structure.
2. Fetch richer Figma node data, styled-text segments and variables as needed by the converter.
3. Generate HTML with embedded vector handling and externalized image/vector resources.
4. Write the generated HTML to `.codebuddy/figma/<first-selected-node-id>/figma.html`.
5. Store exported resources under `assets/CodeBuddyAssets/<first-selected-node-id>/`, reusing content-hashed files where possible.
6. Optionally write `.codebuddy/figma/<first-selected-node-id>/screenShot.png`.
7. Send Agent a `figmaSelection` context containing the first selection's name, a text resource describing the canvas/resource paths and the screenshot path.

The converter receives the selection array, but naming and storage are keyed by its first node. That makes “several selected areas” a compound export whose durable folder identity is still the first selected object, not a versioned multi-root design document.

The current command handler reduces the handoff to:

```text
figmaInfo = {
  name,
  resource: "canvas file path: ...\nresource path: ...",
  imagePath
}
```

The chat layer turns that object into Figma context. One co-bundled input architecture also prefills `Implement selected figma content`; the newer input host converts the same context into content blocks. Co-bundling is not evidence that both UI paths are active simultaneously, but both preserve the same architectural boundary: Agent receives exported material, not a live Figma document handle.

### Local node ids organize the snapshot; they do not bind design to source

Figma node ids remain useful inside the export process and directory names. They are not joined to:

- an application file, line or AST node;
- a generated component identity;
- a Git commit or checkpoint;
- the Preview DOM element produced by the implementation;
- a reverse update from application code into the Figma file.

The strongest established model is therefore:

```text
Figma node(s)
  -> exported HTML/resources/screenshot keyed by first node id
  -> conversation context
  -> Agent-authored project code
```

It is a grounded one-way materialization, not roundtrip design synchronization.

### Re-export has cache semantics that can diverge

The inspected build overwrites `figma.html`, restores a content-hash cache for exported resources and only writes `screenShot.png` when that path does not already exist. Re-exporting the same node id can therefore update the generated HTML while retaining the prior screenshot. Public documentation does not define invalidation, version retention or cleanup for these generated context files.

This is a concrete acceptance risk: Agent can receive current structural material and an older visual reference under the same selection context. The user must compare the eventual runtime against the current Figma source rather than treating the cached screenshot as authoritative.

## Preview handoff: a speculative DOM edit becomes an Agent request

The official [Preview guide](https://www.codebuddy.ai/docs/ide/User-guide/preview) describes an embedded browser kernel that renders code changes, supports component selection, natural-language optimization and a DOM Editor, and can send runtime errors to AI. The compiled distribution establishes the boundary between direct preview manipulation and source mutation.

### Selection starts from runtime HTML, not authored source

When the user selects an element, the injected preview script can collect:

| Runtime field | Meaning | Source-mapping limit |
|---|---|---|
| `html` | Selected element `outerHTML` | Generated runtime markup can differ from templates/components |
| `tagName`, `classes`, `id`, `text`, attributes | Visible structural context | Reuse, conditional rendering and generated classes remain ambiguous |
| `position` | Current x/y/width/height | Viewport/layout state, not source identity |
| `styles` | Computed style values | Does not identify the stylesheet, token or rule that won the cascade |
| `fullPageHtml` | Serialized current page | A runtime snapshot, not the application module graph |
| `lineInfo` | Start/end positions calculated after inserting markers into serialized page HTML | Synthetic HTML coordinates, not authored file lines |

The host adds `filePath` only when Preview itself is displaying a `file:` URL. A normal `http://localhost` or `https://localhost` development server therefore contributes no authored file path.

The extension narrows the ordinary selection before inserting it into Agent context. Its `webSelection` reference contains `html`, `lineInfo`, optional `domEditorInfo` and optional `filePath`. It does not contain a source map, component module, framework fiber, AST node or repository revision.

The synthetic `lineInfo` deserves particular care. The preload serializes the current full page, temporarily inserts comment markers around the selected element and calculates positions in that serialization. The number can relocate the element inside the supplied HTML snapshot. It cannot be interpreted as line 120 of a React, Vue, Svelte or template source file.

### DOM Editor has a two-stage mutation model

The current DOM Editor first applies a CSS property directly to the selected browser element with `element.style.setProperty(...)`. This produces an immediate visual experiment in the running webview.

On **Apply**, the editor:

1. collects the dirty style controls into a structured DOM-editor payload and human-readable bullets;
2. updates the existing `webSelection` context with that payload;
3. invokes a CodeBuddy action with the prompt `use css modify style to the element` and the `webSelection` mention type;
4. leaves Agent to locate and edit the underlying project files.

Natural-language Preview editing enters the same Agent-oriented plane through a preview edit prompt. The visible inline style is not automatically the durable application change.

This creates a useful but failure-prone sequence:

```text
runtime element
  -> temporary inline-style experiment
  -> HTML snapshot + synthetic range + style intent
  -> Agent implementation
  -> project files
  -> rebuilt/hot-reloaded runtime
```

If the Agent edits the wrong shared component, chooses a different CSS mechanism, fails before writing, or the page hot reloads between selection and execution, the temporary Preview can look correct while the durable implementation is wrong or absent.

### Preview errors are context, not rollback

The built-in webview captures page, build-tool and network errors. **Send Errors** packages the current URL and collected messages for Agent. This improves diagnosis but does not restore the runtime, revert partial files or prove that a later fix eliminated the original failure. Error reporting and checkpoint restoration remain separate mechanisms.

## Miora handoff: an underdocumented bridge exports ordinary files

The current Chinese product configuration enables `SelectMiora` and points `mioraBridgeUrl` to `https://miora.design/`. Public CodeBuddy user documentation examined for this snapshot does not define Miora's design-document model, supported node types, persistence or compatibility contract.

The distribution nevertheless exposes the IDE-side bridge:

- the page must expose `window.mioraIDEBridge` and report readiness;
- CodeBuddy reads `getSelection()` to enable export;
- `exportSelection()` returns an array, or an object with `selection`/`assets`;
- each accepted item contains a `downloadUrl` plus optional `nodeId`, `name` and `type`;
- CodeBuddy downloads each item to `.codebuddy/miora/<node-id>/<derived-file-name>`;
- the Miora export command converts those paths into ordinary file information and adds them to chat.

This is not the Figma HTML pipeline and not the Preview DOM pipeline. At the IDE boundary, Miora is a file-export bridge. The following remain material unknowns:

- whether the downloaded file is a raster, vector, component package or another format for every supported selection;
- whether a Miora node has durable revisions or collaboration semantics;
- whether the IDE can write changes back to Miora;
- whether exported node ids survive copy, regeneration or document changes;
- how a Miora asset is associated with the application code that later consumes it.

The existence of a private page bridge is evidence of an integration point, not evidence of a shared editable artifact.

## Agent and Plan Mode: execution is file-centered

The [Agent quickstart](https://www.codebuddy.ai/docs/ide/User-guide/Agent-Mode/Quickstart) separates Work Mode and Programming Mode and lets several tasks run in parallel. It also defines the four result views:

- **Artifacts**: generated deliverables or files surfaced by the task;
- **All Files**: current workspace contents;
- **Changes**: modifications associated with the task;
- **Preview**: the current page, prototype or running application.

Those panes are observations over a task; they are not four copies of one versioned object. A file in Artifacts can also appear in All Files, while Preview reflects whatever runtime is currently serving the workspace.

[Plan Mode](https://www.codebuddy.ai/docs/ide/Features/Plan-Mode) adds a deliberate contract before execution: clarification, solution, user review/edit, implementation and completion. A completed plan is saved as Markdown under `.codebuddy/plans/`. It can preserve requirements, architecture, visual direction and tasks, but it does not pin the Figma export, DOM snapshot, dependency graph, checkpoint or deployment revision that implements the plan.

The normal context system remains broader than design: files, folders, docs, Git state, terminal output and rules can all be mentioned. Global [Memory](https://www.codebuddy.ai/docs/ide/User-guide/Memory) loads across projects and conversations, while manual rules are explicit project/user instructions. Neither should be treated as application artifact state.

## Persistence and recovery have several independent clocks

| Clock | Durable unit | Advance/restore mechanism | Boundary |
|---|---|---|---|
| External Figma design | Figma document and native node ids | Figma editing/versioning | CodeBuddy export is a snapshot; no reverse sync is documented |
| Figma context cache | `.codebuddy/figma/...`, asset cache and screenshot | Re-export selection; file overwrite/cache reuse | No documented snapshot version or atomic invalidation across HTML, assets and screenshot |
| Miora context files | `.codebuddy/miora/...` downloads | Export selected bridge assets again | Upstream revision and writeback semantics are undisclosed |
| Project implementation | Opened workspace files and Git state | Agent/editor/terminal changes, ordinary Git operations | Visual context does not itself establish a file mutation |
| Plan | `.codebuddy/plans/*.md` | Plan review and save | A plan is intent, not executable state or a locked implementation revision |
| Conversation/task | Prompt, context references, results and task state | Continue or reopen from History | Resuming context does not independently restore project files |
| Global memory | Cross-project learned/user facts | Automatic memory management and user controls | Separate from repository, task and checkpoint history |
| IDE checkpoint | File state before a file-changing Craft conversation | Revert; Resume from restored state | Does not version the external design, preview browser state or deployment |
| Preview runtime | Current served application and DOM | Dev server, reload, HMR and Agent file changes | DOM ids/ranges and temporary inline styles can disappear on reload |
| Deployment | EdgeOne/CloudBase/Cloud Studio/Lighthouse result | Provider-specific deploy/redeploy | A successful Preview or checkpoint does not prove production deployment state |

The official [Checkpoint guide](https://www.codebuddy.ai/docs/ide/User-guide/Checkpoint) says every Craft conversation that changes files automatically creates a checkpoint. **Revert** restores the state before it; **Resume** cancels the associated task and continues from the restored state. That is a file-recovery contract, not a transaction spanning all rows above.

The [History guide](https://www.codebuddy.ai/docs/ide/User-guide/History) separately supports searching, continuing, exporting, editing and deleting conversations. Conversation continuity and file recovery are therefore related in the UI but architecturally distinct.

## Delivery is provider-specific, not one universal publish artifact

The official [deployment guide](https://www.codebuddy.ai/docs/ide/User-guide/deploy) exposes several exits:

| Route | Intended result | Important boundary |
|---|---|---|
| EdgeOne Pages | Production static site or serverless deployment | Provider build/runtime and account configuration become authoritative |
| CloudBase | Frontend/backend cloud environment with isolation | Cloud resources and environment state extend beyond local files |
| Cloud Studio | Temporary shareable development environment/link | Temporary preview is not durable production publication |
| Lighthouse | User-controlled server deployment | Operations, credentials and server state remain the user's responsibility |

For Cloud Studio, Agent scans the codebase and infers project type before deployment. That inference is a deployment decision, not a design artifact type. Each route needs its own final URL, build logs, runtime checks and rollback evidence.

## Failure boundaries visible in mechanism and release history

### Mechanism-derived failures

| Break | Why it occurs | Required verification |
|---|---|---|
| Figma changed after export | Exported HTML/resources/screenshot are local materializations | Re-export and compare against the current Figma file |
| Re-exported HTML with retained screenshot | Screenshot write is absence-only for the same node path in the inspected build | Inspect timestamps/content or clear/regenerate the bounded context before trusting it |
| Multi-selection ambiguity | Conversion receives a selection array while folder/name identity comes from the first node | Verify every intended selected region appears in generated HTML and final runtime |
| Runtime target stales | Reload/HMR can replace the selected DOM and synthetic HTML range | Reselect against the current runtime before applying a delayed change |
| Correct Preview, wrong source | Direct DOM editing mutates inline runtime style before Agent materialization | Inspect file diff, reload without the temporary patch and retest |
| One instance implies shared implementation | Runtime HTML does not reveal component reuse or styling scope | Check all usages and responsive/theme states after Agent edits |
| Revert restores files but not context sources | Checkpoints do not rewind Figma, Miora, browser state, memory or deployment | Audit each clock separately after rollback |
| Parallel tasks observe different states | Agent tasks, project files and Preview can advance independently | Review task-scoped changes and the final combined runtime/Git state |

### The release notes show these are operational, not hypothetical, boundaries

The official [release notes](https://www.codebuddy.ai/docs/ide/release-notes/release-notes) record fixes across the same seams, including:

- Windows tasks reporting no changes, repeated file editing after a missing success signal and empty search results in the 1.2.0 line;
- conversation-history loss in 1.2.2;
- Figma Add/selection anomalies in later 4.10.x notes;
- checkpoint markers, changed-file lists, stale version caches, rollback behavior and missing diffs across multiple releases;
- preview/browser, SSH, parallel-session ordering and cross-task Artifact display/share defects.

These entries are historical fixes, not proof that every defect persists in 4.11.0. They establish that file state, task state, preview state and visual context have failed independently in real product versions. Acceptance must examine the actual current journey rather than infer correctness from a completed task card.

## Product evolution: the visual loop was assembled in stages

| Date / version | Public evidence | Architectural significance |
|---|---|---|
| 2025-09-19 · 0.2.4 | Figma onboarding internationalization and experience work | Figma had become an explicit IDE input surface |
| 2025-11-04 · 1.2.0 | Built-in browser DOM editing and viewport-size switching | Preview gained a speculative visual-edit stage whose changes Agent then implements |
| 2025-11-10 · 1.2.2 | Skills/skill creator and conversation-history recovery work | Reusable execution instructions and task history became separate persistence concerns |
| 2026-03-09 · 4.5.5 | Agents mode, Artifacts and parallel Agents | The result model expanded beyond one linear coding chat |
| 2026-07-22 · 4.10.4 | Latest version currently represented in the public IDE release-note page | Public documentation trails the current downloadable build |
| 2026-08-06/07 · 4.11.0.35330129 | Current official Windows update feed and installer | Distribution inspection for this dossier is newer than the public release-note ceiling |

The sequence matters. Figma input, runtime DOM editing, task Artifacts and parallel Agents were added at different times. Their co-location in today's IDE does not prove they share one internal revision graph.

## Closed-source boundary: inspectable distribution is not an open implementation repository

### Current official Windows artifact

On 2026-08-11 the official [Windows update endpoint](https://www.codebuddy.cn/v2/update?platform=ide-win32-x64-user) returned:

| Property | Pinned value |
|---|---|
| Product version | `4.11.0.35330129` |
| Build id / commit-like identifier | `a64e0542131159dfcaadd99c096dc9165c6ad3fb` |
| Installer | `CodeBuddy-win32-x64-user-4.11.0.35330129-a64e0542-cn.exe` |
| Installer SHA-256 | `07b6c8074acca2a434fa82a327f8a73c435288b2c6f3ef4aabc36aee88720e41` |
| Installer size | `163,034,344` bytes |

The installer was downloaded from the official URL, hash-verified and extracted read-only. It was not installed, launched or authenticated. The extracted application contained 5,216 files totaling 639,913,504 bytes.

The package identifies a VS Code `1.106.1` base and Electron `37.7.0`; its development dependency metadata includes `@tencent/design-to-code ^0.5.0` and `@tencent/h2d-html-parser ^2.0.10`. The inherited repository field points to Microsoft VS Code, not to CodeBuddy's proprietary changes.

Key compiled artifacts in this pinned build are:

| Artifact | Size / SHA-256 | What it established |
|---|---|---|
| `out/codebuddy/main.js` | 62,905,973 bytes · `7435337893A799C77C8A761461E0BC079CA5C5CC81843EBD2C4A0261C400F00C` | CodeBuddy desktop/core additions are shipped as a large compiled bundle |
| `out/vs/workbench/workbench.desktop.main.js` | 14,752,755 bytes · `2D2729AE289D18E5DEA301B009385DECDA5F8032223F2C88D30352976A1A2E2A` | Figma/Miora export and Preview-webview orchestration |
| `extensions/genie/out/extension/index.js` | 20.4 MiB · `0DEEC6CC2C45A3CB946B2D3F00158C22E34BB091EDD2CA194F6CDCB0A7D0FE5A` | Agent context, command handlers and file/checkpoint integration |
| Preview/Figma preload bundle | `5C73073EB0CBB56D4707C670A55A8A3FFFEFFAADCB0D36841A1715B0CAE290FD` | Runtime DOM packet, direct style patching and Figma bridge behavior |

The bundles are minified distributions. They declare source-map locations, but the examined official CDN map requests returned 404. This dossier can establish call shapes and data boundaries visible in the shipped code; it cannot claim the original TypeScript module graph, internal tests, server implementation or build-time feature-gate configuration.

### Official public repository is documentation and samples

Tencent's public [CodeBuddy Code CNB repository](https://cnb.cool/codebuddy/codebuddy-code) was pinned at [`d7567c62efbdd532650812fae190e62616050392`](https://cnb.cool/codebuddy/codebuddy-code/-/commit/d7567c62efbdd532650812fae190e62616050392) (2026-08-10 22:14 +08:00). The inspected tree contained 501 files, 403 of them Markdown; its executable code belonged to documentation samples rather than the IDE or CLI product implementation.

The pinned [`docs/ide-integrations.md`](https://cnb.cool/codebuddy/codebuddy-code/-/blob/d7567c62efbdd532650812fae190e62616050392/docs/ide-integrations.md) is still technically useful. It documents two adjacent CodeBuddy Code paths:

- ACP, where an editor hosts CodeBuddy Code as an Agent server;
- an IDE plugin plus local MCP server over SSE/WebSocket, carrying workspace/selection changes and exposing `openFile`, `openDiff`, `getDiagnostics` and `close_tab`.

The file history includes `3126e91098e43c1c2c7a8cb8e7f6863618941369` (2025-09-11), `a52365e011fa5d440c271e68443517220b772ec2`, `6602a3cdb18594d7faed4648bfac42acb329a646`, `07bbf49109e170a5cdb78b4302e8bc0144147595` and `a13dfe65b3982196b75d8f2a96118c567a09d1ea` (2026-05-13). Those commits show documentation evolution. They do not reveal the proprietary IDE Figma or Preview implementation.

### The published CLI package is adjacent compiled code

The npm package [`@tencent-ai/codebuddy-code@2.133.1`](https://registry.npmjs.org/@tencent-ai/codebuddy-code/2.133.1) was also inspected as an adjacent distribution:

| Property | Value |
|---|---|
| Published | 2026-08-08 |
| Tarball size / unpacked size | 38,759,313 / 117,919,962 bytes |
| Tarball SHA-256 | `7F17FB2C253645C248500DD6C5E4E4AFE152EE72435F0C25024631C96D77F13A` |
| npm integrity | `sha512-CgQhwn6uevSrNeBliHb9iZ2kbBL7YYS38VXs60vyxlIMi6X3LHVtA8s7F/QRh9jqWjJdpy82AGjhK0oY+F+Cfw==` |
| Inspectable shape | Large JavaScript bundles and docs; no TypeScript/TSX sources or source maps |

The package has no repository field and points users toward the CNB documentation repository. Its bundled license text does not turn the closed IDE build or remote services into public source. CLI prompt checkpoints, Git worktrees and IDE-plugin MCP integration are valuable adjacent capabilities, but they must not be projected onto the IDE's Figma/DOM contract without direct evidence.

## Facts, inferences and material unknowns

### Directly established

- Official docs expose Figma-to-conversation, Preview selection/DOM editing, Agent result panes, automatic checkpoints, History, Memory, Plan Mode and several deployment routes.
- The pinned IDE distribution writes Figma HTML/resources/screenshot context, passes `figmaInfo` to chat and asks Agent to implement it.
- Preview selection becomes `webSelection` HTML context with synthetic HTML coordinates; DOM Editor first mutates the runtime and then invokes an Agent code action.
- Miora bridge selections become downloaded ordinary files in chat.
- Project files are the implementation handoff authority; Preview is the running projection used to verify them.
- The public CNB repository does not contain the IDE or CLI implementation source at the pinned revision.

### Evidence-backed inference

- Figma and runtime Preview are **dual visual-context convergence paths**: both end in Agent-authored project files, but one begins from an external native document and the other from the project's current runtime.
- Figma directory node ids and Preview synthetic ranges improve grounding without creating durable node-to-source identity.
- A repeated Figma export can present stale visual evidence because the HTML overwrite and screenshot absence-only write use different invalidation behavior.
- Parallel Agent work can make a previously captured Preview selection stale because no public target revision or filesystem precondition joins the two states.

### Material unknowns

- The server-side model orchestration, design-to-code prompting, feature gates and telemetry policy beyond the shipped client boundary.
- Original unminified IDE source, automated tests and source-map-backed module provenance.
- A public schema for Figma context compatibility, selection versioning or reverse synchronization.
- Deterministic DOM-to-file/AST mapping, framework adapters and stale-target conflict rejection.
- Miora's canonical document and version model, export compatibility and writeback behavior.
- Atomic rollback across project files, `.codebuddy` context caches, chat, global memory, Preview state and deployments.
- Whether the current authenticated 4.11.0 service activates every co-bundled UI path observed in the distribution.

## Acceptance checklist for the real journey

A serious CodeBuddy design-to-code evaluation should verify all of the following in the same project:

1. Record the exact Figma node(s), current design revision and intended responsive states.
2. Add the selection and inspect the generated `.codebuddy/figma` HTML, resource folder and screenshot freshness.
3. Confirm Agent changed the intended project files rather than only producing an Artifact/context bundle.
4. Review the task **Changes** pane and the real Git diff for unexpected shared-component scope.
5. Reload Preview from clean source state and verify that the result survives without the DOM Editor's temporary inline style.
6. Reselect the current DOM after HMR before sending a delayed targeted edit.
7. Exercise responsive, theme, interaction, error and data states that were absent from the static Figma selection.
8. Create and test a checkpoint restore, then separately audit Figma/Miora cache files, conversation state and Preview.
9. Deploy through the chosen provider and validate the actual delivered URL, logs, assets, environment and rollback path.
10. Treat any Miora handoff as a file import until its upstream document/version contract is independently established.

## Primary sources and evidence pins

### Official product documentation

- [CodeBuddy IDE introduction](https://www.codebuddy.ai/docs/ide/Introduction)
- [Figma workflow](https://www.codebuddy.ai/docs/ide/User-guide/Figma)
- [Preview](https://www.codebuddy.ai/docs/ide/User-guide/preview)
- [Agent Mode quickstart](https://www.codebuddy.ai/docs/ide/User-guide/Agent-Mode/Quickstart)
- [Agent results](https://www.codebuddy.ai/docs/ide/User-guide/Agent-Mode/Results)
- [Plan Mode](https://www.codebuddy.ai/docs/ide/Features/Plan-Mode)
- [Checkpoint](https://www.codebuddy.ai/docs/ide/User-guide/Checkpoint)
- [History](https://www.codebuddy.ai/docs/ide/User-guide/History)
- [Memory](https://www.codebuddy.ai/docs/ide/User-guide/Memory)
- [Context](https://www.codebuddy.ai/docs/ide/User-guide/Context)
- [Deployment](https://www.codebuddy.ai/docs/ide/User-guide/deploy)
- [IDE release notes](https://www.codebuddy.ai/docs/ide/release-notes/release-notes)
- [Chinese product introduction](https://www.codebuddy.cn/docs/ide/Introduction)
- [Chinese product page](https://www.codebuddy.cn/ide/)
- [CodeBuddy Code IDE integrations](https://www.codebuddy.ai/docs/cli/ide-integrations)

### Pinned distributions and repository history

- [Official Windows update feed](https://www.codebuddy.cn/v2/update?platform=ide-win32-x64-user) — returned `4.11.0.35330129` on 2026-08-11
- [Pinned official Windows installer](https://download.codebuddy.cn/aiide/win32-x64-user/CodeBuddy-win32-x64-user-4.11.0.35330129-a64e0542-cn.exe) — SHA-256 pinned above
- [Official CNB repository](https://cnb.cool/codebuddy/codebuddy-code)
- [Pinned CNB commit `d7567c62...`](https://cnb.cool/codebuddy/codebuddy-code/-/commit/d7567c62efbdd532650812fae190e62616050392)
- [Pinned IDE integration document](https://cnb.cool/codebuddy/codebuddy-code/-/blob/d7567c62efbdd532650812fae190e62616050392/docs/ide-integrations.md)
- [npm registry record for `@tencent-ai/codebuddy-code@2.133.1`](https://registry.npmjs.org/@tencent-ai/codebuddy-code/2.133.1)

No authenticated live task was executed for this snapshot. Product behavior beyond the public docs and shipped-client boundary remains unknown rather than inferred.
