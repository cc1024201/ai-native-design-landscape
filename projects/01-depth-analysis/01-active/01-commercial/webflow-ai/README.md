# Webflow AI

> Research status: **Architecture-level / current platform and source-visible adapter boundary reached / v1.0** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Webflow, Inc. |
| Current category | AI-native site generation, governed visual authoring, native code components, content/optimization agents and delivery |
| Status | Active; AI site builder, AI Assistant, AI code components, AEO/Optimize and MCP 2.0 are current; App Gen is still usable but further development is paused and deprecation has begun |
| Primary artifact | A hosted Webflow site graph: pages/elements, classes, variables, components, interactions, CMS/locales, settings and publication state |
| Secondary code artifacts | Webflow-native single-file React AI code components; separately deployed App Gen applications on Webflow Cloud |
| Agent boundary | In-product AI Assistant plus remote OAuth Webflow MCP 2.0 for Claude, ChatGPT, Codex, Cursor and other MCP clients |
| Source availability | Closed platform/core; MIT source exists for the earlier MCP adapter through public commit `c4fa339`, but the current remote MCP 2.0 implementation is newer than that repository |
| Evidence ceiling reached | Current official product/help/developer contracts, current MCP protocol docs, Flowkit specification and pinned public adapter history; current Designer, AI and remote-service implementation remain closed |

## Executive finding

“Webflow AI” is not one generator with one result. It is an umbrella over several mutation authorities that share a site but do not share one lifecycle:

1. **AI site builder** creates a new native Webflow site on the Flowkit class/variable/component system.
2. **AI Assistant** proposes native sections, copy, CMS sample content and optimization/SEO changes inside an eligible site.
3. **AI code components** create Webflow-owned single-file React components with an editable code surface and managed npm dependencies.
4. **App Gen** creates a separate file-based full-stack application and Webflow Cloud deployment; that path is already entering deprecation.
5. **Webflow MCP** lets external agents mutate native site/CMS resources through governed APIs and optional live Designer context.

The ordinary user can move from prompt to a real hosted site, but “real” still has several meanings. A generated structure is not yet a Designer site; an accepted section is not a published page; a queued CMS item is not live; a code component preview is not a build on the production plan; an Optimize variation is not launched; and an App Gen deployment is not the same artifact as the surrounding Webflow site.

The decisive technical question is therefore **which authority the prompt changed and which promotion gate remains**.

## Journey A: prompt to a Flowkit-backed native site

The [current AI site builder guide](https://help.webflow.com/hc/en-us/articles/38840145286035-Build-a-site-with-Webflow-s-AI-site-builder) describes a gated creation flow rather than one opaque generation call.

### 1. Generate and edit a site structure

The user describes the business, location and goal. Webflow proposes up to five pages, each with sections. Before visual generation the user can:

- add, remove, reorder or change sections;
- duplicate a page or generate another page from a prompt;
- edit the original prompt and regenerate the structure.

Regenerating replaces the current proposed structure and discards its page/section edits. At this stage the durable receipt is only an approved plan for what the site should contain.

The builder can create a brand-new site or continue a site originally created by this builder. It cannot be applied to an arbitrary existing Webflow site. That lineage flag is a product capability boundary, not merely a UI entry-point choice.

### 2. Generate the native design system and pages

**Generate design** creates responsive page designs, content, imagery, animations and a theme. Theme changes can affect colors, typography, sections, images, buttons, forms, cards, spacing, roundness and animation across every generated page.

Generated sites use the documented [Flowkit framework](https://developers.webflow.com/flowkit/getting-started/intro):

- variables as design tokens;
- reusable component classes and predictable sub-element names;
- single-purpose utility classes;
- combo classes such as `is-*`, `on-*`, `gap-*` and interaction modifiers;
- breakpoint modifiers for tablet and mobile regimes;
- an automatically generated Style guide page.

This is why the output remains editable as a normal Webflow site instead of becoming a screenshot or detached HTML proposal. The design system is materialized into Webflow variables, classes, elements and components.

### 3. Cross the plan gate without silently keeping every page

On a free Starter site, only two static pages can continue into the Designer. If the generation produced more, the user must upgrade or choose the homepage plus one other page; unselected pages are permanently deleted. The Style guide does not count toward the limit.

Generated sites also cannot be transferred between Workspaces or share Libraries. Those restrictions are attributed to how AI-generated sites are structured. A generated foundation is therefore native but not fully equivalent to every hand-authored Webflow site in portability and design-system federation.

Receipt after this gate: an actual editable Webflow site with selected pages and a Flowkit style system. It is still unpublished.

## Journey B: native site refinement is constrained insertion, not free-form regeneration

The in-product Assistant operates at several different scopes.

### Section design uses candidates plus classes

[Modify page designs](https://help.webflow.com/hc/en-us/articles/34205154436243-Modify-page-designs-with-the-Webflow-AI-Assistant) is a public beta limited to a small set of free templates and AI-site-builder sites. The ordinary path is:

1. place a Section element;
2. ask the Assistant for a layout;
3. preview candidate designs;
4. choose one to add to the canvas;
5. continue editing it through prompts or native tools.

The inserted section reuses site classes and variables, and creates new classes where needed. It can add/reuse classes but cannot update existing classes. It also does not include components, images or dynamic data and cannot generate an individual element.

This narrow contract matters. “Understands the design system” means it conditions an insertion on current styles and content; it does not grant the model arbitrary write authority over the global system. Undo in the chat steps back in the Assistant conversation, while normal Designer undo removes the inserted design and its generated classes.

### Copy generation has an explicit acceptance gate

[Copy generation](https://help.webflow.com/hc/en-us/articles/38323375464723-Generate-and-refine-copy-with-Webflow-AI) targets supported static or dynamic text elements, or a highlighted span inside one. It returns alternatives and writes only after the user clicks **Done**. Rich text can request continuation through `/`.

The target is native text content, not a source-file string. Acceptance still needs editorial, localization, legal and layout review because replacing copy can change line wrapping and responsive geometry without modifying styles.

### CMS generation enters the content state machine

[CMS item generation](https://help.webflow.com/hc/en-us/articles/51037774703251-Generate-CMS-Collection-items-with-Webflow-AI) can create one sample item from a Collection page or 5/10/20 items in an empty Collection. Unsupported image, option and reference fields receive placeholders.

The two paths have different initial states:

- one canvas-generated item is created as **Draft**;
- bulk sample items are **Queued to publish**.

Webflow CMS independently distinguishes staged/draft data from live data. A generated record is therefore not production delivery merely because it renders in the Collection template. The user must review schema fit, references, media and publication state.

### Optimize and AEO create recommendation/experiment ledgers

[AI-powered Optimize suggestions](https://help.webflow.com/hc/en-us/articles/41393988797587-Create-an-optimization-with-AI-powered-suggestions) turn selected copy plus persona/CRO prompts into ideas. Confirmed ideas become **draft variations**; a separate action launches them. Webflow AEO similarly produces scheduled findings and reviewable recommendations rather than silently editing the live site.

These are measurement/control artifacts around the site. They should not be confused with the main page, CMS record or production release.

## Journey C: AI code components are a native Webflow code island

[AI code components](https://help.webflow.com/hc/en-us/articles/51168990228499-Build-AI-code-components) are the current forward path for interactive functionality such as calculators, multi-step forms and galleries.

### Creation and refinement

The user creates one from the Components panel, optionally supplies reference images, and enters a Component Canvas with:

- a React code editor;
- a live component frame;
- the AI Assistant.

The Assistant reads site styles and variables, generates a component, can add/rename/remove props and can add managed npm packages. Human code edits autosave and update the same preview. Instances expose props in the normal Properties panel.

This is genuine code authority, but its envelope is intentionally narrow:

| Contract | Current boundary |
|---|---|
| framework | React only |
| source shape | one file per AI code component |
| visual editing | internal structure is not editable with native canvas tools; only props, prompts or code |
| data | no CMS Content Delivery API binding yet |
| secrets/auth | unsupported; a submitted secret must be rotated |
| dependencies | npm names only; Webflow manages required `@webflow/*` packages |
| native-to-code conversion | cannot create from an existing native, DevLink or AI code component |
| portability | no DevLink export; stripped from site code export; removed on cross-site copy; sites containing code components cannot be cloned |
| Webflow Cloud reuse | not currently usable inside Webflow Cloud apps |

The [component-type matrix](https://help.webflow.com/hc/en-us/articles/44650915153811-Webflow-component-type-overview) makes the authority split explicit:

- native Webflow components are authored in Webflow and may be exported through DevLink;
- DevLink code components are authored in an external React codebase and imported into Webflow;
- AI code components are authored as code **inside Webflow**, but cannot travel through DevLink.

Their code is readable and editable, yet the hosted Webflow site remains the only supported source of truth. This is a code island, not repository convergence.

## Journey D: App Gen is a separate application lineage already approaching retirement

[App Gen](https://help.webflow.com/hc/en-us/articles/46332369065875-Build-full-stack-web-apps-with-Webflow-AI) generates a standalone browser application beside a Webflow site. It can consume selected CMS Collections/components and design context, exposes folders/files, code editor, Dev Server, Terminal and Deployment controls, and deploys to Webflow Cloud at an app path.

It does **not** become a native page or AI code component:

- it has its own file tree and variables collection;
- preview refresh is separate from code generation;
- deployment can advance without a normal site publish, except for first publication or path changes;
- Webflow Support explicitly does not validate custom code;
- its hosting and lifecycle belong to Webflow Cloud.

The current guide says further development is paused and deprecation has begun, while existing deployments continue to run. This converts portability and recovery from theoretical questions into immediate acceptance requirements. No current public contract establishes repository export, version history or a migration operation from App Gen to AI code components.

New work should not treat App Gen success as a durable platform direction merely because a production URL still resolves.

## Authority topology: one brand surface, many clocks

| Authority / projection | What it owns | How it advances | What can diverge |
|---|---|---|---|
| native site graph | pages, elements, classes, variables, native components, interactions and settings | Designer, AI site builder, section/copy AI, APIs or MCP | autosaved draft differs from staging and production |
| Flowkit/design system | generated variables, class conventions, patterns and Style guide | theme/global edits and native Designer changes | later pages use current image pack; existing images do not update; libraries cannot be shared from AI-generated sites |
| CMS | Collection schemas, item records, locales and status | editor, AI sample generation, CSV/Data API/MCP and item/site publish | Draft, queued and live values coexist; unsupported AI fields use placeholders |
| AI code component | hosted one-file React source, props and managed dependencies | prompts or direct code edits | no clone/export/DevLink/Cloud-app path; production plan gate is separate |
| Optimize/AEO | draft variations, experiment state, measurements and recommendations | confirm, launch, measure and apply | suggestion or winner does not automatically equal main-site content or publish |
| page branch | isolated page content plus branch-side system changes | branch edit, pull/resolve, merge | main page content can be overwritten; comments disappear on merge; CMS is shared |
| backup | periodic/manual whole-site restore point | every 50th autosave, manual save or pre-restore checkpoint | restore affects scheduling, comments, locales, IDs and integrations in version-dependent ways |
| staging / production | hosted compiled site at selected domains | page/site/CMS publish gates | collaborators' staged work can ride with another publish; domains can differ |
| static code export | HTML/CSS/JS/assets ZIP | explicit export on eligible Workspace plan | strips CMS, localization, forms/search, access control and code components; no reverse sync |
| App Gen / Cloud | separate file-based application and deployment | prompt/code/terminal then Deploy and publish | lifecycle is being deprecated and site/app publication can advance separately |

## External agents: Webflow MCP 2.0 writes the native graph, not exported source

The [current MCP overview](https://developers.webflow.com/mcp/reference/overview) exposes native elements, styles, variables, components, pages/branches, custom code, CMS, assets, analytics and activity through a remote OAuth endpoint. Each site can carry Agent Instructions that reference its own Webflow primitives, and shared Libraries can distribute those instructions with their design system.

Webflow also publishes a pinned [`webflow-skills`](https://github.com/webflow/webflow-skills/tree/b4e1fac15f65f60b60385ccd4f13740ae024665c) repository that routes agents through CMS, audit, Designer, Figma-to-Webflow, publish and code-component workflows. Those skills operate the same Webflow project graph and are recorded as an official product surface here, not as another team or canonical product.

### Current architecture

The [documented current path](https://developers.webflow.com/mcp/reference/how-it-works) is:

```text
MCP client
   │ OAuth + structured tools/resources
   ▼
https://mcp.webflow.com/mcp
   ├── Data / Designer APIs ──► hosted site graph, CMS, assets, analytics
   └── Bridge App only for live selection/page/mode/branch/breakpoint and snapshots
```

[MCP 2.0](https://developers.webflow.com/home/changelog/2026/7/21) moved most element, component, style and variable work out of the live Designer requirement. A few visual/session-relative operations still require an open Designer plus Bridge App. Tool responses report the current Designer mode; disallowed operations return `ModeForbidden`.

Every action is constrained by the author's existing Webflow role/permissions and recorded in Site Activity. OAuth authorizes one Workspace at a time. This makes governance part of the agent protocol rather than an after-the-fact convention.

### Native identity is exact but does not return to application files

Current tools can query elements by type, text, style, tag, attribute or component and mutate the matching native resource. The earlier source-visible adapter represented a Designer element with a composite `{ component, element }` id. This is strong identity inside Webflow.

It does not establish an HTML/React source location, AST node, repository revision or exported-code baseline. Page/element ids address the hosted authoring graph; exported HTML and DevLink projections are later materializations. Webflow therefore reinforces the native-document target family rather than adding a repository element-to-source return mechanism.

The MCP also cannot yet create/apply Webflow Interactions, create localized CMS items or change access settings. A successful structural agent pass may still require manual interaction work, localization checks and an independent publish.

## Open MCP adapter evidence is real and historically bounded

Webflow publishes an MIT [`webflow/mcp-server`](https://github.com/webflow/mcp-server) repository. The inspected `main` revision is `c4fa339cd9ba7a93d771e710db89302fc443c447` (2026-04-11), with 51 TypeScript files and 163 commits.

At that revision:

- [`src/mcp.ts`](https://github.com/webflow/mcp-server/blob/c4fa339cd9ba7a93d771e710db89302fc443c447/src/mcp.ts) registers grouped Data API tools and Designer RPC tools;
- [`DEElementIDSchema.ts`](https://github.com/webflow/mcp-server/blob/c4fa339cd9ba7a93d771e710db89302fc443c447/src/schemas/DEElementIDSchema.ts) defines composite native element identity;
- [`designerAppBridge.ts`](https://github.com/webflow/mcp-server/blob/c4fa339cd9ba7a93d771e710db89302fc443c447/src/modules/designerAppBridge.ts) implements the older local Socket.IO bridge, site-to-socket routing, request ids and a 20-second timeout;
- `package.json` still says `1.0.1`, despite an April commit titled MCP v1.2 Release;
- npm's latest `webflow-mcp-server` remains `1.0.0`, pinned by `gitHead=ca01e120…` and the matching `1.0.0` tag.

The older local bridge listens on a free port from 1338–1638, enables any-origin CORS and routes calls by a caller-supplied site id without a bridge token in that source. This is a security boundary for the **legacy local OSS path**, not evidence about the current OAuth remote service or current Bridge App.

The July 2026 MCP 2.0 contract is materially newer than the public repository and npm package. The current remote implementation, OAuth service, Bridge App and headless Designer API mutations cannot be mapped to a corresponding public commit. The dossier is therefore Architecture-level even though a valuable earlier adapter slice is source-visible.

## Recovery and promotion semantics

### Backups are real but not transactionally equivalent to publish

[Webflow backups](https://help.webflow.com/hc/en-us/articles/33961244069395-Save-and-restore-backups) are created every 50th autosave, manually, and immediately before a restore. The user can preview and restore them; a restore first saves the current state.

Restore has consequential side effects:

- scheduled CMS items become queued for the next publish;
- backups before 2024-03-25 regenerate CMS/Ecommerce ids and break API bindings;
- inventory behavior depends on an explicit restore choice;
- reCAPTCHA keys must be re-added and bot blocking turns off;
- comments survive but can move to a parent/body if their element disappeared;
- restored locales can return with publication disabled.

A backup therefore restores authoring state, not the exact externally integrated production system. It does not automatically republish the restored site or rewind external APIs, Optimize experiments, Cloud apps or DNS.

### Page branches isolate one page, not the whole platform

[Page branching](https://help.webflow.com/hc/en-us/articles/46651751861139-Page-branching) is Enterprise-only. A branch copies a page; main changes do not appear until pulled. Merge overwrites main-page content with the branch, while shared classes/components/variables/interactions require pull/conflict resolution.

The branch still shares CMS data with main, cannot edit several global settings, and all branch comments are permanently deleted on merge. Branches do not survive site transfer or duplication. An MCP-created branch is a useful review gate, not a Git-like whole-site repository.

### Publication has destination-specific receipts

The [publishing workflow](https://help.webflow.com/hc/en-us/articles/46651740529811-Publishing-workflow) separates Designer, staging and production. A staging publish allows runtime review; promotion to production can include all staged changes rather than only the page a user was inspecting. CMS items can publish independently, and App Gen deployments can also move separately.

Acceptance must record the exact domain, page/site scope, CMS status and Cloud-app path. “Published” without those qualifiers is ambiguous.

## Static export is a portability fork, not a backup of the whole product

[Code export](https://help.webflow.com/hc/en-us/articles/33961386739347-How-do-I-export-my-Webflow-site-code) produces HTML, CSS, JavaScript and assets. It excludes or disables:

- CMS data and Collection rendering;
- Ecommerce and User Accounts;
- localized content beyond the primary locale;
- password protection;
- form processing, reCAPTCHA and site search;
- all code components, including AI code components.

The export can be hosted elsewhere and edited, but changes do not reverse-sync to Webflow. CMS/Ecommerce/User data need separate CSV exports. A ZIP is therefore a static implementation fork, not a full native backup and not the source authority for continued AI/Designer refinement.

## Failure map for an ordinary-user release

| Boundary | False success | Required evidence |
|---|---|---|
| site structure | five plausible pages/sections appear | approve information architecture before design regeneration destroys edits |
| plan selection | generated preview contains every page | verify which pages actually entered the Designer; unselected free-plan pages are deleted |
| theme/Flowkit | one page looks consistent | inspect Style guide, variables, breakpoints and every selected page |
| section AI | attractive candidate is inserted | inspect generated/reused classes, missing images/components/data and responsive states |
| copy AI | user clicked Done | review accuracy, brand/legal language, localization and layout wrapping |
| CMS AI | items render in template | review placeholders/references and distinguish Draft, queued and live records |
| AI code component | Component Canvas preview works | inspect code/dependencies/props, secret handling, plan/build and actual published runtime |
| MCP | tool reports a write | inspect Site Activity and native graph; run manual interaction/localization checks and publish explicitly |
| branch | change is approved/merged | verify overwritten page content, resolved global conflicts and lost comments |
| backup | old canvas preview looks correct | audit CMS scheduling/ids, integrations, security settings, locales and republish separately |
| Optimize/AEO | AI suggests a winner/fix | confirm draft variation or recommendation, launch/apply deliberately and evaluate real metrics |
| App Gen | preview/deployment resolves | retain source/behavior evidence and migration plan because the product path is deprecating |
| staging | staging domain is correct | promote the intended staged set and verify the exact production/custom domains |
| ZIP export | HTML opens locally | reconstruct omitted CMS, auth, forms, search, localization and code components |

## Data, permissions and AI-agent risk

The [Webflow AI Terms](https://webflow.com/legal/ai-terms) treat prompts/images/context as Input and generated material as Output. Webflow says it uses Input/Output to provide the feature and does not use or permit subprocessors to use them for training/fine-tuning without prior consent. Third-party providers may receive them as necessary for service delivery.

Agent actions are legally distinguished from passive Output: enabling an agent authorizes it to act until disabled or reconfigured, and the customer is responsible for permissions, monitoring and review. This matches the MCP architecture's practical controls:

- Workspace/site role defines maximum authority;
- site-scoped Agent Instructions shape behavior but do not replace permissions;
- current mode can refuse a tool;
- Site Activity records agent changes;
- AI code components have no secret manager and must never receive tokens in prompts;
- an AI-generated optimization, CMS item or code write can still create externally visible effects after a later human publish.

Disabling the Workspace AI toggle prevents generative features but does not disable every adjacent automated product, including Localize automatic translation and core Optimize/AEO analytics. Governance must inventory the actual enabled planes rather than rely on one “AI off” assumption.

## Evolution: why current Webflow AI has three code models

| Date | Publicly evidenced shift |
|---|---|
| 2023 | in-Designer AI Assistant introduced contextual help, copy and section concepts |
| February 2025 | first AI site builder established prompt-to-native-site creation |
| May–July 2025 | Flowkit v1/v2 formalized the generated class/token foundation |
| September 2025 | MCP expanded from Data API management toward Designer authoring; broader Assistant/code generation announced |
| November 2025 | App Gen public beta added separate full-stack applications on Webflow Cloud |
| January–February 2026 | Webflow AI became broadly enabled and the AI site builder reached multi-page/Enterprise maturity |
| April 2026 | public MCP repository recorded its v1.2-era element/style/variable expansion |
| May 2026 | App Gen development was paused/deprecation announced; AI code components became the recommended site-embedded interactive path |
| July 2026 | MCP 2.0 made most native graph mutation headless and governed; current AI code-component docs fixed the portability/secret boundaries |

The three code models are therefore not interchangeable options invented at once. Native Flowkit pages, hosted single-file AI components and deprecating App Gen applications are outcomes of successive product strategies.

## What remains unknown

- current AI site builder prompt, plan, theme and generated-site serialization;
- model/provider/version used for each site, section, copy, CMS, Optimize, AEO and code-generation operation;
- atomicity and stale-write policy for multi-resource AI Assistant and current MCP 2.0 tool calls;
- exact native element/component id stability across duplication, branch merge, restore and export;
- current remote MCP 2.0 source, Bridge App source and OAuth/token storage/refresh implementation;
- whether current AI code-component source/dependencies receive independent version history and exactly how backups restore them;
- production sandbox/build/runtime isolation for AI code components and their managed packages;
- a supported migration/export path for AI code components or App Gen projects;
- App Gen deprecation dates, export guarantees and post-deprecation Cloud deployment controls;
- whether AI-generated-site transfer/Library restrictions will be lifted and how existing sites would migrate;
- transaction boundaries between site publish, CMS single-item publish, Optimize launch, Localize and Cloud deploy;
- rollback semantics for live Optimize variations, AEO-applied changes and external MCP side effects;
- complete accessibility, performance, responsive and cross-browser quality of generated sites/components.

## Practical acceptance checklist

1. Record which Webflow AI plane is in use: native site, section/copy/CMS, AI code component, Optimize/AEO, MCP or App Gen.
2. Record the native site/page/branch/CMS/component ids, Workspace role and AI/Agent Instructions context.
3. Preserve an explicit backup before broad generation, global style work, CMS import or high-risk agent mutation.
4. Review candidates before insertion and inspect all generated/reused classes, variables, dependencies and content states afterward.
5. Exercise responsive states, interactions, forms, accessibility and the ordinary-user route in the actual Webflow runtime.
6. For MCP, review Site Activity and distinguish API success from a visual snapshot, branch merge and publish receipt.
7. For AI code components, inspect source and packages, test every prop/instance and ensure no secrets entered prompts or code.
8. For CMS/Optimize/AEO, record Draft/queued/live or draft/launched/applied status separately.
9. Publish to staging first, inspect the intended pages/data/app path, then promote the exact staged set to production.
10. Verify the production domain independently and retain a migration/portability plan for code islands and deprecated App Gen apps.

## Evidence ledger

| Evidence | Pin / observation | What it supports |
|---|---|---|
| AI overview article JSON | updated 2026-05-21; fetched 2026-08-11; SHA-256 `932f0ee202980dab86dcc45a7ba073bbfc7903a7df1e0e7cb07fd18d8a3bc886` | current product-family and App Gen lifecycle boundary |
| AI site builder article JSON | updated 2026-05-14; SHA-256 `25d890f2fc39eea809393222646081f163d2991bdb7704c619fa7e382c9f0dfd` | plan/design/theme/Flowkit and portability gates |
| section AI article JSON | updated 2026-07-31; SHA-256 `5b8f7fc40f72e7a509e24f21be1329e3c156a844353c26a4e21769e4b83c6fff` | candidate insertion, classes and beta limits |
| AI code-component article JSON | updated 2026-07-31; SHA-256 `f0f31fc698fe5f591bb092f57b1fce18c2a24d1331dcc750a3d518baf6e62402` | code/dependency/prop/portability/secret contract |
| App Gen article JSON | updated 2026-05-13; SHA-256 `b092fb6448ab276a10e88db28d77f3678ca1af8723702c5a24cde21547dbee00` | separate app/Cloud authority and deprecation |
| MCP current docs | overview `1be8963d…`; architecture `095e557d…`; MCP 2.0 changelog `f7caa04a…` | current remote protocol, governance and live-session boundary |
| official Webflow skills | `b4e1fac15f65f60b60385ccd4f13740ae024665c` | current agent routing across MCP audit Designer Figma transfer publish and code components; same Webflow product identity |
| Flowkit specification | SHA-256 `db5325e89d024de658ef28e2cedb9da3c81c35441e2eaa3061187b00848b47e4` | generated-site class/token system |
| official MCP repository | `main`/`HEAD` `c4fa339cd9ba7a93d771e710db89302fc443c447`; 163 commits; MIT | earlier adapter implementation and current-source gap |
| npm MCP distribution | `1.0.0`; `gitHead=ca01e120…`; tarball SHA-256 `5ce3e9168c743f564af1fc4f41116de4bb95eee7a6e59a34d73479d39c8d4235` | ordinary published local package boundary |
| backup/branch/publish article JSON | backups `e87ba114…`; branches `8d7b6a8a…`; publish `e25d1a8d…` | recovery, isolation and delivery clocks |
| code-export article JSON | SHA-256 `fb674b5a4ac7e58e3f4632a398e10d42df2de3cce157024be9637732c319e6e1` | portability omissions and one-way fork |
| AI Terms snapshot | effective 2026-05-11; SHA-256 `f92e1d3271953497a1ab9a1c06110f108cb70deabe6e3e7aa35a1a66c7fc59a9` | data, agent-action and human-oversight boundary |

## Primary sources

- [Webflow AI](https://webflow.com/ai)
- [Webflow AI overview](https://help.webflow.com/hc/en-us/articles/34297897805715-Webflow-AI-overview)
- [Build with the AI site builder](https://help.webflow.com/hc/en-us/articles/38840145286035-Build-a-site-with-Webflow-s-AI-site-builder)
- [Flowkit framework](https://developers.webflow.com/flowkit/getting-started/intro)
- [Modify page designs with the AI Assistant](https://help.webflow.com/hc/en-us/articles/34205154436243-Modify-page-designs-with-the-Webflow-AI-Assistant)
- [Generate and refine copy](https://help.webflow.com/hc/en-us/articles/38323375464723-Generate-and-refine-copy-with-Webflow-AI)
- [Generate CMS items](https://help.webflow.com/hc/en-us/articles/51037774703251-Generate-CMS-Collection-items-with-Webflow-AI)
- [AI-powered Optimize suggestions](https://help.webflow.com/hc/en-us/articles/41393988797587-Create-an-optimization-with-AI-powered-suggestions)
- [Build AI code components](https://help.webflow.com/hc/en-us/articles/51168990228499-Build-AI-code-components)
- [Webflow component-type matrix](https://help.webflow.com/hc/en-us/articles/44650915153811-Webflow-component-type-overview)
- [Build full-stack apps / current App Gen lifecycle](https://help.webflow.com/hc/en-us/articles/46332369065875-Build-full-stack-web-apps-with-Webflow-AI)
- [Webflow MCP overview](https://developers.webflow.com/mcp/reference/overview)
- [Webflow MCP architecture](https://developers.webflow.com/mcp/reference/how-it-works)
- [MCP 2.0 changelog](https://developers.webflow.com/home/changelog/2026/7/21)
- [Official Webflow Skills repository](https://github.com/webflow/webflow-skills/tree/b4e1fac15f65f60b60385ccd4f13740ae024665c)
- [Official MCP source repository](https://github.com/webflow/mcp-server/tree/c4fa339cd9ba7a93d771e710db89302fc443c447)
- [Page branching](https://help.webflow.com/hc/en-us/articles/46651751861139-Page-branching)
- [Backups and restore](https://help.webflow.com/hc/en-us/articles/33961244069395-Save-and-restore-backups)
- [Publishing workflow](https://help.webflow.com/hc/en-us/articles/46651740529811-Publishing-workflow)
- [Code export](https://help.webflow.com/hc/en-us/articles/33961386739347-How-do-I-export-my-Webflow-site-code)
- [Webflow AI Terms](https://webflow.com/legal/ai-terms)
