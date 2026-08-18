# Monet

> Research status: **Source-level** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Het Patel / contributors |
| Category | Agent-operable video timeline and code canvas |
| Status | Active public alpha; package and latest tag are v0.1.9; latest pinned commit is 2026-07-06 |
| Source availability | MIT |
| Canonical source repository | https://github.com/Monet-AI-Editor/Monet |
| Pinned source revision | `74fcb1646a2329dfa35acfe7b3726491544fca18` |
| Product/runtime floor | macOS-first Electron app; README requires Node.js 18+ for source development |

## Ordinary route: media becomes a timeline before the agent edits it

Monet is a local video editor with a second, code-driven Canvas surface. Its ordinary editor route is:

`create .aiveproj.json → import external media → automatically append paired timeline clips → edit through UI or agent → preview in Electron → render with FFmpeg`

The agent can also create an intermediate artifact in Canvas or Remotion:

`Paper.js / Matter.js / HTML frame or Remotion composition → PNG/video file → import as media → automatically append to the active timeline → preview/export`

This is not merely an agent chat beside a video player. The running Electron main process owns a mutable timeline graph; the React editor observes it; the embedded terminal, CLI and HTTP bridge can mutate it; and the export service compiles its active sequence into interval renders. Canvas is a parallel artboard system that can feed files back into that timeline.

The decisive qualification is that those surfaces do **not** converge on one authority. A user-visible “project” spans live memory, multiple sidecars and external paths, while the public MCP server mixes live calls with direct file writes.

## One project has at least six kinds of truth

| State | Location | Authority and failure boundary |
|---|---|---|
| Live video edit | In-process `ProjectStore` | current assets, sequences, tracks, clips, tasks and tool history used by the editor, HTTP bridge and exporter |
| Portable-looking project file | `<name>.aiveproj.json`, normally under `~/Documents/Monet Projects/` | manual materialization of `EditorProjectRecord`; it contains timeline state and absolute media paths, but no Canvas artboards |
| Recovery snapshot | Electron `userData/autosaves/<sha1(project path)>.aiveproj.autosave.json` | 500 ms debounced mirror of the live store; reopen chooses the newer mtime between project file and autosave |
| Canvas workspace | renderer `localStorage` plus `userData/canvas-state/<sanitized project key>.json` | independent artboard array keyed by `file:<absolute project path>` or a draft identity; not bundled into the project file |
| Media identity | absolute filesystem paths in each `MediaAssetRecord` | the project points to external video/audio/image files; it does not content-address or package them |
| Generated material | `remotion/`, `remotion-renders/` and `userData/canvas-frames/` | editable source and rendered files outside the project schema; importing a render creates new timeline state |

`EditorProjectRecord` proves the central omission: it serializes `assets`, `sequences`, `tasks` and `toolHistory`, but has no Canvas field. Canvas persistence derives its key from the project file's absolute path. Therefore moving, renaming or copying a project file changes the automatic Canvas lookup identity. That last sentence is an implementation inference from the key function, not a separately tested migration flow; manual Canvas JSON export/import is the available explicit transfer path.

The `.aiveproj.json` suffix can therefore overstate portability. Its timeline structure is JSON-portable, but successful reopening still depends on external absolute media paths, a path-keyed Canvas sidecar and, for generated work, separate source/render directories.

## Import is already a timeline mutation

`ProjectStore.importFiles()` does more than register assets. It resolves every path to an absolute path, adds the asset records, then appends clips at the current sequence tail:

- video creates one video clip **and** one audio clip that share the same asset id;
- image creates a video clip, using a fallback duration when probing is unavailable;
- audio creates an audio clip;
- each imported asset advances the append cursor, so a batch becomes a sequential rough cut.

The same import path is used after Canvas captures and MCP Remotion renders. Consequently “render this frame and add it to Monet” is also a timeline-placement operation, not a library-only handoff. An agent that repeatedly renders variants can lengthen the active sequence unless it subsequently removes or repositions the generated clips.

Absolute paths are a deliberate repair, not an incidental choice. Commits [`cd20dfb`](https://github.com/Monet-AI-Editor/Monet/commit/cd20dfbc29757dc850ebf6b3ce2acda81c93b72c) and [`eb06241`](https://github.com/Monet-AI-Editor/Monet/commit/eb06241c1b3873bd9bbdd96812198ccf18b446df) fixed and regression-tested relative imports after they produced black-frame playback from a different renderer working directory. Path and mtime remain important cache identities; there is no content-hash relocation layer in the observed project model.

## The control plane splits at MCP

| Interface | How it finds Monet/project state | Mutation authority | Consequence |
|---|---|---|---|
| `editorctl` CLI | reads a temp port file, then scans localhost ports 51847–51857; file fallback selects `project.aiveproj.json` or the newest `.aiveproj.json` in cwd | live HTTP for mutations; file mode is limited to reads | best-aligned public interface with the running app and dynamic bridge port |
| HTTP bridge | Electron main process on `localhost`, choosing 51847–51857 after conflicts | live `ProjectStore`, control state and renderer-delivered Canvas commands | timeline calls share live state; Canvas calls acknowledge event delivery before React persistence completes |
| `editor-mcp` | hard-codes port 51847 and eagerly loads `AI_VIDEO_EDITOR_PROJECT` or `cwd/project.aiveproj.json` before every tool dispatch | mixed: six commands write JSON directly, while many other commands call the live bridge | one advertised server can read stale disk state, bypass live history, miss a non-default bridge port or fail before a live-only tool runs |
| Embedded terminal | login PTY in the project-file directory, with generated agent instructions and wrappers | full local process plus CLI/HTTP/filesystem access | broadest authority; correctness depends on the injected routing rules and the agent respecting them |

The six direct MCP mutations are add clip, split clip, remove clip, add effect, set speed and set volume. They call `saveProject()` on the disk JSON without notifying `ProjectStore`, creating an undo entry or refreshing the UI. Other nearby operations—move, trim, ripple edits, transitions, keyframes and Canvas commands—call the running app instead. Disk-backed MCP reads and live-backed reads are interleaved in the same switch.

That creates a concrete split-brain sequence:

1. the UI holds live state `L`, while the last manual file contains `D`;
2. an MCP direct-write tool loads `D`, mutates it to `D′` and saves it;
3. the UI still displays and exports `L`;
4. a later UI save can overwrite `D′`, while another MCP disk read can report `D′` as if it were current.

There is a second bootstrap mismatch. Managed projects are named `<slug>.aiveproj.json`, the terminal starts in their directory, and the terminal session does not set `AI_VIDEO_EDITOR_PROJECT`. The MCP wrapper only launches its server, whose default is the literal `project.aiveproj.json`; because every request loads that file before its tool switch, even a Canvas/live tool can fail unless the caller supplies the environment variable or provides the default filename. `editorctl` already implements the missing newest-file and dynamic-port discovery logic, but the MCP server does not reuse it.

Remotion adds a narrower command boundary. MCP constructs one shell string with `renderArgs.join(' ')`, including caller-influenced composition ids, filenames and JSON props, then passes it to `execSync`. Unquoted spaces and shell metacharacters are therefore both a correctness and command-boundary risk. A successful render is immediately imported through the live app and consequently appended to the timeline.

## Canvas is a path-bound sidecar with a withdrawn-but-reachable mode

The current Canvas UI offers Paper.js, Matter.js and Raw HTML frames. Every artboard stores dimensions, position, mode and either HTML/script content or a structured design document. React persists the full array on every change to both local storage and the main-process sidecar.

Three boundaries matter:

1. **Persistence is separate.** Saving `.aiveproj.json` does not include Canvas. JSON export/import is an explicit second artifact; import appends remapped frames rather than replacing the current canvas.
2. **Agent acknowledgement is not a transaction.** HTTP Canvas mutations use `webContents.send()` and immediately return `{ok:true}`. The response proves dispatch, not that React applied and durably saved the state.
3. **PNG capture is mode-dependent.** Automatic capture and `canvas-render-png` look for an element with id `canvas` inside the frame iframe. Paper.js/Matter.js frames provide that surface; a raw HTML frame with no such canvas cannot use the advertised per-frame capture path without adding its own canvas.

Canvas isolation itself records a real historical failure. [`5250dd4`](https://github.com/Monet-AI-Editor/Monet/commit/5250dd4a15fcdce22b79f034ef9ec7c13562ab7b) and [`edc7735`](https://github.com/Monet-AI-Editor/Monet/commit/edc7735b2758c98bfffc760f2a53402aa4a19df1) replaced global/legacy fallback behavior after artboards could leak between drafts. The present path-keyed fix isolates projects, but also makes filesystem identity part of Canvas recovery.

“Design mode removed” is not a complete description of the pinned source. Commit [`2441b86`](https://github.com/Monet-AI-Editor/Monet/commit/2441b866744b524dc4168aaa35662c409b6ccda5) says it removed design creation from UI, MCP, CLI and agent context while retaining types only for backward compatibility. Current evidence is mixed:

- UI creation and public MCP definitions omit design mode, and generated instructions say it does not exist;
- `ArtboardMode` still includes `design`, the full `DesignNode` editor remains, imported artboards accept it and renderer commands route it;
- the raw HTTP bridge still exposes `canvas-add-design-frame` and `canvas-update-design-frame`;
- the hidden CLI switch prints “no longer supported” only when required arguments are missing; valid arguments still call the raw endpoint.

The accurate status is: **design mode was withdrawn from advertised/public routing, but its executable substrate remains reachable.** Separately, agent instructions insist on exactly three choices—Paper.js, Matter.js and GPT Image 2—while the UI, README and later routing guide also support raw HTML. That is prompt/interface drift, not a fourth durable artifact model.

## Preview and delivery share intent, not a renderer

The editor preview is a browser/React projection. Export divides the timeline into intervals and builds FFmpeg filter graphs and segment files before concatenation. They consume the same clip/effect records but implement them independently.

Concrete parity limits at the pinned revision:

- preview approximates effects with CSS/DOM constructs; export uses FFmpeg filters, so blur, sharpen, masks, blends, text, shadows, glow, gradients and transforms have separate implementations;
- chroma key is implemented in export through FFmpeg `colorkey`, but there is no corresponding preview branch;
- `reveal_wipe` exists in the `EffectType` union but has no observed preview or export implementation;
- transition records preserve `crossfade`, `dip_to_black`, `wipe` and `slide`, but preview only varies opacity/audio gain and the active export path only applies alpha/audio fades; `transition.type` is carried into interval layers but never selects a renderer;
- export intentionally cuts the graph at the last interval containing video, while the preview can continue through trailing audio. The source calls this a v1 choice to avoid black video, so a timeline with audio after the final picture is not delivered as previewed.

An unused `EffectsService.getTransitionFilter()` does map the four transition names to FFmpeg `xfade` variants, but the current interval exporter never invokes it. Type support and a helper's existence are therefore not evidence of reachable delivery behavior.

## Undo covers only part of the artifact

`ProjectStore` keeps up to 100 in-memory snapshots. Most core timeline methods capture a snapshot before mutation. Several important methods do it afterward: transcript/visual-segment updates, add/remove/update effect operations, effect keyframes, volume and speed. `updateProjectName` captures none. A post-mutation snapshot makes the immediate undo restore the already-changed value.

A direct probe against the pinned `ProjectStore` established the user-visible result:

| Probe | Before undo | After undo |
|---|---:|---:|
| add one blur effect | 1 effect | 1 effect |
| set clip volume | 0.4 | 0.4 |

The same probe confirmed one video import creates one video clip and one audio clip with the same asset id. It used a nonexistent media path, so duration probing fell back to 12 seconds; that fallback does not affect the history conclusion.

Undo is narrower still at the product boundary:

- Canvas artboards live in React/local storage and are absent from `ProjectStore` history;
- the global Cmd/Ctrl-Z handler calls timeline `store.undo()` regardless of whether the active view is Canvas, except when focus is an editable target;
- direct MCP file mutations bypass the live stacks entirely;
- autosave is recovery of current store state, not named versions or a user-browsable history graph.

Monet therefore has local timeline snapshots, not project-wide undo and not versioning across the timeline, Canvas, external media and generated code.

## The embedded agent is deliberately a high-authority local process

Opening the built-in terminal does more than spawn a shell:

- a login PTY starts in the directory containing the project JSON;
- Monet writes `editorctl`, `claude` and `codex` wrappers under Electron user data and injects a managed PATH block into the user's `.zshrc` and existing shell startup files;
- the Codex wrapper forces `-s danger-full-access`;
- each terminal bootstrap overwrites `MONET_AGENT_CONTEXT.md`, `CLAUDE.md`, `AGENTS.md` and six `agent-guides/*.md` files in the project directory, then force-copies a Remotion skill tree when available;
- the Electron windows explicitly use `sandbox: false`;
- the HTTP bridge is loopback-bound, but enables CORS `*` and has no authentication check in the observed request path.

This is a coherent local-first design choice: the agent can inspect files, render media and operate the live editor without a remote orchestration service. It also means Monet must be treated as a trusted local developer tool rather than a contained multi-user agent sandbox. The generated instruction files are product machinery that can overwrite pre-existing repository guidance with the same names.

## Recovery is autosave, not version history

Timeline recovery is stronger than the manual project file alone. Mutations schedule a 500 ms autosave, clean quit flushes it, and reopen chooses whichever of the project file or hashed autosave has the newer modification time. Corrupt autosave falls back to a fresh store in the constructor path; project opening parses the preferred candidate directly, so corruption/fallback behavior is not identical across every entry path.

There is no observed atomic temp-file-plus-rename protocol for project or Canvas writes, no cross-file transaction, no named checkpoint, branch, merge or immutable version graph. File mtimes decide which timeline snapshot wins; the Canvas sidecar is recovered separately by a path-derived key; external media must still exist. Unknown at this review: behavior under a hard crash during a write, concurrent Monet instances editing the same project, or a filesystem move performed while the app is open.

## Implementation map and evolution

Repository pinned at [`74fcb1646a2329dfa35acfe7b3726491544fca18`](https://github.com/Monet-AI-Editor/Monet/commit/74fcb1646a2329dfa35acfe7b3726491544fca18).

### Current implementation map

| Concern | Pinned source | What it establishes |
|---|---|---|
| Product/version/license | [`README.md`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/README.md), [`package.json`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/package.json), [`LICENSE`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/LICENSE) | macOS-first alpha, v0.1.9, Node floor, author and MIT terms |
| Project schema | [`src/shared/editor.ts`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/shared/editor.ts#L80-L161) | external-path assets, tracks/clips/effects/transitions and Canvas's absence from `EditorProjectRecord` |
| Live store/import/history | [`project-store.ts`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/project-store.ts#L210-L369), [`project-store.ts` history/import append](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/project-store.ts#L716-L783), [`project-store.ts` effect history](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/project-store.ts#L1257-L1375) | autosave scheduling, paired import placement, 100 snapshots and post-mutation history bugs |
| Project/autosave/Canvas files | [`src/main/index.ts`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/index.ts#L486-L563), [`save handlers`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/index.ts#L1635-L1650), [`Canvas state handlers`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/index.ts#L1719-L1750) | hashed recovery, mtime choice, manual materialization and separate path-keyed Canvas sidecar |
| Canvas runtime | [`CanvasPanel.tsx` model/persistence](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/renderer/src/components/CanvasPanel.tsx#L880-L1030), [`Canvas commands`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/renderer/src/components/CanvasPanel.tsx#L1073-L1093), [`current creation UI`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/renderer/src/components/CanvasPanel.tsx#L2540-L2575) | per-project persistence, canvas-element capture, design-mode reachability and the three visible frame types |
| CLI versus MCP | [`editorctl.ts`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/cli/editorctl.ts#L7-L125), [`MCP bootstrap`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/mcp-server/index.ts#L10-L35), [`MCP mixed dispatch`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/mcp-server/index.ts#L693-L725), [`direct add clip`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/mcp-server/index.ts#L821-L862) | dynamic live discovery in CLI versus fixed port/default file and mixed disk/live semantics in MCP |
| HTTP and Canvas acknowledgement | [`api-bridge.ts`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/api-bridge.ts#L837-L864), [`Canvas routes`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/api-bridge.ts#L2088-L2158), [`PNG route`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/api-bridge.ts#L2230-L2259) | localhost/CORS boundary, fire-and-ack event delivery, retained design endpoints and canvas-only capture |
| Preview/export parity | [`PreviewMonitor.tsx`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/renderer/src/components/PreviewMonitor.tsx#L438-L495), [`export intervals`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/export-service.ts#L475-L590), [`FFmpeg transition fades`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/export-service.ts#L968-L978), [`trailing-audio cut`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/export-service.ts#L1291-L1324) | independent browser/FFmpeg projections, ignored transition type and export-tail policy |
| Embedded-agent authority | [`agent-context.ts`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/agent-context.ts#L32-L84), [`wrapper/PATH setup`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/index.ts#L630-L747), [`terminal bootstrap`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/index.ts#L1839-L1880) | overwritten agent files, shell startup changes, danger-full-access wrapper and PTY working directory |
| CI and Windows binary boundary | [`.github/workflows/ci.yml`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/.github/workflows/ci.yml), [`media-binaries.ts`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/src/main/services/media-binaries.ts#L12-L30), [`media-binaries.test.ts`](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/tests/media-binaries.test.ts#L12-L26) | both CI jobs start with `npm ci`; PATH parsing is colon-specific and drops a Windows drive prefix |

### Evolution that changes the current reading

| Commit | Change and significance |
|---|---|
| [`8615210`](https://github.com/Monet-AI-Editor/Monet/commit/861521086e600f1197817e3fcda1eb826b5bd31a) · 2026-04-21 | initial public alpha already contained the Electron timeline, CLI, HTTP/MCP surfaces, transcription and export foundation |
| [`27a9473`](https://github.com/Monet-AI-Editor/Monet/commit/27a9473426060f48cd9337bf9022d3604a7cda95) · 2026-04-26 | introduced Monet Canvas as an artboard surface for coding agents, with JSON and PNG handoff into video media |
| [`2441b86`](https://github.com/Monet-AI-Editor/Monet/commit/2441b866744b524dc4168aaa35662c409b6ccda5) · 2026-04-30 | added live-mode and Canvas bridge/safety work and declared design mode removed; retained runtime paths make this commit central to the current documentation drift |
| [`5250dd4`](https://github.com/Monet-AI-Editor/Monet/commit/5250dd4a15fcdce22b79f034ef9ec7c13562ab7b) and [`edc7735`](https://github.com/Monet-AI-Editor/Monet/commit/edc7735b2758c98bfffc760f2a53402aa4a19df1) · 2026-05-03 | scoped Canvas state per project after cross-draft leakage and shipped it as v0.1.7 |
| [`3a1d207`](https://github.com/Monet-AI-Editor/Monet/commit/3a1d20745903f44a8258e0e59f41b6fd5af23c7c) · 2026-05-04 | reworked agent guides and shell PATH/wrappers so `editorctl` remains reachable inside Claude/Codex subshells |
| [`87d3a7e`](https://github.com/Monet-AI-Editor/Monet/commit/87d3a7e36ef33a102d5df51bd45ecc1b69005e55) · 2026-05-04 | added the HTML-frame CLI path, deepening the contradiction with “exactly three” generated agent choices |
| [`cd20dfb`](https://github.com/Monet-AI-Editor/Monet/commit/cd20dfbc29757dc850ebf6b3ce2acda81c93b72c) and [`eb06241`](https://github.com/Monet-AI-Editor/Monet/commit/eb06241c1b3873bd9bbdd96812198ccf18b446df) · 2026-05-04 | fixed relative-path black frames and added permanent source/docs/test guardrails |
| [`74fcb16`](https://github.com/Monet-AI-Editor/Monet/commit/74fcb1646a2329dfa35acfe7b3726491544fca18) · 2026-07-06 | latest pinned commit; documentation-only removal of the README star-history section |

The pinned repository has 59 commits and tags `v0.1.0` through `v0.1.9`. Tags establish named releases; the implementation claims in this dossier remain pinned to the full latest commit rather than a moving branch.

## Executable verification at the pinned revision

Verification ran on Windows with Node v24.16.0 and npm 11.13.0. It establishes repository contracts and defects, not macOS product acceptance:

| Check | Result |
|---|---|
| cold `npm ci` from the committed lockfile | failed before tests because the lockfile lacked transitive entries required by the current dependency graph, including `@electron/windows-sign`, `cross-dirname`, `fs-extra`, `postject`, `commander`, `jsonfile` and `universalify` |
| temporary `npm install` used only in the disposable clone | succeeded and changed the lockfile by 107 insertions / 2 deletions; no repaired lockfile was copied into this landscape repository |
| `npm run typecheck` after temporary repair | passed |
| `npm run build` after temporary repair | passed for Electron main, preload, renderer, CLI and MCP |
| `npm test` after temporary repair | 38 passed / 1 failed out of 39; the Windows-only failure loses `C:` because media binary resolution splits PATH on literal `:` |
| direct import/history probe | confirmed paired video/audio clips with one asset id; undo did not remove a newly added effect or restore changed volume |

Both checked-in GitHub Actions jobs begin with `npm ci`, so the committed CI workflows cannot reach their verify/package steps from this exact revision until the lockfile is repaired. The one Windows test failure does not establish a macOS or Linux CI failure; the product is explicitly macOS-first and the failing implementation is POSIX-specific.

Existing tests cover core import, split/ripple/caption behavior, interval strategy, preload and UI helpers. They do not cover MCP/live-store synchronization, Canvas portability, post-mutation history ordering, transition-type rendering or end-to-end preview/export parity.

## Evidence boundary and remaining research gaps

This dossier establishes the public repository at one immutable revision. It does not infer a private backend, unpublished release or roadmap implementation. Source observations are facts about the pinned code; filesystem-move and overwrite outcomes described above are marked as causal inferences where they were not executed end to end.

Still unverified or explicitly unknown:

- whether an ordinary macOS user can complete install → import → embedded agent → Canvas/Remotion → timeline → export from a packaged v0.1.9 build without source-level workarounds;
- actual preview/export fidelity on representative multi-track media, fonts, chroma key, effects, transitions and trailing audio;
- behavior when two Monet instances, MCP and UI mutate one project concurrently;
- crash recovery during direct JSON/Canvas writes and whether corrupt preferred autosaves can block all project-open paths;
- a supported project bundle/relocation workflow that preserves media, Canvas and generated source together;
- whether browser private-network controls materially limit cross-origin access to the unauthenticated localhost bridge in supported Electron/browser environments;
- whether the retained design endpoints are intentional backward compatibility or incomplete removal;
- release signing, updater and telemetry behavior in an installed production artifact;
- any project-wide version, collaboration or merge model beyond the observed local snapshot mechanisms.

## Primary sources

- [Official repository](https://github.com/Monet-AI-Editor/Monet)
- [Pinned repository tree](https://github.com/Monet-AI-Editor/Monet/tree/74fcb1646a2329dfa35acfe7b3726491544fca18)
- [Pinned README](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/README.md)
- [Pinned package metadata](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/package.json)
- [Pinned MIT license](https://github.com/Monet-AI-Editor/Monet/blob/74fcb1646a2329dfa35acfe7b3726491544fca18/LICENSE)
- [Commit history](https://github.com/Monet-AI-Editor/Monet/commits/74fcb1646a2329dfa35acfe7b3726491544fca18/)
