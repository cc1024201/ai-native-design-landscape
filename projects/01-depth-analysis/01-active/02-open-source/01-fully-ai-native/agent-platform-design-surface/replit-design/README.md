# Replit Design

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Replit |
| Category | Agent-first design surface inside an application-building project |
| Status | Active; the current Design Canvas replaced Agent 3's standalone Design Mode in Agent 4 |
| Product surfaces | Replit Project header: **Design** and **Build**; documentation points to `replit.com/design`, whose anonymous GET returned 404 in this snapshot |
| Availability | Most Design capabilities and applying a design are available across plans; building a new app from a Design frame requires Core or Pro |
| Source availability | Closed; no canonical Design Canvas, Visual Editor, Agent or hosted-project implementation repository is public |
| Canonical product documentation | https://docs.replit.com/design/what-is-replit-design |
| Canonical source repository | N/A — closed source |
| Pinned source revision | N/A — no public implementation revision |

## Product boundary: Design and Build are two surfaces over one Project

Replit Design is not a separate design file that is later exported into an unrelated app builder. In the current product model, **Design** and **Build** are adjacent entry points into the same Replit Project. Design is the exploration surface; Build is where an Artifact runs with application behavior, data and integrations. The [current Design-versus-Build guide](https://docs.replit.com/design/design-vs-build) makes that shared Project boundary explicit.

That does not mean a Design frame and a running application are the same object. Replit documents two distinct states:

- a **Design frame** is a static or interactive mockup for rapid visual exploration;
- an **Artifact frame** is backed by a running Artifact and can already behave as a live app;
- converting or applying a Design frame is an Agent operation that creates or rewrites an Artifact;
- the source Design frame remains on the Canvas as a reference after the rewrite.

The important architectural claim is therefore narrower than “design is code.” Design and Build share a project context, but a deliberate materialization step still separates a mockup from publishable software.

## The ordinary journey branches visually, then commits through Agent

```text
prompt / template / Figma / Claude / URL / screenshot / design system
                              ↓
                     generated Design frames
                              ↓
        suggestions / alternate models create sibling frames
                              ↓
          chat · draw · direct edit · generated media
                              ↓
                    choose one winning frame
                              ↓
                  Agent checkpoint before change
                       ↙                  ↘
          build a new Artifact       apply to an Artifact
                       ↘                  ↙
                    Agent writes/rewrites code
                              ↓
                running Artifact + new checkpoint
                              ↓
             inspect, repair translation gaps, publish
```

The [product overview](https://docs.replit.com/design/what-is-replit-design), [frame guide](https://docs.replit.com/design/frames) and [Build guide](https://docs.replit.com/design/build-your-design) establish this path:

1. start with a prompt, template, Figma or Claude import, URL, screenshot, or saved design system;
2. generate one or more frames on the infinite Canvas;
3. explore suggestions or other model directions, each appearing beside the source frame rather than replacing it;
4. refine with Agent chat, annotations, the Visual Editor and generated assets;
5. choose **Build this design** to create a new Artifact, or choose an existing Artifact to restyle;
6. Agent builds or rewrites its code, reports the change and creates a checkpoint;
7. inspect the running result and continue in chat when visual or functional details did not translate.

The side-by-side alternatives are the exploration history. The checkpointed source and running Artifact are the implementation history. They overlap inside one Project but are not publicly documented as one version graph.

## Project, Frame and Artifact carry different authority

The current documentation exposes several related objects whose roles should not be collapsed:

| Object | Public role | What it can authoritatively establish | What it does not establish |
|---|---|---|---|
| Project | Cloud container for code, data, settings and up to seven Artifacts | shared backend, database, storage, files and publication lifecycle | one independently publishable child lifecycle |
| Canvas | Infinite hosted board reached through Design | arrangement of frames, drawings, notes and visual alternatives | publicly documented Git serialization or source repository representation |
| Frame | Selectable, movable unit on the Canvas | one Artifact preview, Design mockup, image, video or vector direction | a universal publishable format |
| Element | Directly targetable content inside an eligible frame | visual selection for deterministic edits or Agent context | a published stable element-id schema |
| Design frame | Static or interactive mockup | a visual candidate that can be refined and handed to Build | backend, database, production behavior or independent publication |
| Artifact | Publishable project output such as an app, mobile app, slides, animation or data visualization | running/publishable result backed by project files and services | an independent deployment cycle inside a shared Project |
| Project files | Code, configuration and assets supporting Artifacts | source changes, Git commits and long-term implementation history | the publicly documented complete Canvas board state |
| Design system | Living style guide plus project-readable files | reusable tokens, typography, component examples and Agent-readable guidance | a zero-cost stylesheet swap when applied to an existing Artifact |

The [Projects and Artifacts guide](https://docs.replit.com/learn/projects-and-artifacts/projects-and-artifacts) says Artifacts in one Project share database, backend/API, file storage and deployment. Publishing pushes them together; one Artifact cannot currently be published independently, and an Artifact cannot be moved to another Project. A Project is limited to seven Artifacts and one mobile app. Those are product-domain constraints, not incidental UI limits.

This yields a useful authority model:

- **Frame is the visual branching unit.** Suggestions and model explorations create siblings while leaving the selected original intact.
- **Artifact is the publishable unit.** It is the live output users can run, but it still shares its Project's deployment boundary.
- **Project is the integration and lifecycle unit.** Files, services and publishing converge here.
- **Source files are the implementation authority for running software.** Both Visual Editor and Agent ultimately change them for an Artifact.
- **Canvas is a hosted exploration authority whose complete persistence representation is undisclosed.**

## Three mutation routes look similar in the UI but have different semantics

Replit exposes direct manipulation and Agent-assisted change through one visual surface. The public contract separates three routes:

| Route | Trigger | Mutation authority | Cost / timing | Verified result boundary |
|---|---|---|---|---|
| Deterministic Visual Editor edit | select text, color, spacing, layout or image and save | Visual Editor updates underlying source code directly | no Agent loop or AI credits for eligible changes | changed source; selection may update all reused instances |
| Targeted Agent change | select an element/frame, draw an annotation or describe hidden complexity | Agent receives targeted metadata or a frame snapshot and edits the project | Agent execution and credits | files/runtime must be inspected after Agent finishes |
| Build or apply transaction | select a Design frame, then create or choose an Artifact | Agent creates a new Artifact or rewrites an existing Artifact's code | checkpointed Agent task; new-app path requires Core or Pro | running Artifact plus checkpoint; Design frame remains a reference |

### Route 1: deterministic edits write source directly

The [Visual Editor documentation](https://docs.replit.com/design/visual-editor) states that simple text, color, spacing, layout and image changes update source code without an Agent round-trip. In Preview, saving such an edit updates the source. If selected text is represented as a source-code string, it can be replaced immediately. Layout controls can change flex direction, alignment, gap, distribution and inner/outer spacing.

The same direct-edit contract applies to eligible Design Canvas frames and running Preview frames. That is stronger than a screenshot annotation: a rendered target can produce a source mutation.

But the direct route is conditional:

- the product decides whether a change contains “hidden complexity” and must be routed to Agent;
- composite elements cannot always be text-edited directly;
- a selected element rendered in a loop or reused component is highlighted and updated across all instances;
- Visual Editor is available in web browsers, not the Replit mobile or desktop apps;
- element interaction for editing is documented as a desktop-oriented operation.

The visible instance a user clicks can therefore have a broader write scope than that one instance. The UI target is precise, but the mutation cardinality depends on source reuse.

### Route 2: visual context can guide Agent without becoming source identity

Selecting a frame attaches it to the next Agent message as a snapshot. Drawings and notes on the Canvas are also readable by Agent. In Preview, complex Visual Editor changes send “targeted metadata” to Agent. These are multiple context paths, not one documented identity protocol.

A snapshot can preserve appearance and selection context while losing semantic source identity. Targeted element metadata may be more precise, but Replit does not publish its schema. Public documentation therefore supports the fact that Agent receives grounded visual context; it does not establish that every chat, drawing and snapshot carries one stable file/AST binding.

### Route 3: Build is a checkpointed Agent rewrite

The [Build guide](https://docs.replit.com/design/build-your-design) is explicit about both paths:

- **Build this design** creates a new live Artifact from the frame's layout, styling and assets;
- **Apply to an existing app** has Agent rewrite that Artifact's code to match the selected frame;
- Agent creates a checkpoint before the operation and another checkpoint after reporting its work;
- the Design frame remains on the Canvas for reference.

This is not a proven live binding between the frame and generated application code. It is a one-way, recoverable Agent transaction. Subsequent source edits need not update the Design frame, and subsequent frame edits are not documented as automatically updating the Artifact. The user must compare the running result and ask Agent to repair anything that did not translate.

Applying a saved design system has the same important cost boundary. Replit says Agent regenerates the Artifact's styling layer and warns about time and credits; it is a [real rebuild](https://docs.replit.com/design/apply-design-system), not a stylesheet pointer swap.

## A Design frame is source-backed but not app-backed

Two pieces of current documentation create an apparent tension:

- the [Design-versus-Build guide](https://docs.replit.com/design/design-vs-build) describes Design as exploration “before committing to code” and says mockups lack data and external services;
- the [Visual Editor guide](https://docs.replit.com/design/visual-editor) says edits to both Canvas frames and Preview update underlying source code.

The evidence supports a two-stage interpretation:

1. a generated Design frame has enough underlying representation or source for rendering and deterministic visual editing;
2. it is still not an app-backed Artifact with server behavior, database access, authentication, service integrations or publication authority;
3. Build asks Agent to materialize that visual specification into a new Artifact or rewrite an existing one.

This interpretation reconciles the public behavior without inventing the hidden storage format. It should not be strengthened into claims about React component structure, a Canvas-specific AST, iframe injection or compiler transforms; Replit does not disclose those internals.

Interactive frames sharpen the distinction. When that capability is enabled, a Design frame can respond to clicks and form input like a page; otherwise it renders as a snapshot. Interactivity is prototype behavior, not evidence of a backend or production application.

## Visual target-to-source return is a public contract, not a public implementation

The strongest public mapping fact is in the Visual Editor FAQ: clicking the top-left label on a selected element jumps to its location in source code. Combined with direct source updates, this establishes a product-level return path:

```text
rendered element → selected target → source location or deterministic source edit
```

It does **not** expose how that path is implemented. The public evidence does not reveal:

- whether runtime nodes receive injected ids, source locations, component signatures or source-map metadata;
- which parser, AST, bundler or framework adapters perform a patch;
- how conditional rendering, portals, generated class names, fragments or multiple source roots are resolved;
- how a loop instance is mapped to the shared source expression;
- how stale Preview state, concurrent edits or failed patches are detected;
- whether Canvas Design frames and running Artifacts use the same mapping machinery;
- whether the target identity survives Build, copy, import, regeneration or checkpoint rollback.

Accordingly, Replit adds a **closed-product target-to-source contract** to the landscape, not a seventh source-inspected implementation mechanism.

## The design system is the clearest bridge from Canvas into repository state

Replit's design-system documentation exposes more concrete file-backed state than the Canvas itself. A generated system includes named tokens, role-based colors, typography, two or three example components, and supplied logos or brand assets. It can be created from a prompt and references, or extracted from a selected mockup.

The [storage guide](https://docs.replit.com/design/design-md) names the bridge:

```text
living style guide on Canvas
          ↓
tokens.json → CSS variables (for example src/index.css) → components
          +
DESIGN.md → human-readable and Agent-usable system description
```

An existing `DESIGN.md` can seed another system alongside Figma, a website, code or reference images. This gives the style system two usable forms: a visual guide and project files that Agent and components can consume.

The bridge is still generative rather than declaratively enforced. Extracting a system asks Agent to distill a mockup. Applying one to an existing Artifact asks Agent to rebuild styling. Replit even tells users to inspect important screens and flag drift in chat. `tokens.json` and CSS variables provide a durable implementation spine, but they do not prove that every generated component is mechanically constrained to the current system.

## Figma is an import/context source, not a documented roundtrip authority

Replit supports two related Figma paths:

- the [Design import flow](https://docs.replit.com/design/import-figma-designs-into-replit-design) brings a selected Figma frame into Replit and uses Agent to create a project/design starting point;
- the [Figma MCP integration](https://docs.replit.com/features/mcp/figma) lets Agent explore layers, extract variables/components/layout specifications, capture screenshots, inspect raw MCP activity and generate starter code.

Both paths provide grounded design context. Neither public contract exposes a durable Figma-node-to-generated-source-AST binding, a shared version transaction, or reverse synchronization from Replit to the original Figma file. Replit's own import guidance tells users to compare the result visually and test behavior and responsiveness. Figma is therefore an input authority at conversion time; Replit Project files become the implementation authority after generation.

## Runtime projection and delivery preserve the Project boundary

The Canvas can contain live Artifact previews beside lighter Design mockups, images, videos and SVG graphics. A Design frame can be exported as PNG, but the [frame documentation](https://docs.replit.com/design/frames) describes that result as a rendered screenshot. It preserves visible pixels, not the frame's editable or interactive semantics.

For software delivery, the path is different:

1. Build or apply creates/rewrites an Artifact;
2. the running Artifact can gain authentication, database state, payments and integrations;
3. publishing ships the Project's Artifacts together;
4. monitoring, domains and feedback operate on the published application.

The shared Project services are convenient for related outputs but create coupling. A web app, admin surface and deck can share backend/data, yet they cannot currently have independent publication cycles inside that Project. An ordinary user who discovers the coupling late cannot move an Artifact out; Agent must rebuild it in another Project.

## Persistence has at least two version clocks

Replit documents a strong Git/checkpoint story for project implementation. Its [version-control guide](https://docs.replit.com/learn/projects-and-artifacts/version-control) says Agent checkpoints, the Git pane, Git CLI and File History relate to one underlying Git repository. Agent checkpoints appear as Git commits and can sync with GitHub.

The [checkpoint guide](https://docs.replit.com/features/version-control/checkpoints-and-rollbacks) says a checkpoint captures:

- project files, directories, packages and configuration;
- AI conversation context;
- runtime and publishing configuration;
- Agent memory;
- database contents and schema.

Rollback restores files, context, configuration and the development environment. Development-database rollback is optional; production-database restoration is not automatic. Roll-forward remains available until new changes after a rollback create an alternate history branch. Replit recommends manual Git commits for long-term tracking alongside automatic checkpoints.

The same guide does not explicitly name Canvas frame layout, board geometry, drawings, notes, Design-frame metadata or suggestion branches among the captured fields. It also cannot mean that database contents and AI conversation context are literally stored in an ordinary Git commit merely because every checkpoint has a corresponding commit.

The public model therefore has at least two clocks:

| Clock | Publicly established contents | Recovery strength | Unresolved boundary |
|---|---|---|---|
| Git / files | source, config, assets, manual commits and Agent checkpoint commits | normal Git inspection, branches and external sync | hosted context/database state exceeds ordinary Git objects |
| Agent checkpoint | files plus conversation, memory, environment and optional development database state | one-click rollback/roll-forward around milestones | exact transactionality across all captured stores is undisclosed |
| Hosted Canvas state | frames, layout, notes, drawings and visual branches are visibly project-associated | cloud persistence is implied by the product workflow | no public serialization, Git inclusion or rollback guarantee for the complete board |

This is not evidence that Canvas state is unversioned or lost. It is evidence that **Canvas recovery cannot be equated with Git recovery from the published contract**. Before Build, the checkpoint is a meaningful safety boundary for the code/project transaction; whether it returns every Canvas-only detail remains unknown.

## Ordinary-user failure atlas

| User expectation | Documented or evidence-bounded break | Practical consequence |
|---|---|---|
| “The interactive mockup is already the app.” | Design frames have no documented backend/database; interactive frames can simulate page behavior | clicks may work while auth, persistence and integrations do not exist |
| “Build preserves the frame exactly.” | Agent converts or rewrites code; documentation explicitly asks the user to review what did not translate | visual and responsive acceptance must happen on the running Artifact |
| “A direct edit changes only what I clicked.” | looped or reused elements update all instances | a local-looking correction can have component-wide scope |
| “Every visible property is directly editable.” | composite text and hidden complexity route to Agent | cost, latency and nondeterminism re-enter the loop |
| “Applying my system swaps shared tokens.” | existing Artifacts undergo an Agent rebuild with time/credit warning | restyling can touch a broader styling layer and drift must be reviewed |
| “A PNG is my editable design backup.” | export is a rendered frame screenshot | structure, interactions and source mapping are lost |
| “Checkpoint means the whole Canvas is in Git.” | public capture lists omit Canvas-specific state | Git recovery cannot be assumed to restore board layout/branches |
| “Rollback restores production data.” | production database restoration is separate and not automatic | code and live data can return to different moments |
| “Each Artifact can ship independently.” | Project publishing deploys all Artifacts together | unrelated release cadences require separate Projects |
| “I can split an Artifact out later.” | moving Artifacts is unsupported; rebuild in a new Project | an early project-boundary decision can become migration work |
| “More Artifacts are just organization.” | maximum seven, one mobile app; additional previews consume memory | large suites need multiple Projects and lose shared lifecycle convenience |
| “Figma import stays linked.” | public flow is conversion/context with no documented roundtrip binding | later changes need manual or Agent-mediated reconciliation |
| “Canvas editing works on every Replit client.” | Visual Editor is web-only | mobile/desktop-app workflows cannot perform the same direct manipulation |

## Product evolution changed the underlying design model

| Date | Public change | Architectural significance |
|---|---|---|
| 2025-03-21 | Replit launched Visual Editor for JavaScript apps, allowing users to click/select project elements | established runtime visual targeting before the current Design suite |
| 2025-11-21 | Agent 3 launched standalone Design Mode, powered at launch by Gemini 3, for interactive/static websites and one-click conversion | design was a separate, web-focused pre-build mode |
| 2026-03-19 | Agent 4 replaced standalone Design Mode with the always-available Design Canvas | Canvas became project-central, supports live previews/direct manipulation and all Artifact types |
| 2026-05-22 | Visual Editor gained dedicated flex layout controls | moved another class of edits from Agent rewrite to deterministic source mutation |

The [Agent 4 transition post](https://replit.com/blog/whats-changed-agent3-to-agent4) is especially important. It says old Design Mode was a separate web-app-only tab, whereas Design Canvas puts Artifact previews and mockups side by side and supports web, mobile, slides, data visualization and other Artifact types. Old projects remain usable, but the post records a temporary incompatibility for creating multiple apps in one old project. The current dossier describes the Agent 4 model, not the retired standalone mode.

## Facts, inferences and unknowns

### Established public facts

- Design and Build open the same Replit Project.
- Canvas frames can represent running Artifacts, Design mockups and media.
- suggestions generate sibling frames while preserving the selected original.
- simple Visual Editor changes update source code directly without an Agent loop or AI credits.
- complex changes route targeted metadata to Agent.
- selected element labels can jump to source locations.
- Build/apply asks Agent to create or rewrite Artifact code and brackets the operation with checkpoints.
- `tokens.json`, CSS variables and `DESIGN.md` give generated design systems file-backed representations.
- Artifacts in one Project share services and publish together.
- checkpoints correspond to Git commits while also capturing hosted context beyond ordinary files.

### Evidence-backed inferences

- Design frames must have a renderable/editable underlying representation, but that does not make them application Artifacts.
- Build is a materialization/rewrite boundary rather than a proven durable frame-to-source binding.
- the visual selection-to-source contract requires internal mapping metadata or structural resolution, but its mechanism cannot be selected from public evidence.
- Replit Project files become the runnable implementation authority after Figma import or Design Build.
- Git/checkpoint history and Canvas exploration history cannot be assumed to be one atomic version graph.

### Material unknowns

- the serialized Canvas, frame and element schemas;
- renderer isolation and whether frames use iframes, generated bundles or another sandbox boundary;
- supported framework matrix and exact Visual Editor patch adapters;
- element identity generation, source-location metadata and AST mutation strategy;
- deterministic-versus-Agent classification rules;
- concurrency, conflict detection, idempotency and partial-failure semantics for direct edits;
- whether checkpoint rollback restores Canvas layout, Design-frame source, notes, drawings and suggestion branches;
- whether Design frames and Artifacts ever share stable element identity across Build;
- exact storage/transaction boundaries among Git, conversation context, Agent memory, Canvas state and databases;
- model routing for current Design generation; Gemini 3 is documented for the 2025 launch, not established as the sole current model.

## Verification performed for this snapshot

This dossier was rebuilt from the current official Design, Project/Artifact, version-control, MCP and changelog pages on 2026-08-11. The documentation index was checked for the current Design page set, all 20 linked official sources returned HTTP 200 after redirects, and historical claims were tied to dated Replit changelogs or the Agent 4 transition post. A separate anonymous GET to the documented `https://replit.com/design` entry returned HTTP 404; that observation establishes only the unsigned access boundary, not product unavailability for an authenticated account.

No signed-in project was created, no paid Build was run, no AI credits were consumed and no private workspace was inspected. Consequently, the following acceptance checks remain access- or cost-blocked rather than silently treated as passed:

- inspect actual project files before and after a deterministic Canvas edit;
- verify element-label source return across reusable components and unsupported constructs;
- observe the hidden-complexity handoff payload;
- compare a Design frame and built Artifact at pixel/behavior level;
- inspect Git commits and checkpoint rollback for Canvas-only state;
- test an imported Figma frame through Build and later revision;
- test multi-Artifact publication and migration limits in a real Project.

The implementation is closed, so there is no honest commit-level product trace to add. The remaining gaps require authenticated product state, paid execution or private implementation source; all public evidence available within the current scope has been exhausted around the decisive journey and mechanism. That is why the status is **Architecture-level / closed-source boundary reached**, not Source-level.

## Primary sources

- [What is Replit Design](https://docs.replit.com/design/what-is-replit-design)
- [Design vs. Build](https://docs.replit.com/design/design-vs-build)
- [Canvas](https://docs.replit.com/design/canvas)
- [Frames](https://docs.replit.com/design/frames)
- [Elements](https://docs.replit.com/design/elements)
- [Explore suggestions](https://docs.replit.com/design/explore-suggestions)
- [Visual Editor](https://docs.replit.com/design/visual-editor)
- [Build your design](https://docs.replit.com/design/build-your-design)
- [Create a design system](https://docs.replit.com/design/create-a-design-system)
- [Design system contents and DESIGN.md](https://docs.replit.com/design/design-md)
- [Apply a design system to an existing app](https://docs.replit.com/design/apply-design-system)
- [Projects and Artifacts](https://docs.replit.com/learn/projects-and-artifacts/projects-and-artifacts)
- [Version control](https://docs.replit.com/learn/projects-and-artifacts/version-control)
- [Checkpoints and Rollbacks](https://docs.replit.com/features/version-control/checkpoints-and-rollbacks)
- [Import Figma designs into Replit Design](https://docs.replit.com/design/import-figma-designs-into-replit-design)
- [Figma MCP Integration](https://docs.replit.com/features/mcp/figma)
- [Visual Editor launch, 2025-03-21](https://docs.replit.com/updates/2025/03/21/changelog)
- [Design Mode launch, 2025-11-21](https://docs.replit.com/updates/2025/11/21/changelog)
- [Agent 3 to Agent 4 transition, 2026-03-19](https://replit.com/blog/whats-changed-agent3-to-agent4)
- [Visual Editor layout controls, 2026-05-22](https://docs.replit.com/updates/2026/05/22/changelog)
