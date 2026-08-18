# FlutterFlow

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | FlutterFlow |
| Category | Structured visual Flutter application builder with external coding-agent control |
| Status | Active |
| Working authority | A branch-specific FlutterFlow project on FlutterFlow's service; generated Flutter code is a runtime/export projection and becomes an independent code authority only after an intentional export or Git fork |
| Public implementation | Hosted IDE, project service, visual renderer and code generator are closed; the current CLI router and AI SDK are source-available distributions under BSL 1.1 |
| Evidence pin | Public exporter repository [`9859302`](https://github.com/FlutterFlow/flutterflow-cli/tree/9859302ad8b96c37ecf68312d571a16d4a41422a); `flutterflow_cli@0.0.39`; signed `flutterflow_ai@0.0.40` build `b5c8a09d` |

## Evidence pin: three code surfaces with different freshness and licenses

The name “FlutterFlow CLI” currently covers three materially different audit surfaces.

1. The public Git repository was pinned at [`9859302ad8b96c37ecf68312d571a16d4a41422a`](https://github.com/FlutterFlow/flutterflow-cli/commit/9859302ad8b96c37ecf68312d571a16d4a41422a) on 2026-08-11. It contains the BSD-3-Clause `0.0.31` export/deploy client, including the export-manifest flag, but none of the present `flutterflow ai` router, DSL, MCP, branch or live-session implementation.
2. The current [`flutterflow_cli@0.0.39`](https://pub.dev/packages/flutterflow_cli/versions/0.0.39) archive was published on 2026-07-22. Its SHA-256 is `ad5219f8809973c69b74e456fa714c57e7610f9af9683e36248fdf8fea0f32c0`. It includes readable Dart source for the exporter and AI package router, but its license is Business Source License 1.1 rather than the stale repository's BSD license.
3. That router downloads a signed AI SDK snapshot from FlutterFlow's artifact channel. The live production pointer on 2026-08-11 selected version `0.0.40`, build `b5c8a09d`, commit `b5c8a09d66ca89c2a77dc966fb76c422cb09bf97` (not reachable from the public repository), released 2026-07-29. The archive SHA-256 is `14202e81a29f92ac63d81249f139c714edb7d22cd57956cec9c4b9e96855b083`; its 267-file source distribution contains the DSL/compiler, generated protobuf schema, project graph, API client, validation pipeline, fast patcher, branch/merge implementation, local MCP server and Desktop bridge.

The router compiles in an Ed25519 public key, verifies signatures on both [`latest.json`](https://storage.googleapis.com/flutterflow-downloads/flutterflow-ai-packages/prod/latest.json) and the selected [`manifest.json`](https://storage.googleapis.com/flutterflow-downloads/flutterflow-ai-packages/prod/builds/b5c8a09d/manifest.json), checks the archive hash and version gate, rejects symlinks/path escapes and oversized compressed or extracted payloads, then atomically promotes an extracted temporary directory into its package cache. The two signatures and archive digest were independently verified for this snapshot.

Both current distributions grant FlutterFlow-connected production use but prohibit using the work to build a competing visual builder, low-code platform or code-generation tool. Their stated change date is 2055-04-22, with an earlier fourth-anniversary conversion possible per version. They are source-available, not open source. The hosted FlutterFlow product remains outside all three distributions.

## Decisive architecture: one cloud project, four local representations

The central fact is not that an agent “edits Flutter code.” In the normal AI workflow, the agent edits the same **structured FlutterFlow project** that the visual builder edits. Flutter source is generated afterward.

| Layer | Concrete representation | What it is for | Authority and staleness |
|---|---|---|---|
| Hosted project branch | internal `FFProject` graph, exposed to one public API as partitioned YAML and to the AI SDK as a compressed protobuf | pages, components, widget trees, state, schema, APIs, actions, custom code, theme, navigation and integrations | canonical authoring state for Builder and AI; each internal branch has its own project id and commit history |
| Local change program | `dsl/create.dart`, then `dsl/edit.dart`, tests, references and optional staged custom-code files | repeatable intent that compiles/mutates a fetched project graph | editable agent source, but not a complete mirror of the latest hosted project |
| Generated typed context | `lib/flutterflow_project.dart` plus per-entity files under `lib/flutterflow_project/` | typed page/component/resource handles, widget keys, types and selectors | generated inspection/authoring map; can be fresh, stale or explicitly refreshed |
| Generated Flutter snapshot | `generated_code/` plus `.flutterflow/export_manifest.json` | actual Dart projection for layout, render, build and runtime diagnosis | read-only runtime truth for that export snapshot, not the visual project's authoring authority |
| Workspace sidecars | `.flutterflow/config.yaml`, `workspace.json`, run journal, history, traces, merge bundles and generated-code state | project/branch binding, diagnostics, recovery evidence and local control state | useful receipts with independent write and retention boundaries; none supersedes the hosted project |

This explains why “the folder is only a workspace” and “generated code is runtime truth” can both be correct. The server project owns editable application structure; generated Dart owns what Flutter will execute for one projection; the DSL and typed SDK are local programs/maps around those two truths.

## Ordinary journey: point, mutate the native graph, then prove the projection

A safe existing-project loop is:

1. `flutterflow ai init --project <id>` binds a local workspace, installs the signed SDK snapshot and writes the agent/MCP configuration.
2. The agent reads the generated typed project map or a fresh FlutterFlow AI Selector rather than rediscovering the whole project from prompts.
3. A literal property change to an existing widget takes the fast-patch path; a structural, bound, action, schema or custom-code change is authored in `dsl/edit.dart` and sent through the full pipeline.
4. The full `run` compiles, validates and performs wiring checks before any remote push. A separate `validate` is only useful when the caller deliberately wants the same checks without mutation.
5. A successful write creates a FlutterFlow commit on the active internal branch. The workspace regenerates typed context and normally refreshes the generated Flutter snapshot.
6. The user verifies the actual Builder canvas or running app. With FlutterFlow Desktop paired, the agent can observe selection, start/wait for local run, read logs and capture supported-device screenshots; those controls do not create a second mutation path.
7. Branch merge, code export, GitHub synchronization, deployment and backend-data changes are later gates with their own receipts.

`flutterflow ai run` does not execute or deploy the app. A valid project commit proves that the structured graph passed the available validation, not that the Flutter build starts, the screen looks correct, a backend contains the expected data or a production deployment serves that commit.

## The project is structured data, not generated Dart

FlutterFlow publishes two protocol views over the project model.

### Public Project API: partitioned YAML

The Beta [Project API](https://docs.flutterflow.io/resources/projects/settings/project-apis/) describes a complete project schema split into named YAML files: interface/widget structure, project configuration and integrations, data schema and app state, actions, assets, custom code and organization. Clients can list partitions, download them, validate submitted YAML and update one or more whole named files. Responses include a partitioner version and `projectSchemaFingerprint` so clients can recognize schema drift.

This is a whole-partition replacement edge. The documented API has validation and project-lock errors, but exposes no `expected_updated_at_ms` or equivalent public compare-and-swap field. It should not be conflated with the AI SDK's separate protobuf and patch endpoints.

### AI SDK: protobuf graph plus declarative mutation

The AI SDK fetches a compressed `FFProject` protobuf, compiles `App` declarations or edit operations into that representation, validates the result through FlutterFlow's service and pushes either the whole project or a typed `ProjectUpdate` delta. Pages, components, action blocks, data types, enums, state, APIs, queries, custom functions/actions/widgets/classes, dependencies, design tokens, navigation and several backend integrations are first-class surfaces.

Greenfield `dsl/create.dart` is intentionally one-shot. A successful first push binds `.flutterflow/workspace.json`; later work starts from the current remote graph and uses edit flows. The pipeline defers remote creation until local tasks pass, but creation and first push are still separate server operations. If creation succeeds and the subsequent push fails, the SDK explicitly warns that an unbound remote project may need manual cleanup because it has no delete API.

After a project push, the pipeline separately uploads the local change source against the returned commit. That second call can fail after the project commit already exists. A failing command therefore is not always proof that no remote mutation occurred: the “validation failed before push” case is atomic, while the “project pushed, source upload failed” case is a partial success that requires reading branch history and project state.

## Target identity stops at the native graph boundary

FlutterFlow's external-agent path has a precise selector format. A `FlutterFlow AI Selector v1` block carries:

- `project_id`, `scope_kind` and `scope_name` for the page/component boundary;
- `selector_path` for deterministic structural traversal;
- `node_key`, `node_name` and `node_type` for identity and verification.

The inspected SDK resolves the path first, checks expected type/name and falls back to the key. Its structural grammar begins at the widget-class root, uses `.<slot>[index]` for named slots and `.children[index]` for generic children. Typed widget handles expose the current node key and widget type directly. Other edit helpers can target by name, type or visible text; the source itself labels text matching brittle and recommends fresh exact context when identity matters.

The generated-code manifest provides a second, coarser join. It maps a page, component, action block or other **entity** by name/key to one or more generated Dart `primary_files`. This is sufficient to jump from “the selected Home page” to the Dart files that actually render it. It does not map every FlutterFlow widget node to a Dart source range, AST node, source map or repository revision.

Consequences:

- native Builder and Agent edits can address the same hosted widget identity;
- `selector_path` can drift after structural edits and a key can stale after replacement/regeneration;
- entity-to-file mapping helps diagnose generated runtime behavior but does not authorize editing the generated file;
- no public reverse transaction carries arbitrary edits in generated/exported Dart back into the same visual node;
- custom code authored **inside** the FlutterFlow project is different: it remains a native project resource and is regenerated intentionally.

This is native project-node identity plus an entity-level projection manifest, not a widget-to-Flutter-source round trip.

## Two write paths, two meanings of conflict

### Fast patch: literal intent reapplied on the newest head

The current generated table contains 98 fast-patch operations. They update literal text, typography, colors, visibility, opacity, sizing, common widget properties and a few app-scoped theme settings by emitting protobuf field paths. They do not insert/remove/reorder widgets, wire action chains, create custom code, or bind values to state/API/conditions.

The client caches the project's `updated_at_ms`, sends it as `expected_updated_at_ms` and, on HTTP 409, fetches a fresh token and retries once unless the caller explicitly supplied a strict parent token. A second 409 becomes `cas_conflict`; disabled and invalid operations return separate structured errors. This prevents a blind write against an old server timestamp, but it is **not semantic conflict review**. The automatic retry deliberately reapplies the requested literal to the newer head; if another writer changed the same property, the later requested literal can win.

After success, typed context refreshes first and generated code refreshes in the background. The patch response may therefore arrive while `generated_code/` is still stale or rebuilding.

### Full run: validate, classify overlap, re-run, then final CAS

The full pipeline fetches a baseline project and timestamp, executes the change program, validates it and checks server metadata before upload. When the timestamp changed, it compares baseline→external and baseline→SDK entity sets:

- overlap aborts rather than silently pushing;
- no overlap causes the same tasks to run again on the latest project;
- metadata is checked again, for at most two rebase attempts;
- the final whole-project push still includes `expected_updated_at_ms`, closing the check/push race with a server-side 409 guard.

The inspected overlap classifier is deliberately not a general field-level merge. It compares full bytes for pages and components; presence changes for data structs, enums, app-state fields, action blocks and app events; and singleton bytes for theme and routing. It does not classify modifications inside existing data/schema/state/event objects, nor APIs, custom code and many other project settings as overlapping entities. Those changes still trigger timestamp drift and a re-run on the latest graph, but may not produce a “same intent” conflict. The final CAS protects server freshness, not semantic agreement between two writers.

The practical contract is therefore optimistic, validated replay against the newest structured project—not a transaction spanning visual editor intent, DSL source, generated Dart and runtime acceptance.

## Internal branches are YAML Git history, not GitHub branches

FlutterFlow [branching](https://docs.flutterflow.io/collaboration/branching/) is built over a Git repository of partitioned project YAML, with custom code represented as Dart. Each internal branch is a separate FlutterFlow project id linked to the same trunk. The workspace config records `main_project_id`, branch name/reference and local head commit; checkout swaps the active project id and refreshes typed/generated projections.

Every AI push has a required commit message. The current SDK also adds AI attribution fields for client, agent, model and client version. The API-key owner remains the commit author; model identity is explicitly self-reported and unverifiable, so the badge is provenance metadata rather than cryptographic model attestation.

The merge path is unusually inspectable:

1. the service performs a Git three-way merge over partitioned YAML;
2. a local `.flutterflow/merges/<id>/` bundle retains ancestor, target, source and working trees;
3. deterministic auto-resolution handles identical and one-sided/no-op cases;
4. remaining marker blocks expose partitioner id and three-way YAML context;
5. resolution validates marker count, YAML parsing and server schema;
6. a client-side no-loss verifier flags a file when one side changed from the ancestor but the working result reverted to the ancestor;
7. merge commit refuses drops unless `--accept-drops` is given.

The server rejects unresolved markers and invalid project schemas, but the SDK changelog says full server-side dropped-edit detection remains future work. The no-loss guard is presently local and bypassable. A semantically invalid combined project can also fail even when Git reports no line conflict.

Closing a non-main branch is a soft delete with a documented 30-day restore window. Restoring a prior branch commit creates a new commit rather than erasing history. Separately, automatic snapshots have plan-specific retention and the older Versions mechanism is deprecated in favor of commits. Neither history rewinds generated GitHub output, deployment, backend records or a developer's local workspace in one operation.

## Local MCP and Desktop are two trust paths around the same writer

The external coding agent does not talk directly to an undocumented remote MCP service. `flutterflow ai init` configures a **local Dart MCP server** from the vendored SDK. Its tools wrap the same CLI/SDK operations: initialize, inspect, search, validate, run, patch, history, branches, merges, integrations and Test Pilot. Large results can spill to workspace-managed files instead of exceeding the client response limit.

Authentication and context have separate scopes:

- cloud project calls use `FF_API_KEY` or a base-URL-keyed credential stored at `~/.flutterflow/credentials.json`; an environment key wins and is not persisted;
- the router refuses sending an API key over plaintext HTTP to a non-loopback host;
- the documented POSIX credential write uses mode `0600`; the inspected code does not establish an equivalent Windows ACL guarantee;
- local workspace reads exposed through Desktop are root-sandboxed;
- FlutterFlow's Desktop Agent launches the user's selected Claude/Codex provider locally, and official docs state that prompts/responses travel through that provider rather than being stored as FlutterFlow conversation history.

When FlutterFlow Desktop is open, another local bridge exposes IDE selection, screens/components/theme, local-run control, logs and screenshots. macOS/Linux use a per-user Unix socket; the current Windows path uses loopback TCP plus an endpoint-file token. Mutating project calls still go through `patch`/`run`; the Desktop observes and re-renders the resulting project rather than applying an independent live edit.

Run control also has its own state machine. `start` may return while export/build/install is still `starting`; bounded `wait_ready` distinguishes that from `ready`. A timeout can mean a slow build continues, not failure. Screenshots work through supported Skia/native paths, while Web's HTML renderer and real iOS devices can return no image. A successful screenshot is runtime evidence for one device/frame, not project or deployment durability.

Desktop additionally exposes interactive managed-Firebase creation/configuration with explicit user confirmation and Google OAuth. Region is a material, irreversible choice. This is a separate control plane that extends the normal project-edit workflow; it does not make Firebase project creation, data state and the FlutterFlow commit one transaction.

## Generated code is a projection; GitHub is an intentional fork

FlutterFlow can export code for an internal branch, development environment and historical commit, optionally with an export manifest. Local export honors `.flutterflowignore` patterns so selected existing files are not overwritten during archive extraction. That protection does not make arbitrary Dart changes round-trip into the structured project.

The managed [GitHub push](https://docs.flutterflow.io/exporting/push-to-github/) always regenerates a branch named `flutterflow` and warns developers not to edit it because a future push overwrites it. The documented customization flow is to merge `flutterflow` into a separate `develop` branch, keep hand-written integration there, and promote reviewed work toward `main`.

These branch domains must stay distinct:

| Domain | Identity | Direction |
|---|---|---|
| FlutterFlow internal branch | separate FlutterFlow project id and YAML commit graph | visual/AI edits merge inside FlutterFlow |
| Generated GitHub `flutterflow` branch | generated Dart projection | FlutterFlow → Git; replaced on future pushes |
| Developer `develop` / `main` | reviewed application code and external customizations | consumes generated updates; no supported general reverse import into the project graph |
| Deployment | chosen FlutterFlow or Git branch build plus environment configuration | code/config → hosted/mobile release |

Once a team chooses exported source as its long-term authority, it has accepted a fork. The visual project can continue generating new code, but arbitrary changes in the fork are reconciled through ordinary Git/code review rather than a public code-to-builder merge protocol.

## Environment, data, tests and delivery advance on separate clocks

FlutterFlow development environments are not Flutter flavors. Selecting one changes which backend project and environment values are inserted into Test/Run, Local Run, exports and deployments. Different environments can bind separate Firebase or Supabase projects. Private values are omitted from client code where supported, but official docs warn that some values used by generated Cloud Functions can appear in exported function source and therefore require repository review.

[Test Pilot](https://docs.flutterflow.io/testing/test-pilot/) creates a web build snapshot and runs AI-authored browser steps with its own run history. That is useful application evidence, but it is not proof of native-device behavior, external service state or the production deployment. Likewise, a local-run screenshot, successful generated-code build and FlutterFlow project commit are three different receipts.

The durable clocks are therefore plural:

| Clock | Durable object | Does not automatically include |
|---|---|---|
| Internal branch commits | structured project YAML/custom code and commit attribution | generated Git repository state, deployment, backend records, provider conversation |
| Automatic snapshots | retained hosted project recovery point | indefinite history or downstream artifacts |
| Local workspace journal/history/traces | agent source, plans, diagnostics and best-effort redacted traces | authoritative remote head or runtime proof |
| Typed SDK and generated-code state | a marked fresh/stale local projection | visual editor changes after its timestamp |
| Git repository | exported/generated Dart plus reviewed developer work | reverse visual graph, FlutterFlow branch restore or backend data |
| Environment/backend | Firebase/Supabase configuration, records and secrets | code/history rollback |
| Test Pilot/local run | a particular test/run result and visual/log evidence | release identity or all platforms |
| Deployment/app-store release | delivered build at one target | guarantee that project, data and Git can be restored to the same moment |

No public operation rewinds all of them together.

## Failure and recovery map

| Break | User-visible consequence | Recovery / evidence boundary |
|---|---|---|
| Create succeeds but first project push fails | an unbound remote project may remain | inspect project list and reuse with `--find-or-create` or clean up manually; workspace state deliberately does not bind it |
| Project push succeeds but change-source upload fails | command errors although the native project commit exists | read branch history/project state before retrying; do not assume “failed command” means no mutation |
| Visual editor changes while a full run is compiling | non-overlap is replayed on latest; classified overlap aborts; repeated churn eventually aborts | refresh context, inspect both intents and rerun; final CAS prevents stale upload but not every semantic conflict |
| Concurrent writer changes the same fast-patched literal | first 409 causes automatic token refresh and patch replay | inspect the resulting property/commit; use explicit strict CAS when silent replay is inappropriate |
| Selector path/key is stale | wrong/missing target or type/name verification failure | refresh context, resolve path, verify type/name, then fall back to exact key; avoid brittle text selectors |
| Typed map or generated snapshot is stale | agent reasons from old graph or old runtime Dart | use context check/codegen status and refresh; background fast-patch codegen can still be in flight |
| Agent edits `generated_code/` | next refresh/export replaces the change and visual Builder never received it | express the change through DSL/native custom code; keep intentional external changes in a forked Git branch |
| Developer edits GitHub `flutterflow` | managed push overwrites work | keep custom integration in `develop`/`main`, review every regenerated diff and recover through Git |
| Branch checkout head differs from server tip | SDK refuses to switch by default | inspect/commit/reconcile local state; use force only when intentionally abandoning the local head |
| YAML merge has no text markers but combined project is invalid | server schema validation blocks commit | repair cross-file semantic references, then revalidate; line-level Git success is insufficient |
| No-loss verifier is bypassed | a side's edit can disappear from the resolved YAML | document every intentional drop; server-side drop protection is not yet established |
| Local run `start` times out | slow export/build may continue despite an error-shaped response | use `wait_ready` and phase/log evidence; do not launch duplicate runs based on timeout alone |
| Screenshot returns null | Web HTML renderer or real iOS device lacks supported capture path | use another supported target or user-supplied/native capture; no image is not app failure |
| Environment changed before export/deploy | code points at the wrong backend or values | verify selected environment, generated diff and destination; inspect function source for exposed private values |
| Internal commit restored | GitHub code, backend records and deployment remain newer | restore/redeploy/reconcile each authority explicitly; there is no suite-wide rewind |

## Evolution: exporter became a native-project agent control plane

| Date | Release / commit | Architectural consequence |
|---|---|---|
| 2023-01-09 | [`d0c14f9`](https://github.com/FlutterFlow/flutterflow-cli/commit/d0c14f96c163eb9a8b7fbb67dd3a3582990c5d99) | initial public CLI established one-way code export |
| 2023-09-22 | [`eb6551c`](https://github.com/FlutterFlow/flutterflow-cli/commit/eb6551c01bb823d3bcaf3acf8d9a604d5d6848b0) | export could target an internal FlutterFlow branch |
| 2024-05-03 | [`2278e1b`](https://github.com/FlutterFlow/flutterflow-cli/commit/2278e1b38590d99c4538fbd55e3dd9727dd177a6) | Firebase deployment joined the public export client |
| 2024-07-03 | [`31d53be`](https://github.com/FlutterFlow/flutterflow-cli/commit/31d53bec3d3d26f968f10c7f8f348a1f74716766) | export could pin a FlutterFlow commit |
| 2024-10-22 | [`d2ed1eb`](https://github.com/FlutterFlow/flutterflow-cli/commit/d2ed1eb450657943ea85e8fd76e990befe514f1a) | `.flutterflowignore` added bounded local overwrite protection |
| 2026-04-03 | [`296a637`](https://github.com/FlutterFlow/flutterflow-cli/commit/296a6377a7f4004a1349cf703c94ee823c406468) | export manifest exposed entity-to-generated-file lookup |
| 2026-04-28 | `0.0.32-beta.4` / `0.0.33` | current distribution introduced the `flutterflow ai` namespace, then moved from BSD to BSL 1.1; public Git stopped representing the release source |
| 2026-06-02 | `flutterflow_cli@0.0.37` | Desktop live debugging added a local observation/control plane |
| 2026-07-14–22 | `0.0.38`–`0.0.39` | interactive project onboarding and Windows picker fixes made the local agent path ordinary-user accessible |
| 2026-07-29 | signed SDK `0.0.40` | branch/merge-aware project writing, fast-patch/source mapping and AI-attributed commits were present in the inspected snapshot |

The important transition is from “download generated Flutter code” to “let an external agent mutate the canonical structured project, commit it and regenerate code.” Export remains a downstream fork rather than becoming the primary AI write path.

## Implementation evidence map

The public Git paths are pinned to `9859302ad8b96c37ecf68312d571a16d4a41422a`. Current router paths refer to the immutable [`flutterflow_cli@0.0.39` archive](https://pub.dev/api/archives/flutterflow_cli-0.0.39.tar.gz). SDK paths refer to the signed immutable [`0.0.40/b5c8a09d` archive](https://storage.googleapis.com/flutterflow-downloads/flutterflow-ai-packages/prod/builds/b5c8a09d/flutterflow_ai-package.tar.gz); its manifest commit is an artifact identity, not a Git object reachable from the public repository.

| Concern | Pinned file / source | What it establishes |
|---|---|---|
| Old public export boundary | [`pubspec.yaml`](https://github.com/FlutterFlow/flutterflow-cli/blob/9859302ad8b96c37ecf68312d571a16d4a41422a/pubspec.yaml), [`flutterflow_api_client.dart`](https://github.com/FlutterFlow/flutterflow-cli/blob/9859302ad8b96c37ecf68312d571a16d4a41422a/lib/src/flutterflow_api_client.dart) | public repository is version 0.0.31 exporter/deployer, not current AI implementation |
| Export manifest | [`296a637`](https://github.com/FlutterFlow/flutterflow-cli/commit/296a6377a7f4004a1349cf703c94ee823c406468) | optional entity-to-generated-file manifest entered the public exporter |
| Local overwrite exclusions | [`flutterflow_ignore.dart`](https://github.com/FlutterFlow/flutterflow-cli/blob/9859302ad8b96c37ecf68312d571a16d4a41422a/lib/src/flutterflow_ignore.dart), [unzip path](https://github.com/FlutterFlow/flutterflow-cli/blob/9859302ad8b96c37ecf68312d571a16d4a41422a/lib/src/flutterflow_api_client.dart) | glob-matched generated archive members can be skipped locally |
| Current router/package split | CLI `lib/src/ai_router.dart`, `ai_workspace.dart` | AI commands route into a workspace-vendored SDK snapshot rather than the stale Git implementation |
| Artifact trust chain | CLI `lib/src/ai_artifacts.dart` | compiled signing key, signed pointer/manifest, hash, version, rollback, size/path and atomic-install checks |
| Credentials | CLI `lib/src/ai_credentials.dart` | environment precedence, per-base-URL JSON cache, POSIX mode and stale-key clearing |
| Project compiler/write pipeline | SDK `lib/src/dsl/app.dart`, `compiler.dart`, `pipeline/flutterflow_ai_pipeline.dart` | declarative intent compiles/mutates `FFProject`, validates, detects bounded overlap and commits with final CAS |
| Cloud client | SDK `lib/src/client/flutterflow_ai_client.dart` | compressed full-project push, delta patch, `updated_at_ms` CAS, one transparent patch retry and separate source upload |
| Fast patch | SDK `lib/src/fast_patch/fast_patch_ops.g.dart`, `fast_patch_dispatcher.dart`, `fast_patch_mcp_handler.dart` | 98 literal operations lower to protobuf field paths and refresh context after mutation |
| Typed context/selectors | SDK `lib/src/dsl/project_sdk_generator.dart`, `project_sdk.dart`, `edit.dart` | per-entity typed handles, key/path/name/type/text targeting and structural path grammar |
| Generated-code projection | SDK `lib/src/generated_code_snapshot.dart`, `generated_code_state.dart` | atomic local snapshot swap, explicit fresh/stale state and read-only export-manifest path |
| Branch checkout | SDK `lib/src/branch/branch_ops.dart`, `branch_context.dart` | branch/project-id binding, local/server head guard, soft close/restore and main protection |
| Merge resolution | SDK `lib/src/branch/merge_workspace.dart`, `merge_auto_resolver.dart`, `merge_explainer.dart`, `no_loss_verifier.dart` | four-tree local bundle, deterministic cases, marker/YAML/schema checks and client-side drop detection |
| Local MCP | SDK `mcp/server.dart` | local tool registration for project writes, patches, branches, merges, tests and Desktop proxying |
| Desktop bridge | SDK `lib/src/live_session/desktop_client.dart`, `endpoint_file.dart`, `mcp/desktop_proxy_tools.dart` | UDS/Windows loopback pairing, workspace/IDE reads, run leases, logs, screenshots and managed-Firebase controls |
| Local evidence | SDK `lib/src/pipeline/run_journal.dart`, `run_trace.dart`, `workspace_state.dart` | run records, traces and workspace binding are explicit sidecars rather than the project database |
| License boundary | current CLI `LICENSE`; SDK `LICENSE` | BSL terms apply to present distributed code while old public Git remains BSD |

## Reproducibility check on Windows

The current pub and signed SDK archives were downloaded and hashed. The router's compiled Ed25519 key independently verified both remote signatures, and the archive digest matched the signed manifest. The extracted SDK contained 238 Dart files, including 193 under `lib/` and three MCP source files.

Neither Dart nor Flutter was installed in the research environment, so no CLI/SDK tests, analyzer pass, generated project, local run or Flutter build was executed. Changelog statements such as “2617 tests pass” are maintainer claims, not independent verification. The hosted project service, validator, generator, visual editor and Desktop app are absent from the archives, so static source inspection cannot reproduce a real end-to-end project mutation.

## Evidence boundary and open questions

Established from current official documentation, versioned distributions and the signed SDK snapshot:

- the hosted branch-specific FlutterFlow project—not generated Dart—is the normal Builder/Agent authoring authority;
- external agents use a local source-available MCP/SDK that writes the same structured project through validated protobuf operations;
- native selectors and typed handles preserve hosted node identity, while the export manifest only maps entities to generated files;
- fast literal patches and full DSL runs have different conflict behavior and neither creates a transaction with runtime acceptance;
- internal YAML branches/commits, local mirrors, GitHub output, environments, backend data, tests and deployment are separate clocks;
- current source is distributed under BSL and is newer than the public BSD Git repository;
- generated GitHub code is an explicit one-way projection with a documented overwrite branch.

Not established publicly at this snapshot:

- the hosted IDE/database schema, collaboration engine, visual renderer, validator and Flutter code-generator implementation;
- the exact lossless relationship and migration algorithm among `FFProject` protobuf, partitioned YAML, Firestore state and generated Flutter code;
- a public widget-node-to-generated-Dart range/AST/source-map/revision binding or general reverse import from edited Dart;
- complete semantic-conflict detection for all project resource types, or server-side no-loss enforcement for merges;
- transactional guarantees across a project commit, uploaded change source, typed context refresh and generated-code export;
- how live collaborator writes are surfaced inside all Builder states beyond timestamp/CAS and branch contracts;
- a unified restore across project commits/snapshots, GitHub, environment values, backend records, Test Pilot and deployment;
- Windows filesystem ACL guarantees for saved API credentials;
- a public Git object or build recipe that reproduces the signed `b5c8a09d` SDK archive;
- model/provider retention and training behavior beyond FlutterFlow's statement that Desktop conversations travel through the selected provider.

## Primary sources

- [Build with AI Agents](https://docs.flutterflow.io/flutterflow-cli/build/)
- [FlutterFlow Desktop AI Agent](https://docs.flutterflow.io/concepts/ai-agent/)
- [Project API](https://docs.flutterflow.io/resources/projects/settings/project-apis/)
- [Project model](https://docs.flutterflow.io/resources/projects/)
- [Branching](https://docs.flutterflow.io/collaboration/branching/)
- [Saving and versioning](https://docs.flutterflow.io/collaboration/saving-versioning/)
- [GitHub push](https://docs.flutterflow.io/exporting/push-to-github/)
- [Deploy from GitHub](https://docs.flutterflow.io/deployment/deploy-from-github/)
- [Development environments](https://docs.flutterflow.io/testing/dev-environments/)
- [Custom code](https://docs.flutterflow.io/concepts/custom-code/)
- [Generated state management](https://docs.flutterflow.io/generated-code/state-management/)
- [Test Pilot](https://docs.flutterflow.io/testing/test-pilot/)
- [Refactor Project / direct YAML editing](https://docs.flutterflow.io/resources/projects/refactor-project/)
- [FlutterFlow version management](https://docs.flutterflow.io/resources/projects/settings/flutterflow-version-management/)
- [Public CLI repository](https://github.com/FlutterFlow/flutterflow-cli)
- [Current CLI registry package](https://pub.dev/packages/flutterflow_cli/versions/0.0.39)
- [Signed production SDK manifest](https://storage.googleapis.com/flutterflow-downloads/flutterflow-ai-packages/prod/builds/b5c8a09d/manifest.json)
