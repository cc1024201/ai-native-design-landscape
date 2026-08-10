# Motiff

> Research status: **Architecture-level / historical closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | MOTIFF PTE. LTD. |
| Category | Historical structured UI editor and hosted AI UI generator |
| Status | UI Editor ceased service 2025-08-22 00:00 UTC-7; Motiff AI went offline 2026-06-23; export remains announced through 2026-10-31 |
| Editor-era durable artifact | Hosted native design file: pages, layers, components, styles, variables, libraries, prototypes and file history |
| Generator-era durable artifact | Hosted Motiff AI project containing generated/refined screens; every export creates a separate destination authority |
| Agent interface | Read-only Motiff-frame-to-HTML/screenshot MCP projection for an external coding agent |
| Source availability | Core product closed; public MIT npm MCP distribution inspected at 0.0.19 |

## One brand, two product centers, three terminal dates

“Motiff shut down in June 2026” is incomplete. The official record exposes two successive products and three different terminal events:

| Date | Product boundary | Consequence |
|---|---|---|
| 2025-08-22 00:00 UTC-7 | Original Motiff UI Editor ceased service | The collaborative structured-design editor, its native files and its editor-era AI Toolbox stopped being an active product surface |
| 2026-06-23 | Later Motiff AI service went offline | Users could no longer access the generator editor or create files |
| 2026-10-31 | Announced export deadline | Export closes and Motiff says all remaining data will be permanently deleted after this date |

The 2025 notice explicitly names the **UI editor** and makes all its features free until shutdown so users can back up and migrate design assets. The later help center says the old editor docs are offline because Motiff changed business direction. The 2026 notice then shuts down the later Motiff AI service and advertises a second export window.

This dossier therefore treats Motiff as one historical lineage with two artifact centers:

```text
editor era
native Motiff design file
  -> AI Layout / AI Reduplication / AI Design Systems mutate or govern that file
  -> version history / collaboration / libraries remain Motiff-hosted
  -> .fig, copied Figma layers, images or MCP HTML leave as projections

generator era
prompt + reference files/images/layers + hosted project context
  -> generated and refined screens
  -> image, Figma, HTML, React or per-screen Project ZIP exits
```

The later generator is not safely described as merely another feature inside the former editor: the company had already declared UI Editor support discontinued, the help taxonomy changed, and the later product exposed different inputs, model choices, credits and code-oriented exports.

## Artifact authority moved before the company stopped service

### Editor era: one structured document was the design authority

The original editor's public help model is a conventional but rich native design graph:

- a canvas with pages and an ordered layer tree;
- frames, groups, shapes, text, images, masks and vector networks;
- Auto Layout, constraints and smart selection;
- components, instances, variants, styles, variables and libraries;
- prototypes, comments, multiplayer collaboration and Dev Mode;
- hosted files, permissions, copies, deletion/restore and version history.

The canvas was a projection and manipulation surface for that document. Code snippets, exported images, an MCP-generated HTML page and a Figma copy were downstream representations; none was documented as a live second source of truth.

### Generator era: a hosted project coordinated screens, but code left as forks

The later Motiff AI help center supports a multi-step product workflow: plan pages, generate a first page, continue with other pages, generate a subpage from a selected click target, and refine a selected page or module. This establishes project/session context across screens.

It does not establish one cohesive code repository. The IDE handoff guide says every generated UI screen is exported as an **individual project** and tells the user or coding agent to merge multiple exported screens for a larger workflow. The hosted Motiff AI project was therefore the cross-screen editing center; each code ZIP was a screen-scoped fork.

## Editor-era ordinary-user journey

The evidence-backed editor journey was:

1. Open or create a hosted Motiff file in a workspace, project or drafts area.
2. Build pages and structured layer trees on the canvas.
3. Reuse local or published styles, components, variables and libraries.
4. Optionally invoke one of three materially different AI paths:
   - infer a temporary or durable responsive layout;
   - duplicate a pattern while retrieving likely text/images from prior organization files;
   - recognize candidate design-system elements and let humans promote or replace them.
5. Collaborate, comment, prototype and hand off through Dev Mode.
6. Let Motiff autosave hosted changes and optionally create named history versions.
7. If connectivity fails, continue only in a file already open; retain unsynchronized operations in the current browser/device until reconnection.
8. Export a visual asset, a Figma representation or a frame-level HTML/screenshot projection when leaving the native document.

The three AI paths must not be collapsed into “AI edited the canvas.” They use different side state, freshness rules and commit boundaries.

## AI Layout: a reversible structural hypothesis with an explicit commit

AI Layout's decisive mechanism was not generic generation. It inferred structure around an existing free-form mobile interface while trying to preserve its appearance.

### Temporary-layout path

The documented path was:

```text
existing free-form layer tree
  -> select a layer
  -> AI analyzes the enclosing mobile interface
  -> temporary frames/groups + Auto Layout constraints are introduced
  -> user inspects or adjusts spacing, order, text growth and reflow
  -> exit/discard OR Save auto layout
```

The engineering post describes the temporary structure as an overlay used to make the interface dynamically adjustable. Motiff had to reason about containment, overlap, alignment, visual similarity and existing group/frame relations. It also describes special handling for:

- rectangles whose visual effect must survive conversion into structured containers;
- opacity/effect relationships that could change if hierarchy moved naively;
- deliberate one- or two-pixel misalignments that should not be “corrected” away;
- elements that need absolute positioning or constraints inside inferred Auto Layout.

The product imposed an appearance invariant: entering AI Layout should not visibly change the design.

### The save boundary

Two exits had different authority:

| Exit | Durable consequence |
|---|---|
| Leave the temporary mode without saving | AI-created frames/groups are removed and the file returns to its free-form structure |
| **Save auto layout** | The inferred layout is promoted into native document structure |
| Use “AI adds auto layout” directly | Selected layers receive durable Auto Layout rather than a disposable trial structure |

This is a genuine human-controlled commit point. The inference itself was not the durable artifact; the saved native layer tree was.

One wording boundary remains. Public help says exiting directly reverts the design interface to its original state, while the engineering post emphasizes removing temporary structure after structured adjustments. It does not specify transaction semantics for every content/position edit made while the temporary structure is active. This dossier does not infer an undocumented partial-commit rule.

## AI Reduplication: native mutation driven by stale organizational memory

AI Reduplication combined three systems:

1. a permission-bounded reference corpus of existing design files;
2. a hosted retrieval/index layer that learned text/image co-occurrence and business context;
3. native duplication and AI Layout recalculation in the current file.

The user selected teams/projects as the reference range. Files with either `Can view` or `Can edit` permission could be included, but the range applied only inside the current organization and had to be reset after switching organizations or external teams.

The ordinary interaction was unusually direct: select content and drag the bottom-right control handle; direction and distance controlled the duplicate count and direction. Motiff then:

- copied the pattern;
- replaced text, images or icons from prior business content;
- recalculated position and size after variable-length content replacement;
- allowed Alt/Option duplication without content replacement.

### The index was side state, not file truth

The first indexing of newly included files could take minutes, while later changes to existing files were generally reflected within 24 hours. The engineering history says the implementation evolved from per-user indexing toward shared indexes and more granular groups/files/frames.

This creates an explicit stale-read boundary:

```text
authorized organization files at indexing time
  -> asynchronous shared retrieval index
  -> duplication suggestion
  -> native layers written into the current Motiff file
```

The resulting layers were durable in the design document. The index was a separate hosted memory and could lag the source files.

The documented product also bounded its content source: the historical system could reuse images from prior design files but could not generate or introduce external images through AI Reduplication. Public evidence does not disclose:

- which exact file/layer supplied each replacement;
- an index revision or retrieval score attached to the duplicated layer;
- what happened to indexed material after source permissions were revoked;
- a reversible multi-layer transaction if part of a duplication failed.

## AI Design Systems: recognition candidates were not governance

Motiff separated inventory, promotion, maintenance and enforcement instead of allowing recognition output to silently become the design system.

```text
historical design files
  -> AI recognition and de-duplication
  -> candidate inventory + usage frequency/scenarios + origin tracing
  -> human selection
  -> native styles/components
  -> publish library
  -> optional replacement or consistency repair in consuming files
```

### Creator

The Creator scanned every interface in selected files, so Motiff warned users to organize those files first to exclude unintended material. It grouped results by recognized type, showed usage frequency and usage scenarios, and let users select candidates to create styles/components and publish a library.

The public product listed 17 recognized categories, including color, typography, effect, icon, button, badge, list, tag, input, checkbox/radio, switch, dialog, popup, toast, tabs, navigation bar and tab bar.

The engineering post explicitly rejects fully automated design-system definition: AI can collect, categorize, re-group and de-duplicate candidates, but naming, semantic boundaries and organization policy require human and business consensus. Its color grouping used Google HCT and hierarchical clustering; the post also acknowledges ambiguous visual cases such as an unchecked checkbox versus radio.

### Maintainer

The Maintainer compared recent files with an existing design-system file and added an **AI maintenance results** page containing newly discovered candidates. Preferences could:

- retain only the top 20% most-used styles when too many were found;
- ignore text candidates whose only difference was line height.

Again, discovery did not publish automatically. A human compared usage and scenarios, then chose whether to create styles/components.

### Replacement and consistency were separate commits

“AI replaces components” let a maintainer map candidate elements to canonical styles/components and **publish replacements**. Consuming files then received update notifications, and a user accepted replacements for a page or file. That is at least a two-stage publish/accept boundary, not a silent organization-wide rewrite.

The Consistency Checker scanned a design file against selected design-system files, located nonconforming text, color and components, and offered bulk replacement for text/color. Hidden and locked layers, illustrations and marketing graphics were skipped.

The native library and accepted file mutations were authoritative. Candidate pages, checker results and replacement notifications were workflow side state.

## MLLM by Motiff explains UI perception, not every later generation

Motiff's 2024 research post discloses a UI-domain multimodal model with:

- a high-resolution visual encoder;
- a visual-language connector;
- a large language model;
- UI screenshot captions, structured captions and instruction-tuning data;
- manual annotation, pseudo-labeling and domain-knowledge distillation;
- component, icon and OCR expert models plus a private LLM in data generation;
- tens of millions of UI and general multimodal samples.

The stated training path adapted existing models rather than training every modality from scratch. During alignment, Motiff froze the visual model and LLM and trained the connector; it then performed end-to-end UI-domain instruction tuning.

The post reports evaluation on ScreenQA, Screen2Words, RefExp, Widget Captioning and MoTIF-Automation, including Motiff-reported scores of 86.09 for MoTIF-Automation, 85.13 for RefExp, 121.19 CIDEr for Screen2Words, 93.03 F1 for ScreenQA Short and 161.77 CIDEr for Widget Captioning.

Those are vendor-reported UI-understanding results. They do not prove that this one MLLM generated every design in either product era.

The later Motiff AI product explicitly exposed Auto, Gemini 3 Pro Preview, Claude Sonnet 4.5 and Gemini 2.5 Flash modes and described a multi-model pipeline that chose models per step. The bounded model history is therefore:

- the original team developed and evaluated a UI-specialized MLLM;
- late Motiff AI used a multi-model generation product;
- the public sources do not map each feature, request stage or model mode to a reproducible model checkpoint.

## Motiff MCP: read-only frame projection into an IDE

The editor later exposed a concrete agent interface. A user enabled Develop Mode, configured Motiff MCP in an IDE, pasted a link to a Motiff frame and asked the IDE's coding agent to implement it. Motiff's official help says the server exported HTML because it expected LLMs to understand that projection more readily than native design JSON.

### Immutable distribution pin

The inspected public package is:

| Field | Pinned value |
|---|---|
| Package | `@motiffcom/motiff-mcp-server` |
| Version | `0.0.19` |
| Published | 2025-06-23T08:07:35.140Z |
| License | MIT License |
| Registry SHA-1 | `0b00812e04f0d0f543c19eeca456513f0b715c1a` |
| Registry integrity | `sha512-xFT5Xh9qWyD2NcC1iHQqAxBGYoLgMjdEOZRaBZwgmrZID5Vw7bWKnEpLH+JLny4rkDzjwY3NDoYlPm9dmASVRQ==` |
| npm `gitHead` | `730a7eaed674d47d6a774e5b3a282dc917b7342d` |
| MCP SDK | `@modelcontextprotocol/sdk@1.7.0` |
| Transport | stdio |

The tarball contains compiled JavaScript and declarations, plus a React/Vite/Tailwind template. It does not declare a repository URL and the `gitHead` could not be located in a public repository. The package is inspectable source distribution, but it is not a publicly auditable core-product commit.

### Two registered read tools

`dist/server.js` registers only:

| Tool | Input | Result |
|---|---|---|
| `get_motiff_node` | `docId`, `nodeId`, optional `isDebug` | complete HTML page with inline CSS |
| `get_motiff_node_screenshot` | `docId`, `nodeId` | base64 image and MIME type |

Although `dist/tools/create-react-project.js` and a project template ship in the tarball, the server does not register that tool. Distribution presence is not callable capability.

The server also reports protocol metadata version `0.0.1` even though the package is `0.0.19`. Clients cannot use that internal version string to identify the installed package revision.

### HTML and screenshot task protocols

`dist/utils/api.js` reads `MOTIFF_TOKEN`, defaults to `https://api.motiff.com` and sends the token as a Bearer credential.

The HTML path in `dist/motiff/client.js`:

1. POSTs `/api/v1/documents/html?docId=...&nodeId=...`;
2. receives a task id;
3. polls `/api/v1/documents/html/{taskId}` once per second, for at most 60 attempts;
4. on success, fetches the returned `dataUrl`;
5. returns the downloaded HTML verbatim to the MCP client.

The screenshot path similarly POSTs `/api/v1/documents/image?...&scale=THUMBNAIL`, polls for up to 120 attempts, accepts either a `nodeId2Url` mapping or legacy direct URL, downloads the image and converts it to base64.

Registry diffing from 0.0.18 to 0.0.19 shows explicit `FAILED` handling was added for both asynchronous task types. The same revision removed obsolete project-creation guidance and a commented registration block. This history reinforces the actual boundary: version 0.0.19 is a two-tool reader, not a repository-writing agent.

The distribution also exposes narrower implementation failures:

- screenshot resolution selects the first entry in `nodeId2Url` rather than proving that its key equals the requested `nodeId`;
- optional HTML debug mode writes synchronously to `/tmp/{docId}-{nodeId}.html` without creating or negotiating a platform-specific temp directory;
- polling uses fixed one-second intervals, has no exposed cancellation/retry policy and returns ordinary MCP error text rather than a durable task receipt.

Those details do not prove that the hosted API misbehaved in ordinary single-node use. They define what the adapter itself does and does not guard.

### What identity survives

The public link and tool input preserve a Motiff document id and selected frame/node id long enough to request a projection. They do not establish:

- native descendant-node ids embedded in the resulting HTML;
- a source file, component or AST identity;
- a durable mapping from generated application elements back to Motiff layers;
- a write tool that mutates the Motiff file;
- any transaction between the hosted design revision and the code an external agent writes.

Official help also lists the fidelity failures: complex edits can be poorly represented, exported HTML uses absolute units, large frames can exceed model context, and coding tools/models process the same data differently. Narrowing the exported layer range was the documented mitigation.

## Later Motiff AI ordinary-user journey

The later generator's evidenced path was:

1. Provide a text prompt, image, selected canvas layer or supported file (`.txt`, `.html`, `.pdf`, `.json`, `.md`).
2. Choose Auto, Minimalist, Material Design, Ant Design or shadcn/ui styling.
3. Choose Auto or a named model mode.
4. Generate one or more high-fidelity screens.
5. Continue the conversation to plan pages, generate further main/subpages or derive a page from a selected click target.
6. Select a layer/page/module and describe a refinement.
7. Analyze the result or extract content when useful.
8. Export an image, copy to Figma, emit HTML/React or download a Project ZIP.

The product documented failure as resource congestion, abnormal requests or substantial result deviation and primarily advised retrying the prompt. It advertised programmatic generation access only through contacting support; no public generator API schema, versioning or idempotency contract was located.

The research page describes consistency as learned/extracted style guidance, design-system component reuse and previous screens used as few-shot examples. That establishes a product direction, not the storage schema or exact context-selection algorithm.

## Multi-screen generation breaks at code handoff

The prompt guide encourages planning and generating a full product flow inside one Motiff AI project. The Project ZIP guide then says:

> each UI screen is exported as an individual project.

For an ordinary user, this creates a specific handoff break:

```text
one hosted multi-screen design conversation
  -> N separately generated code folders
  -> user or external coding agent merges routing, shared state, dependencies and design primitives
```

A successful ZIP download therefore does not prove:

- one runnable multi-page application;
- shared components rather than duplicated per-screen code;
- coherent navigation or state;
- a common dependency lock;
- reverse synchronization after the merge.

## Escape is a lossy choice, not one export button

| Exit | What survives | Known loss or new authority |
|---|---|---|
| Bulk/save as `.fig` | Instances, styles and color variables are retained more structurally | Main components are unavailable until libraries are reconnected; styles/variables cannot be edited until rebound; masks inside instances can render differently |
| Copy Layers to Figma | Editable pasted layers | Instances, styles and variables are deliberately detached |
| PNG/JPEG/WebP/PDF | Visual appearance | Layer structure, components, variables, prototype logic and history are flattened |
| MCP HTML | A selected frame's high-fidelity HTML/CSS projection plus optional screenshot | Absolute-unit HTML can be hard to make responsive; complex/layer-heavy frames lose fidelity; there is no writeback |
| HTML/React export | Screen implementation material | Framework/runtime contract and roundtrip semantics are not public |
| Project ZIP | Assets and code in an IDE-ready folder | Every screen is a separate project; cross-screen architecture becomes user/agent work |

The `.fig` path preserves more native design semantics than clipboard copy, but it also transports unresolved library references and a known mask incompatibility. Clipboard copy is faster but intentionally severs system semantics. Neither path is a live roundtrip.

## Persistence is a set of clocks, not “autosave”

### Hosted file history

Motiff automatically created a version after file content stopped changing for 30 minutes; users with edit permission could also create named manual versions. A version recorded contributor ordering, time, name and description. Users could preview pages/layers, filter autosaves, restore, duplicate and share a link.

Restore was intentionally not a total rewind:

- Motiff saved a version before and after restoration;
- published libraries did not roll back;
- comments did not roll back;
- deleted/resolved comments from later state were not resurrected.

Thus file content, libraries and comments already had separate clocks.

### Offline operation log

Motiff was cloud-first. Offline mode worked only for files already open and stored **modified operations**, not a complete portable file, in the current device's browser IndexedDB. Those operations synchronized after reconnection.

The public bounds were:

- up to 30 days in most browsers and seven days in Safari;
- unavailable on another device or browser;
- lost if cache/browser data was cleared, storage filled, private/guest mode evicted data, an extension blocked storage or the user changed browser;
- no new files, unopened files, library master search, collaboration or version-history operations while offline.

The desktop application used the same browser-application storage model. Its public help describes a Chrome-based shell with local-font access and the same Motiff workspace/files, not a standalone native document store.

### Retrieval, credits and shutdown

Other independent clocks included:

- AI Reduplication's minutes-to-24-hours retrieval freshness;
- design-system recognition pages and replacement notifications;
- paid/free credits consumed by late generation;
- hosted Motiff AI project context;
- the 2026 service-offline date;
- the later export/data-deletion deadline.

No public contract joins these clocks atomically.

## Data and ownership boundary

The late Motiff AI terms distinguish paid from free/trial usage:

- users retain their inputs;
- outputs generated with paid credits are owned by the user to the fullest extent permitted by law;
- Motiff says paid-credit inputs/outputs are not used, stored or reviewed for model training or optimization beyond service delivery, subject to law and specific support cases;
- free/trial usage grants Motiff a license to use, analyze and aggregate anonymized or de-identified data to improve the service/models.

The privacy policy also allows temporary processing of AI input/results for model improvement, misuse monitoring and debugging, then carves out the paid-credit protection. The narrow paid-credit promise must not be generalized to every generation.

The shutdown notice's promised deletion after 2026-10-31 is stronger and more specific than the general retention wording for this terminal event.

## Shutdown recovery boundary

The official 2026 page is internally incomplete from an ordinary user's perspective. It says:

- service/editor access ends on 2026-06-23;
- export remains available through 2026-10-31;
- the export steps require signing in, opening a project and clicking Export.

It does not document the exact post-June export-only interface or whether every format remains available for every editor-era and generator-era artifact after the editor is inaccessible. That is a material unknown, not a reason to invent a hidden recovery surface.

Before the terminal deadline, recovery acceptance requires the actual downloaded artifact:

1. enumerate every team/project/file and Motiff AI project;
2. export each artifact through its highest-fidelity useful route;
3. open every `.fig` in Figma and reconnect libraries before editing/copying;
4. compare masks, instances, styles and variables;
5. unzip and run every code project;
6. merge and test multi-screen workflows explicitly;
7. retain visual exports as comparison evidence;
8. do not treat an email, completed export task or download UI as proof until the file exists and opens locally.

## Failure atlas

| Boundary | User-visible failure | Established cause/limit | Recovery evidence |
|---|---|---|---|
| AI Layout temporary mode | Inferred structure disappears or differs from intended hierarchy | Temporary frames/groups are disposable until save; exact partial-edit semantics are unpublished | Reopen/inspect the native layer tree and verify saved Auto Layout |
| AI Layout visual preservation | Appearance changes after structuring | Overlap, hierarchy, effects, constraints and deliberate small misalignments are hard cases | Before/after visual comparison plus layer-tree inspection |
| AI Reduplication | Old or irrelevant replacements | Reference index can lag existing-file changes by about 24 hours and is organization-scoped | Confirm reference range/freshness and inspect resulting native layers |
| Design-system recognition | Wrong or noisy candidates | Entire interfaces are scanned; visual ambiguity and duplicate/near-duplicate clustering remain | Human review, origin trace, usage context and explicit publish |
| Consistency check | Violations remain | Hidden/locked layers, illustrations and marketing graphics are skipped | Manual audit beyond checker results |
| MCP HTML | Generated code differs from design | Complex editing, absolute units, layer-count context overflow, client parsing and model limits | Narrow frame scope; compare running implementation with design/screenshot |
| MCP task | Reader fails, times out or returns an unverified screenshot mapping | Invalid/unauthorized doc/node, API failure, 60/120-second polling ceilings; screenshot client takes the first returned map entry | Confirm Develop Mode/token/ids and require actual HTML/image content for the requested frame |
| Offline editing | Unsaved work disappears | IndexedDB eviction/expiry, cache clearing, full disk, private mode, browser/device switch | Reconnect within retention window and verify hosted sync/version |
| Version restore | Comments/libraries remain “new” | Restore only rewinds file content, not those domains | Inspect restored layers plus current comments and published library separately |
| Figma `.fig` | Mask/library/style differences | Cross-tool mask semantics and missing library authorities | Import, reconnect libraries, compare before further edits |
| Copy to Figma | System semantics vanish | Components/styles/variables detach by design | Inspect pasted Figma object model, not only pixels |
| Project ZIP | Screens do not form an app | One project per UI screen | Merge dependencies/routing/state and run the complete journey |
| Late AI generation | Task fails or deviates | Resource congestion, abnormal requests or model mismatch | Retry, then independently inspect output; status alone is insufficient |
| Shutdown export | User cannot follow published steps after service offline | Post-June export-only surface is undocumented | Obtain/open every local file before 2026-10-31 |

## Facts, inferences and material unknowns

### Directly established

- Motiff operated a structured collaborative UI editor and later a focused AI UI generator.
- The UI Editor and later Motiff AI had different shutdown dates.
- AI Layout exposed a disposable inferred structure and an explicit save-to-native-structure boundary.
- AI Reduplication depended on an asynchronous organization-scoped index and wrote native duplicates.
- AI Design Systems separated recognition candidates, human promotion, publication and per-file acceptance.
- Native file versions were generated after 30 minutes of inactivity and did not rewind comments or published libraries.
- Offline persistence stored operations in current-device IndexedDB rather than a whole portable file.
- Motiff's public MCP package was a read-only two-tool HTML/screenshot adapter at 0.0.19.
- The later generator accepted multimodal/reference inputs, named model modes, selected-layer refinements and plural exports.
- Project ZIP exported each UI screen as a separate project.
- Figma exits have documented mask, library, style, variable or detachment losses.

### Evidence-backed inferences

- The company shifted artifact authority from a general native design document toward a hosted generator project before the final company-wide shutdown.
- AI Layout's temporary graph, Reduplication's retrieval index and design-system candidate pages are three different side-state classes; none should be described as the native source of truth.
- Motiff MCP preserved top-level frame addressability for retrieval but did not create a durable design-node-to-code binding.
- The later multi-model generator and the earlier UI-domain MLLM belong to one research lineage but cannot be equated implementation-for-implementation.
- After any export, the destination file/repository becomes an independent authority because no reverse synchronization is documented.

### Material unknowns

- Core editor document schema, rendering engine, collaboration protocol and server storage.
- AI Layout model/version, inference transaction details and exact treatment of edits made inside temporary mode.
- AI Reduplication index deletion, permission-revocation and provenance behavior.
- Design-system candidate/replacement serialization and atomicity.
- Which MLLM or external model handled each historical or late-product request stage.
- Generator project/screen/version schema, prompt retention and rollback.
- Public generator API request/response contract and idempotency.
- Exact descendant identity inside MCP-produced HTML and its generating backend.
- A public repository/commit corresponding to npm `gitHead` `730a7eae...`.
- Post-2026-06-23 export-only interface and format availability.
- Whether any recovery remains after 2026-10-31; the official statement says remaining data will be deleted.

## Evidence boundary

The Architecture-level boundary is reached because the decisive artifact transitions, three AI mutation/governance mechanisms, persistence clocks, read-only agent interface, export fidelity and shutdown failures are established from official behavior and an immutable public package.

The core product remains proprietary. Archived Next.js help pages and current website bundles prove public documentation behavior, not the editor implementation stack. The MIT MCP tarball proves only its distributed adapter code; it must not stand in for the editor, AI backend or generator.

No live authenticated artifact was available for destructive or post-shutdown testing. Claims that would require a private file, token, server response, model checkpoint or internal repository remain explicit unknowns.

## Acceptance checklist for reconstructing a Motiff workflow

- Identify whether the artifact belongs to the original editor or later generator.
- Pin the relevant service/export deadline before reasoning about availability.
- In the editor era, prove durable change by inspecting native layers/components/libraries, not an AI panel.
- For AI Layout, distinguish temporary inference from saved Auto Layout.
- For AI Reduplication, record reference scope and freshness separately from the resulting layers.
- For design-system work, preserve candidate, promotion, publish and consuming-file acceptance as separate events.
- For MCP handoff, require actual HTML/image content and a rendered repository diff; a successful tool call is not implementation fidelity.
- For version recovery, audit file content, comments and libraries independently.
- For offline recovery, synchronize on the same device/browser inside the retention window.
- For Figma escape, verify structure and library reconnection, not only appearance.
- For code escape, run each project and test the merged multi-screen journey.
- Before final deletion, verify every downloaded file locally and keep a redundant inventory.

## Primary sources and evidence pins

### Lifecycle and legal

- [UI Editor refund and 2025-08-22 shutdown notice](https://motiff.com/help/others/385912547434501)
- [Motiff AI 2026 shutdown, export and deletion schedule](https://motiff.com/help/others/462390803479041)
- [Old UI Editor help-doc retirement notice](https://beta.motiff.com/help/docs)
- [Motiff AI privacy policy](https://motiff.com/privacy)
- [Motiff AI terms of service](https://motiff.com/terms)

### Original editor and persistence

- [Archived introduction to the Motiff editor](https://web.archive.org/web/20240617160107id_/https://motiff.com/help/docs/sections/37711764310784)
- [Archived 2024 editor help taxonomy](https://web.archive.org/web/20240617173545id_/https://motiff.com/help/docs)
- [Archived offline-mode and IndexedDB behavior](https://web.archive.org/web/20240617172351id_/https://motiff.com/help/docs/articles/89898446992641)
- [Archived version-history semantics](https://web.archive.org/web/20250612151305id_/https://motiff.com/help/docs/sections/65951435819529)
- [Insufficient disk space and local-data categories](https://motiff.com/help/others/266701503819272)
- [Archived desktop-app boundary](https://web.archive.org/web/20250622150239id_/https://www.motiff.com/help/docs/sections/110550819121921)
- [Figma export fidelity and detachment behavior](https://motiff.com/help/others/385547512936960)

### AI Layout and AI Reduplication

- [Archived AI Layout help](https://web.archive.org/web/20240617165722id_/https://motiff.com/help/docs/articles/232648479013377)
- [Archived AI Layout engineering history](https://web.archive.org/web/20240617175139id_/https://motiff.com/blog/ai-layout-the-dream-of-dynamic-flexibility)
- [Archived AI Reduplication help](https://web.archive.org/web/20240617174326id_/https://motiff.com/help/docs/articles/232648479013121)
- [Archived AI Reduplication engineering history](https://web.archive.org/web/20240617174248id_/https://motiff.com/blog/ai-reduplication-fast-duplicate-smart-replace)

### AI Design Systems

- [Archived AI Design System Creator help](https://web.archive.org/web/20240617160202id_/https://motiff.com/help/docs/articles/232648479013378)
- [Archived AI Design System Maintainer help](https://web.archive.org/web/20240617162907id_/https://motiff.com/help/docs/articles/232648479013122)
- [Archived AI Consistency Checker help](https://web.archive.org/web/20240617172307id_/https://motiff.com/help/docs/articles/232648479013379)
- [Archived AI replaces components help](https://web.archive.org/web/20240617175705id_/https://motiff.com/help/docs/articles/232648479013123)
- [Archived AI Design Systems product surface](https://web.archive.org/web/20240614132109id_/https://motiff.com/ai-design-systems)
- [Archived Creator engineering history](https://web.archive.org/web/20240605135932id_/https://motiff.com/blog/ai-design-system-creator)

### Models and later generator

- [MLLM by Motiff research post](https://api.motiff.com/blog/mllm-by-motiff-shaping-the-future-of-ui-design)
- [Motiff AI evaluation and multi-model direction](https://motiff.com/research)
- [Later Motiff AI quick start](https://motiff.com/help/docs/sections/396124339930624)
- [Prompting and multi-screen project workflow](https://motiff.com/help/docs/sections/403724733484545)
- [Per-screen Project ZIP and IDE handoff](https://motiff.com/help/docs/sections/427165792765815)
- [Late-product pricing and credit envelope](https://motiff.com/pricing)

### Agent interface and immutable distribution

- [Archived official Motiff MCP guide](https://web.archive.org/web/20250520141936id_/https://motiff.com/help/docs/sections/358051399613186)
- [Immutable npm registry metadata for 0.0.19](https://registry.npmjs.org/%40motiffcom%2Fmotiff-mcp-server/0.0.19)
- [Immutable 0.0.19 tarball](https://registry.npmjs.org/@motiffcom/motiff-mcp-server/-/motiff-mcp-server-0.0.19.tgz)

Reproducible package inspection used `npm view @motiffcom/motiff-mcp-server@0.0.19 --json`, `npm pack @motiffcom/motiff-mcp-server@0.0.19`, and registry-to-registry `npm diff` for 0.0.17→0.0.18 and 0.0.18→0.0.19.
