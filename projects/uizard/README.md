# Uizard

> Research status: **Architecture-level / observable-client boundary reached / v1.0** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | UizardApp ApS; part of Miro since May 2024 |
| Current category | Hosted AI UI ideation, native mockup editing and interactive prototyping |
| Status | Active; the public app, product site and help center remain live |
| Decisive artifact | A hosted Uizard prototype/project: device-scoped screens, native objects, interactions, brand/design context, comments and permissions |
| Current AI surface | Autodesigner 2.0 plus screen, selection, theme, screenshot, wireframe, image and design-review generation |
| Source availability | Closed; an anonymous production client bundle is readable but its source map URL returns the app HTML shell, not sources |
| Observable client pin | `main.6d8a2b4c.js`, SHA-256 `8bc8671e86e39f396521831bab09c1e3ca012a19ff838fbafe38a6ad32f14a4d`; HTTP `Last-Modified` observed as 2026-04-29 |
| Evidence ceiling reached | Current official behavior/docs, policies and the hash-pinned anonymous Web client contract; server implementation and native object serialization remain closed |

## Executive finding

Uizard is best understood as an **AI-assisted native prototype graph**, not a code generator that happens to display a canvas.

Text, screenshots, hand-drawn wireframes, URLs, templates and manual creation all enter through different recognition or generation paths. The useful result of each path is the same kind of thing: editable Uizard screens and objects inside a hosted project. Autodesigner then addresses those native objects, while humans drag, style, connect and comment on them in the same editor.

This makes Uizard unusually coherent before handoff and deliberately asymmetric after it:

- a generated screen, scanned screenshot and manually drawn screen can become peers in one project;
- a selection can be modified by native object id rather than rediscovered from pixels;
- a prototype can preserve screen-to-screen navigation and be shared interactively;
- an SVG, PDF, image or individual React/CSS component is an export fork;
- the whole prototype cannot be exported as a runnable HTML/JavaScript application, and a public prototype is not a functional website or app.

The ordinary user's central risk is therefore not “did generation return pixels?” It is mistaking a hosted, autosaved and clickable design artifact for recoverable version history or production implementation.

## One project graph, four ways in

The [current product surface](https://uizard.io/product/) and [Autodesigner guide](https://support.uizard.io/en/articles/7728147-guide-to-autodesigner) establish four materially different creation paths.

### 1. Prompt to a multi-screen project

Autodesigner asks for a device class and a short product description, then lets the user derive style from a screenshot, text description or URL. The guide documents a 300-character project prompt limit and mobile, tablet or Web device choices.

The result is a set of editable screens with a suggested flow, not flattened screenshots. The user can regenerate while the immediate result dialog is open, or create another project later. A high-fidelity first result is still a proposal: copy, interaction semantics, responsive behavior and product logic have not been validated.

### 2. Prompt to additional screen candidates

Inside an existing project, Screen Generator creates several proposals for one requested screen. The user explicitly chooses **Use screen**; unchosen proposals are not equivalent to durable sibling project branches.

The published client contract makes the asynchronous boundary visible:

```graphql
mutation CreateScreensFromText(
  $prototypeId: ID!
  $deviceType: String!
  $prompt: String!
) {
  createScreensFromText(...) { reference }
}

subscription TextToScreensComplete($reference: String!) {
  textToScreensComplete(reference: $reference) {
    state
    nodes
    prototypeId
    error
  }
}
```

Request acceptance and a returned `reference` are not screen creation. The subscription's terminal payload is the first public receipt that native candidate nodes exist; explicit insertion establishes that one became part of the project.

### 3. Screenshot or sketch to editable objects

[Screenshot Scanner](https://support.uizard.io/en/articles/7915206-using-screenshot-scanner) accepts JPG, PNG or HEIC and reconstructs one image at a time into editable text, colors, images and other UI objects. The official [troubleshooting boundary](https://support.uizard.io/en/articles/7927865-troubleshooting-screenshot-scanner) is consequential:

- device frames should be removed from mobile captures;
- tables are not recognized;
- fonts, placement and images can differ and require manual repair;
- bulk screenshot scanning is not supported.

[Wireframe Scanner](https://support.uizard.io/en/articles/6435370-using-wireframe-scanner) similarly recognizes a constrained hand-drawn visual language. Its sketching rules are part of the effective input protocol; an incorrectly recognized component is repaired in the native editor rather than kept bound to the original pen mark.

Both paths are lossy reconstruction. The uploaded image may remain as input evidence, but no public contract binds each reconstructed node back to a pixel region, OCR span or source revision.

### 4. Blank/template project plus native editing

A user can also start from a blank canvas, project template or Brand Kit and compose screens from shapes, text, images and reusable component templates. This path is important because it proves that AI outputs are not a separate artifact class. Once accepted, their objects enter the same editing vocabulary as manually created content.

## Autodesigner converges on native object identity

Autodesigner 2.0 can modify an existing selection, generate screens and themes, and review a screen. Its public client contract is stronger than a vague “AI sees the canvas” claim.

### Selection mutation

The current bundle initiates a change with project and native selection identity:

```graphql
mutation CreateDesignFromText(
  $prototypeId: ID!
  $prompt: String!
  $selectedNodeIds: [String!]!
) {
  createDesignFromText(...) { reference }
}
```

Completion returns an explicit mutation-shaped command:

```graphql
subscription TextToDesignComplete($reference: String!) {
  textToDesignComplete(reference: $reference) {
    state
    command { add modify delete }
    prototypeId
    message
  }
}
```

This is native-graph targeting: the user selects Uizard objects and the service returns additions, modifications or deletions for that project. It is not DOM-to-repository source return. There is no application file, range, AST, source map or Git revision because application source is not Uizard's authority.

### Conversation is a side ledger, not the design itself

The client exposes project-scoped AI threads with `threadUuid`, timestamps, messages and prompt. `syncAiChatThread` sends JSON Patch-like message updates separately from the design mutation subscription. The help guide lets a user revisit a prior chat and reinsert an earlier generated component with **Use in design**.

That establishes two clocks:

- chat history preserves prompts, responses and reusable generated candidates;
- the prototype graph records the objects actually accepted, modified or deleted.

Restoring a component from chat creates or reuses project content; it is not a whole-project rewind.

### Theme generation is a project-wide projection

[Theme Generator](https://support.uizard.io/en/articles/7947511-using-theme-generator) can derive a style from a prompt, guided choices, screenshot or URL, preview it against the project and then apply it. The current client subscription returns `objectsPatch` plus `previewNodes.current` and `previewNodes.new`; Brand Kit application similarly returns an `objectsPatch`.

The public behavior exposes a weak recovery edge: immediately after applying a theme the user can undo, but the help center says an older theme cannot otherwise be restored and theme settings cannot currently be edited. A global-looking style operation is therefore a materialized object patch, not a permanently live design-token binding with named historical revisions.

## What the hosted prototype actually has to coordinate

The anonymous [`main.6d8a2b4c.js`](https://app.uizard.io/static/js/main.6d8a2b4c.js) bundle exposes GraphQL operations without exposing the service implementation. Its `ViewPrototype` query shows the public metadata envelope:

| Plane | Publicly observable fields or operations | Authority meaning |
|---|---|---|
| Project identity | `_id`, name, description, privacy, template flag, pipeline request UUID | stable hosted container for the design |
| Device | type plus width/height resolution | one project is designed for a chosen device regime; it is not a responsive codebase |
| Native scene | generated `nodes`, selected node ids, object patches and annotation object-id paths | editable screen/object graph; exact server serialization remains closed |
| Interaction graph | source component to destination screen or external URL, transition and duration | clickable prototype behavior, not application logic |
| Brand/design context | Brand Kits, colors, fonts, photos, icons, templates and optional design-system identity | reusable generation/editing context with separate organization/project scope |
| AI ledger | project-scoped chat threads and asynchronous generation references | intent and candidate history, separate from accepted scene state |
| Review | annotations, comments, members, permissions and notifications | collaboration state around the graph |
| Sharing | viewer URL access, sharing enablement and duplication policy | access to a published projection, not code deployment |
| Export | asynchronous export record and completion subscription | materialized destination artifact with its own lifecycle |

The same bundle is configured for HTTPS GraphQL, GraphQL subscriptions over WebSocket and a separate multiplayer socket endpoint. This is evidence of split transport responsibilities, not proof of the server's storage engine or conflict algorithm. Real-time collaboration is documented; whether the scene uses operational transforms, a CRDT or another protocol is **unknown**.

## Interaction is a bounded prototype state machine

[Creating an interactive project](https://support.uizard.io/en/articles/6435343-creating-an-interactive-project) turns a component into a trigger that opens another screen or, on eligible plans, an external URL. The user can choose a transition and duration, then exercise the flow in Preview mode.

The documented state machine is intentionally narrow:

- no same-screen jump/overlay interaction;
- no swipe;
- no hover or mouseover;
- no attached backend or database;
- no evidence that generated flow links implement validation, data mutation, authentication or failure states.

An Autodesigner-created flow can therefore be structurally useful without being behaviorally complete. Ordinary-user acceptance should follow the intended path in Preview and inspect dead ends, back navigation, scroll/fixed elements and device assumptions rather than treating visible connector lines as proof.

## Brand Kits reuse style; they do not create a live cross-project transaction

[Brand Kits](https://support.uizard.io/en/articles/8725623-using-brand-kits) can be created from scratch, a screenshot, URL, prompt or existing project. They can contain colors, custom fonts, images, icons and saved component templates, and a project can select or switch its active kit.

This creates three distinct semantics:

1. the Brand Kit is an organization/project-scoped reusable resource;
2. applying it materializes changes into one prototype through an object patch;
3. saving a selected component into the kit creates a reusable template.

Public evidence does not establish live instance propagation or project pinning to an immutable Brand Kit revision. Applying or switching context should therefore be treated as a broad project mutation and verified screen by screen. Deleting a kit is blocked while a project actively uses it, but that guard is not a versioning model.

## Persistence and recovery: autosave is not version history

The [project-management guide](https://support.uizard.io/en/articles/6359662-managing-projects) says projects autosave and have no manual save button. The editor also exposes conventional undo/redo, project duplication and chat-history component recovery.

Those mechanisms cover different failures:

| Mechanism | What it can recover | What it does not establish |
|---|---|---|
| autosave | latest hosted project state | a named immutable version or rollback point |
| undo/redo | recent editor operations while history remains available | durable recovery across all sessions, collaborators and broad generated patches |
| AI chat history | earlier messages and generated components that can be inserted again | prior complete screen/project state |
| duplicate project | an explicit independent fork at duplication time | continuing synchronization or common merge history |
| public-copy permission | another user can duplicate a shared project | controlled upstream/downstream roundtrip |
| raster/vector/PDF export | a visual checkpoint | editable native graph, comments, interactions or recovery |

There is also current contract skew. The help article says there is no archive and a deleted project cannot be recovered. The 2026 production bundle contains `archivePrototype` and `PrototypesArchived`. That proves a newer archive-shaped client path exists, but not which plans/users can invoke it, whether it is reversible, or whether hard deletion semantics changed. Until live documentation or an authenticated test establishes recovery, deletion must still be treated as destructive.

No public API, bundle operation or help article establishes a user-facing named version graph, immutable project revision id, branch merge or whole-project restore. This absence is the central recovery limitation, not a cosmetic missing feature.

## Handoff is deliberately plural and lossy

The [export guide](https://support.uizard.io/en/articles/6380330-exporting-projects) separates whole-project visual delivery from component-level developer handoff:

| Exit | What the user receives | Semantics lost or unproven |
|---|---|---|
| JPG / PNG | flattened screen/component pixels | objects, text semantics, interactions, comments and responsive rules |
| PDF | paged static representation | clickability; interactive PDF is unsupported |
| SVG | vector representation importable elsewhere | Uizard layers, native identity, flow graph and reverse synchronization |
| CSS inspect/copy | style for one selected component | application architecture, behavior and complete project composition |
| React copy/download | one selected component's generated source | full application, routing, shared state, backend and code roundtrip |
| public link/embed | hosted interactive prototype | production functionality, database, custom application deployment and offline ownership |

The guide explicitly says an entire project cannot be exported as HTML, JavaScript or another runnable script, and layers/comments/device frames are not exportable. [Sharing](https://support.uizard.io/en/articles/6380408-sharing-projects) requires an explicit publish step, can expose a URL or embed, and can later be unpublished; creators and viewers have different edit/comment rights, and public duplication can be configured on paid plans.

Most importantly, the sharing guide says Uizard cannot publish a functional website or app. The hosted link is a prototype projection. A developer must separately reproduce UI, state, data, accessibility and responsive behavior in application source.

## Source-return and implementation boundary

Uizard has exact identity **inside** its own graph and no public reverse identity outside it:

```text
prompt / image / sketch / URL
          │ lossy generation or recognition
          ▼
Uizard prototype → screen ids → native object ids → interaction targets
          │
          ├── share/preview projection
          ├── static export fork
          └── one-component CSS/React fork
                                ──X──► no reverse link to project object/revision
```

The help center says code files cannot be imported, while whole-project code export is unavailable. The React handoff is component-scoped. Consequently:

- Uizard does not add a repository element-to-source return mechanism;
- generated React does not become a second synchronized artifact authority;
- a developer implementing the prototype must establish their own component mapping and acceptance evidence;
- a later application screenshot imported back through Scanner is a fresh reconstruction, not roundtrip reconciliation.

## Observable runtime and source-evidence ceiling

On 2026-08-11, the anonymous app shell served one first-party JavaScript entry, `main.6d8a2b4c.js`:

```text
size:          7,349,073 bytes
SHA-256:       8bc8671e86e39f396521831bab09c1e3ca012a19ff838fbafe38a6ad32f14a4d
Last-Modified: Wed, 29 Apr 2026 08:23:03 GMT
source map:    /static/js/main.6d8a2b4c.js.map returns the Uizard HTML shell
```

Readable embedded operations expose product contracts such as `CreatePrototypeFromText`, `CreateScreensFromText`, `CreateDesignFromText`, `TextTo*Complete`, `syncAiChatThread`, `applyBrandKitToPrototype`, annotation batches, sharing and asynchronous export. Configuration exposes separate platform GraphQL, subscription and multiplayer endpoints.

This supports Architecture-level analysis but not Source-level classification. The bundle is minified compiled delivery, has no corresponding public source revision, and reveals neither server code nor preferred-form client source. Library-name strings are insufficient to claim Uizard's backend stack, scene algorithm or persistence engine.

## Failure map for the ordinary user

| Boundary | Plausible false success | Required check |
|---|---|---|
| whole-project generation | several polished screens appear | inspect copy, missing states, flow completeness and actual device choice |
| screen generation | asynchronous request/reference exists | wait for terminal candidate nodes, choose one and confirm it joined the project |
| selection modification | AI returns a command | inspect add/modify/delete scope and adjacent components before continuing |
| screenshot/sketch scan | image was accepted | repair unsupported tables, OCR/font/image/layout discrepancies and test the reconstructed flow |
| theme/Brand Kit | preview looks consistent on one screen | inspect every screen and retain an immediate undo or duplicate checkpoint |
| collaboration | cursors/comments are live | verify editor/viewer permissions, comment resolution and concurrent change outcome |
| autosave | latest state reloads | do not infer named history or recovery from destructive deletion |
| prototype preview | links click between screens | exercise the full ordinary-user route and document unsupported interaction semantics |
| component handoff | React/CSS copied successfully | integrate, render and test the real application; identity no longer roundtrips |
| publish/share | public URL opens | verify intended access/duplication settings and remember it is not a functional app deployment |

## Privacy, ownership and external-input boundaries

The [Terms of Service](https://uizard.io/terms-of-service/) define prompts, images and other submitted material as Customer Data, leave Customer Data ownership with the customer, allow processing to provide and improve the service, and require adequate output review. They also warn that service delivery can involve international data transfer and make the customer responsible for rights in submitted material.

That matters because Uizard's strongest inputs can be sensitive:

- screenshots may expose private product screens or customer data;
- URL-derived style extraction sends an external address to a hosted service;
- custom fonts, logos, icons and Brand Kit assets leave the local environment;
- public links can permit anyone with the link to view and, depending on settings, duplicate the project;
- AI prompts and feedback live on a separate service-side ledger from the scene.

The public policy does not pin the model/provider used for each Autodesigner feature, a per-generation retention period, training opt-out semantics or deletion propagation across generated derivatives. Those remain deployment-specific questions for sensitive work.

## Evolution explains the current architecture

| Date / phase | Publicly evidenced shift |
|---|---|
| 2017 | the lineage began as the `pix2code` machine-learning research project |
| 2018 | Uizard formed around a “no-design” product mission |
| 2021 | public product launch centered accessible collaborative UI creation |
| June 2023 | Autodesigner introduced prompt-to-editable multi-screen projects |
| October 2023 | Autodesigner 1.5 moved screen, theme and image generation into the in-editor assistant |
| May 2024 | [Uizard joined Miro](https://uizard.io/blog/uizard-joins-miro/); the announcement said Uizard would remain available while integration options were explored |
| June 2024 | Autodesigner 2.0 added selected-object modification, alternative screens, upgraded scanners and design review |
| April 2026 observable build | the current anonymous client asset exposes newer archive, design-system, chat-patch and asynchronous mutation contracts beyond parts of the 2024 help center |

The product's architecture is therefore evolutionary: recognition tools and prompt generation were absorbed into an existing native editor instead of replacing it with a code-agent workspace.

## What remains unknown

- the native object schema, ordering and serialization used by the current multiplayer editor;
- server-side generation, OCR, layout, image and style-extraction models and their exact versioning;
- conflict resolution and transaction boundaries for simultaneous human, AI and multiplayer mutations;
- whether AI add/modify/delete commands apply atomically and how stale `selectedNodeIds` are rejected;
- the lifetime, cancellation and idempotency rules for generation references and subscriptions;
- current authenticated archive/unarchive behavior and the hard-delete recovery window;
- any durable named project-version or organization backup capability not exposed publicly;
- whether a project is pinned to an immutable Brand Kit/design-system revision;
- generated React structure, dependencies and fidelity across the full component catalog;
- public-link caching, access logging and deletion propagation after unpublish;
- AI provider, training, retention and regional-processing choices for each feature;
- Miro/Uizard data or artifact integration beyond the 2024 acquisition announcement;
- accessibility, localization, responsive and real-device quality of generated screens at production scale.

## Practical acceptance checklist

For a Uizard result to count as a usable design handoff:

1. record the project id, device class, exact generation path and design/brand context used;
2. distinguish candidates from screens explicitly accepted into the prototype;
3. inspect every AI selection command for unintended adjacent additions, modifications or deletions;
4. manually repair scanner discrepancies and preserve rights/provenance for imported assets;
5. exercise the complete intended flow in Preview, including exits, back paths and unsupported interaction cases;
6. duplicate the project before a broad theme or risky restructuring operation when rollback matters;
7. verify collaborators, viewers, public-link access and duplication settings independently;
8. export the intended static/component artifacts and reopen/build them outside Uizard;
9. treat React/CSS handoff as a new implementation fork and establish a mapping/test plan in the destination repository;
10. verify the actual application and deployment separately; a Uizard share receipt is only prototype delivery.

## Evidence ledger

| Evidence | Pin / observation | What it supports |
|---|---|---|
| production Web client | `main.6d8a2b4c.js`; 7,349,073 bytes; SHA-256 `8bc8671e86e39f396521831bab09c1e3ca012a19ff838fbafe38a6ad32f14a4d` | current public client protocol, resource identities and service boundaries |
| source-map probe | same-name `.js.map` returns 4,054-byte Uizard HTML shell | no public source map at the conventional path |
| Autodesigner guide snapshot | fetched 2026-08-11; SHA-256 `5dd1fd8e4539156cf2857cc89b9138c7c2f7e6640341db9f9d107509357214f0` | ordinary generation, selection, chat and regeneration behavior |
| Scanner snapshots | Screenshot guide `4facf104…`; troubleshooting `2d48baf5…`; Wireframe guide `d1b320e9…` | recognition inputs, fidelity and one-at-a-time limits |
| Theme guide snapshot | SHA-256 `6232f0db49ecdf03a23723ae5fb7df166b38068db32c481c1482a16d8f88c311` | preview/apply/revert and editing boundary |
| Interaction guide snapshot | SHA-256 `2a845eed4f2f54cdec17b5ff6f98e164a67acf28c62247711fe467e58a629a1e` | prototype state machine and unsupported interactions |
| Export guide snapshot | SHA-256 `5b4e9286c969ca4c365a41f393db5595db036ed755cfa311ce8e04a56d862300` | static and component-code exit boundary |
| Sharing guide snapshot | SHA-256 `14db3035c517527a368e1615a2f249832d0ba4260b6bcbd98db7da24f94dcebf` | publish, embed, permissions, duplication and non-functional-site boundary |
| Project/Brand snapshots | project guide `1b8acbd…`; Brand Kit guide `d3aa8290…` | autosave/deletion and reusable-style semantics |
| Miro announcement | SHA-256 `770066878e3a9fc22e786e50f0eb7dd091637534620f3b02669c011580f132cd` | ownership and product-continuity transition |

## Primary sources

- [Uizard official site](https://uizard.io/)
- [Current product overview](https://uizard.io/product/)
- [Autodesigner 2.0 product page](https://uizard.io/autodesigner/)
- [Autodesigner 2.0 launch](https://uizard.io/blog/autodesigner-2-0-is-here/)
- [Guide to Autodesigner](https://support.uizard.io/en/articles/7728147-guide-to-autodesigner)
- [Screenshot Scanner](https://support.uizard.io/en/articles/7915206-using-screenshot-scanner)
- [Screenshot Scanner limitations](https://support.uizard.io/en/articles/7927865-troubleshooting-screenshot-scanner)
- [Wireframe Scanner](https://support.uizard.io/en/articles/6435370-using-wireframe-scanner)
- [Theme Generator](https://support.uizard.io/en/articles/7947511-using-theme-generator)
- [Interactive projects](https://support.uizard.io/en/articles/6435343-creating-an-interactive-project)
- [Brand Kits](https://support.uizard.io/en/articles/8725623-using-brand-kits)
- [Project management and deletion](https://support.uizard.io/en/articles/6359662-managing-projects)
- [Exporting projects](https://support.uizard.io/en/articles/6380330-exporting-projects)
- [Sharing and publishing prototypes](https://support.uizard.io/en/articles/6380408-sharing-projects)
- [Uizard joins Miro](https://uizard.io/blog/uizard-joins-miro/)
- [Terms of Service](https://uizard.io/terms-of-service/)
- [Pinned anonymous production bundle](https://app.uizard.io/static/js/main.6d8a2b4c.js)
