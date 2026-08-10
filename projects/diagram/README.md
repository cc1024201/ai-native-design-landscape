# Diagram

> Research status: **Architecture-level / historical closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Diagram Technologies; acquired by Figma on 2023-06-21 |
| Category | Historical Figma-native design automation and generative-design product family |
| Status | Acquired / historical; standalone product availability is no longer verifiable |
| Decisive artifact | Native Figma document, plus product-specific automation/code/prompt side state |
| Source availability | Closed products; public automation JSON, plugin scaffold and open Framer foundation |
| Historical product snapshot | Diagram homepage archived 2023-06-20, one day before acquisition announcement |

## One company, four different design-computation loops

Diagram should not be reconstructed as one generic “AI for design” product. Its public product family exposed four materially different loops:

| Surface | User input | Computation | Visible output | Release boundary |
|---|---|---|---|---|
| Automator | Drag-and-drop actions, variables and optional network data | Recursive action interpreter over the Figma Plugin API | Native Figma node/style/file mutations | Shipped; team cloud sync and 100+ actions documented |
| Magician | Prompt, selected text/layer or current design context | Generative “spells” for icons, images, copy and names | SVG/icon assets, images, text suggestions or renamed layers in Figma | Private beta in 2022; marketed as available by June 2023 |
| Genius | Product description, current design, design-system components and proposed Smart Elements | Contextual UI suggestion/generation using the UI-AI program | Proposed fully editable UI and in-line component suggestions | Preview/waitlist; still labeled “Coming soon” immediately before acquisition |
| Prototyper | Existing Figma layers plus handwritten JavaScript | Closed Figma-to-variable bridge running the open Framer Library | Real-time high-fidelity interactive preview | Publicly launched in 2022; absent from the final 2023 product navigation |

The shared center was Figma, not a Diagram-owned canvas. Each product reached into the current design document differently, and each left a different amount of reusable side state behind.

## Historical boundary: the pre-acquisition homepage is the product ledger

The archived Diagram homepage from 2023-06-20 listed Magician, Genius, Automator and UI-AI. It described Genius and UI-AI as “Coming soon,” Automator as a shipped automation system and Magician as an in-Figma AI utility suite. The next day, Figma announced that it had acquired Diagram and welcomed the five-person team.

Figma's announcement establishes the organizational event, but does not publish a feature-by-feature lineage from Diagram products into later Figma AI. This dossier therefore stops at Diagram's own products and public contracts. It does not relabel later Figma features as Diagram implementations without direct evidence.

Current observations reinforce the historical boundary without supplying a precise shutdown date:

- the old Diagram blog hostname no longer resolves;
- product domains are parked, redirected or no longer present the historical product;
- the original Prototyper documentation domain currently resolves to unrelated content;
- no official product-specific sunset ledger or data-export schedule was found.

Archived official pages are consequently first-class evidence here; current domain ownership is not treated as product documentation.

## Automator: the ordinary-user journey is an executable tree

Automator's central promise was to turn common Figma operations into a reusable visual program:

1. Create an automation in the plugin.
2. Add actions such as getting the current selection, finding a layer, creating a frame, applying a style or fetching a URL.
3. Nest actions to establish execution and data scope.
4. Bind values through built-in or custom variables.
5. Run the automation against the current Figma file.
6. Inspect resulting nodes, variables and console output.
7. Export the definition as JSON, duplicate/remix a community automation or sync a team definition through Diagram's cloud.
8. Keep the resulting design as native Figma document state.

The automation definition and the mutated design are separate artifacts. Re-running the same definition against another file, selection, network response or design-system state can produce a different result.

### The official example exposes the real artifact schema

Diagram's official Airtable tutorial links to a JSON automation published by founder Jordan Singer. The final Gist history commit is `d446085765bbeee68207e9a2961d5e0fd0bd0997`; the file is 6,542 bytes.

Its root shape is:

```json
{
  "id": "kyiz0pkjsx75lgnm6wi",
  "name": "Import from Airtable",
  "description": "",
  "color": "red",
  "actions": [],
  "createdAt": 1642441092211
}
```

Every action recursively uses the same structure:

```json
{
  "id": "...",
  "command": {
    "name": "fetchURL",
    "metadata": { "method": "GET", "url": "..." },
    "title": "",
    "description": ""
  },
  "actions": []
}
```

This is a small executable language rather than a flat macro list:

- `command.name` selects the operation;
- `command.metadata` is an operation-specific parameter map;
- child `actions[]` define structural and asynchronous scope;
- action ids and the root id give definitions internal identities;
- `{{...}}` expressions reference scoped data;
- array/property traversal and arithmetic appear directly in strings;
- guard actions can display a message and stop the automation.

### Nesting defines both order and target

The official nesting guide makes the interpreter semantics explicit:

- a fill action nested under `Create frame` operates on the frame result;
- the same fill action at the root runs independently and lacks that parent target;
- actions nested under `Fetch URL` wait until the request completes;
- a `Repeat` or `For each` action executes its children in the loop scope.

The Airtable example materializes this path:

```text
set base_id
  -> if placeholder remains
       -> show message
       -> stop automation
set api_key
  -> if placeholder remains
       -> show message
       -> stop automation
fetch Airtable records
  -> for each result.records
       -> create frame named from item.fields.Name
            -> set vertical auto layout
            -> insert image from item.fields.Images.0.url
            -> create text from item.fields.Name
```

The X coordinate is stored as `{{index}} * 200`, showing that interpolation is not limited to direct substitution. The graph combines control flow, remote data, canvas creation and layout mutation in one portable definition.

### Variables are lexical-looking run context, not durable design state

Official documentation lists built-ins including:

`index · this · result · automationName · fileName · currentPageName · parent · date · time · item · currentUser · activeUsers`

Some are global to a run; others are exposed by a parent action. `result` carries an operation's output, `item` and `index` carry loop state, and nested actions consume those values. The Inspect view separately displayed created nodes, current variable values and console output.

Variables make the action tree compositional, but public docs do not establish snapshot isolation. Current selection, active users, network payloads, page name and design nodes can change between runs.

### “No code” includes a code and network escape hatch

Automator's public positioning emphasized drag-and-drop automation without code, but the execution surface remained powerful:

- `Fetch URL` could call an external API;
- the Inspect Console accepted valid JavaScript that could interface directly with the Figma Plugin API;
- actions could find nodes/styles by id, react to an external drop event, change the file thumbnail and convert created content to components;
- the September 2022 release documented more than 100 available actions.

“No code” described the main authoring UX, not a low-capability or side-effect-free sandbox.

### The portable JSON is also a credential boundary

The Airtable guide tells the user to replace `YOUR_BASE_ID` and `YOUR_API_KEY`. In the published schema those values live in ordinary `setVariable.metadata.value` strings, and the `fetchURL` URL interpolates them.

Consequences follow directly from the artifact:

- exporting or sharing a configured automation can disclose a credential;
- duplicating a community definition also duplicates any embedded literal values;
- team cloud sync raises an unanswered question about secret filtering and access scope;
- a URL containing a key can appear in logs, inspection or exported JSON;
- no separate secret-reference type is visible in the pinned example.

The tutorial itself warns users not to share the Airtable key, but the public schema does not enforce that advice.

## Automator persistence: program, document and cloud are three clocks

Automator supported several distribution paths:

| State | Persistence role | Established behavior | Unresolved boundary |
|---|---|---|---|
| Figma document | Durable design output | Actions create/update native nodes, styles and file metadata | No public automation-run transaction or revision pin |
| Automation definition | Reusable program | Export/import as JSON; duplicate/delete in plugin | No schema version or migration field in the pinned example |
| Community copy | Discoverable template | Users duplicate an automation to run or remix it | Copy/update provenance and upstream sync are undisclosed |
| Team cloud definition | Shared team procedure | Automator for Teams syncs shared automations to the cloud | Server schema, access control, history and deletion guarantees are closed |
| Run variables/results | Execution context | Scoped values feed nested actions and Inspect | Retention and replay are not documented |

There is no public claim that a run atomically binds automation JSON version, Figma file version, input selection, remote response and every resulting mutation. A failure after some actions execute can therefore leave a partially changed document unless the host or user separately recovers it.

## Magician: AI output becomes native design material

Magician packaged generative behavior as “spells” inside a Figma plugin rather than asking the designer to leave the canvas.

### Four established mutation paths

| Spell | Input | Output in the design workflow | Evidence boundary |
|---|---|---|---|
| Magic Icon | Text prompt | Generated scalable SVG icon for use on the canvas | Exact vector-node conversion, prompt history and model version are closed |
| Magic Image | Text prompt | A selected generated image inserted onto the canvas | Image model, seed, asset storage and regeneration contract are closed |
| Magic Copy | Selected text layer or entered text | Suggested headline/body/CTA alternatives and text rewrites | Specific Text Review API contract is public; Magician backend is closed |
| Magic Rename | Existing layers/design context | Contextual layer names | Selection scope, rename transaction and model inputs are closed |

The durable center is the Figma file after insertion or replacement. Generated alternatives, prompts, safety decisions and model state were not documented as part of Figma version history.

### Magic Copy used Figma's background Text Review API

Figma's own engineering case study states that Magician used the Text Review API so suggestions could appear while a designer typed, without requiring the plugin window as the primary interaction.

The public Figma typings at commit `3c7665daf36e4bd7c90b45738a048dcbdf3a5925`, current on the case-study date, expose:

```ts
type TextReviewEvent = { text: string }

type TextReviewRange = {
  start: number
  end: number
  suggestions: string[]
  color?: "RED" | "GREEN" | "BLUE"
}
```

A plugin requests enablement through `TextReviewAPI`, receives a `textreview` event and returns ranges plus replacement suggestions. This explains the in-editor UX at the platform boundary.

The event contract itself carries text and offsets, not a file id, node id, design-system identity or model revision. Magician code could use other plugin APIs, but its implementation is unavailable; those additional bindings cannot be assumed.

### Model and safety claims stop at the published boundary

Diagram said Magician drew on contemporary generative systems including Stable Diffusion and OpenAI, and that the team fine-tuned output behavior through extensive iteration. It also said explicit-content filtering and broad testing were required because model output was unpredictable.

This does not establish which model powered each spell, whether “fine-tuning” meant model weights or product/prompt tuning, what datasets were used, or how failures were evaluated. No product-specific model card, prompt-retention policy or reproducibility contract was found.

## Genius: a demonstrated direction, not a completed product contract

Genius is the most easily overstated part of Diagram's history. The February 2023 announcement called it a preview and waitlist product. The June 20 homepage still labeled it “Coming soon.”

The demonstrated thesis had three layers:

1. **Contextual autocomplete:** understand the UI already being designed and suggest the next element.
2. **Design-system grounding:** use existing components so suggestions look like the current product rather than a generic generated mockup.
3. **Structured generation:** let Smart Elements establish desired structure/order, then use a product description or prompt to generate fully editable UI.

The homepage also depicted inviting Genius into a Figma file and chatting with it so it could answer a design question or add a component. Those are product-direction demonstrations, not evidence of a generally available agent runtime.

### UI-AI was the proposed model layer

Diagram used “UI-AI” for a model program intended for designers. The Genius announcement said the team was combining LLMs, diffusion models and creative prompting, and previewed a custom icon model named UI-AI Glyphs. The pre-acquisition homepage expanded the proposed family to glyphs, emojis, fonts and layers, including multimodal text/image prompts.

Material unknowns remain:

- model architectures, weights, training data and licenses;
- how a Figma document or design system was serialized for inference;
- component retrieval/ranking and constraint enforcement;
- editable-output schema and node/component fidelity;
- whether Smart Elements were Figma nodes, plugin data or service-side objects;
- prompt/version history, collaboration and rollback;
- which demonstrated capabilities reached users before acquisition.

The correct historical label is **design-system-aware generative companion preview**, not shipped autonomous design agent.

## Prototyper: a forward binding from Figma layers into code

Prototyper, launched publicly in June 2022, followed a different technical direction. It placed a code editor beside the design canvas, rendered a real-time preview and turned every Figma layer into a variable that JavaScript could manipulate.

Its loop was:

```text
native Figma layers
  -> closed Diagram layer-to-variable bridge
  -> user-written JavaScript
  -> Framer Library layer/animation/gesture runtime
  -> live interactive preview
```

This is a forward design-to-runtime binding. It is not evidence that Figma nodes were bound to repository source files, nor that edits in the preview round-tripped into the design document.

### Open Framer is the runtime foundation, not the product source

Diagram explicitly credited the old open-source Framer Library. The official Diagram organization retains a fork at commit `477b95a8433522620c553d147cea109d5213bacd`, identical to its upstream pin and MIT-licensed.

That source contains the generic prototyping substrate: layers, animation loops/curves, gestures, draggable behavior, flows, scrolling, page/grid/slider components and rendering context. Its README describes an open JavaScript framework for high-fidelity animations and interactions and a workflow combining visual layers with code.

The public repository does **not** contain Prototyper's Figma plugin, its layer-name/id-to-variable generator, code persistence, preview bridge, error handling or sharing model. The product-specific binding remains closed.

### The missing artifact contract matters

Official material establishes that code runs against layer variables and produces a real-time preview, but does not say where that code is durably stored:

- in Figma plugin data;
- in a Diagram account;
- in browser/client storage;
- in an exported project;
- or only in the current plugin session.

It also does not establish rename stability. If a Figma layer becomes a JavaScript variable, duplicate/invalid names and subsequent renames need an identity scheme, but no public contract exposes it. This is the decisive unknown for recovering or sharing a Prototyper artifact.

## Shared artifact authority and product-specific side state

Across the product family, the most stable statement is:

> The Figma document owns durable design state; Diagram products add generators, executable definitions, model context or prototype code around it.

| Product | Figma-native durable result | Side state that matters | Public recovery limit |
|---|---|---|---|
| Automator | Created/modified nodes, styles and file metadata | Recursive JSON program, cloud/team/community copy, transient variables | No run-level transaction or definition-to-file-version binding |
| Magician | Inserted SVG/image assets, rewritten text, renamed layers | Prompt, alternatives, model/safety decisions | Prompt/output history and regeneration identity undisclosed |
| Genius | Proposed editable Figma UI/components | Smart Elements, design-system context, chat/model state | Preview never exposed a complete persistence contract |
| Prototyper | Original Figma design layers | JavaScript and generated layer-variable binding | Code storage, identity stability and preview sharing undisclosed |

Figma's native collaboration/versioning can preserve document mutations according to Figma's own rules. It does not automatically preserve a Diagram automation version, model prompt, rejected generation or Prototyper code unless the plugin explicitly stores that state—and that storage is not public.

## Failure atlas

| Apparent success | Actual failure boundary | Evidence needed before acceptance |
|---|---|---|
| Automator completed | Earlier actions may have mutated the file before a later action/network request failed | Inspect all changed nodes/styles and test failure midway through the graph |
| An automation works in one file | Selection, ids, styles, variables and remote data can differ in another file | Re-run on a disposable copy with pinned inputs |
| JSON export is portable | It may contain credentials and has no visible schema version | Remove secrets, diff the JSON and test import before sharing |
| Team/community automation is available | A duplicated/cloud copy can drift from its source | Record definition id/hash/version and ownership separately |
| Inspect shows expected variables | Inspect state is run evidence, not replayable document history | Verify native Figma output and retain sanitized input data |
| “No code” sounds safe | Fetch URL and arbitrary Console JavaScript expand side effects | Review network endpoints, permissions and code before execution |
| Magic Copy suggests the right sentence | Text Review ranges do not prove design/context/model identity | Review the actual text layer, tone, localization and final document diff |
| Magic Icon/Image looks usable | Model output can be unsafe, inconsistent or legally ambiguous | Review content, editability, licensing and export fidelity |
| Magic Rename cleans the layer panel | Reused/component layers can be renamed too broadly | Inspect component/instance scope and downstream conventions |
| Genius demo generates coherent UI | The product remained preview/coming soon with no complete artifact contract | Require a real editable file, component fidelity and recovery test |
| Genius says it uses the design system | Retrieval, component identity and constraint enforcement are undisclosed | Inspect whether output uses real components/variants rather than lookalikes |
| Prototyper preview is interactive | Code persistence and layer-variable identity are unknown | Reload/rename/share and prove the prototype can be recovered |
| Acquisition implies product continuity | No official feature-by-feature migration or data-export ledger exists | Treat each product account/artifact as a separate historical dependency |

## Public source boundary and immutable pins

### Official Diagram plugin scaffold

The only non-fork public repository that directly represents Diagram's plugin development is `diagram/diagram-figma-plugin-template` at `4be9c8d50d734c99167055591464f53c1e6e6cef`.

It contains a minimal Figma plugin scaffold:

- `manifest.json` points `main` to `dist/code.js` and `ui` to an inlined `dist/ui.html`;
- TypeScript builds separate plugin and UI entries;
- React 17 renders the UI;
- Webpack 5 and `InlineChunkHtmlPlugin` package the iframe UI;
- the plugin entry only calls `figma.showUI`;
- production disables source maps; development uses inline source maps.

This establishes an official team template and plausible platform boundary, not the stack of Automator, Magician, Genius or Prototyper. The repository has no root license file; its `package.json` says MIT. That inconsistency is recorded rather than normalized into a product-source claim.

### What is not public

No official repository was found for:

- Automator's interpreter, action catalog, cloud sync or community service;
- Magician's plugin/backend, prompts, safety layer or model adapters;
- Genius, Smart Elements or UI-AI models;
- Prototyper's Figma bridge and code/preview persistence;
- account/billing services or product databases.

The pinned Automator JSON is a real user artifact, the Figma typings are a real host API contract and Framer is a real runtime foundation. None substitutes for Diagram's proprietary implementations.

## Evolution: from deterministic automation to contextual generation

| Date / period | Established event | Technical change |
|---|---|---|
| 2020 prototype lineage | Jordan Singer demonstrates a GPT-3-driven Figma “Designer” concept | Prompt-to-design becomes an early exploration |
| Early 2022 | Automator ships as Diagram's first product | Reusable recursive action graphs automate native Figma operations |
| 2022-05 | Diagram announces its seed round around design + AI | Deterministic automation becomes the base for a broader product family |
| 2022-06 | Prototyper launches publicly | Existing layers become code variables in a Framer-powered preview |
| 2022-09 | Automator `1.5.3` adds team cloud sync and documents 100+ actions | Personal JSON programs gain organizational distribution |
| 2022-11 | Magician private beta begins | Prompted icon/image/copy generation enters the Figma canvas |
| 2022-12 | Figma documents Magic Copy's Text Review API integration | AI suggestions move into background typing interaction |
| 2023-02 | Genius preview and UI-AI model program are announced | Generation shifts toward current-design and design-system context |
| 2023-06-20 | Final pre-acquisition homepage still marks Genius/UI-AI coming soon | Shipped utilities and future companion remain distinct |
| 2023-06-21 | Figma acquires Diagram | Standalone company lineage ends; exact product migrations remain unpublished |

## Facts, inferences and material unknowns

### Directly established

- Diagram shipped Figma-native Automator, Magician and Prototyper products and previewed Genius/UI-AI before acquisition.
- Automator definitions are exportable recursive JSON action trees with operation-specific metadata and nested variable scope.
- The pinned official example combines guards, stop behavior, external fetch, loops, layout and native node creation.
- Automator supported community duplication and later team cloud sync; official documentation claimed more than 100 actions.
- Magician generated icons, images and copy and later renamed layers; inserted/rewritten output lived in the Figma workflow.
- Magic Copy used Figma's Text Review API; the public event/return types are text plus range suggestions.
- Genius was still a preview/coming-soon product immediately before acquisition.
- Genius proposed design-system-aware autocomplete and Smart Element-structured generation backed by the UI-AI program.
- Prototyper converted Figma layers into variables for code-driven Framer Library previews.
- Framer Library, Figma plugin typings and Diagram's minimal scaffold are public; Diagram product cores are not.
- Figma announced Diagram's acquisition on 2023-06-21.

### Evidence-backed inferences

- Diagram's durable-center strategy was **native-document augmentation**: improve or automate a Figma file instead of replacing it with a new proprietary canvas format.
- Automator is best modeled as a recursive interpreter whose tree structure establishes execution/data scope; the Figma document is its mutation target, not its program store.
- Magician is a set of narrow generative transforms rather than one general agent loop.
- Genius attempted to move from prompt-only generation toward ambient design context and reusable component constraints, but the public artifact contract never matured before acquisition.
- Prototyper created a forward design-node-to-runtime-code binding; its missing persistence/identity contract prevents stronger recoverability claims.
- The product family evolved from deterministic actions, through code/runtime augmentation and narrow AI utilities, toward a contextual design companion.

### Material unknowns

- Product-core source, backend services, database schemas, deployment history and original commit lineage.
- Automator schema evolution, interpreter ordering under errors, undo grouping, id collision handling and atomicity.
- Team cloud/community definition history, access control, deletion, provenance and credential filtering.
- Exact Magician model/provider mapping, prompts, data retention, safety thresholds, asset licensing and reproducibility.
- Genius/Smart Element serialization, design-system retrieval, editable-output fidelity and actual pre-acquisition rollout.
- UI-AI weights, datasets, licenses, evaluations and whether any announced custom models shipped.
- Prototyper code storage, layer-variable naming/identity, reload behavior, export and collaboration.
- A product-specific privacy contract for Figma document content and prompts; the archived generic 2021 website policy is insufficient.
- Official shutdown, export or migration dates for each standalone product.
- A documented feature-level mapping from Diagram products to later Figma AI.

## Acceptance checklist for reconstructing a Diagram workflow

1. Name the exact product and historical date; do not collapse Automator, Magician, Genius and Prototyper into one behavior.
2. Work on a copy of the Figma file when running an untrusted or complex automation.
3. Export and diff the Automator JSON; record its id/hash and remove API keys or other literal secrets.
4. Pin the selected nodes, page, component/style libraries and remote input schema before a run.
5. Test network failure and a mid-graph stop; inspect partial native-document mutations.
6. Treat community/team copies as forks unless an explicit update/provenance contract is demonstrated.
7. Review every AI-generated icon, image, text and layer rename for scope, safety, licensing and editability.
8. Preserve prompts/model context separately when reproducibility matters; Figma output alone does not capture rejected alternatives or generation settings.
9. For Magic Copy, verify the final text layer and localization instead of accepting range suggestions as durable intent.
10. Treat Genius capabilities as historical preview claims until an actual pre-acquisition editable artifact proves otherwise.
11. For Prototyper, prove code survives reload, layer rename, duplication and collaborator handoff before calling the prototype durable.
12. Keep a native Figma version/export and a portable side-artifact copy before relying on historical product services.

## Primary sources and evidence pins

### Lifecycle and product-family snapshot

- [Diagram's archived 2023-06-20 homepage](https://web.archive.org/web/20230620224003id_/https://diagram.com/)
- [Figma acquisition announcement](https://www.figma.com/blog/ai-the-next-chapter-in-design/)
- [Archived seed announcement](https://web.archive.org/web/20220502141122id_/https://blog.diagram.com/p/diagrams-3m-seed)

### Automator

- [Archived Automator introduction](https://web.archive.org/web/20220521222321id_/https://blog.diagram.com/p/welcome-to-automator)
- [Archived action semantics](https://web.archive.org/web/20220627054406id_/https://blog.diagram.com/p/actions)
- [Archived nesting semantics](https://web.archive.org/web/20220627050121id_/https://blog.diagram.com/p/nesting-actions)
- [Archived automation settings/export documentation](https://web.archive.org/web/20220627063641id_/https://blog.diagram.com/p/automation-settings)
- [Archived default-variable documentation](https://web.archive.org/web/20220627054033id_/https://blog.diagram.com/p/default-variables)
- [Archived Community documentation](https://web.archive.org/web/20220627060350id_/https://blog.diagram.com/p/community)
- [Archived team-sync and 100+ action release](https://web.archive.org/web/20220927204205id_/https://blog.diagram.com/p/whats-new-automator-for-teams-documentation)
- [Archived Airtable tutorial](https://web.archive.org/web/20220627060225id_/https://blog.diagram.com/p/importing-from-airtable-into-figma)
- [Official Airtable automation Gist at `d4460857...`](https://gist.github.com/jordansinger/1788b0fa378117c5df15ea316a7c3baa/d446085765bbeee68207e9a2961d5e0fd0bd0997)
- [Archived Automator Inspect release](https://web.archive.org/web/20220930050407id_/https://blog.diagram.com/p/whats-new-inspect-view-and-variable)

### Magician, Genius and Prototyper

- [Archived Magician announcement](https://web.archive.org/web/20221121161029id_/https://blog.diagram.com/p/introducing-magician)
- [Figma engineering case study of Magician's Text Review API use](https://www.figma.com/blog/how-magician-uses-figmas-text-review-api/)
- [Figma plugin typings at `3c7665da...`](https://github.com/figma/plugin-typings/blob/3c7665daf36e4bd7c90b45738a048dcbdf3a5925/plugin-api.d.ts)
- [Archived Genius/UI-AI announcement](https://web.archive.org/web/20230209195735id_/https://blog.diagram.com/p/introducing-genius)
- [Archived Prototyper announcement](https://web.archive.org/web/20220623134532id_/https://blog.diagram.com/p/introducing-prototyper)
- [Open Framer Library foundation at `477b95a8...`](https://github.com/koenbok/Framer/tree/477b95a8433522620c553d147cea109d5213bacd)

### Official public-code boundary

- [Diagram GitHub organization](https://github.com/diagram)
- [Diagram Figma plugin scaffold at `4be9c8d5...`](https://github.com/diagram/diagram-figma-plugin-template/tree/4be9c8d50d734c99167055591464f53c1e6e6cef)
- [Scaffold build configuration at the pin](https://github.com/diagram/diagram-figma-plugin-template/blob/4be9c8d50d734c99167055591464f53c1e6e6cef/webpack.config.js)
- [Diagram's Framer fork at the upstream-equivalent pin](https://github.com/diagram/Framer/tree/477b95a8433522620c553d147cea109d5213bacd)

No authenticated historical product session or mutation was executed. Runtime claims stop at Figma's official acquisition/API evidence, archived Diagram-owned product material, the pinned automation artifact and immutable public repository boundaries.
