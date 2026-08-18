# Alloy

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Alloy / Index Technologies Pty Ltd |
| Category | Capture-grounded AI prototyping and GitHub-backed cloud code agent |
| Status | Active; capture flows were introduced as beta, and codebase sessions were introduced in early access |
| Core source availability | Closed |
| Public implementation boundary | Official product/runtime contracts, MCP, GitHub workspace-boot format, current Chrome extension distribution and its identifiable SingleFile capture dependency |
| Product boundary in this dossier | Capture-first prototypes and repository-backed codebase sessions share a workspace and collaboration surface, but they do not share one artifact, history or recovery authority |
| Decisive artifact question | Is the recoverable object a captured rendered page, a hosted prototype session, an exported React fork, a transient cloud workspace, or a Git branch and pull request? |
| Evidence snapshot | Official docs, security page and launch history plus Chrome extension CRX `3.4.3` inspected on 2026-08-11; no authenticated private workspace was used as evidence |

## The shortest accurate description

Alloy is not one prompt-to-code artifact. It coordinates **three independently durable domains**:

1. a **capture** is a workspace-owned snapshot of a rendered product page or recorded flow;
2. a **prototype session** is a hosted generated experience with chat, files, visual editing, comments and its own destructive history;
3. a **codebase session** is a cloud agent working against a real GitHub repository, booted by checked-in environment files and delivered through a branch and pull request.

The browser extension makes the first domain unusually concrete. The inspected distribution runs a customized SingleFile-style page archival pipeline: it serializes DOM and CSS, extracts resources and computed style context, captures a screenshot, blocks captured scripts and video playback, and packages the result for upload. That is useful **rendered-product code context**. It is not the original React/Vue source, component AST, repository path or Git revision.

The hosted prototype then generates its own implementation from that starting point. Its live preview, chat history, component library and restore operation belong to Alloy. A Pro-plan React ZIP is another downstream fork.

Codebase sessions cross a different boundary. They boot actual repository code in an isolated cloud workspace, let the agent change those files, show a live preview and open a GitHub pull request. Here the repository is implementation authority; the Alloy session is execution, collaboration and review context around it.

Alloy MCP exposes session context to external assistants. Its public contract enumerates metadata, chat, files, prototype file content and some before/after diffs, but no mutation tool. It is therefore a context and handoff plane, not a shared write transaction with either the hosted prototype or Git.

## One workspace, three authority domains

| Domain | Starting material | Working object | Durable center | Recovery / branch action | What does not follow automatically |
|---|---|---|---|---|---|
| Capture library | a rendered private page through the extension, a public URL, or a recorded multi-page flow | archived page representation, resources, screenshot and optional interaction segments | the workspace Capture entry | reuse the capture to start another prototype | renaming a capture does not rename or revise derived prototypes; deleting it does not delete those prototypes |
| Hosted prototype session | one capture plus prompts, files, components and visual edits | Alloy-hosted generated files, rendered preview, chat, comments and session history | the hosted prototype and current chat point | duplicate to preserve a branch; restore from an earlier chat point to replace the later prototype state | restore does not preserve later changes; deleting the prototype deletes its chat/history but leaves the original capture |
| Codebase session | an authorized GitHub repository and its selected revision | isolated cloud checkout, agent conversation, live preview and file changes | repository files, branch and eventual pull request | normal Git review, changes and reverts after the work is pushed | the cloud session does not merge or deploy; public docs do not establish that session rewind restores Git or sandbox side effects |

Several adjacent objects have their own clocks as well:

- captured components can be published as new library versions that update linked Alloy designs;
- public/private share links project a session for review but do not become implementation source;
- inline comments are pinned to an element and page inside a session preview, not to a repository location;
- a downloaded React ZIP becomes an independent filesystem project;
- `.alloy/environment.json` and the referenced Compose file become repository-owned boot configuration;
- MCP consumers receive a read projection of session context at request time.

Any acceptance or recovery plan that treats those objects as one atomic project will lose information.

## Journey A: capture the current product and explore a future one

The ordinary capture-first journey is:

1. **Open a rendered product state.** For a private or authenticated page, use a Chromium browser with the Alloy extension. For a public page, supply a URL that works without authentication, a VPN or a private network.
2. **Capture deliberately.** A single-page capture snapshots the current page. The multi-page mode records navigation and interactions while the user moves through a flow.
3. **Check the Capture entry.** The capture is placed in the workspace library and is visible to all workspace members. It can be renamed or reused without changing prototypes already derived from it.
4. **Start a prototype.** Select the capture, then prompt Alloy in the chat sidebar. Current sessions can also accept documents, presentations, spreadsheets, structured data, source snippets, images, fonts and video as attachments.
5. **Refine the hosted result.** Prompt at page scope, select a specific element for a grounded request, or use the visual toolbar for supported layout, spacing, type, color, border, shadow and opacity controls.
6. **Reuse captured components.** Alloy automatically creates components from captures. A saved component can be referenced with `@Name`; publishing a new component version updates linked designs.
7. **Review the actual interaction.** Exercise the hosted preview at relevant viewport sizes. Comments can be threaded, and the current inline-comment feature anchors a pin to the selected element and page.
8. **Preserve a branch before destructive history actions.** Duplicate creates the same prototype experience with a clean chat sidebar. Restoring from an earlier chat point removes later prototype changes irrecoverably.
9. **Choose a destination.** Keep sharing the hosted session, or on an eligible plan export a generated React ZIP.
10. **Verify the destination independently.** Run the ZIP locally, inspect its code and exercise the journey again. Hosted prototype success does not establish production quality or integration fidelity.

This is a strong ideation and review loop precisely because it starts from a real rendered product. It is still a reconstruction loop, not a reversible edit to the product that was captured.

## Capture is a browser archive, not original application source

### Public distribution snapshot

The product core is closed, but the current Chrome distribution exposes the capture boundary in enough detail to audit it without guessing the hosted implementation.

The extension was fetched through Google's Chrome update service on 2026-08-11. The service redirected to a CRX named `PHENPKGKIAIBDLFGLLCHGFHDFIEPHPDI_3_4_3_0.crx`.

| Distribution fact | Observed value |
|---|---|
| Chrome extension id | `phenpkgkiaibdlfgllchgfhdfiephpdi` |
| Manifest / package format | Manifest V3 / CRX3 |
| Manifest version | `3.4.3` |
| CRX SHA-256 | `EBC0203CA9DA5881D3DF869F4941BCB580F2194942DBEB2A149F57D72426B3B7` |
| Publisher in manifest/store | Index Technologies Pty Ltd |
| Main Alloy content bundle | minified `dist/content.js`, about 1.26 MB |
| Identifiable capture library | `lib/single-file.js` plus SingleFile frame, hook, bootstrap and extension-core modules |
| Source maps | none present in the package |

The indexed Chrome Web Store HTML still exposed the much older `0.2.4` metadata when crawled, while the update service and downloaded manifest served `3.4.3`. The package is the stronger evidence for shipped code; the discrepancy also means store-page metadata should not be used as a release ledger.

The package's SingleFile filenames, globals and page-processing behavior identify the public [SingleFile](https://github.com/gildas-lormeau/SingleFile) family. Upstream SingleFile is AGPL-licensed. The Alloy package does not expose a usable upstream version or commit, so that repository is evidence for the adjacent capture foundation—not a pinned source tree for Alloy's customized bundle or hosted service.

### Manifest authority and privacy surface

The inspected manifest declares:

- `activeTab`, `scripting`, `storage` and `unlimitedStorage` permissions;
- `<all_urls>` host permission;
- a background service worker in `dist/background.js`;
- frame/bootstrap hooks injected at `document_start` across all matching frames;
- the main SingleFile and Alloy content scripts on all URLs;
- an additional upload/detector bridge only for `https://alloy.app/*` and `http://localhost:8080/*`;
- external connection permission limited to those two origins.

Those are capability facts, not proof that Alloy uploads every visited page. The official product flow says the user triggers Capture. They do show why an enterprise must evaluate the extension, captured authenticated state and workspace membership before installing it broadly.

The Store listing discloses handling website content and personally identifiable information. Alloy's current security FAQ goes further: depending on enabled features, stored data can include repository code, captured pages, prompts, uploaded files, integration content, generated code, prototypes, assets, comments and collaboration metadata.

### The single-page packet

For a single-page capture, the shipped Alloy content bundle requests a browser screenshot and calls `singlefile.getPageData(...)` in parallel. Decisive options include:

```text
removeHiddenElements: true
removeUnusedStyles: true
removeUnusedFonts: true
removeFrames: false
blockScripts: true
blockAudios: false
blockVideos: true
compressCSS: false
compressHTML: false
saveOriginalURLs: false
```

After SingleFile returns, Alloy performs another materialization pass:

- parses the serialized HTML;
- removes the extension overlay;
- separates stylesheets, inline style rules, images, fonts and frame resources into named files;
- rewrites embedded data URLs into generated asset paths;
- records selected body computed styles and CSS custom-property values;
- embeds additional SVG style context for a single-page capture;
- strips nonstandard element attributes unless they are used by CSS selectors, are standard for that HTML element, or are `data-proto*`, ARIA or `role` attributes;
- injects a script that prevents anchor navigation inside the captured document;
- adds `index.html`, CSS, `body-computed-styles.json`, `svg-computed-styles.json`, extracted resources and `screenshot.png` to the upload;
- attaches title, up to 50 `h1`/`h2` texts, original URL and a `continuousCapture` flag;
- labels the current payload as `extensionAPIVersion: 8`.

The upload endpoint is an Alloy internal prototype route. The public package exposes the client packet, not the server-side capture schema, conversion model or later prototype generator.

### Recorded flows add interaction segments, not a source repository

The January 2026 capture-flow feature records navigation, form work and modal-triggering interactions. The inspected bundle confirms a separate continuous path:

- it maintains an initial body snapshot;
- tracks route, mutation and interaction segments;
- embeds a `data-proto-diff-data` container before final capture;
- stores pending segments for resume/finalization;
- marks the result with `continuousCapture: true`;
- reuses retained CSS across segments when assembling the uploaded packet.

Continuous mode keeps hidden elements and unused styles that the single-page mode removes, because later interactions may reveal them. It still blocks captured scripts in the archival pass. The recorded interaction representation and Alloy's later runtime must recreate behavior from the packet; the original application's JavaScript module graph is not transported as an executable repository.

### What “screen and code grab” does and does not mean

Official docs call a capture a screen and code snapshot of product structure, UI and styling. The distribution makes that phrase precise:

**Captured evidence includes:**

- serialized rendered HTML and frame documents;
- CSS rules, inline styles and selected computed styles;
- images, fonts, media references and data assets;
- canvas/shadow-root/frame state handled by the SingleFile foundation;
- the current URL, headings and screenshot;
- in continuous mode, an Alloy interaction/mutation representation.

**It does not publicly carry:**

- original React, Vue, Svelte or server source files;
- package-manager lockfiles or build configuration;
- source maps, component ASTs or authored symbol identities;
- repository URL, path, branch, commit or dirty-worktree state;
- a durable binding from a captured element back to the product's source line;
- the original authenticated application's complete backend behavior.

The capture can look exact and still be a derived browser archive. High visual fidelity and source identity are different properties.

## The hosted prototype is a second implementation

### Generated files and preview

Official MCP and export contracts prove that prototype sessions contain generated files, not only pixels. Alloy MCP can list session files and return prototype file content. The export pipeline turns the hosted visual result into a component-based React application in JavaScript or TypeScript with screens, interactions, routing, assets and build dependencies.

The public docs do not disclose:

- the canonical hosted file schema;
- whether the preview executes those files directly or a compiled projection;
- the renderer, bundler, isolation boundary or package policy;
- whether every visual edit maps deterministically to one file;
- how chat, file writes and preview refresh are committed atomically;
- whether a generated file exposed through MCP has an immutable version id.

The safe working invariant is:

`hosted session state -> generated files -> current Alloy preview`

The preview is acceptance evidence for that session, not proof that the captured product or an external repository changed.

### Visual editing grounds intent without exposing source identity

The visual editor selects a rendered block or text element, then offers two paths:

- a targeted natural-language request using the selected element as context;
- WYSIWYG controls for documented CSS-like properties.

Block controls cover absolute size, flex/stack or grid layout, margins, padding, radius, background, border, shadow and opacity. Text controls cover size, family, color, treatment, alignment, spacing and opacity.

The public contract does not reveal the selected-element packet, element id, generated component mapping, source range or patch algorithm. The control may be precise at the user interface while still relying on a proprietary rematerialization step.

Deleting an element is explicitly irreversible. That is stronger than an ordinary non-destructive selection gesture and must be treated as a mutation, not a pending visual preview.

### Captured components create a workspace library clock

Alloy automatically creates reusable components when a page is captured. A component can be opened, changed visually or by prompt, and published as a new version. Publishing updates all linked designs automatically. A component can also be inserted into another design by mentioning its `@Name`.

This creates a shared dependency graph inside Alloy:

`captured component -> published component version -> linked hosted designs`

The public docs do not specify version pinning, compatibility checks, conflict handling or whether a prototype restore also restores the component revision it previously consumed. A component publication can therefore broaden the effect beyond the currently visible prototype.

### Comments are session targets, not code targets

Threaded comments support internal and external feedback. The July 2026 inline-comment feature pins a discussion to the selected element and page in the session preview.

That improves review precision, but the public launch contract does not claim that a pin carries:

- a generated file and source range;
- a repository path or revision;
- a stable identity after the element is regenerated or removed;
- automatic mutation of the prototype or codebase.

A comment is durable collaboration state. It becomes implementation only after an agent or human changes the authoritative artifact and the resulting journey is rechecked.

### History is destructive unless the user branches first

Hosted prototypes autosave, but autosave is not equivalent to a non-destructive version graph.

- **Duplicate** copies the same prototype experience into a new prototype with a clean chat sidebar. This is the documented branch-preservation action.
- **Create new version from this point** restores the prototype from an earlier chat point and removes later prototype changes. Alloy warns that they cannot be recovered.
- **Delete prototype** permanently removes the prototype's chat interactions and version history. The source capture remains.
- **Delete capture** is also irreversible, but derived prototypes remain.
- **Delete workspace** permanently removes its captures, prototypes, components and other associated data through a support-mediated process.

The product uses “version” for an operation whose downstream branch is destructive. A safe reviewer duplicates before exploring an old chat point.

### React export is a one-way fork

Eligible users can download a ZIP containing a component-based React application. Alloy documents a typical `src/`, `public/`, root `App.js`/`App.tsx`, routing and package dependency structure. The generated app uses Bun in the documented local flow:

```sh
bun install
bun run dev
```

The suggested local endpoint is `http://localhost:5173` unless configured otherwise.

Alloy explicitly does not guarantee production-quality code. The export docs describe downloading or uploading the result to a source-control system, not keeping it synchronized with the hosted prototype. The ZIP becomes a new code authority whose dependencies, behavior, accessibility, security, responsiveness and integration must be reviewed independently.

### “Import” from another design tool is still browser capture

Alloy advertises optimized capture paths for Bolt, Figma, Lovable, Magic Patterns, Onlook, Subframe and v0. The documented import does not ingest their native project or source model. It captures what the browser renders, one page at a time.

Consequences documented by Alloy include:

- tool chrome can be captured accidentally unless the preview is opened separately;
- the page must finish loading first;
- complex interactions may need to be recreated;
- authenticated projects require the extension;
- public-link capture is best for static pages with minimal interactivity.

“Imported project” is therefore a new Alloy capture, not a retained native-project binding.

## Journey B: take a real repository to a pull request

Codebase sessions use a different critical path:

1. **Connect GitHub.** Authorize Alloy for the intended personal account or organization and explicitly select accessible repositories.
2. **Choose the repository.** The selected repository becomes the source for a Workspace Setup run.
3. **Let Workspace Setup inspect and boot it.** Alloy opens a cloud workspace, discovers required commands and services, and iterates on a Docker Compose configuration until the preview renders.
4. **Review the setup preview.** A chat confirmation is not enough; the current application and relevant authenticated route must actually be usable.
5. **Push the setup changes.** Alloy opens a pull request containing a Compose file—usually `docker-compose.alloy.yaml`—and `.alloy/environment.json`.
6. **Review and merge the setup PR deliberately.** Once checked in, the environment file is the canonical Alloy boot contract for the repository.
7. **Start a codebase session.** The cloud agent works directly against repository files in an isolated remote workspace, while the session shows chat and a live preview.
8. **Refine and collect feedback.** Share the session and use comments; verify interactions in the actual booted application, not only a generated screenshot.
9. **Push code and open a feature PR.** GitHub receives the reviewable branch and diff.
10. **Finish in the repository workflow.** Inspect the base revision, tests, code, security and deployment. Alloy does not merge or deploy the PR automatically.

The current product page calls codebase sessions and cloud agents the same feature. The April 2026 launch introduced them as early access; the current guide treats the workflow as active. Public evidence does not establish whether every account has identical entitlement or limits.

## The checked-in boot contract

### `.alloy/environment.json` becomes canonical

The documented example is:

```json
{
  "dockerComposePath": "./docker-compose.alloy.yaml",
  "frontendPort": 3000,
  "homeUrl": "/"
}
```

Supported fields are:

| Field | Role |
|---|---|
| `dockerComposePath` | repository-relative path to the Compose file |
| `frontendPort` | application port proxied through Alloy's reserved port `8080` |
| `homeUrl` | initial path to open after startup |
| `loginScript` | optional JavaScript injected once when a preview needs scripted login |

When Alloy finds the checked-in environment file:

- the corresponding GUI environment editor becomes read-only;
- the file is treated as source of truth;
- Alloy syncs its contents back into the stored `environment_config` value;
- invalid JSON keeps the GUI locked and in an error state until the file is fixed or removed.

That is an unusually explicit repository-authority contract for a closed product.

### The current docs contradict themselves about `frontendPort`

The prose says `frontendPort` can be omitted when the application is already available on Alloy's port `8080`. The JSON Schema on the same page lists both `dockerComposePath` and `frontendPort` in `required`, while the property description says not to use `8080` because Alloy owns it and proxies to the configured application port.

Those statements cannot all define one validation rule. The dossier leaves the inconsistency visible. A setup PR must be validated against the behavior of the current account and backend rather than assuming the prose or schema wins.

### The runtime is a Modal sandbox with Docker-specific failure modes

The official guide names Modal's Docker-in-Sandboxes support and warns that it is alpha. Public runtime facts include:

- Docker daemon state is not preserved in Modal filesystem snapshots;
- a resumed sandbox may need to start the daemon again;
- reliable startup can require `dockerd --iptables=false --bridge=none`;
- a repository's Compose setup may separately require `network_mode: host`;
- required secrets must be added in Alloy before boot can succeed;
- Alloy owns port `8080` for its preview/proxy path;
- `docker compose up --wait` waits only for services with a health check;
- dependency installs, builds or migrations can still be running after Compose reports success;
- the same false-readiness risk applies during pre-warming.

This means a green setup status is not enough. The Compose graph needs meaningful health checks for infrastructure and application endpoints, and the live preview must be exercised after the stack reaches real readiness.

### Git is authoritative, but several transaction details remain closed

The public contract establishes repository access, a setup PR, agent changes, Push Code and a feature PR. It does not specify:

- which exact base ref a new session pins when branches advance;
- whether each prompt creates a Git commit or only a working-tree delta;
- how concurrent sessions on the same repository are isolated;
- whether a stopped or failed turn leaves partial files, processes or commits;
- branch naming and force-push policy;
- sandbox lifetime and resumability guarantees;
- how PR updates behave after external branch changes;
- whether a comment or selected preview element maps to a particular source range;
- any atomic rollback spanning chat, sandbox filesystem, GitHub and external services.

The only safe recovery center after push is the repository's observable branch and Git history. Before push, the session workspace is a separate, partially documented state domain.

## MCP is a read projection of session context

Alloy hosts a remote Streamable HTTP MCP server at:

```text
https://mcp.alloy.app/mcp
```

OAuth is the preferred authentication path. Clients without remote HTTP support can use `mcp-remote`; workspace admins can create a workspace-scoped MCP key for clients that need an `X-MCP-API-Key` header.

The public access list is explicit:

- session metadata, including title, type, timestamps, status and workspace context;
- session chat messages;
- file lists;
- prototype-session file content;
- before-and-after file diffs where available.

The documentation describes access and context transfer only. It publishes no Alloy mutation tool, prototype write endpoint, Git push action or comment action through MCP. Calling this boundary read-only is therefore an inference from the complete published capability list, not a claim about undisclosed server internals.

Consequences:

- an external coding agent can understand a prototype without manual screenshot/chat copying;
- a codebase-session diff can help implementation review where Alloy exposes it;
- MCP does not prove that the external agent wrote or committed anything;
- an implementation produced elsewhere does not update the Alloy prototype;
- a prototype file returned through MCP has no public link to the original captured application's authored source;
- authorization is workspace-scoped, so the supplied session URL must belong to the authorized workspace.

The handoff invariant is:

`Alloy session link -> authorized MCP read -> external agent context -> separately verified destination change`

Skipping the final step confuses context acquisition with artifact delivery.

## Persistence, deletion and recovery are intentionally asymmetric

| Event | Capture | Hosted prototype | Components | Codebase session | Git repository | Export / share |
|---|---|---|---|---|---|---|
| rename capture | renamed | unchanged | unchanged | unchanged | unchanged | unchanged |
| delete capture | permanently removed | survives | public effect not specified | unchanged | unchanged | unchanged |
| duplicate prototype | reused as original provenance | copied experience, clean chat | existing library remains | not documented as codebase branch action | no Git branch implied | old shares/exports unchanged |
| restore old chat point | unchanged | later prototype changes removed irrecoverably | component rollback not specified | not documented | no Git rewind implied | old exports/shares not proven to rewind |
| publish component version | unchanged | linked designs update | new shared version | effect not documented | unchanged unless separately implemented | previous exports unchanged |
| delete prototype | survives | chat and history permanently removed | public effect not specified | not applicable | unchanged | copied/exported artifacts can still exist |
| delete workspace | removed | removed | removed | service access removed; exact sandbox cleanup undisclosed | external GitHub repository remains under GitHub authority | external copies may remain |
| push code | unchanged | unchanged | unchanged | session delta reaches branch/PR | branch/PR becomes review authority | session share remains context |

No documented operation restores every column together.

## Target return and source mapping

Alloy exposes several precise-looking targets, but none closes a public capture-to-original-source loop.

### Capture target

The extension retains DOM structure, CSS, resources, computed style context, screenshot evidence and interaction segments. It does not retain original file/range/AST/revision identity. In fact, the post-processing pass intentionally removes many nonstandard attributes and blocks scripts.

### Prototype visual target

The visual editor grounds a request or property edit in a selected hosted element. Inline comments likewise anchor to an element and page. No public packet maps either target to a generated prototype file, much less the source code of the originally captured application.

### Codebase target

The cloud agent operates on real repository files, so its durable result can be reviewed as a real Git diff. The public docs do not disclose a rendered-element-to-source mapping, source-map path or revision guard inside the live preview. A correct-looking preview still requires diff and reuse-scope review.

### MCP target

MCP can return session files and some diffs. It does not expose a target-selection identity that joins a capture DOM element, hosted prototype element and repository source location.

The resulting boundary is:

`rendered page archive -> generated hosted prototype -> optional external React fork`

or, independently:

`Git repository -> cloud checkout -> Git diff / pull request`

The first chain is reconstruction. The second is repository mutation. Public evidence does not establish a lossless bridge between them.

## Failure atlas

| Stage | User-visible failure | Established cause or boundary | Safe response |
|---|---|---|---|
| extension install | extension is unavailable or blocked | Chromium-only capture path; enterprise extension policy | obtain admin approval or use a public URL for eligible pages |
| extension click | nothing happens | content scripts only apply to tabs opened/refreshed after installation | refresh the intended tab or restart the browser before retrying |
| extension capture | capture failed | antivirus, firewall, proxy or enterprise allowlist can block Alloy | evaluate and allowlist the required Alloy service deliberately |
| captured page | wrong controls or tool chrome appear | capture records what the browser rendered | open a dedicated preview and verify state before capture |
| public-link capture | missing interactions/authenticated content | URL must work without credentials/VPN; public capture favors static pages | use the extension for private state; recreate and verify complex interactions |
| single-page capture | hidden or unused content is absent | shipped capture options remove hidden elements and unused styles | capture the relevant revealed state or use a recorded flow where appropriate |
| recorded flow | behavior diverges from the product | scripts are blocked in the archive and behavior is represented through recorded segments | exercise every critical transition in the resulting prototype |
| visual edit | an element disappears permanently | visual Delete is documented as irreversible | duplicate or preserve a branch before destructive exploration |
| component update | unrelated linked designs change | published component versions update linked designs | enumerate consumers and review them before publication |
| history restore | later work vanishes | restore from a chat point is destructive | duplicate first, then restore in the copy |
| prototype deletion | chat and history disappear | deletion is permanent | export or preserve required evidence before deletion |
| React export | ZIP looks plausible but is not deployable | production quality is not guaranteed; export is a fork | inspect code, install cleanly, test the actual journey and integrate through normal review |
| Workspace Setup | preview never boots | Compose, daemon, network, secrets, port or login contract is wrong | inspect setup PR/logs and correct repository-owned configuration |
| resumed cloud workspace | Docker services disappear | daemon state is not preserved in Modal snapshots | restart the daemon/services and retest readiness |
| setup status | Alloy reports ready too early | `docker compose up --wait` ignores services without health checks | add real health checks and test the application endpoint |
| environment config | GUI is locked in error | checked-in JSON is invalid | repair or remove the repository file through Git review |
| environment validation | backend disagrees with docs | `frontendPort` optionality conflicts with the published schema | verify against current behavior and record the accepted config in the setup PR |
| MCP connection | session cannot be resolved | wrong URL, incomplete OAuth, wrong workspace or stale server process | authorize the owning workspace and restart the client connection |
| MCP handoff | external code does not match session | context read is not a write or shared transaction | inspect the destination diff and run the destination independently |
| data governance | expected region/control is unavailable | public security page says US storage; SOC 2 Type II and audit logs were not complete at snapshot | confirm current contractual controls with Alloy before regulated use |

## Security and workspace boundaries

Official security material last updated 2026-07-13 states:

- daily backups to a separate region with recovery testing;
- AES-256 encryption at rest;
- HTTPS/TLS 1.2 and 1.3 in transit;
- primary AWS storage in `us-west-2` and backup replication to `us-west-1`;
- SOC 2 Type II in progress with an estimated Q3 2026 completion;
- audit logs and data residency listed as upcoming;
- SSO through SAML or OIDC on Enterprise;
- access, transfer and deletion requests through support.

The workspace guide exposes a data-region field set during workspace creation, while the security FAQ names only the two US regions above. Public docs do not establish that another operational storage region can currently be selected. That should be treated as a procurement question, not inferred from the existence of a settings field.

All workspace members can view captures and prototypes created in that workspace. Capturing an authenticated application can therefore transfer sensitive rendered state from the source application's access model into Alloy's workspace access model.

## Product evolution changes the architecture

| Date | Public change | Architectural consequence |
|---|---|---|
| 2025-09-25 | Alloy introduced capture-first AI prototyping | rendered product capture became the starting authority |
| 2025-12-04 | macOS and Windows desktop apps | the same hosted work gained native clients without changing capture authority |
| 2025-12-06 | public-link capture | server-side/public capture became a lower-fidelity alternative to the extension |
| 2026-01-15 | end-to-end architecture rebuild and performance claim | implementation changed behind the same product workflow; timings are release claims, not artifact guarantees |
| 2026-01-28 | multi-page capture flows in beta | capture expanded from a page archive to interaction/mutation segments |
| 2026-02-18 | responsive chat, stop and queue | agent control improved without proving transactional rollback |
| 2026-03-06 | threaded comments | review state became a distinct persistent domain |
| 2026-03-19 | shared nested folders | workspace organization gained a separate hierarchy |
| 2026-04-21 | codebase sessions in early access | Alloy added a second implementation authority: real GitHub repositories |
| 2026-04-29 | Slack session launch and Push Code | a conversation thread became another session entry point, not a new artifact authority |
| 2026-06-15 | conversational voice | spoken wording became chat input in the current session |
| 2026-06-24 | Alloy MCP | external assistants gained a read projection of session context |
| 2026-06-26 | reusable Skills | workspace/session guidance gained reusable slash-addressed instructions |
| 2026-07-03 | prompt file attachments | documents, data, media, fonts and source snippets could condition generation |
| 2026-07-20 | model selection | model choice became workspace-persistent across prototype and codebase sessions |
| 2026-07-28 | inline comments | review pins gained element-and-page anchoring in the preview |

The lineage matters: statements from the original capture-only product must not be projected onto codebase sessions, and repository behavior must not be projected back onto ordinary hosted prototypes.

## Facts, inferences and unknowns

### Established facts

- Captures and prototypes are separate workspace objects with asymmetric rename/delete behavior.
- The shipped extension serializes rendered page structure/resources, takes a screenshot, blocks scripts and video playback, and leaves the audio-block option disabled in the capture packet.
- Multi-page capture uses a distinct continuous representation with interaction/mutation segments.
- Hosted prototypes contain files that MCP can expose and that Alloy can export as generated React.
- Visual editing targets rendered elements and supports documented CSS-like controls.
- Prototype restore from an earlier chat point destroys later prototype changes; duplicate is the preservation path.
- Captured components can be versioned and published to update linked designs.
- Codebase sessions boot real GitHub repositories in isolated cloud workspaces and deliver pull requests.
- `.alloy/environment.json` becomes repository-owned boot truth and locks the GUI copy.
- The current runtime guide names Modal Docker-in-Sandboxes and its persistence/readiness constraints.
- MCP uses remote Streamable HTTP and exposes session context, files and some diffs.
- The public MCP contract does not enumerate write tools.

### Evidence-backed inferences

- A capture's “code grab” is best understood as a page-archive representation of browser output, not original authored source.
- Capture, hosted prototype and codebase session are independent mutation and recovery domains even when one workspace links them.
- Visual selection and inline comments improve grounding but do not establish source return without a published file/range/revision packet.
- MCP is read-only at the published contract boundary and requires a later destination diff to prove implementation.
- A generated React ZIP and a GitHub PR are fundamentally different exits: one forks a hosted prototype, while the other changes a repository through review.

### Consequential unknowns

- hosted prototype database, file/version and renderer schemas;
- exact model prompts, planning state and tool routing;
- the selected-element packet and visual-edit patch mechanism;
- component identity, pinning and rollback behavior across linked designs;
- comment retargeting after regeneration;
- atomicity among chat, generated files, preview, components and comments;
- the exact SingleFile upstream version/commit used in extension `3.4.3`;
- server-side behavior after the client uploads a capture packet;
- branch/base-ref/commit policy for codebase sessions;
- sandbox lifetime, resume guarantees and cleanup behavior;
- concurrent-session and external-branch conflict handling;
- whether codebase previews have any deterministic element-to-source mapping;
- which `frontendPort` rule the current backend validates;
- operational availability of non-US data regions;
- current audit-log and SOC 2 completion status after the review date.

## Acceptance checklists

### Capture-first prototype

- [ ] Record the source application's URL, visible state, viewport and build/revision before capture.
- [ ] Confirm the capture excludes browser/tool chrome and sensitive information not intended for the workspace.
- [ ] Compare typography, assets, responsive behavior and every critical interaction against the source.
- [ ] Treat captured components as shared dependencies and review consumers before publishing a new version.
- [ ] Duplicate before an irreversible visual delete or old-chat restore.
- [ ] Exercise the final hosted journey from a clean share session.
- [ ] If exporting, unpack in a clean directory, install with the documented toolchain, inspect the diff/dependencies and rerun the full journey.

### Codebase session

- [ ] Verify the GitHub installation scope, repository and exact base revision.
- [ ] Review the setup PR rather than accepting generated Compose/environment files blindly.
- [ ] Resolve the `frontendPort` contract against current backend behavior.
- [ ] Keep secrets in Alloy's secret store, not in checked-in Compose or login scripts.
- [ ] Add health checks that cover real service readiness.
- [ ] Exercise the authenticated route and failure states in a fresh cloud preview.
- [ ] Review all changed files and generated commits in GitHub.
- [ ] Run repository tests and security checks outside the chat completion signal.
- [ ] Merge and deploy through the team's normal controls; verify the deployed journey separately.

## Evidence boundary reached

The decisive public boundary is now established:

- the extension distribution reveals the capture packet and its loss of original source identity;
- official product docs establish the hosted prototype, component and destructive-history semantics;
- export docs establish a one-way React fork;
- GitHub docs establish the repository-owned Compose/environment contract and Modal runtime edge;
- MCP docs establish the external context projection;
- security and workspace docs establish the storage, membership and deletion boundary;
- the remaining gaps are proprietary server, model, renderer, visual-mapping and transaction internals.

No public repository, source map, SDK or protocol currently exposes the Alloy hosted core deeply enough for commit-level tracing. The public SingleFile repository is an adjacent foundation without a disclosed Alloy dependency revision; it must not be used as a substitute for proprietary product source.

## Primary sources

### Product, journeys and persistence

- [Alloy launches](https://alloy.app/launches)
- [Concepts](https://alloy.app/guide/concepts)
- [Captures](https://alloy.app/guide/how-to-capture)
- [Browser extension](https://alloy.app/guide/browser-extension)
- [Public links](https://alloy.app/guide/public-url)
- [Prototypes](https://alloy.app/guide/how-to-prototype)
- [Visual editing](https://alloy.app/guide/visual-editing)
- [Components](https://alloy.app/guide/components)
- [Import from other tools](https://alloy.app/guide/import)
- [Export code](https://alloy.app/guide/export-code)
- [Workspaces](https://alloy.app/guide/workspaces)
- [Download Alloy](https://alloy.app/guide/download-alloy)

### Repository runtime and agent interface

- [GitHub codebase connectivity](https://alloy.app/guide/github-codebase-connectivity)
- [Cloud agents](https://alloy.app/cloud-agents)
- [Alloy MCP](https://alloy.app/guide/integrations/mcp)

### Distribution and security

- [Alloy Chrome Web Store listing](https://chromewebstore.google.com/detail/alloy-ai-prototyping-for/phenpkgkiaibdlfgllchgfhdfiephpdi)
- [SingleFile public repository](https://github.com/gildas-lormeau/SingleFile)
- [Alloy security](https://alloy.app/security)

All URLs and the direct Chrome distribution were checked on 2026-08-11. Product pages and launch posts establish public behavior; the CRX establishes shipped client behavior only; SingleFile establishes the adjacent open foundation only. None exposes Alloy's hosted implementation source.
