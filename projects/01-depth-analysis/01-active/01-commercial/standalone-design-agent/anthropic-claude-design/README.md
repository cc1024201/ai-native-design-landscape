# Claude Design

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Anthropic / Anthropic Labs |
| Category | Agent-first design workspace |
| Status | Active beta; launched as a research preview on 2026-04-17 |
| Availability | Claude Pro, Max, Team and Enterprise; Enterprise defaults off |
| Product surfaces | `claude.ai/design`; current user documentation also describes a Claude Desktop sidebar entry |
| Source availability | Closed; no canonical client, renderer, project-schema or MCP-server source repository is published |
| Canonical product URL | https://claude.com/product/design |
| Canonical source repository | N/A — closed source |
| Pinned source revision | N/A — no public implementation revision |
| Public agent endpoint | `https://api.anthropic.com/v1/design/mcp` |

## Product boundary: a hosted visual project, not one design-file format

Claude Design is a dedicated Claude workspace for producing designs, interactive prototypes, presentations, one-pagers and other visual work. The visible surface is a chat beside a canvas: Claude creates a working first version, the user corrects it at several levels of precision, and the result can be shared, exported or handed to another tool. Anthropic launched the product from Anthropic Labs on 2026-04-17 and now labels it beta in the [current product page](https://claude.com/product/design), [user guide](https://support.claude.com/en/articles/14604416-get-started-with-claude-design) and [admin guide](https://support.claude.com/en/articles/14604406-claude-design-admin-guide-for-team-and-enterprise-plans).

The product is broader than a UI mockup generator. Its documented result types have different native delivery formats:

- runnable prototypes and microsites can leave as standalone HTML or a ZIP/folder;
- decks can leave as PPTX, PDF or an editable destination such as Canva;
- product concepts can move to Claude Code or partner builders for implementation;
- hosted projects can remain organization-scoped review objects with view, comment or edit access.

That breadth is causally important: the product cannot be accurately modeled as a thin wrapper around one universal equivalent of a Figma file. Anthropic does not publish the internal project schema that reconciles these result types.

## The ordinary journey has two coupled loops

Claude Design separates organization setup from day-to-day making. A team can use the product without a prepared design system, but Anthropic says the result will be generic; its recommended rollout starts by establishing and validating the organization-level system.

### Loop A: turn examples into an organization constraint

```text
codebase / design files / screenshots / deck / brand assets
                         ↓
                 Claude extraction
                         ↓
 colors · typography · components · layout patterns
                         ↓
             review with generated examples
                         ↓
               publish / set default
                         ↓
            inherited by future projects
```

The [design-system setup guide](https://support.claude.com/en/articles/14604397-set-up-your-design-system-in-claude-design) establishes the public lifecycle:

1. a permitted user creates or selects an organization;
2. they supply at least one codebase, designed document/deck or brand-asset source;
3. Claude extracts a reusable UI kit containing color, type, components and layout patterns;
4. the owner validates it by generating representative work;
5. the system is published and can become the organization default;
6. later changes are made by opening the system and using **Remix** to work on it with Claude.

Organizations can retain multiple design systems. Enterprise custom roles can reserve publication, default selection and deletion for designated administrators. This makes the design system a governed product object, not merely a prompt attachment.

### Loop B: create, inspect, correct and deliver a project

```text
inherited or attached design system
              +
prompt / screenshot / document / repository / web capture
              ↓
       working canvas result
              ↓
 chat ─ inline comment ─ direct edit ─ generated slider
              ↓
       save another direction
              ↓
 share / export / hand off
```

The [current getting-started guide](https://support.claude.com/en/articles/14604416-get-started-with-claude-design) gives this ordinary-user path explicitly: create a project, attach or inherit a design system, add context, describe the intended result, inspect the canvas, refine it, then export or share it. Screenshots, assets, slide decks, documents, repositories and existing design work can all condition the project.

## The hosted project is the working authority; exports are exits

The public contracts expose three ownership layers but do not publish their internal schemas:

| Layer | Established product behavior | Authority during the documented journey | What remains unknown |
|---|---|---|---|
| Organization design system | Extracted from supplied assets, publishable, selectable as default, reusable across projects and editable through Remix | Governing constraint inherited or attached to projects | exact component/token schema, source binding, validation algorithm and revision model |
| Hosted Claude Design project | Holds the conversation-visible working design, comments, direct edits, saved directions, sharing permissions and export actions | Working source of truth while the user remains in Claude Design | project graph, stable node IDs, operation log, storage layout and merge semantics |
| Export or handoff | ZIP/folder, standalone HTML, PDF, PPTX, partner destination or Claude Code handoff | New delivery artifact or downstream implementation input | whether any format roundtrips, how identities survive, and how later downstream edits return |

**Inference:** the hosted project is the practical editing authority because sharing, revision requests and all export choices originate there. This is an inference from observable product contracts, not a claim about Anthropic's storage model.

An HTML export can be a runnable result and a PPTX can become an editable presentation, but neither fact establishes that either file is a lossless serialization of the hosted project. Similarly, a downstream application can become the eventual production authority without proving a live two-way binding to the design project.

## Correction is split by intent bandwidth

Claude Design's decisive interaction mechanism is not just prompt-to-canvas generation. It gives the user four ways to express a correction, each suited to a different amount and type of intent:

| Human signal | Documented use | Addressing precision | Publicly established action |
|---|---|---|---|
| Chat | structural changes, new sections, alternatives, explanation and accessibility review | project- or composition-level language | Claude regenerates or revises the working result |
| Inline comment | a component-level request at a clicked canvas location | selected visible element plus comment | Claude receives a targeted change request |
| Direct edit | quick aesthetic/layout correction | direct manipulation of visible elements | drag, resize, align and edit text on the canvas |
| Claude-created adjustment slider | continuous exploration of a relevant visual parameter | control generated for the current work | tune dimensions such as spacing or color, then ask Claude to propagate the change |

The [launch announcement](https://www.anthropic.com/news/claude-design-anthropic-labs) introduced custom sliders made by Claude, while the [current product page](https://claude.com/product/design) continues to describe adjustment sliders created by Claude alongside element comments, direct text editing, drag, resize and alignment.

This is an artifact-specific control surface: Claude participates not only in generating the result, but also in selecting a useful continuous control for that result. The public evidence does **not** reveal whether a slider is backed by CSS variables, generated code, a parameter graph, repeated model calls or another mechanism. It also does not establish that a direct edit and an agent edit address one durable internal node identity.

One documented bridge is especially important: after a user makes a local adjustment, Claude can apply that change across the larger design. At the product level this is demonstration followed by generalization. The inference from a demonstrated edit to a broader rule is model behavior; it is not equivalent to replaying the same low-level operation everywhere.

## The design system is inferred, then governed

The design system is not limited to importing an already normalized token file. Claude can derive colors, typography, components and layout patterns from heterogeneous evidence including React-style component libraries, existing design files, screenshots, presentations, PDFs and brand assets. The user then validates generated examples before publishing the result.

This creates a two-step correctness boundary:

1. **Extraction correctness:** did Claude infer the intended rules from incomplete or inconsistent sources?
2. **Generation compliance:** did the project actually follow the published system?

Anthropic says Claude builds with real components, checks its output against the selected design system and corrects it before presentation. No public contract defines the check, the fidelity metric, component-source identity or what happens when two supplied sources disagree. The getting-started guide explicitly warns that a messy codebase or incomplete design file will propagate into output quality.

Publishing and default selection create organization-level governance, but they do not make the inferred kit an independently auditable package. The public docs do not describe export of the design-system object, semantic diff between revisions, dependency pinning, or a project-level record of which exact design-system revision generated a result.

## Executable previews have a separate trust boundary

The [admin guide](https://support.claude.com/en/articles/14604406-claude-design-admin-guide-for-team-and-enterprise-plans) provides one concrete runtime fact: project previews execute in sandboxed iframes on an Anthropic-operated content domain separate from the account and editor. Preview access uses short-lived signed tokens that are rechecked against project sharing permissions when opened.

That establishes the following public boundary:

```text
Claude Design editor and account
             │
      permission-checked token
             │
             ▼
separate-domain sandboxed preview iframe
```

The preview code is documented as unable to reach the user's Claude account, login or editor. The evidence does not disclose the renderer framework, container lifecycle, network policy, package installation policy, CSP details, deterministic-build guarantees or whether every export is produced from the exact preview bytes.

Hosted sharing supports view-only, comment and edit access within the organization. Multi-person editing is currently documented as basic and potentially unreliable, so link permissions should not be confused with mature real-time collaborative editing semantics.

## Claude Code and MCP form an authenticated service edge

Claude Design exposes several routes between the hosted project and coding work:

- `/design-sync` brings design-system context from Claude Code;
- the product page documents `/design` for working with Claude Design from Claude Code;
- a design can be handed to local Claude Code or Claude Code on the web;
- Claude Code can connect to the hosted Claude Design MCP service.

The official setup command is:

```bash
claude mcp add --scope user --transport http claude-design https://api.anthropic.com/v1/design/mcp
```

The user then runs `/design-login`. On 2026-08-11, an unauthenticated MCP `initialize` request to that endpoint returned `401 Unauthorized` with an OAuth protected-resource URL. The public resource metadata returned:

```json
{
  "resource": "https://api.anthropic.com/v1/design/mcp",
  "authorization_servers": ["https://claude.ai/v1/design/mcp"],
  "scopes_supported": ["user:design:read", "user:design:write"]
}
```

This live edge check establishes an authenticated read/write design service and separate authorization server. It does not expose the post-login MCP tools, project schema or mutation guarantees. The response's `x-version` value (`95128532c446870be1f579fbfc30f53b5dc1ec7b`) is a deployed service identifier observed at that moment, not a public source commit and not a stable product version.

Anthropic describes handoff as carrying existing work or a bundle including design intent so Claude Code does not restart from a screenshot. The schema of that bundle, its component/source references and its behavior after either side changes are not public. Therefore the evidence supports workflow continuity, but not a durable canvas-node-to-file/AST mapping or a two-way transaction between design and code.

## Persistence exists at several scopes, but version semantics are thin

The public behavior establishes persistence at more than one scope:

- uploaded organization assets are stored persistently under Anthropic's applicable retention/deletion policies;
- published design systems survive and are reused by later projects;
- hosted projects can be shared and revisited;
- a user can ask Claude to save the current direction before exploring another one;
- prior saved iterations can be referenced in the conversation.

The user guide does not document an explicit revision graph, automatic snapshot cadence, named-version identifiers, granular restore, diff, branch merge or conflict resolution. “Save what we have” proves a user-visible checkpoint operation, not a Git-like history model. Likewise, starting a new chat tab inside the same project is the documented workaround for one chat failure, but the docs do not specify which context is shared between those tabs.

At the organization level, Claude Design currently lacks audit logs. Usage analytics can show adoption, but analytics are not an edit history. The admin guide also says data residency is not currently supported.

## Delivery changes the artifact and its owner

| Exit | User-obtainable result | What can be verified after exit | Boundary not established |
|---|---|---|---|
| Download ZIP / save folder | local bundle | files and local runtime can be inspected | lossless re-import or future hosted-project sync |
| Standalone HTML | executable web artifact | browser behavior and asset completeness | equality with the hosted preview environment |
| PDF | fixed-layout delivery | rendered pages | editable project semantics |
| PPTX | editable presentation container | slide structure and rendering in a compatible app | fidelity of every canvas behavior or component |
| Organization link | hosted review surface | current accessible project under permissions | offline ownership or permanent URL validity |
| Partner destination | destination-native artifact or implementation workflow | state visible in the receiving product | shared identity, transaction or reverse synchronization |
| Claude Code handoff | implementation context and/or files for a coding agent | resulting repository diff and real runtime | automatic fidelity, production readiness or durable node-to-source identity |

A successful export notification is not sufficient artifact evidence. Each exit must be validated in its receiving environment: unzip and run HTML, render PDF/PPTX, inspect the destination-native object, or review and execute the repository produced by Claude Code.

## Failure atlas from the current product contract

| Breakpoint | Documented symptom or constraint | Consequence | Current mitigation / evidence limit |
|---|---|---|---|
| Inline-comment persistence | comments can intermittently disappear before Claude consumes them | a precisely addressed correction may be lost | copy the feedback into chat; no public delivery acknowledgement protocol |
| Large repository context | very large codebases can cause lag or browser issues | design-system grounding may be incomplete or slow | use `/design-sync` from Claude Code; exact ingestion limits are unpublished |
| Chat upstream error | a project chat can fail | iteration stops despite the project still existing | start another chat tab in the same project; shared-state semantics are unspecified |
| Multi-person editing | simultaneous editing is still basic and may be unreliable | concurrent corrections can conflict or disappear | no documented CRDT/OT, locking or conflict UI |
| Noisy design-system sources | incomplete or messy inputs degrade output | every inherited project can repeat the wrong rule | add better examples and regenerate/refine the system |
| Shared usage pool | complex projects and many iterations consume the same quota as chat, Claude Code and Cowork | design becomes unavailable when usage is exhausted | wait for reset or enable usage credits |
| Governance telemetry | no Claude Design audit log | admins cannot reconstruct every design action from an audit stream | usage analytics and qualitative sampling do not replace provenance |
| Preview/export discontinuity | hosted preview and export targets have different environments | a design that looks correct in the iframe may fail after delivery | validate the actual exported artifact; exact build equivalence is unknown |
| Availability documentation drift | the current user guide says web and Claude Desktop; the admin guide's third-party-platform section says web only | deployment planning can misclassify the supported surface | treat web as confirmed and Desktop as documented but not live-verified in this audit |

## Product evolution that changes the technical model

| Date / snapshot | Public change | Why it matters |
|---|---|---|
| 2026-04-17 | Anthropic Labs launched Claude Design as a research preview powered at launch by Claude Opus 4.7 | established chat + canvas, inferred team design systems, fine-grained controls, sandboxed prototypes and intent-carrying Claude Code handoff as one product |
| 2026-06-17 documentation | organization design-system extraction, publication, default selection and Remix update flow documented | made the design system a governed reusable object rather than a per-project attachment only |
| 2026-08-11 snapshot | product and help pages label Claude Design beta; product page documents `/design-sync`, `/design`, more partner exits and shared subscription limits | the current product boundary is broader than the launch preview and spans a hosted editor, code interface and downstream artifact network |

No public source history or stable API changelog maps these product changes to implementation commits. Current help pages are mutable, so this dossier records the review date and preserves conflicting statements rather than silently reconciling them.

## Evidence boundary

### Fact

- Claude Design is a closed hosted beta with chat and canvas surfaces, organization design systems, four documented correction modes, hosted sharing, multiple export formats and Claude Code/MCP integration.
- Design-system objects are generated from supplied assets, can be published, selected as defaults, reused, updated and governed through Enterprise roles.
- project previews use a separate-domain sandboxed iframe and permission-checked signed access tokens.
- the public MCP resource requires Bearer authentication and advertises read/write design scopes.
- current official docs enumerate specific failure modes around comments, large repositories, chat errors, concurrency, source quality, audit logs and data residency.

### Inference

- the hosted Claude Design project is the working editing authority because corrections, sharing and all exits originate there.
- Claude-created sliders constitute an artifact-specific generated control surface, even though their implementation is unknown.
- a handoff preserves more task context than a screenshot-only transfer, but its semantic strength cannot be quantified from the public bundle description.

### Unknown or not established

- internal project, canvas-node, component, token, comment and revision schemas;
- renderer, editor framework, model orchestration, tool calls and generated-control implementation;
- post-login MCP tool list, idempotency, transactions, error model and concurrency behavior;
- stable canvas-node-to-design-system-component or canvas-node-to-code-AST identity;
- lossless roundtrip among the hosted project, HTML, PPTX, partner destinations and source repositories;
- exact version pinning between a project and the organization design system;
- production fidelity or accessibility of generated work without artifact-specific acceptance testing.

## Verification performed for this snapshot

- Opened the current Anthropic product, launch, getting-started, design-system, admin and release-note pages on 2026-08-11.
- Opened `https://claude.ai/design` in both a clean application-browser session and the available Chrome session; neither had a Claude login, and both redirected to the product page with a login-return URL, so no signed-in editor behavior was claimed.
- Sent an unauthenticated MCP initialize request and read the advertised OAuth protected-resource metadata; no credentials, project mutations or paid model turn were used.
- Did **not** create a project, import a repository, inspect an authenticated MCP tool list, exercise direct editing, export an artifact or validate a Claude Code handoff. Neither available browser session was authenticated, so those checks require new account authority and remain explicitly access-blocked rather than implied successes.

## Research gaps

- Run one controlled signed-in project through prompt, inline comment, direct edit, generated slider, saved direction and restore; record which identities survive each step.
- Export the same project to ZIP, standalone HTML, PDF and PPTX and compare the actual bytes, structure, runtime behavior and re-import support.
- Authenticate the documented MCP service in a disposable test organization, record its tool/resource schemas and test read/write error, concurrency and idempotency semantics without exposing credentials.
- Inspect one `/design-sync` and Claude Code handoff end to end to determine the bundle contents, repository mutation authority and whether design-system component references remain actionable.
- Test permission revocation against an already open preview and document token expiry behavior.
- Reconcile the current web/desktop availability statements through direct signed-in observation or a clarified Anthropic document.

## Primary sources

- [Claude Design product page](https://claude.com/product/design)
- [Introducing Claude Design by Anthropic Labs — 2026-04-17](https://www.anthropic.com/news/claude-design-anthropic-labs)
- [Get started with Claude Design](https://support.claude.com/en/articles/14604416-get-started-with-claude-design)
- [Set up your design system in Claude Design](https://support.claude.com/en/articles/14604397-set-up-your-design-system-in-claude-design)
- [Claude Design admin guide for Team and Enterprise](https://support.claude.com/en/articles/14604406-claude-design-admin-guide-for-team-and-enterprise-plans)
- [Claude release notes](https://support.claude.com/en/articles/12138966-release-notes)
- [Claude Design MCP protected-resource metadata](https://api.anthropic.com/v1/design/.well-known/oauth-protected-resource)
