# Builder.io Fusion

> Research status: **Architecture-level / closed hosted boundary reached; MIT dev-tools distribution and public Agent Skills inspected** · Last reviewed: **2026-08-11**

| Field | Verified value |
|---|---|
| Product / operator | Builder.io Fusion; current documentation usually calls its repository-backed working surface **Projects** |
| Lifecycle | Active; introduced on 2025-06-18 and released as Fusion 1.0 on 2025-11-06 |
| Category | Repository-backed visual development and product/design/code agent workspace |
| Ordinary working object | A Builder Project and branch running an application checkout, with visual/agent/code changes converging toward branch files |
| Supported web stacks | React, Next.js, Vue, Svelte and Angular are advertised on the current product surface; repository setup docs describe React, Vue, Svelte and Angular support |
| Git providers | GitHub, GitLab, Azure DevOps and Bitbucket, with provider-specific and enterprise connection paths |
| Human surfaces | Design, Interact and Code modes; agent chat in Fast or Plan mode; comments, history, previews, branch navigation and PR review |
| External agent surfaces | Hosted Fusion MCP, local Builder MCP, Agents Run API, CLI, Desktop app, VS Code integration, Slack/Jira workflows and `@builder-bot` in provider PRs |
| Execution choices | Builder cloud container, host-local temporary workspace, or local Podman container; enterprise custom-image and privacy controls are documented |
| Working code authority | Builder branch workspace/container while editing; committed Git branch and reviewed PR after synchronization |
| Separate publishing lane | Builder Publish can register approved React components/content surfaces and deliver CMS-managed changes; it is not the same state graph as a Fusion Project branch |
| Source availability | **Partial / hybrid**: hosted editor, agent, capture and source-write core are closed; `@builder.io/dev-tools@1.79.0` is MIT and ships readable bundles, declarations and a complete 1,294-source source map; public Agent Skills are commit-addressable |
| Public package inspected | `@builder.io/dev-tools@1.79.0`, published 2026-08-05, Node `>=18`, 490 files and 56,036,252 unpacked bytes |
| Closed boundary | Hosted canvas, renderer instrumentation/capture, model orchestration, visual-to-source mutation planner, branch/history stores, collaboration, container control plane, reviews and Publish service |
| Evidence snapshot | Official product/docs/blogs, npm registry metadata, exact tarball hashes, unpacked package/source map, and two official GitHub repositories; no Builder account, repository, branch, PR or deployment was mutated |

## The shortest accurate description

Fusion is a visual IDE and agent control plane over a running repository branch. The canvas is not the durable design document. It is a live projection of an application checkout, and its useful result is code that can enter the team's existing Git and PR workflow.

```text
repository base branch
  -> fresh Builder branch workspace / application runtime
       ├─ Design: staged visual operations -> Apply Visual Changes
       ├─ Agent: Fast implementation or Plan -> Implement Plan
       ├─ Code: direct file edits
       ├─ external agent / CLI: committed Git branch push or pull
       └─ Interact: executable preview and user-flow observation
  -> branch files in Builder's execution environment
  -> Git commits and provider branch
  -> reviewed pull request
  -> existing CI/deployment pipeline

parallel, non-atomic clocks
  ├─ prompt/chat history and bookmarks
  ├─ hosted restore points
  ├─ live application process and browser state
  ├─ Builder branch/container snapshot
  ├─ remote Git branch and PR comments
  ├─ preview URL and QA recordings
  ├─ design-system index and project rules
  └─ optional Builder Publish content/version state
```

That distinction prevents the most consequential category error. “The visual change looks right” establishes transient runtime state. “Apply Visual Changes finished” suggests source materialization. “History restored” changes a hosted project state. “The branch was pushed” establishes a remote Git projection. “The PR merged and the deployed ordinary-user journey passed” is delivery evidence. None of those receipts subsumes all the others.

## The ordinary repository-to-PR journey

### Establish the branch and runtime

1. Connect an existing repository or start a new project. For an existing repository, configure the primary branch, setup commands, development-server command/port and environment variables.
2. Builder creates a fresh branch workspace from the configured main branch, clones the repository, installs dependencies, starts the development server and opens the running application in the Visual Editor.
3. Add design-system or API repositories as context where needed. Additional repositories can inform generation; they are not automatically the primary mutation authority.
4. Confirm the correct route, state and data are running. A successful clone or dev-server process does not establish that the canvas is showing the intended page or that authenticated/data-dependent paths work.

### Change the product through the appropriate control plane

5. Use **Design** for selected-element layout, typography, spacing, styles, options, hierarchy, tokens and data bindings. These operations remain pending until **Apply Visual Changes** synchronizes them to underlying code.
6. Use **Fast** prompting when immediate implementation is intended. Use **Plan** to discuss first; the documented write boundary is **Implement Plan**.
7. Use **Code** for direct source edits, terminal/log inspection and Git status. Code changes flow back into Design and Interact projections.
8. Use **Interact** to exercise the actual running application across routes, controls and screen sizes. It is an observation/interaction mode, not a commit or release receipt.
9. Review the changed files and behavior together. Generated use of a component or token is still a hypothesis until the diff, runtime and intended product path agree.

### Promote and independently accept the result

10. In PR or draft-PR commit mode, choose **Send PR**, review proposed changes and create the provider PR. Direct Commit mode deliberately shortens this gate and therefore needs stronger local review discipline.
11. Run existing tests, build and lint commands, inspect the PR diff, and exercise the ordinary-user journey from a fresh state. Builder's optional code-review and browser-QA agents can add evidence, but do not replace product acceptance.
12. Merge through the team's normal approval policy and verify the actual deployment. A Builder preview URL is a branch runtime projection; it does not prove the merged commit, production environment, data or external services.

The critical acceptance chain is therefore:

```text
intent accepted
  != visual operation staged
  != source materialized
  != branch committed
  != remote synchronized
  != PR approved/merged
  != deployed ordinary-user journey accepted
```

## Fusion's decisive mechanism: plural inputs, one branch workspace

### Design, Interact and Code are not equivalent editors

The [editing-mode contract](https://www.builder.io/c/docs/projects-editing-modes/) makes the write boundaries unusually explicit:

| Surface | What the user controls | Mutation point | Most important boundary |
|---|---|---|---|
| Design | selected live elements, insertion, style, options, layers, data and tokens | **Apply Visual Changes** syncs accumulated visual operations to code | the public docs do not disclose the target identity, patch planner, AST adapter or conflict precondition |
| Fast agent | a direct natural-language implementation request | the agent begins implementation immediately | completion text is not a reviewed diff or passing runtime |
| Plan agent | requirements and implementation approach | files should change only after **Implement Plan** | a good plan is not an artifact and implementation can diverge from it |
| Code | source tree, file editor, logs, terminal and Git status | direct file writes | direct edits can race or invalidate pending visual/runtime context; atomicity is unpublished |
| Interact | live flows and responsive behavior | no documented source mutation | it tests the current runtime, not the remote branch, PR or release |

This is not a parallel Figma-style graph whose nodes later happen to export as code. The durable convergence target is the branch filesystem. Design mode adds a staged-intent layer because translating a visual operation into repository code is materially different from changing the DOM in place.

### The canvas operates on the real application runtime

Repository setup documentation says Builder clones the repository, installs it, runs its development server and opens the result in the Visual Editor. The inspected local distribution shows what that means on one public execution path.

`@builder.io/dev-tools@1.79.0` contains `packages/dev-tools/cli/launch/proxy.ts` in its source map. That implementation:

- proxies HTTP and WebSocket traffic to the configured application server;
- rewrites host/origin routing and removes forwarding headers before proxying;
- suppresses response `Content-Security-Policy` and `X-Frame-Options` so the application can run inside the editing frame;
- detects SSR markers for React/Next.js, Vue/Nuxt, Angular, Solid, Svelte and Qwik so injection does not disturb an SSR-rendered head;
- injects a bridge into non-Desktop HTML that reports runtime and Vite-overlay errors;
- accepts `builder.evaluate` and `builder.fusion.evaluate`, constructs `new Function(text)`, executes it with supplied arguments and posts the result/error back to the parent frame.

The bridge establishes that local Fusion is coupled to an executable application page, not merely a screenshot. It also defines a high-trust development boundary: the visible implementation uses wildcard `postMessage` responses and does not check message origin/source before executing matching evaluation messages. The HTTPS proxy path also permits unverified certificates. Those facts do not by themselves prove an exploitable product vulnerability—the enclosing origin, network and launch controls matter—but they do mean the launch proxy should be treated as privileged development tooling, not an arbitrary public reverse proxy.

### Visual capture and durable code writeback remain closed

The package does **not** expose the full route from a selected rendered node to a safe source mutation. Public product behavior proves that Fusion can visually select and change code-backed UI. The inspected proxy proves a runtime evaluation bridge. Neither exposes:

- how the selected DOM node is associated with a component/file/range;
- whether build-time markers, React internals, source maps, runtime stacks or model search produce that association;
- how repeated component instances, conditionals, loops, portals and dynamic styling are classified;
- whether a visual operation becomes a deterministic AST/CSS patch or an agent regeneration;
- what file revision or branch precondition rejects a stale visual target;
- how pending Design operations reconcile with concurrent Code, agent or collaborator edits.

Fusion therefore does not establish a source-inspected visual-to-code mutation family. It does expose a narrower post-capture source-reconciliation mechanism for comments.

## A source-visible comment anchor, after the hidden capture step

The same package's `comment-anchor.ts` and `codegen.ts` implement read-only classification for a comment whose source coordinate has already been captured. This mechanism answers “does this anchored element still exist in source?” It does not reveal how the canvas initially produced `filePath`, line and optional column, and it is not used as a demonstrated mutation target.

### Derivation

Given source plus a coordinate, Babel parses JSX/TS with error recovery and chooses the closest/innermost JSX opening element. It records:

- a versioned structural key: `v1:<component-scope>/<tag>[sibling-index]/...`;
- nearest function, variable or class component scope;
- start line/column and end line;
- a static signature `tag|sorted-static-attrs|static-text`.

The signature deliberately excludes `style`, `data-*`, spread attributes and expression-valued attributes. It is therefore a resilient semantic hint, not a complete element digest.

### Resolution

Resolution is conservative and ordered:

1. Parse the recorded file and try the structural key.
2. If the key now points at a different same-tag sibling, use an exact static signature when that signature occurs elsewhere.
3. If the file no longer matches, derive a distinctive static-text/attribute token and use ripgrep to nominate up to 20 candidate files, then parse and resolve them concurrently. This can recover a moved or renamed file.
4. Return source `present` or `absent`; the caller maps source-present-but-not-rendered to `UNREACHABLE` and genuine absence to `ORPHANED`.

Ambiguity, syntax recovery, search errors, an exhausted search cap or an unusably short signature all bias toward `present`. This intentionally avoids falsely orphaning a comment during an edit or move. It also means “present” is not always a unique identity proof: duplicate signatures choose the structurally closest candidate, and a failed/partial search can preserve the old address as uncertain.

The result is stronger than a raw line number and weaker than a stable AST identity. It survives many line shifts, local structural edits and file moves, but tag/sibling paths drift, static signatures collide, dynamic attributes are absent, and no repository revision is part of the key.

## Git is the shipping ledger, but Builder and Git are separate ledgers

### Hosted branch behavior

The current [Git-provider workflow](https://www.builder.io/c/docs/projects-git-providers) establishes these product facts:

- PR and draft-PR modes enable `+ New Branch`; Direct Commits is a separate mode.
- each new Builder branch is a fresh clone of the configured main branch;
- merging a branch causes Builder to delete it;
- **Send PR** exposes proposed changes before provider PR creation;
- a single PR comment or code-line comment mentioning `@builder-bot` can produce another commit on the same PR, while a batched review comment does not trigger it;
- renaming/deleting the repository, base branch or active branch can break the connection.

Enterprise [parallel branches](https://www.builder.io/c/docs/parallel-branches) send the same prompt to several branches/models and let the user compare through branch navigation. That is variant generation across isolated Git candidates, not a published merge or consensus protocol.

### The inspected push path

The public CLI guide says only committed changes are synchronized. The inspected `corePush()` shows the ordering:

1. run `git push origin <gitBranch>`;
2. fetch the Builder Project/branch catalog;
3. find a Builder branch for that Git branch or create one;
4. when creating, optionally attach at most 10,000 characters of `origin/<default>...HEAD` diff as branch context;
5. persist the selected Project id;
6. notify the remote Builder branch to synchronize.

The final notification can warn after Git push has already succeeded. A successful local push and a successfully refreshed Builder branch are therefore distinct receipts.

### The inspected pull path

`corePull()` exposes the opposite reconciliation:

1. resolve a Builder branch to its associated Git branch and per-repository container commit;
2. fetch and check out the remote branch, then fast-forward from `FETCH_HEAD`;
3. compare the container's last commit with local `HEAD` via `git merge-base --is-ancestor`;
4. if remote Git lacks container work, ask the running container to push it—or cold-start the container first—then pull again;
5. for multi-repo snapshots, select the commit recorded for the current remote's workspace folder.

Empty/unknown commits and Git errors conservatively return “not contained,” causing a container contact rather than silently dropping possible work. The implementation proves that the Builder container, Builder branch metadata, provider branch and local checkout are separate state holders reconciled through commits.

### The real durability model

| State holder | What it preserves | What it cannot prove or restore alone |
|---|---|---|
| Running application | current route, DOM, browser/data/session behavior | source durability, commit, PR or deployment |
| Pending Design operations | visual intent before Apply | files changed, conflict-free materialization or persistence after interruption |
| Builder branch workspace/container | current hosted files/process and agent work | remote synchronization, merge, CI or production |
| Fusion history | prompt-linked restoration points, code/content/layout/visual state | relationship to provider commits, backend/external side effects or deployed state |
| Remote Git branch/commit | portable code revision and reviewable diff | Builder chat/history, runtime/browser state, secrets/data or Publish content |
| Provider PR | review discussion, approvals, checks and merge target | successful production behavior |
| Preview URL | shareable execution of a branch state | exact commit binding in the public contract, merge or release acceptance |
| Deployment | executable release in the team's infrastructure | untested journeys, data correctness or external service state |

## Hosted history is a destructive project rewind, not `git revert`

Fusion [History](https://www.builder.io/c/docs/fusion-history) retains a complete prompt timeline for the current documented scope, supports search and bookmarks, and can restore to a prior point. Restoration reverts visual edits, code, content and layouts after that point while keeping chat history; later edits are discarded.

The public contract does not say:

- which serialized object constitutes a restoration point;
- whether direct Code changes without a prompt have equivalent points;
- how a restore relates to already-pushed Git commits or an open PR;
- whether collaborator comments, preview state, external MCP writes or remote services rewind;
- whether a restored hosted branch rewrites, appends to or conflicts with provider history.

History is therefore a hosted recovery clock. Git is the portable code clock. A safe recovery verifies both explicitly; it never assumes that clicking Restore rewound a remote branch, PR, deployment, database or Publish entry.

## Three external agent interfaces serve different authorities

### Hosted Fusion MCP: project/branch/run control plane

The [Fusion MCP server](https://www.builder.io/c/docs/fusion-mcp-server) is streamable HTTP at `https://mcp.builder.io/mcp/fusion`, uses OAuth 2.0 dynamic client registration and scopes a token to one selected organization. Its tools:

- list/get Projects and branches;
- read branch message history;
- list design systems and inspect the authenticated identity;
- start agent work for a new Project, an existing Project or a specific branch;
- accept attachments and an optional idempotency key;
- return a run id immediately and expose `submitted`, `working`, `completed` or `failed`, with a preview URL when available.

This interface delegates to the hosted Fusion agent. A completed run plus preview is not a PR, merge or deployed acceptance receipt.

### Local Builder MCP: repository and design-system execution plane

The [Builder MCP](https://www.builder.io/c/docs/builder-mcp), marked as an Enterprise feature in the current docs, runs through `npx @builder.io/dev-tools@latest mcp` in the caller's environment. It can inspect design-system documentation, plan and implement UI directly into current project files, summarize changed files, consume Builder prototype URLs or Figma Quick Copy ids, and push/pull branches using the same CLI paths. Documented implementation operations have a five-minute timeout.

This interface gives an external coding agent local source authority. Its tool success still needs file/diff/runtime verification, and the inspected push code shows that remote Builder synchronization can fail after the Git push.

### Agents Run API: asynchronous hosted ingress

The [Agents Run API](https://www.builder.io/c/docs/agents-run-api) accepts a private-key-authorized `POST https://api.builder.io/agents/run?apiKey=<spaceId>` with a prompt, attachments and optional Project/branch/user identity. It returns `202 Accepted` once the branch exists, with `branchName`, `projectId`, editor URL and `status: "processing"`; the agent continues in the background.

The documented page does not expose a corresponding public status endpoint. The returned editor URL is an observation path, not completion evidence. This makes `202` a request/branch receipt only.

These interfaces should not be conflated:

| Interface | Where mutation runs | Addressable object | Strongest immediate receipt |
|---|---|---|---|
| Fusion MCP | hosted Fusion agent | organization → Project → branch → run | asynchronous run state and optional preview |
| Builder MCP / CLI | local repository plus Builder services | current files/design systems/Builder branch | changed-file summary or push/pull result |
| Agents Run API | hosted Fusion agent | Space → optional Project/branch | `202`, branch identity and editor URL |

## Execution environment is an explicit product choice

The [Desktop execution contract](https://www.builder.io/c/docs/desktop-app-execution-environments) exposes three regimes:

| Environment | Checkout/process location | Key implementation detail | Failure/privacy boundary |
|---|---|---|---|
| Cloud container | Builder infrastructure | Desktop streams logs/communication while processing occurs in the cloud | fastest shared setup, but code/runtime leave the host-controlled execution boundary |
| Local machine | `{userDataDir}/temp-workspaces/{projectId}/{branch}` | clones primary/additional folders and runs setup/dev commands natively | host tools and credentials are reachable; temporary workspace is not the user's original checkout |
| Local container | Podman on the host | mounts workspace at `/app`, selects `fusion-base` by Node/architecture and runs dev-tools `launch` | greater isolation/reproducibility; host mount, image, port proxy and container state still need review |

Builder sets a dynamic `PORT` locally to avoid project/branch conflicts. Multi-repository CLI workspaces use `workspace.json` with named folders. The local-repo tutorial calls the instruction file `AGENT.md`, while current configuration docs consistently promote `AGENTS.md`; that is documentation skew worth checking in the installed version rather than silently treating the names as interchangeable.

[Privacy Mode](https://www.builder.io/c/docs/privacy-mode) is enterprise, Desktop/CLI-oriented and explicitly **not fully end-to-end encrypted**. It adds client-controlled encryption, optional user/LLM message redaction, optional MCP disablement and Desktop/local-container enforcement. It reduces exposure; it is not proof that no source, prompt, retrieval fragment, telemetry or service metadata leaves the machine.

## Design-system intelligence is generation context, not identity

The [indexing pipeline](https://www.builder.io/c/docs/component-indexing), also marked as an Enterprise feature in the current docs, runs `npx @builder.io/dev-tools@latest index-repo` in three documented phases:

1. scan components and group them by architectural interdependency;
2. generate MDX documentation for component groups;
3. upload component information to Builder servers by default.

It detects components, imports, usages, tokens and icon libraries; supports delta updates/CI; and benefits from running inside the real design-system repository so docs, examples, Storybook stories and tests are available. Builder describes automated discovery as typically 70% mapping accuracy, which is itself an explicit review warning rather than a correctness guarantee.

Project-specific instructions can arrive through `AGENTS.md`, `.builder/rules/*.mdc` and recursive `.builderrules`; the docs say Builder processes all three. Additional repositories can supply design-system/API context. ACL rules can independently gate file `read`, `write` and `list`; deny rules run before allows and unmatched access defaults to deny.

These mechanisms improve component selection and code style. They do not create a persistent Figma-node ↔ design-system-component ↔ rendered-element ↔ source-AST identity, and index refresh is a separate clock from the Project branch.

## “Bidirectional Figma” is a conversion round trip

The Fusion 1.0 launch calls the integration bidirectional. The detailed [Figma round-trip tutorial](https://www.builder.io/c/docs/design-with-figma-and-fusion) specifies the actual handoffs:

```text
selected Fusion layer
  -> Export to Figma
  -> clipboard
  -> Builder Figma plugin import
  -> ordinary Figma edits / annotations
  -> Smart Export
  -> clipboard
  -> paste into a Fusion prompt against a selected target layer
  -> AI implementation, possibly followed by more prompts
```

The tutorial warns that the Figma import may need manual adjustment and that additional Fusion prompts may be necessary. The local Builder MCP can alternatively consume a `vcp-...` Quick Copy id and implement with indexed components.

This is useful two-way conversion, but public evidence does not establish a live shared graph, retained original node ids, component-instance binding, variable identity, revision pin or reverse synchronization. After each clipboard/AI boundary, the destination becomes its own authority.

## Review evidence has a hierarchy

| Receipt | What it establishes | What it does not establish |
|---|---|---|
| Agent/Fusion MCP `completed` | hosted run reached a terminal state | correct files, committed branch, passing tests or intended experience |
| Design **Apply Visual Changes** | visual intent was submitted for source synchronization | exact safe patch, conflict freedom, commit or runtime correctness |
| Interact / preview link | current branch runtime can be opened and exercised | exact remote commit, merged PR, production build or protected data behavior |
| Hosted History restore point | Builder can return its Project to a recorded earlier state | Git/PR/deployment/external-service rewind |
| CLI push result | committed local branch was pushed and associated with Builder | later Builder refresh, PR, CI or release |
| PR code review | diff received structured review | running UX, data and integration correctness |
| QA-agent recording/test cases | documented browser paths were exercised with video, console/network evidence | exhaustive coverage, source/deploy immutability or human acceptance |
| Peer approval and merged PR | governance and Git promotion completed | production deployment and ordinary-user success |
| Fresh production journey | tested user path works on delivered code/data at that moment | untested roles, states, regions, load and later regressions |

The [Quality Review](https://www.builder.io/c/docs/quality-review) product path is GitHub-only at this snapshot, requires a Team/Enterprise configuration, and runs only for PRs created by Builder users. The QA agent browser-tests PR/custom-instruction paths, can receive login details, captures video/test cases/comments/network/console errors, and can send selected fixes back to the original Project branch and PR. It is unavailable to CLI-only users.

The inspected package adds one concrete harness constraint: a per-test-case `succeeded` report is rejected unless `evidence_frame_count >= 1`, with a reminder to take a screenshot and call `RecordFrame`; non-success outcomes should carry a failure category. This raises the minimum evidence for the package's test-reporting path. A screenshot frame still proves only what it depicts, and the counter is not a cryptographic binding to a commit or deployment.

Preview access has its own risk boundary. [Project Previews](https://www.builder.io/c/docs/projects-previews) are Space-member-only by default, can be password protected at Space or Project level on eligible plans, and can be externally shared. External sharing allows recipients to view **and clone** the Project, so a preview link should be treated as capability-bearing access rather than harmless presentation media.

## Fusion Projects and Builder Publish are separate delivery lanes

Fusion 1.0 describes direct publishing through the Builder SDK for approved homepage sections, experiments and personalization. Current [Fusion for Publish](https://www.builder.io/c/docs/fusion-for-publish) documentation makes the bridge explicit: prototype a component in Fusion, register it for the Publish Visual Editor, preview it there, and hand the component to engineering for codebase merge.

The official `builder-agent-skills` repository sharpens the separation. At pinned commit `3366b3527706cad45434f97bcd1feda6359af6eb`, `fusion-to-publish/SKILL.md` scaffolds a Next.js catch-all content route, SDK initialization, `builder-registry.ts`, component registrations and `.builderrules`. Publish needs a deployed public application URL; localhost is insufficient for its editor.

Therefore:

- a Fusion Project branch owns application code under Git review;
- a Publish Space owns content models/entries/versions and SDK-delivered content;
- registered components form an integration contract, not shared storage;
- a Fusion history restore does not imply a Publish content restore;
- a Git revert does not necessarily revert published content or experiment state;
- a Publish action is not proof that an unmerged Fusion branch reached production.

## Guardrails constrain operations but do not make them transactional

- [ACLs](https://www.builder.io/c/docs/acl-basics) can default-deny and check every documented file read/write/list/existence operation, with custom failure messages.
- Project permissions, roles and path/glob restrictions can separate designers, developers and sensitive directories.
- `AGENTS.md`, scoped `.mdc` rules and `.builderrules` condition generation, but can conflict or stale as the repository changes.
- Project settings choose Direct Commits, Draft PRs or PRs and can customize branch naming.
- Privacy Mode can disable MCP by default, but enabling an external MCP introduces that provider's authority and side effects.
- Local MCP servers are child processes with their own permissions and cleanup boundaries.

The public docs currently mention both `builder.config.json` for local workspace/repository configuration and `fusion.config.json` in ACL/CLI surfaces. They also show `AGENT.md` in one multi-repo tutorial and `AGENTS.md` elsewhere. These may reflect different command scopes or documentation eras. No public migration/precedence document found in this audit resolves every combination, so automation should pin a dev-tools version, inspect that command's help/schema and test with `--dry-run` where available.

## Failure map for an ordinary team

| Breakpoint | User-visible symptom | Evidence-led response |
|---|---|---|
| Repository/branch renamed or deleted | Project cannot fetch, branch disappears or PR flow breaks | verify provider ids/refs and reconnect; do not repair from an old canvas assumption |
| Setup/dev command or monorepo `cd` is wrong | clone succeeds but canvas never reaches the app | run the exact commands in the intended package, verify port/route and persist corrected settings |
| Wrong route/root selected | Design appears empty or targets the wrong subtree | verify URL and optional Design Mode selector/iframe root before editing |
| Pending visual changes not applied | canvas looks changed but files/diff remain unchanged | invoke Apply, inspect files and rebuild; runtime DOM alone is not durability |
| Target stales during HMR/concurrent work | Apply affects the wrong structure or requires regeneration | refresh runtime, reselect against current files and review the complete diff; no public revision guard can be assumed |
| Design-system index is stale/inaccurate | generic or wrong components/tokens appear | re-index after architecture changes, inspect generated MDX/mappings and verify imports/usages |
| Figma round trip loses fidelity | imported layout needs repair or AI misses intent | treat clipboard data as reference, compare responsive/interactive behavior and retain source Figma separately |
| Hosted restore surprises Git users | Builder view rewinds while remote PR still contains later commits | inspect Builder history, provider branch and local `HEAD` separately before choosing a recovery direction |
| Local push partially succeeds | Git branch exists but Builder does not refresh | distinguish successful `git push` from failed remote-notify/sync and retry only the missing layer |
| Pull contacts a stopped container | delay/cold start before new commits appear | inspect remote branch and container commit; avoid assuming no work because the first fetch was empty |
| QA says succeeded with narrow evidence | one recorded path looks correct | inspect covered cases/frames/errors, then run missing roles, states and production journey |
| External preview shared too broadly | outsiders can view or clone | disable external sharing, rotate password/access and review what source/context was exposed |
| ACL/rules/config naming mismatch | agent ignores guidance or denies expected files | confirm installed CLI schema and resolved rules; test actual operations rather than trusting a filename |
| Publish and Git diverge | code rollback does not change live content, or content expects missing component | audit Publish entry/version, registered component, deployed code and Git commit as separate authorities |

## What is established, inferred and still unknown

| Claim | Classification | Evidence / limit |
|---|---|---|
| Fusion works against repository branches and ships through Git/PR workflows | Established product fact | current product page and repository/provider docs |
| Design mode stages changes until Apply Visual Changes | Established product fact | editing-mode docs |
| local dev-tools proxies the executable app and injects an evaluation/error bridge | Source-inspected fact | exact MIT npm tarball and complete source map |
| the bridge accepts matching messages without an origin/source check and strips frame/CSP headers | Source-inspected fact | exact proxy source; surrounding hosting controls remain closed |
| hosted visual selection uses this same bridge to derive source coordinates | **Unknown** | the bridge is relevant runtime infrastructure, but no public path connects it to the closed capture service |
| a captured comment coordinate becomes a structural JSX key/signature and can be re-found after a file move | Source-inspected fact | `comment-anchor.ts` plus `codegen.ts` in the package source map |
| that comment key is a unique AST identity or deterministic source-write target | **False / unsupported** | structural keys/signatures collide and the API is explicitly read-only classification |
| Builder container and remote Git are separate ledgers reconciled through commits | Source-inspected fact | `corePush`, `corePull`, commit snapshot and `merge-base` logic |
| hosted History rewinds provider Git and Publish state | **Unknown and must not be assumed** | history docs name Project visual/code/content/layout state, not remote/external transactions |
| design-system indexing improves generation but does not guarantee mapping | Established product boundary | official “typically 70%” claim plus three-phase uploaded index |
| Figma and Fusion retain a live bidirectional node binding | **Unsupported** | detailed tutorial is clipboard export/import plus AI implementation and manual adjustment |
| QA success requires at least one screenshot in the inspected harness path | Source-inspected fact | `ReportTestOutcome` validation in `codegen.ts`; not a system-wide correctness theorem |
| Publish and Fusion code use one version graph | **False** | separate product docs and public registration skill establish a bridge between distinct authorities |

## Public-source and distribution audit

### Exact npm artifact

The registry's `latest` distribution at this snapshot was `@builder.io/dev-tools@1.79.0`. The downloaded tarball matched both registry digests:

| Property | Verified value |
|---|---|
| Tarball | `https://registry.npmjs.org/@builder.io/dev-tools/-/dev-tools-1.79.0.tgz` |
| SHA-1 | `c75f4aceb118359fea851a2ee1925c5c0171859e` |
| SRI | `sha512-al45qEGbiY1vyM2pfKdDC5z866zXNFtBSg2m6VNvDn7olO+zrQH7PpDqqDfMLuFH2gCwz9NMJscw3fImb/dqXg==` |
| License | MIT |
| Package repository field | absent (`null`) |
| CLI aliases | `builder-dev-tools`, `builder.io`, `builderio` |
| Main CLI bundle | approximately 5.4 MB `cli/index.cjs` |
| Main source map | approximately 16.5 MB `cli/index.cjs.map` |
| Source/source-content entries | 1,294 / 1,294 |

The exact tarball is source-visible enough to audit the mechanisms described above, but it is not commit-addressable provenance. Its manifest points to `https://builder.io/` rather than a source repository.

### Adjacent repositories do not open the hosted core

- [`BuilderIO/builder` at `964d91ac7d9503c76a2e2b2980114408b321c5bd`](https://github.com/BuilderIO/builder/tree/964d91ac7d9503c76a2e2b2980114408b321c5bd) is Builder's public SDK/examples/plugins monorepo. A recursive 5,096-entry tree audit found no path segment named `fusion` or `dev-tools`; it is not provenance for this package or the Fusion core.
- [`BuilderIO/builder-agent-skills` at `3366b3527706cad45434f97bcd1feda6359af6eb`](https://github.com/BuilderIO/builder-agent-skills/tree/3366b3527706cad45434f97bcd1feda6359af6eb) exposes auditable workflows such as [prototype import](https://github.com/BuilderIO/builder-agent-skills/blob/3366b3527706cad45434f97bcd1feda6359af6eb/import-prototype/SKILL.md), [Fusion-to-Publish registration](https://github.com/BuilderIO/builder-agent-skills/blob/3366b3527706cad45434f97bcd1feda6359af6eb/fusion-to-publish/SKILL.md) and [rules review](https://github.com/BuilderIO/builder-agent-skills/blob/3366b3527706cad45434f97bcd1feda6359af6eb/rules-reviewer/SKILL.md). These are extension/workflow evidence, not editor, renderer or hosted-agent source.

### Reproduction notes

```powershell
npm view '@builder.io/dev-tools@1.79.0' --json
npm pack '@builder.io/dev-tools@1.79.0'
Get-FileHash .\builder.io-dev-tools-1.79.0.tgz -Algorithm SHA1
tar -xf .\builder.io-dev-tools-1.79.0.tgz

# Inspect package/package.json and package/cli/index.cjs.map.
# The map's sources[] and sourcesContent[] both contain 1,294 entries.

git ls-remote https://github.com/BuilderIO/builder.git refs/heads/main
git ls-remote https://github.com/BuilderIO/builder-agent-skills.git refs/heads/main
```

Because the package lacks a repository field and the adjacent monorepo does not contain its source path, this dossier pins npm version plus cryptographic digests for source-derived claims and pins Git commits only for the two actual public repositories.

## Product history that changes the technical conclusion

| Date | Public event | Why it matters |
|---|---|---|
| 2025-06-18 | [Fusion introduced](https://www.builder.io/blog/introducing-fusion/) | established the existing-codebase visual canvas, design-system indexing, branch/preview/PR workflow, background agent, Figma/VS Code/MCP context and permissions direction |
| 2025-11-06 | [Fusion 1.0](https://www.builder.io/blog/fusion/) | expanded the positioning to a product/design/code agent with Slack/Jira ingress, real-time collaboration, model choice, Desktop environments, direct Publish lane and team memory |
| 2026-08-05 | `@builder.io/dev-tools@1.79.0` published | provides the exact source-visible local runtime, Git reconciliation, comment-anchor and QA-harness snapshot used here |
| 2026-08-11 | dossier snapshot | current product page centers existing repository, shared branch, visual code editing, external-agent push/pull and approved PR delivery |

## Evidence boundary and remaining research gaps

This dossier reaches the present public ceiling for the decisive repository-to-PR journey. It establishes branch/runtime authority, write boundaries between modes, Git/container reconciliation, recovery and delivery clocks, Figma conversion semantics, three agent interfaces, execution choices, design-system context, QA receipts, Publish separation and the source-visible local mechanisms.

The remaining gaps are consequential but closed:

1. renderer-to-file/range capture and framework-specific coverage;
2. visual-operation representation before Apply and its persistence across reload/collaboration;
3. deterministic versus agent-mediated patch selection for each edit class;
4. file revision, concurrency and stale-target conflict rules;
5. hosted branch/container snapshot schema and transaction boundary;
6. exact History serialization and Git/restore interaction;
7. current collaboration protocol and multi-user conflict handling;
8. model/router, memory representation and instruction precedence internals;
9. provider-specific commit/PR failure compensation after partial success;
10. preview-to-commit binding, container isolation and secret/redaction implementation;
11. QA test-plan generation, replay retention and commit/deployment binding;
12. Publish/Fusion cross-product version compatibility and rollback behavior.

A future source leak, official architecture paper, protocol schema or bounded authenticated observation can narrow those gaps. Adjacent SDKs, Agent Skills and the MIT dev-tools distribution must not be used to invent the closed hosted implementation.

## Primary sources

### Product and lifecycle

- [Current Fusion product surface](https://www.builder.io/fusion/)
- [Introducing Fusion — 2025-06-18](https://www.builder.io/blog/introducing-fusion/)
- [Fusion 1.0 — 2025-11-06](https://www.builder.io/blog/fusion/)
- [Projects overview](https://www.builder.io/c/docs/fusion-projects-overview)

### Repository, modes, history and review

- [Connect Git providers to Projects](https://www.builder.io/c/docs/projects-git-providers)
- [Projects Design, Interact and Code modes](https://www.builder.io/c/docs/projects-editing-modes/)
- [Project settings](https://www.builder.io/c/docs/fusion-project-settings)
- [Chat History](https://www.builder.io/c/docs/fusion-history)
- [Parallel branches](https://www.builder.io/c/docs/parallel-branches)
- [Project Previews](https://www.builder.io/c/docs/projects-previews)
- [Quality Review](https://www.builder.io/c/docs/quality-review)
- [Comments in Projects](https://www.builder.io/c/docs/projects-commenting/)

### Local execution, agent interfaces and code sync

- [Connect a local repository](https://www.builder.io/c/docs/projects-local-repo)
- [Desktop execution environments](https://www.builder.io/c/docs/desktop-app-execution-environments)
- [Privacy Mode](https://www.builder.io/c/docs/privacy-mode)
- [Builder CLI code sync](https://www.builder.io/c/docs/builder-cli-code-sync)
- [Fusion MCP server](https://www.builder.io/c/docs/fusion-mcp-server)
- [Builder MCP](https://www.builder.io/c/docs/builder-mcp)
- [Agents Run API](https://www.builder.io/c/docs/agents-run-api)
- [Builder CLI API](https://www.builder.io/c/docs/builder-cli-api)

### Design context, guardrails and Publish

- [Design System Indexing](https://www.builder.io/c/docs/component-indexing)
- [Projects configuration files](https://www.builder.io/c/docs/projects-configuration-files)
- [ACL basics](https://www.builder.io/c/docs/acl-basics)
- [Design with Figma and Fusion](https://www.builder.io/c/docs/design-with-figma-and-fusion)
- [Fusion for Publish](https://www.builder.io/c/docs/fusion-for-publish)

### Auditable distributions and repositories

- [npm metadata for `@builder.io/dev-tools@1.79.0`](https://registry.npmjs.org/@builder.io%2Fdev-tools/1.79.0)
- [Exact `@builder.io/dev-tools@1.79.0` tarball](https://registry.npmjs.org/@builder.io/dev-tools/-/dev-tools-1.79.0.tgz)
- [`BuilderIO/builder` pinned public tree](https://github.com/BuilderIO/builder/tree/964d91ac7d9503c76a2e2b2980114408b321c5bd)
- [`BuilderIO/builder-agent-skills` pinned public tree](https://github.com/BuilderIO/builder-agent-skills/tree/3366b3527706cad45434f97bcd1feda6359af6eb)
