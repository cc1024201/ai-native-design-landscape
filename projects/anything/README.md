# Anything

> Research status: **Architecture-level / closed-source boundary reached; live OpenAPI and MIT CLI distribution inspected** · Last reviewed: **2026-08-11**

| Field | Verified value |
|---|---|
| Product / operator | Anything, formerly Create |
| Lifecycle | Active; Anything launched on 2025-08-08 after two years of Create, while eligible older projects can now opt into a separate v2 architecture |
| Category | Hosted AI full-stack application builder with design reasoning, runtime-grounded agent repair and web/mobile delivery |
| Ordinary working object | A hosted **project group** containing web/mobile/backend/database modules, generation threads, revisions, files, preview endpoints and release state |
| Generated front ends | Web applications using React; mobile applications using Expo / React Native for iOS and Android |
| Managed runtime | Cloud sandbox, serverless functions, authentication, uploads, integrations, payments, hosting and PostgreSQL through Neon |
| Human surfaces | Browser chat, Code view, cloud Preview, version history, database viewer, logs, real-device Expo preview, publishing and team collaboration |
| Agent surfaces | Thinking, Fast, Discussion, Plan and Max modes; HTTP API; `@anythingai/cli`; packaged agent skill |
| Delivery surfaces | Explicit web publish, custom domain, TestFlight / App Store flow and beta Google Play internal-testing upload |
| Portable exits | Project source ZIP, separate database SQL ZIP and read-only CLI/API file pull; GitHub synchronization is documented as “coming soon” |
| Public protocol inspected | Live `Anything API` OpenAPI document, version `0.1.0`, with 38 paths at this snapshot |
| Public distribution inspected | `@anythingai/cli@1.0.0`, MIT, published 2026-06-10; readable bundled JavaScript plus a packaged Anything skill |
| Closed boundary | Builder UI, agent/model orchestration, project/version stores, code writer, v2 migration service, Max browser/simulator and merge system, collaboration, managed functions/auth/storage, deployment and app-store control planes |
| Evidence snapshot | Official docs/blogs, live OpenAPI, npm registry metadata and an unpacked CLI tarball; no account, project, database, deployment or store submission was mutated |

## The shortest accurate description

Anything is not merely “a prompt that returns React.” It is a hosted project-group control plane in which code generation, live execution, backend state and several delivery systems advance on different clocks:

```text
brief / screenshot / URL / Figma frame
  -> agent thread + requested generation revision
  -> hosted project-group files and modules
  -> cloud Preview or real-device Expo preview
  -> optional Max runtime-test-and-repair loop
  -> explicit release
       ├─ web deployment + public URL/domain
       ├─ iOS build -> TestFlight -> App Store review
       └─ Android bundle -> Play internal-testing draft -> review/release

parallel state
  ├─ development database data + schema
  ├─ production database data + schema
  ├─ development / preview / production secrets
  ├─ auth users and sessions
  └─ source ZIP / CLI pull / database export forks
```

The decisive technical question is therefore not “did the agent finish?” It is **which receipt proves which layer**. A `VALID` generation can contain no file change; a working Preview is not a deployment; a web publish can omit a mobile backend; a schema publish does not copy development rows; a TestFlight upload is not App Store approval; and a source ZIP is not the hosted application's complete state.

## The ordinary-user journey, with the real acceptance points

### Build and refine

1. Start a project with a plain-language brief. The product can create web, mobile or both, and can add pages/components, functions, a database, auth, payments and integrations.
2. Supply visual direction through text, a reference URL, screenshots/images or a Figma file/frame/page. The agent reasons about layout, color, spacing and style and uses preinstalled UI components.
3. Choose a mode. Thinking is the documented default; Fast shortens the loop, Discussion avoids code edits, Plan plans, and Max adds runtime execution and repair.
4. Review the generated application in the cloud sandbox and inspect its actual files in Code view. For a mobile application, use the QR code and Expo Go on a physical device before trusting camera, location, barcode or other device-only behavior.
5. Iterate in the same or another thread. Every documented change enters version history; a previous chat message can preview its version and **Restore** can make it current again.
6. Exercise the real data and auth path. Demo/Preview uses development data, while a released application uses production data. A successful static screen is insufficient evidence for functions, auth, uploads or payments.

### Release and verify

7. For web, explicitly choose the pages, functions and routes to publish, choose a hosted slug or domain, review any database-structure migration and wait for the deployment.
8. For mobile, publish the web/backend lane as well when the application depends on functions or data. Test the built binary through TestFlight or Google Play internal testing, not only the browser's device frame.
9. Complete the store-owned steps. Apple and Google retain review, policy, listing and final-release authority after Anything uploads a build.
10. Re-run the ordinary-user journey on the actual public URL or installed build with fresh auth, production data, loading/empty/error states and the intended permissions.

Anything's own Max documentation reinforces the last point: the ordinary agent writes and hands back a result but expects the builder to validate it. Max automates more of that loop; its “complete” report still does not collapse deployment, database and app-store state into one transaction.

## A receipt hierarchy, not one success flag

| Layer | Publicly observable receipt | What it establishes | What it does **not** establish |
|---|---|---|---|
| Request accepted | Generate API returns `revisionId` and optional `threadId` | A generation was started against one project group | That the agent understood the request, wrote a file or completed |
| Generation terminal | Status/message becomes `COMPLETED` or `VALID` | The service considers the turn terminal | Official CLI docs explicitly say `VALID` can be chat-only or plan-only with zero file changes |
| Hosted source changed | Current file contents/module metadata plus a meaningful version/diff | The project artifact changed | That it compiles, runs, was published or matches visual intent |
| Development runtime | `devServerUrl`, Preview behavior, logs and database observations | Current hosted development state can execute | Production build, production data, device-only behavior or store binary |
| Max report | Browser/simulator steps, diffs, tests and audit trail | The autonomous loop exercised the paths it recorded | Exhaustive coverage, an immutable source/deploy binding or human product acceptance |
| Publish requested | Publish API/command returns deployment identity or begins a wait | A release operation exists | Success when `--no-wait` is used; correct public behavior; database/data parity |
| Deployment succeeded | Deployment status, URL and build logs | One web release completed | That the URL serves the intended revision/data or that mobile releases use it correctly |
| Web acceptance | Fresh public URL passes the real user flow | The tested deployed path works at that moment | Mobile binary/store state or untested users/regions/concurrency |
| Store upload | Submission status, TestFlight build or Play internal-test draft | Anything delivered a mobile build to a store-owned surface | Store approval, production release or policy compliance |
| Database migration | Approval dialog and resulting production schema | Selected structural changes reached production | Development rows were copied; all existing production data survived semantically |
| Durable external exit | Verified ZIP, SQL dumps or `.anything/files/` snapshot | A particular exported projection exists | A complete hosted backup, live Git sync or a reproducible deployment |

This hierarchy explains a current documentation/distribution conflict. The web CLI guide warns that `anything ship` can return `ok: true, published: true` after the agent merely asks a question or presents a plan. The inspected `1.0.0` bundle adds a non-interactive instruction, checks the latest assistant serialization, sends one automatic “proceed” prompt and skips publish with `NEEDS_INPUT` if it still sees no build activity. Both are official artifacts at the same snapshot. The package guard is newer behavior in that exact tarball; the public guide shows that callers must still inspect messages/files rather than assume every deployed CLI/service combination enforces it.

## The public project-group contract

The live OpenAPI describes the top-level resource as a project **group**, not a repository checkout. `GET /v0/api/projects/{projectGroupId}` returns:

- a UUID, name, optional slug and `filesystemVersion`;
- `platform: web | mobile | both`;
- creation and update timestamps;
- development and mobile-preview URLs;
- all published URLs plus `latestPublishedUrl`;
- a field named `files` whose items are actually module records: id, name, slug, `moduleType`, `pathSegment` and `path`.

File content has a separate read-only endpoint that either lists paths or returns one `{ path, content }` object. Generation accepts a prompt, optional `threadId` and `createNewThread`, then returns a revision id. The cheap status document carries the latest revision id/status, build errors, update time and an optional deployment `{ id, status, url }`.

Three boundaries follow directly:

1. A project group can contain multiple modules and delivery types; “the file” is not the whole artifact.
2. A revision id, current file set and deployment id are different identities. The public schema exposes no atomic release object binding them to a database snapshot.
3. The current API can read files and ask the hosted agent to generate, but exposes no write-file or Git-push endpoint. The hosted service remains mutation authority.

The API uses an Anything API key as HTTP Basic username with an empty password. The CLI provides browser login or `ANYTHING_API_KEY`, but its rollout is limited to selected accounts at the snapshot.

## Threads, versions and parallel work

The builder exposes New Thread, and Max can run several focused tasks in separate threads. Public generation messages carry a thread id; the API can continue or create a thread. Version history separately records every documented change, lets a user preview an older message/version and labels published versions.

Those are related but not equivalent ledgers:

| Ledger | Public purpose | Boundary |
|---|---|---|
| Conversation thread | Context and agent task stream | A message can be Discussion/Plan or a question without a source mutation |
| Generation revision | Server-side unit returned when generation starts | Its internal patch schema, parent relation and commit conditions are closed |
| Version history | Human preview/restore of prior project state | Public docs do not define the serialized object or prove backend/data rollback |
| Current files/modules | Executable source projection | A direct public write or file-level compare-and-swap contract is absent |
| Published version/deployment | Explicit release state | Later source changes and database data can advance independently |

Anything says its “novel merge systems” coordinate simultaneous Max tasks. It does not publish the merge representation, conflict detection, revision precondition, database-operation ordering or behavior when two tasks touch the same module. Separate threads support parallel intent; they are not public proof of serializable source or data mutations.

## Design context is one-way grounding, not source identity

Anything's current design path is agent-mediated application construction:

```text
URL -> screenshot inspiration ┐
screenshot / image ----------+-> agent reasoning -> generated app source -> Preview
Figma frame/page + prompt ----┘
```

- A URL is fetched as a screenshot reference, not imported as original DOM/CSS/source.
- A screenshot or image supplies pixels and visual intent.
- A Figma Pro-or-higher connection lets the user paste a file, specific frame or page. The chat chip links back to the original, then iteration continues with the Anything agent.
- No public Figma node id, component/variable identity, revision pin, file/range, AST marker or reverse-sync contract accompanies the generated application.

The current top-bar **Element selector** is documented as a switch for which page, component or database the builder is viewing. It is not evidence of clicking a rendered DOM node and receiving authored source coordinates. The 2023 Create launch article did describe tapping a part of the result, but current product documentation and public protocols do not establish that historical route as a durable present-day target-to-source mechanism.

Consequently Anything does not add a new source-inspected target-return family to the root taxonomy. Visual references improve model grounding; they do not preserve an addressable relationship to their origin.

## Max is a runtime-ownership strategy

The base agent can read compile-time, runtime, browser, network and device logs. Max extends the loop with:

- a real browser that can scroll, click, type, log in, upload and check out;
- a simulated iOS device for taps, swipes and native interaction checks;
- backend execution rather than source-only inspection;
- runtime APIs, visual diffing, logs and database branches;
- long background jobs, sometimes 100+ steps and more than 30 minutes;
- several independent Max tasks in parallel threads;
- visible step history, diffs, tests and an audit trail.

The engineering rationale is unusually explicit: Anything owns the runtime surface—Neon-backed Postgres, auth, serverless compute, payments, integrations and deployment—so the agent can observe and repair more than code. Runtime behavior after each change is the stated feedback signal.

That is a stronger feedback loop, not a single artifact transaction. Public evidence does not reveal:

- browser/simulator implementation or isolation;
- the exact model/router and system prompts;
- database-branch lifetime and merge semantics;
- how “novel merging” orders or reconciles parallel file and schema writes;
- how an audit step binds to a project version or deployment;
- which test coverage is exhaustive versus sampled.

Max completion is therefore useful evidence to review, but the released URL/binary and production data remain the acceptance surfaces.

## Runtime and data have their own authority graph

### Development and production databases

Every project receives PostgreSQL through Neon with development and production lanes. Current documentation states:

- Demo mode uses development data;
- publishing pushes **schema structure**—tables and fields—from development to production;
- development and production rows stay separate;
- dropping a production field can destroy live data and requires an approval warning;
- resetting development restores the last-published structure and deletes later structures/data;
- duplicating a project always copies schema and can optionally copy development data, production data, both or neither;
- one project can attach only one database at a time, while one database can be shared by several projects;
- database export is a separately prepared ZIP containing `development.sql` and `production.sql`, both with schema and data;
- importing an external dump is not yet supported through the documented product path; automatic backups require support for restore.

Project, database and app are therefore not one-to-one identities. Sharing a database can intentionally couple two applications, while restoring an application version does not document a corresponding data rewind.

### Backend, auth, uploads and secrets

Serverless functions expose `/api/...` routes to the generated web and mobile clients. User Accounts adds auth pages/tables, secure cookies, bcrypt password hashes and JWT sessions. Uploads go to managed cloud storage and applications persist returned URLs when they need later access.

The CLI distinguishes three secret environments—`development`, `preview` and `production`—even though the database documentation describes two data lanes. By default its `secrets add` writes to all three; targeting development only means the live application will not receive the key. Secret names are listable, but the API and CLI do not return plaintext values.

These are separate state planes. A source restore can be correct while a function uses the wrong secret, an auth session remains live, an uploaded object persists or production rows retain a newer schema assumption.

## Publish is a family of deliveries

### Web

Web publication is explicit. The builder asks for a hosted subdomain, included pages/functions and routes, then deploys to a permanent URL. Preview is owner-only development state; publish creates the public endpoint. Unpublish removes the URL while keeping the project and data.

Database schema changes require a separate review inside the publish flow. A failed publish exposes a Failed badge/build error and can send the error back to the agent. The API/CLI also expose deployment status and build logs, so a command return is not the strongest receipt.

### iOS

Anything builds and uploads to App Store Connect, then the owner installs through TestFlight, tests the real binary, completes listing/privacy/review requirements, chooses a build and submits for Apple review. The store, not Anything, owns approval and final public availability. The v2 migration page explicitly warns that a copied v2 mobile project becomes a new app rather than an update to the original listing.

### Android

Google Play submission is beta at this snapshot. The owner creates the Play Console listing using Anything's exact package name, grants Anything's service account release-to-testing permission, and Anything uploads an Android App Bundle as a draft on the internal-testing track. The owner still manages testers, policy information, review and public promotion in Play Console.

For either mobile path, the publish dialog can also publish web/backend. Omitting it can produce a valid installed binary whose functions or database calls fail in production.

## v2 is a selective copy and rewrite, not an in-place upgrade

The v2 flow deliberately creates a fresh project and leaves the original editable:

```text
legacy project ------------------------------ remains editable
       |
       | opt-in background migration
       v
fresh v2 project
  ├─ code rewritten into new component structure
  ├─ optional domain move
  ├─ optional database copy: schema + all selected rows
  ├─ optional users/auth copy: accounts + sessions + config
  └─ agent repair pass
```

The consequences are operationally important:

- the original and v2 copy can both keep changing;
- skipped resources can be migrated in a later run, creating another cutoff;
- the live domain moves only when selected;
- an existing published application does not automatically follow;
- an App Store listing does not continue; the v2 copy publishes as a separate app;
- code is rewritten rather than byte-copied into the new component organization;
- the repair pass can make the v2 result differ again from the legacy source.

A safe migration therefore records legacy and v2 project ids, source/version cutoffs, database row cutoffs, auth/session transfer, domain routing and each release identity. “Migration ready” is not a receipt for traffic, data parity or store continuity.

## The CLI/API edge is inspectable—and exposes its own limits

### Public command surface

The Node 24+ CLI can create/generate/publish projects, read messages/files/logs, manage secrets/auth settings, operate databases/domains/members/assets, start mobile submissions, inspect deployments, link a local directory, pull a projection, watch inferred events and print its packaged agent skill. JSON and NDJSON modes, explicit exit codes, `--dry-run`, `--quiet` and automatic non-interactive mode make it agent-friendly.

That interface is an external control plane over the same hosted project group. It is not a local builder or a Git client.

### How `1.0.0` waits for generation

The unpacked bundle implements this sequence:

1. subscribe to `projectGroupRevisionsFinished` on `/subscriptions`;
2. allow a 90-second WebSocket fast path;
3. on WebSocket error/timeout, poll status every three seconds;
4. treat `COMPLETED` and `VALID` as success and `INVALID`, `INVALID_PROMPT` and `FAILED` as terminal failure;
5. stop its wait after four minutes without a changed `status|latestRevisionId|updatedAt` marker, or a hard 30-minute maximum;
6. return `still_building` with the project id because server work may continue.

After a WebSocket completion, the CLI asks for the latest message status. If that read fails or finds no message, the implementation defaults to success with `?? true`. This is a concrete receipt weakness: a subscription completion plus an unreadable message can be reported as generation success without a second artifact check.

### The `ship` guard is serialization-based

The `1.0.0` `ship` command appends a non-interactive instruction, then inspects the latest assistant message:

- any `<ask-questions ...>` tag means input is needed;
- absence of a `<file-based-block ... uiType="file|database">` means no build activity;
- it automatically sends one “proceed with reasonable defaults” prompt;
- if the second response still meets either condition, it emits `NEEDS_INPUT` and skips publish.

This reduces the public guide's empty-template failure, but it is a regular-expression check over assistant-message serialization—not a server-side diff, file hash, build receipt or deployment precondition. A serialization change, a meaningful non-file operation or a misleading file block can defeat the inference. Exact hosted-service compatibility with this package is not published.

### `watch` synthesizes events

`anything watch` is not a server event log. The bundle polls project info every three seconds and infers:

- generation start/complete from `devServerUrl` changing null/non-null;
- a generic update from `updatedAt`;
- deployment completion from `latestPublishedUrl` changing.

It exits after five minutes without an **inferred** event. A stable URL for a newer deployment, an update without the expected transitions or a slow job can therefore be invisible/misclassified.

### `pull` creates a context fork

`anything link` writes `.anything/project.json`. `anything pull` then reads every current API file sequentially into `.anything/files/` and writes sorted secret **names** with empty values to repository-root `.env.example`.

The bundle does not clear `.anything/files/` first, so deleted remote paths can remain locally and mix with current output. It does not overwrite the application's working source tree, pull secret values or expose a push command. The OpenAPI itself provides no file-write endpoint. The result is a read-only context snapshot for an agent, not bidirectional synchronization or portable cloud authority.

### Rollback is advertised but explicitly unavailable

The web CLI table, packaged skill and bundle all expose `anything deployments rollback`. The same generated client description says “Deployment rollback is not yet implemented,” and the live OpenAPI endpoint has no `200` response—only `400`, `401`, `403`, `404` and `501 Not implemented`.

Command presence is therefore not capability evidence. At this snapshot an automated recovery flow must create a new publish from a known version; it cannot rely on the advertised rollback command succeeding.

## Source export is a fork, not a roundtrip

The Code tab can download a project ZIP. Current export documentation says GitHub sync is “coming soon” and instructs users to push the downloaded source manually. The API/CLI adds a second read-only projection, not a source push.

The complete exit is plural:

| Exit | Carries | Does not publicly carry or synchronize |
|---|---|---|
| Project ZIP | Current downloadable source code | Hosted version/thread graph, deployment identity, database rows, auth sessions, secret values, store listing and a reverse sync |
| CLI `pull` | API-readable current file contents under `.anything/files/`; secret names in `.env.example` | Working-tree replacement, deleted-file reconciliation, secret values, writes/pushes, database/deployment/store state |
| Database export | `development.sql` and `production.sql` with schema/data | Application source, uploaded objects, auth-provider secrets, deployment and automatic import into another Anything project |
| Manual Git repository | Whatever the user commits from an export | Past hosted history unless separately reconstructed; live two-way Anything sync |

An exported project can become maintainable only after a user selects a new source authority, records a commit, reconstructs the backend/infrastructure and validates the independently deployed journey. A successful local build proves neither hosted function semantics nor production data portability.

## Distribution evidence

The npm registry exposes no repository field for `@anythingai/cli@1.0.0`. Its `gitHead` (`263ae04b88551fbf95f6f4ff1f149d05e5d3aef3`) therefore cannot be attributed to a public repository or expanded into commit-level product evidence.

| Distribution fact | Verified snapshot |
|---|---|
| Registry lineage | Scope/package created 2026-06-01; versions `0.0.1` through `0.1.7`, then `1.0.0`; latest remains `1.0.0` |
| `1.0.0` publish | 2026-06-10; registry metadata last modified 2026-07-28 without a newer version |
| License / engine | MIT; Node `>=24.0.0` |
| Tarball | 86.0 kB registry size; 381.4 kB unpacked |
| SHA-1 | `f241823fdbfc21b1773f07546904c0187ef50598` — locally recomputed and matched registry `shasum` |
| SHA-512 integrity | `sha512-SX2UxNoOUCQl0EVhj/U2rqbzIW1h+iTW7m/GsAzs3cREqusc6PlLWxaSIcK0+lgfYnoRYWyq2UtSG2pBLw4fvg==` — locally recomputed and matched registry integrity |
| Published files | `dist/js/bin.mjs` (354,812 bytes), packaged `SKILL.md` (18,648 bytes), setup reference, OpenAI agent metadata, README, changelog and manifest |
| Runtime dependencies | `conf`, `graphql`, `graphql-ws`, `neverthrow`, `ws`, `yargs`, `zod` |
| Build evidence in manifest | generated OpenAPI client scripts, Zod/Yargs CLI and GraphQL WebSocket dependencies; development references private `@createinc/*` packages |
| Source boundary | Readable compiled CLI/control logic and packaged instructions; no original TypeScript, public repository or hosted product implementation |

The published changelog labels several fixes as `[Unreleased]` even though the inspected `1.0.0` bundle contains corresponding behavior. That is another reason to pin tarball integrity rather than infer behavior from headings or mutable docs alone.

## Failure and recovery map

| Break | User-visible symptom | What survives | Evidence-bounded recovery |
|---|---|---|---|
| Generation is `VALID` but no app change occurred | Assistant asked a question or returned a plan; files/template unchanged | Thread, project id and prior version | Read latest messages **and** current files; answer/continue generation before publish |
| `ship` behavior differs by docs/package/service | Empty template may be published or `NEEDS_INPUT` appears | Project id and message history | Pin CLI version, inspect terminal result/messages/files and publish only after an artifact/build check |
| WebSocket completion but message read fails | CLI can default generation to success | Hosted project continues to exist | Re-read status/messages/files and verify Preview; do not trust the fast-path return alone |
| CLI stops waiting | `still_building`, nonzero result after stall/cap | Server job and project id continue | Poll project status, then inspect files/messages before deciding to publish |
| `--no-wait` used for generation/publish | Command returns before terminal build/deploy | Job/deployment identity | Poll the explicit status/deployment endpoint and inspect logs/URL |
| Mobile browser preview looks correct | Camera/location/native action fails on device | Source and cloud sandbox | Test through Expo Go or store binary on a real device |
| Preview is healthy but publish fails | Failed badge or deployment build logs | Current source/version and development data | Diagnose logged build error, generate a repair, republish and retest the public URL |
| Development data expected in production | Live app is empty | Development rows and production database remain separate | Seed/migrate production data explicitly; schema publication does not copy rows |
| Destructive schema change | Publish warning or live-column data loss | Backups may exist; production rows until migration | Review migration, export DB, avoid/transform destructive change; support handles documented backup restore |
| Version Restore used as full rollback | Code/UI rewinds while data/secrets/releases do not | Independent state planes | Restore and validate code, production schema/data, secrets and deployment separately |
| Advertised deployment rollback invoked | API returns `501` | Existing deployments and source/version history | Select a known project version, publish a new deployment and verify it; no API rollback exists |
| Parallel Max tasks collide | One result overwrites or conflicts with another, or schema/data order is unclear | Thread/audit traces and version history | Scope tasks, review each resulting version/diff and exercise combined behavior; merge algorithm is closed |
| v2 migration is mistaken for in-place upgrade | Two projects diverge; old domain/store listing still serves | Original remains editable; v2 copy exists | Record both ids/cutoffs, deliberately move resources/domain and release v2 as the documented separate app |
| CLI pull contains deleted/stale paths | `.anything/files/` mixes old local and current remote files | Remote file listing remains readable | Reconcile against the current API list in a fresh controlled directory before using it as context |
| Secret exists only in development | Preview works, published app fails | Secret metadata and source survive | Add/verify the production secret environment without exposing values, then redeploy/test |
| Source ZIP builds but hosted capability fails | Front end runs; auth/function/data/upload calls fail | Exported source and separate SQL export | Reconstruct each managed service, migrate state and validate an independent deployment |
| Figma/screenshot result drifts from origin | Generated app looks close but changes do not roundtrip | Figma/image source and generated project remain separate | Compare again at the intended source revision; implement reviewed corrections rather than assume binding |
| Store upload succeeds but app is unavailable publicly | TestFlight/internal draft exists; review/listing incomplete | Uploaded build and project | Finish store requirements, test binary, submit/promote and confirm actual store availability |

## Acceptance gates

### Web release

- record project group id, intended current version/revision and module set;
- verify meaningful current file changes, not only terminal generation status;
- run the ordinary flow in a clean Preview and inspect runtime/network/function logs;
- test development auth/data without assuming those rows will publish;
- review database schema changes and production secrets explicitly;
- wait for deployment success and record deployment id plus exact public URL;
- open that URL in a fresh session and verify auth, data, upload/payment/integration, loading, empty and error paths;
- verify the published version label matches the intended release and re-publish after later source changes.

### Mobile release

- complete the web checks for every shared backend/function/database dependency;
- test device capabilities through Expo Go on hardware;
- build/upload and record the store submission/build identity;
- install the exact TestFlight/internal-testing build and repeat the real flow against production services;
- complete store privacy, policy, screenshots, review and public-release controls;
- confirm final store availability independently from Anything's submission status.

### v2 migration or external exit

- record source and destination project ids plus migration/export timestamps;
- reconcile rewritten v2 source or exported source at an exact Git commit;
- count and reconcile development/production rows and auth users/sessions as appropriate;
- verify domain routing and explicitly identify which old/new project still receives traffic;
- recreate secrets, uploads, managed integrations and store/deployment configuration that source does not carry;
- exercise the replacement release before considering the older authority retired.

## Product and distribution chronology

| Date | Public event | Architectural consequence |
|---|---|---|
| 2023-11-02 | Create's generative app-builder article | Prompt, visual rendering, conversational refinement, collaboration, launch and code copy formed the original lineage |
| 2025-08-08 | Anything launched after the team rethought Create around a new coding agent | Web/mobile, design, backend, data, auth, payments, integrations, hosting and App Store delivery became one hosted product boundary |
| 2025-09-26 | “Building Max” published | Runtime ownership, browser/runtime APIs, visual diffing, logs, database branches and parallel merge became the autonomy strategy |
| 2026-06-01 | `@anythingai/cli` registry lineage began | A public scriptable control-plane distribution became independently inspectable |
| 2026-06-10 | CLI `1.0.0` published | Packaged skill, OpenAPI-generated client, WebSocket/polling wait logic, pull/watch and ship guard were fixed to an auditable tarball |
| 2026-08-11 | Current evidence snapshot | v2 is opt-in copy migration; Android publish is beta; CLI rollout is selective; GitHub sync and database import remain upcoming; rollback remains unimplemented |

There is no public product source repository whose commit history could establish the hosted agent, builder, migration, Max or deployment implementation. The npm tarball's untraceable `gitHead` is not substituted for such evidence.

## Fact, inference and unknown ledger

| Class | Statement |
|---|---|
| Fact | Anything launched on 2025-08-08 as the result of rethinking the earlier Create product around a new coding agent. |
| Fact | Current projects can contain web/mobile/backend/data capabilities, while the public API represents the top level as a project group with modules, revisions, preview and publish fields. |
| Fact | Preview, current files/versions, deployment, two database lanes, three secret environments and mobile store submissions expose distinct state/receipt boundaries. |
| Fact | `VALID` can represent a chat-only or plan-only generation with no file changes according to current CLI documentation. |
| Fact | The exact `@anythingai/cli@1.0.0` tarball adds a message-serialization guard to `ship`, waits through WebSocket/polling, pulls files read-only and synthesizes `watch` events from project fields. |
| Fact | The live OpenAPI says deployment rollback is not implemented and exposes only `501` as its implementation response, despite the CLI command being advertised. |
| Fact | Publishing copies database schema from development to production while keeping rows separate; a database may be shared across projects and exports separately as two SQL dumps. |
| Fact | v2 migration creates a new project, rewrites code, selectively copies domain/database/auth state, leaves the original editable and does not continue an existing app-store listing. |
| Fact | Figma, screenshots, images and URLs are agent context; no public contract exposes a durable design-node-to-generated-source identity or reverse sync. |
| Fact | Source ZIP export is available, GitHub sync is still upcoming, and current API/CLI file operations expose no source write/push route. |
| Inference | The hosted project group is the working authority until an external export is deliberately promoted to Git and its missing managed services are reconstructed. |
| Inference | `ship`'s regex guard reduces but cannot eliminate false success because assistant serialization is not an artifact/diff receipt and hosted compatibility is unstated. |
| Inference | `watch` can miss meaningful activity because it infers events from a few changing fields rather than consuming an authoritative event stream. |
| Inference | Parallel Max tasks and v2 migration can create source/data ordering hazards that require human reconciliation because public merge/transaction semantics are absent. |
| Unknown | Hosted project/version/revision schema, snapshot retention and exact restore atomicity. |
| Unknown | Agent model routing, prompts, file-ranking/AST implementation and deterministic-versus-model edit policy at this snapshot. |
| Unknown | Current framework/component architecture generated by every v2 project beyond the documented component-based rewrite; templates and project types may differ. |
| Unknown | Max browser/simulator isolation, database-branch implementation, audit-log binding and parallel merge/conflict algorithm. |
| Unknown | Collaboration transaction semantics when humans, base-agent threads, Max tasks and API requests overlap. |
| Unknown | Managed function/runtime, auth, uploads, deployment and app-store backend source and exact tenancy/retention guarantees. |
| Unknown | Whether and when GitHub synchronization, database import and deployment rollback will ship, and how existing projects will migrate to them. |

## Primary sources

### Identity, builder and runtime loop

- [Anything launch](https://www.anything.com/blog/anything-launch)
- [Create — a new generative AI app builder](https://www.anything.com/blog/create-a-new-generative-ai-app-builder)
- [Essentials](https://www.anything.com/docs/essentials)
- [Agent](https://www.anything.com/docs/builder/agent)
- [Builder controls, Preview and version history](https://www.anything.com/docs/builder/controls)
- [Design inputs and design reasoning](https://www.anything.com/docs/apps/design)
- [Figma import](https://www.anything.com/docs/import/figma)
- [Max product contract](https://www.anything.com/docs/builder/max)
- [Building Max: runtime ownership and parallel merging](https://www.anything.com/blog/building-max)

### State, migration and delivery

- [Web apps](https://www.anything.com/docs/apps/web)
- [Mobile apps](https://www.anything.com/docs/apps/mobile)
- [Mobile getting started](https://www.anything.com/docs/apps/mobile/getting-started)
- [Databases](https://www.anything.com/docs/apps/databases)
- [Backend functions](https://www.anything.com/docs/apps/backend)
- [Auth](https://www.anything.com/docs/apps/auth)
- [Uploads](https://www.anything.com/docs/apps/uploads)
- [Upgrade to v2](https://www.anything.com/docs/builder/upgrade-to-v2)
- [Web/mobile publish](https://www.anything.com/docs/launch/publish)
- [Submit to App Store](https://www.anything.com/docs/launch/app-store)
- [Submit to Play Store](https://www.anything.com/docs/apps/mobile/publishing-android)
- [Source export and GitHub status](https://www.anything.com/docs/share/export)

### Public protocol and distribution

- [Anything API and CLI for agents](https://www.anything.com/docs/cli)
- [Builder CLI guide](https://www.anything.com/docs/builder/cli)
- [Documentation and API index](https://www.anything.com/docs/llms.txt)
- [Live OpenAPI `0.1.0`](https://api.anything.com/v0/api/openapi.json)
- [`@anythingai/cli@1.0.0` registry metadata](https://registry.npmjs.org/%40anythingai%2Fcli/1.0.0)
- [`@anythingai/cli@1.0.0` published contents](https://unpkg.com/browse/@anythingai/cli@1.0.0/)

All product availability, beta, upcoming-feature, protocol and package statements are snapshot-dated. The OpenAPI and MIT CLI distribution expose a meaningful external control plane and several concrete failure modes; they do not make the hosted Anything product open source.
