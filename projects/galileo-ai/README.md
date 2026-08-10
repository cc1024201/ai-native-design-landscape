# Galileo AI

> Research status: **Architecture-level / historical closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Galileo AI, Incorporated; founded by Arnaud Benard and Helen Zhou |
| Category | Historical prompt/image-to-UI design workspace |
| Status | Historical; the legacy domain now redirects to Google Labs Stitch |
| Historical evidence window | Late 2022 origin through the public 2024 Galileo product |
| Decisive artifact | Hosted chat message containing one or more generated screen variants and a shared theme |
| Downstream artifact | One-way HTML clipboard materialization pasted into a separate Figma document |
| Source availability | Closed product; archived shipped web-client bundles and public projections are inspectable |

## Historical boundary: product continuity is visible, transaction details are not

Galileo AI's own public history starts in late 2022, reaches a private beta in October 2023 and a public beta on 2024-02-06. The historical product described itself as a prompt-to-UI system for designers and builders and exposed separate text-to-UI, image-to-UI, Explore, design-share and pricing routes.

As of this review, `https://www.usegalileo.ai/` returns a permanent redirect to `https://stitch.withgoogle.com/`. Google's 2025-05-20 Stitch launch is co-authored by Galileo co-founder Arnaud Benard and describes the same broad input/refinement/export family: prompt or image input, multiple variants, conversational iteration, theme controls and paste to Figma. Those facts establish a strong product-line continuity and make Stitch the current destination for the former Galileo domain.

They do **not** establish the legal mechanics of that transition. No primary source located for this dossier announces an acquisition price, effective transaction date, account migration contract or feature-by-feature transfer. The bounded conclusion is therefore:

- the 2024 Galileo application is a historical product;
- the old official domain now assigns traffic to Stitch;
- Google officially launched Stitch in May 2025 with Benard as a named author;
- current Stitch behavior belongs to the separate active Stitch dossier;
- corporate acquisition terms and exact Galileo shutdown/migration dates remain unknown.

## The decisive mechanism is screen lineage inside a hosted design thread

The useful unit of Galileo was not an isolated generated bitmap. Its shipped client distinguished at least four identities:

```text
chat/thread
  -> user message
  -> bot chat_message_id
       -> screen id [variant 0]
       -> screen id [variant 1]
       -> ...
```

A later request could point back to `based_on_screen_id`; retry could address a failed subset through `screen_ids`; theme changes targeted the bot message and caused its screens to be regenerated asynchronously. The screenshot was a projection of a screen. It was not the complete editing protocol.

This changes the correct artifact model:

> Galileo's editing center was a hosted thread of messages and screen variants. Raster images, public share pages and pasted Figma layers were separate projections or forks of that center.

No public contract exposes an immutable version graph, transactional rollback or a reverse binding from Figma back to a Galileo screen.

## Ordinary-user journey

The archived product and shipped client establish this historical path:

1. Start a new design and choose mobile or desktop.
2. Enter a natural-language product/UI request, or use the image-to-UI path with a wireframe, screenshot or other image.
3. Choose how many variants to generate and whether the thread is public or private when that feature is available.
4. Submit the request; the hosted generation service creates a chat/message and queues screen variants.
5. Observe each screen resolve independently into a rendered design or a typed failure.
6. Compare variants and expand a chosen screen.
7. Refine from a selected screen; the next request carries its `based_on_screen_id` rather than silently treating the result as unrelated.
8. Retry only failed screen ids while retaining the original message, base screen and theme context.
9. Open the theme editor and apply appearance, preset/color, corner-radius and font changes to the message's screens.
10. Keep the thread private or expose it through public Explore/share behavior.
11. Export a selected screen by copying an HTML payload to the operating-system clipboard, then paste it into Figma.
12. Treat the resulting Figma document as a new downstream authority; no reverse synchronization is established.

The public-beta announcement adds the product-level intent: one prompt should produce multiple layout options in under a minute, including UI elements, images and product copy, so a user can select a direction and continue iterating.

## Creation protocol: the public client exposes the request contract

The fixed 2024 create-route bundle constructs the generation request from these fields:

```text
input
device_type
num_variants
is_public
chat_id
chat_message_id
screen_ids
based_on_screen_id
chat_type
theme
input_image
```

The field set reveals several independent concerns rather than one opaque prompt:

| Field group | Role | Consequence |
|---|---|---|
| `input`, `input_image`, `chat_type` | Text or multimodal intent | Image-to-UI is an explicit path, not merely an image embedded in ordinary chat |
| `device_type`, `num_variants` | Output envelope | Mobile/desktop and exploration breadth are request state |
| `chat_id`, `chat_message_id` | Conversation and retry identity | A generation belongs to a hosted thread/message rather than a stateless endpoint call |
| `screen_ids` | Partial retry target | One failed variant can be retried without asking for every screen again |
| `based_on_screen_id` | Refinement lineage | A later design can declare which prior screen it follows |
| `theme` | Image-to-UI/style context | Visual constraints travel separately from the prose input |
| `is_public` | Publication choice | Visibility is a first-class request property, not just a share button after generation |

The bot-message projection in the same client includes:

```text
screens · bot · in_progress · failed · chat_text · title · description
error_type · theme · chat_message_id · based_on_screen_thumbnail_url
```

Screens are sorted by `design_index`. Each can carry its own `failed`, `in_progress`, stage and error state while remaining under one message. This is why “the generation succeeded” is too coarse an acceptance condition: a message can exist while only some variants complete.

### Refinement is explicit lineage, but not a documented version graph

When retrying, the client recovers the preceding user message and sends:

- the failed screen ids;
- the failed bot message id;
- the prior `based_on_screen_id`;
- the bot message theme.

That is a real lineage and recovery contract. It still does not prove:

- immutable parent/child revisions;
- named versions or branching history;
- a way to restore a previous message as the current head;
- conflict handling for two simultaneous refinements;
- retention of rejected variants after deletion/account termination;
- a transaction joining prompt, theme, every screen and exported destinations.

The safest model is a **hosted conversational screen lineage**, not a source-controlled design document.

## A screen has structured metadata beyond its raster

The archived mobile and web Explore pages server-rendered a real public feed into `__NEXT_DATA__`. Both snapshots used build `-_PEHrvdxvKu1DOE7NoK1`, exposed 30 initial records and reported 282 total records for the selected device category.

A public feed record had this shape:

```json
{
  "id": "<design UUID>",
  "screen": {
    "id": "<screen UUID>",
    "screenshot_url": "https://cdn.usegalileo.ai/screenshots/<uuid>.webp",
    "feed_image_url": "https://cdn.usegalileo.ai/feed-images/<uuid>.webp",
    "dimensions": { "width": 390, "height": 844 },
    "theme": {
      "font": "inter",
      "mode": "light",
      "preset": null,
      "roundness": 3,
      "saturation": 2,
      "primaryColor": "#197fe6",
      "secondaryColor": null,
      "autoGenerated": true
    },
    "completed_at": "2024-02-01T...",
    "device_type": "mobile"
  },
  "title": "...",
  "description": "...",
  "user_input": "...",
  "user": {
    "id": "<user UUID>",
    "name": "...",
    "username": "..."
  }
}
```

The desktop example uses 1280 × 1850 dimensions and a different font while retaining the same identity/theme structure. Public evidence therefore establishes this projection:

```text
public design UUID
  -> screen UUID
       -> screenshot image
       -> feed image
       -> dimensions
       -> device type
       -> theme
  -> prompt + title + description + user identity
```

This does not prove that the feed record is the private database schema. It does prove that Galileo kept a design/share identity separate from the screen identity and could publish prompt, author, theme and raster metadata together.

### A public design page is a narrower share projection

The archived `/d/<designId>` page used build `rCj838W6gkIfDDLe3NK2X`. Its server-rendered page props exposed only `imageUrl`, `title`, `description` and observability metadata. The image came from a Google Cloud Storage `og-images` path.

The public page is therefore evidence of a share/preview projection, not a complete portable artifact. Its small SSR shape says nothing about fields retained by the private service and cannot be used to claim that a design consisted only of one image.

## Theme editing is message-scoped regeneration

Galileo's theme editor did not merely repaint a local screenshot. It targeted:

```text
/chats/{chatId}/messages/{chatMessageId}/theme
```

The editor exposed:

- light/dark appearance;
- named presets or custom primary/secondary colors;
- corner-roundness levels;
- font selection;
- a saturation field present in the theme model, although the inspected UI marked that control disabled.

On **Apply Theme**, the client sent the new theme, received a list of screen ids, marked those screens as in progress and subscribed to per-screen completion/error events. A successful event replaced that screen's design data; an error marked only that screen failed. The client used a Pusher-backed event channel for this asynchronous update boundary.

The correct interpretation is:

> Theme is a generation constraint shared by a message's screens. Applying it requests new screen results; it is not evidence of deterministic local token mutation on an editable node tree.

Consequences:

- two screens under one message share a theme but still complete independently;
- applying a theme can partially fail;
- the returned screen data may differ beyond the visibly changed color/font controls;
- no public diff describes which internal properties changed;
- no atomic rollback joins all regenerated variants;
- preset names and generated color maps are service/client concepts, not Figma design-token bindings.

## Figma export is one-way HTML clipboard materialization

The shipped `920` chunk exposes the complete client-side handoff sequence:

1. Request `/screens/{screenId}/figma` with a plain-text content type.
2. If the service reports `Out of quota`, show the Figma-export quota error.
3. Use the returned value as the target of a second request.
4. Receive an HTML string.
5. Construct `new Blob([html], { type: "text/html" })`.
6. Write it with `navigator.clipboard.write([new ClipboardItem(...)])`.
7. Tell the user to paste with Cmd/Ctrl+V in Figma.
8. Mark `/screens/{screenId}/exported` and record the export event.

This establishes the bridge exactly:

```text
Galileo screen id
  -> service-produced HTML payload
  -> browser clipboard item: text/html
  -> user paste
  -> destination-owned Figma document
```

It is not a Figma REST API integration, a plugin node mutation, a file-key binding or a live sync channel. No Figma file id, node id, component identity or return path appears in the export client flow.

Material limits follow:

- clipboard permission and browser support can fail after the export payload is ready;
- the client checks and reports an export-specific quota separately from the generation request; whether both consume one plan counter is unknown;
- “copied” confirms a clipboard write, not successful Figma paste or layer fidelity;
- `/exported` is an analytics/accounting marker, not proof that Figma accepted the document;
- the HTML payload's exact structure and conversion fidelity were not observed in an authenticated session;
- edits made in Figma cannot be assumed to update the originating Galileo screen.

## Public/private and the data-use boundary

The client carries `is_public` on generation and includes a dated private-design feature flag. The public Explore projection shows why this setting matters: a published record can expose the prompt, user name/username, title, description, screen theme and raster assets.

The December 2023 terms add a separate legal/data clock:

- Galileo defined the prompt/request as **User Inputs** and generated designs as **System Outputs**.
- As between user and Galileo, the user owns System Outputs.
- The user nevertheless grants Galileo a worldwide, perpetual, irrevocable, transferable and sublicensable license over inputs and resulting outputs for operating, promoting, redistributing, training, improving and developing the service/business.
- User Submissions include both inputs and outputs; some may be viewable by other users.
- Usage information could also be licensed for developing and training algorithms/models.
- Account termination may destroy associated content, and recovery is not promised.

The archived privacy policy says the service could disclose data to AI-generation/content providers including OpenAI, Stability and Unsplash, and could retain anonymized/aggregated information for service improvement. This policy is disclosure evidence, not proof that every provider processed every design or which model produced a specific screen.

“Private” should therefore be interpreted narrowly as a product visibility control unless a stronger contract is demonstrated. It does not, by itself, negate the terms' training/service-development license or establish a retention/deletion guarantee.

## Model direction: specialized UI learning, with no reproducible model pin

Galileo's public-beta announcement makes stronger technical claims than the generic “LLM generates UI” description:

- the team found out-of-the-box language models insufficiently aware of interface-design subtleties;
- it trained specialized models on tasks aligned with UI design standards;
- the training focus included components, colors, styles and design principles;
- the team said it built a custom UI-design dataset;
- image-to-UI interpreted both text and images to transform wireframes/screenshots into high-fidelity designs.

The shipped client also contains a dated `_2024_01_16_GPT4V` feature-flag name. That string is evidence that a GPT-4V-labelled rollout path existed in client configuration. It is **not** enough to assign GPT-4V to every production request, establish a model version, or infer the full generation pipeline.

No public model card, weights, dataset manifest, evaluation set, seed/reproducibility contract or prompt/version pin was found. Generated screen identity is durable enough for refinement, but not reproducible from disclosed model inputs alone.

## Client/runtime boundary and immutable evidence pins

The historical product shipped as a closed Next.js web application. The archived app exposes a REST-like generation boundary at `ml-api.usegalileo.ai`, Auth0-hosted authentication, Pusher-backed asynchronous screen events and CDN/object-storage projections. These are client-observable integration boundaries, not a disclosed backend architecture.

The 2024-03-13 create snapshot uses build `2LPzCAMtgpZAYIi8_JGCV`. Its decisive archived chunks are pinned by content hash:

| Archived client artifact | Bytes | SHA-256 | Evidence role |
|---|---:|---|---|
| Create route `[[...chatId]]` | 30,269 | `BA9641712B431A09774D5BDB71094D7ED140A4FE754E5E036BE8F1A9B0E1EBDD` | Thread UI, retry and screen-lineage behavior |
| Shared chunk `920` | 41,840 | `0E4BA29B284CDAC644288C1A454B07EF33714D13BF38BC76C8CE24E12AB791AB` | Generation payload, theme update and Figma clipboard flow |
| Shared chunk `267` | 28,913 | `9EA6EF5F9041FC6105E98FCD7C631EF123065E47962A640BC0B6EB180911D01D` | Supporting editor behavior |
| Shared chunk `974` | 5,260 | `D23507D090D33E1E405AC8FCA8AF9288BB244267AB91790CD832578CB33FA31B` | Supporting shared runtime |
| `_app` chunk | 4,983,190 | `CA9C9F39376E2E1BD33412396CB8FFC4F707D50CF9218D6CC4222FE47D48E3BD` | Constants, error taxonomy, flags and integration hosts |

These minified files contain no `sourceMappingURL` marker. They expose shipped client behavior, not original TypeScript, server code, database schemas or model implementation. No official public repository for the Galileo product core was found.

### Client-visible generation stages are failure boundaries, not a server diagram

The app's error taxonomy names:

```text
InvalidInputError
ModerationError
MaliciousPromptError
GenerationPreparationError
ThemePredictionError
GenerationQueuingError
PromptRewritingError
LayoutPredictionError
ImagePredictionError
RenderingError
TitlePredictionError
EnhanceYourCalmError
GenerationQuotaExceededError
AssistantTimeoutError
```

The names establish user-visible distinctions among validation/moderation, preparation, theme, queue, prompt rewriting, layout, image, rendering, title, rate, quota and timeout failures. They do not prove one microservice per name, execution order in every request or the underlying model/provider for each stage.

## Persistence clocks

Galileo's historical workflow spans several independently changing states:

| State | Durable role | Established behavior | Break |
|---|---|---|---|
| Account | Access, plan and identity | Owns user/profile, credits and hosted work access | Termination can destroy associated content; recovery is not promised |
| Chat/thread | Conversational container | Addressed by `chat_id` and route | Schema, retention, collaboration and export are closed |
| User/bot message | Request/result group | Bot message has one theme and multiple screens | No immutable version/transaction contract |
| Screen variant | Refinement and export target | Has screen id, design index, render state and optional parent screen | Parent semantics survive requests, but branch/history UI is undocumented |
| Theme | Message-level generation constraint | Saved to a message and regenerates screens asynchronously | Partial per-screen failure; no atomic rollback or token binding |
| Raster assets | Screenshot/feed/share projections | Stored under screenshot, feed-image and OG-image categories | Image availability is not portable structured-design recovery |
| Public design/share | Publication projection | Joins design id, screen, prompt, author and metadata | Can expose intent/identity; private backend shape remains unknown |
| Figma clipboard/paste | Downstream editable fork | HTML copied then pasted into a destination document | Clipboard success is not paste/fidelity proof; no reverse sync |
| Credits/export quota | Service entitlement | Client exposes generation-quota and Figma-export-quota failures at separate request boundaries | Whether they share one counter is closed; artifact state and entitlement can diverge |
| Training/service license | Long-lived data-use right | Terms license inputs, outputs and usage beyond account life | Deletion of hosted work does not imply revocation of the granted license |

There is no public atomic join across these clocks. A user can have a completed screen but a failed share, a copied payload but no Figma document, a public raster whose original thread is gone, or a regenerated theme with only some variants updated.

## Failure atlas

| Apparent success | Actual failure boundary | Evidence needed before acceptance |
|---|---|---|
| The bot message appeared | Individual screens can still be queued, failed or timed out | Check every requested variant and its final state |
| One variant looks good | Other variants may have failed at different named stages | Record screen ids and retry only the intended failures |
| A refinement resembles the selected screen | `based_on_screen_id` establishes lineage, not a lossless version/rollback graph | Preserve the source screen and compare changed structure/content |
| Retry succeeded | It can reuse stale prompt/theme/base context or replace only a subset | Verify requested `screen_ids`, parent and theme |
| Apply Theme completed | Screens update asynchronously and can partially fail | Wait for every screen completion/error event and compare each result |
| Colors/font changed | Theme regeneration may alter more than deterministic style tokens | Diff layout, copy, imagery and component structure too |
| Public share opens | The share page is a raster/metadata projection, not portable editing state | Reopen the authenticated thread and independently preserve output |
| Private is selected | Visibility control does not prove no training, retention or provider disclosure | Review the applicable terms/privacy contract and avoid sensitive input |
| Figma export says copied | Only an HTML clipboard write is established | Paste into a real file, inspect layers/components/assets and save it |
| Figma paste looks correct | No screen↔Figma identity or reverse sync exists | Test editability, constraints, fonts and component semantics |
| An image is available on the CDN | Raster survival does not recover prompts, variants, theme or editable structure | Preserve thread metadata and destination-native artifacts separately |
| Account work is visible today | Termination/service transition can destroy hosted content | Export before shutdown/migration and verify the exported destination |
| A feature flag names GPT-4V | Flag labels do not prove request routing or exact model version | Require a model/version contract or treat provider as unknown |
| The old domain opens Stitch | Redirect proves current routing, not acquisition terms or data migration | Keep lifecycle claims limited to the observable product continuity |

## Evolution

| Date / period | Established event | Technical/product change |
|---|---|---|
| Late 2022 | Founders begin the text-to-UI project | UI generation becomes the product thesis |
| 2023-10 | Private beta rollout begins | Designers, founders and engineers exercise multi-variant generation |
| 2023-11 to 2024-01 | Dated client flags cover private designs, Figma export, GPT4V and free credits | Visibility, downstream handoff, multimodal experimentation and entitlement become explicit product concerns |
| 2024-02-06 | Public beta and $4.4M seed round announced | Text-to-UI becomes public; image-to-UI remains an R&D/new feature direction |
| 2024-02/03 snapshots | Explore, design-share, creation and pricing surfaces are publicly archived | Hosted design/screen/theme projections and the clipboard export protocol are inspectable |
| 2025-05-20 | Google Labs launches Stitch; Arnaud Benard is a named co-author | Active successor destination expands the broad prompt/image/variant/theme/Figma direction to frontend code |
| By 2026-08-11 | `usegalileo.ai` permanently redirects to Stitch | Standalone Galileo domain no longer presents the historical product |

The exact standalone shutdown date, account migration window and data/export notice remain unpublished in the primary evidence located here.

## Facts, inferences and material unknowns

### Directly established

- Galileo launched a prompt-to-UI public beta on 2024-02-06 after an October 2023 private beta.
- Its official announcement describes specialized UI-task models, a custom UI dataset, multi-variant generation and image-to-UI.
- The shipped client addresses chats, bot messages and screens separately.
- Requests carry device, variant count, visibility, retry screen ids, parent screen id, theme and optional image.
- Theme applies to a message and triggers asynchronous screen completion/error handling.
- Public Explore records expose separate design and screen ids, prompt, author, theme, dimensions and raster URLs.
- Public design pages are narrower image/title/description projections.
- Figma export obtains HTML and writes it to the clipboard as `text/html` before the user pastes it.
- The export flow contains no Figma file/node identity or reverse synchronization path.
- The terms assign System Output ownership to the user while granting Galileo broad perpetual licenses over inputs, outputs and usage for training/service development.
- The current official domain permanently redirects to Stitch.
- Google's official Stitch launch is co-authored by Galileo co-founder Arnaud Benard.

### Evidence-backed inferences

- The working artifact was a hosted **screen-lineage thread**, not a standalone bitmap and not a repository source tree.
- `based_on_screen_id` makes refinement lineage explicit, but the absence of version/rollback contracts prevents calling it an immutable revision graph.
- Theme editing is best understood as constrained regeneration because it returns/replaces screens asynchronously rather than mutating a disclosed node/token graph locally.
- Public share and Figma paste are downstream projections/forks that can outlive or diverge from the hosted thread.
- The old-domain redirect, shared founder authorship and overlapping workflow establish product-line continuity toward Stitch, but not the legal form of the transition.

### Material unknowns

- Corporate transaction/acquisition terms, effective date and team/account migration contract.
- Exact shutdown date and whether every historical account/design was migrated, exportable or deleted.
- Server implementation, database schema, queue topology, renderer, model orchestration and deployment history.
- Exact model/provider used per generation stage or request; model weights, prompts, datasets and evaluation results.
- Internal editable-screen representation and how HTML for Figma was constructed.
- Figma layer/component/auto-layout fidelity, font handling and whether exported HTML contained private asset URLs.
- Version-history, branch, undo/rollback, deletion, collaboration and concurrent-write semantics.
- Whether theme regeneration preserves a screen id or creates new immutable internal records under every condition.
- Private-design access control, public-index removal, CDN deletion and post-account-retention behavior.
- Input-image storage, moderation retention and exact third-party routing for a particular request.
- An official product-core source repository or original commit history.

## Acceptance checklist for reconstructing a Galileo workflow

1. Record the historical date/build; do not treat current Stitch behavior as proof of 2024 Galileo behavior.
2. Capture `chat_id`, `chat_message_id`, screen ids, device type, variant count, visibility, parent screen and theme separately.
3. Verify every requested screen reaches a terminal state; a bot message alone is not completion.
4. Preserve the selected base screen before refinement and compare the child result rather than assuming reversible history.
5. Retry only the intended failed screen ids and confirm the retained parent/theme context.
6. After Apply Theme, wait for all per-screen events and inspect layout, copy and imagery as well as palette/font.
7. Treat public publication as disclosure of prompt, identity, theme and raster metadata unless a narrower current contract is demonstrated.
8. Keep confidential/customer data out of prompts and uploads unless the applicable privacy/data-use agreement is acceptable.
9. For Figma export, test clipboard permission, paste into a real file, inspect editability and save a destination-native copy.
10. Never use “copied” or `/exported` as evidence that the Figma artifact exists or is faithful.
11. Preserve hosted metadata and raster references separately from the Figma fork; neither is a complete backup of the other.
12. Export before account termination or service transition and prove the exported file can be reopened independently.
13. Treat feature-flag/model labels as rollout hints, not reproducible model pins.
14. Describe the current Stitch relationship as observable product continuity unless a primary corporate announcement establishes more.

## Primary sources and evidence pins

### Lifecycle and product direction

- [Current Galileo domain, now redirecting to Stitch](https://www.usegalileo.ai/)
- [Archived public-beta and seed announcement, 2024-02-06](https://web.archive.org/web/20240206180648id_/https://www.usegalileo.ai/blog/seed)
- [Google Developers Blog: introducing Stitch, 2025-05-20](https://developers.googleblog.com/en/stitch-a-new-way-to-design-uis/)
- [Current Google Labs experiment index](https://labs.google/experiments)

### Historical product and public artifact projections

- [Archived create surface](https://web.archive.org/web/20240105153211id_/https://www.usegalileo.ai/create)
- [Archived image-to-UI surface](https://web.archive.org/web/20240209022500id_/https://www.usegalileo.ai/image-to-ui)
- [Archived mobile Explore feed](https://web.archive.org/web/20240209022500id_/https://www.usegalileo.ai/explore/features/mobile)
- [Archived web Explore feed](https://web.archive.org/web/20240209022500id_/https://www.usegalileo.ai/explore/features/web)
- [Archived public design page](https://web.archive.org/web/20240303113609id_/https://www.usegalileo.ai/d/0121b583-3309-4f6e-a4ee-81eadff8fda2)
- [Archived pricing surface](https://web.archive.org/web/20240203123920id_/https://www.usegalileo.ai/pricing)

### Terms and privacy

- [Archived Terms route](https://web.archive.org/web/20240706093240id_/https://www.usegalileo.ai/legal/terms)
- [Archived raw Terms content, effective 2023-12-12](https://web.archive.org/web/20240706093242id_/https://www.usegalileo.ai/assets/terms.html)
- [Archived Privacy Policy route](https://web.archive.org/web/20240706093241id_/https://www.usegalileo.ai/legal/privacy-policy)
- [Archived raw Privacy Policy content, effective 2023-12-12](https://web.archive.org/web/20240706093243id_/https://www.usegalileo.ai/assets/privacy.html)

### Archived shipped-client evidence

- [Create route chunk, build `2LPzCAMtgpZAYIi8_JGCV`](https://web.archive.org/web/20240313025512id_/https://www.usegalileo.ai/_next/static/chunks/pages/create/%5B%5B...chatId%5D%5D-a01927aa3c737a17.js)
- [Shared generation/theme/Figma chunk `920`](https://web.archive.org/web/20240313025512id_/https://www.usegalileo.ai/_next/static/chunks/920-18d62b954313c43f.js)
- [Shared chunk `267`](https://web.archive.org/web/20240313025512id_/https://www.usegalileo.ai/_next/static/chunks/267-2ce39759151a587b.js)
- [Shared chunk `974`](https://web.archive.org/web/20240313025512id_/https://www.usegalileo.ai/_next/static/chunks/974-834f5338b10ac2c1.js)
- [Application chunk with constants/error taxonomy](https://web.archive.org/web/20240313025512id_/https://www.usegalileo.ai/_next/static/chunks/pages/_app-896187ee649ca8f1.js)

No authenticated historical generation, theme mutation or Figma paste was executed. Runtime claims stop at Galileo's archived official pages, server-rendered public data, shipped client protocol and legal terms. The missing backend, model and destination-fidelity details remain unknown rather than inferred.
