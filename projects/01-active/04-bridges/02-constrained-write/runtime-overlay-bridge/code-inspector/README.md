# Code Inspector

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | zh-lx / Code Inspector contributors |
| Category | Compile-time DOM-to-source and in-browser coding-agent bridge |
| Status | Active; pinned `main` is release v2.0.7 |
| Source availability | Open source under the MIT License |
| Previous names / aliases | `code-inspector-plugin` is the umbrella npm package |
| Canonical product URL | https://inspector.fe-dev.cn/en/ |
| Canonical source repository | https://github.com/zh-lx/code-inspector |
| Pinned source revision | `22c8d1e037a17b36acd93a5a3bff0db05f2e4cab` |

## Product boundary: source return inside a running application

Code Inspector is developer tooling that connects a rendered web element to the source location that produced it. Its core interaction is: hold the configured hot keys or enable the switch, hover an element, then click to open an IDE at the corresponding file, line and column. The browser overlay can also copy that location, open a templated target URL, dispatch a custom event or open an AI coding panel with the selected element as context.

At the pinned v2.0.7 revision, the public surface includes:

- hover highlighting and source-location labels;
- mouse-wheel traversal between source-bearing parent/child elements;
- a right-click DOM tree composed from instrumented ancestors;
- IDE launch, path copy and custom target actions;
- a `code-inspector:trackCode` browser event for host integrations;
- Claude Code, Codex and OpenCode providers in CLI, SDK or embedded terminal modes;
- provider/model switching, pasted-image input, streamed tool events and per-tool edit reversal;
- browser-refresh recovery for a running AI turn or terminal session;
- server-side conversation history under the target project's `node_modules/.code-inspector/` directory.

The first-party monorepo contains adapters for Vite, webpack/rspack, esbuild, Turbopack and Mako; the umbrella `code-inspector-plugin` package selects among them. The documentation also names integrations built on those paths for Vue, React, Preact, Solid, Qwik, Svelte, Astro, Next.js, Nuxt and UmiJS.

Code Inspector is not a visual design editor. It has no separate canvas document, design object graph or direct-manipulation layout model. The target repository remains the artifact. Ordinary locate/copy/target actions do not change source; source mutation begins only when a configured external coding agent uses its own tools.

### Architectural direction

Code Inspector's technical direction is **to establish rendered-element identity before the browser runs, carry that identity through the normal application render, then use a thin in-page runtime and local Node service to return to source or hand the location to a coding agent**.

The main route is:

`source parser / bundler transform → data-insp-path(file:line:column:node) → normal framework render → in-page Lit overlay selects an instrumented DOM node → IDE / copy / URL / coding agent`

This differs from a runtime-only locator. The browser does not normally infer a source file from React fiber, stack traces, source maps or DOM selectors. Instead, framework-aware transforms inject a source coordinate into the generated element. For React-style components, an additional rewrite tries to propagate the component invocation coordinate through props to a single DOM root, so a user can select the call site rather than only the component definition.

The architecture is deliberately additive:

1. application source files remain authoritative;
2. bundler adapters rewrite eligible modules during development;
3. the transformed application renders normally, including its own framework/HMR path;
4. a Web Component is injected into the same page for selection and AI UI;
5. a local Node service handles IDE launch and agent execution;
6. Git, tests and the application itself remain responsible for durable source history and verification.

Failure is mostly fail-open. If a transform cannot parse a file, `transformCode` returns the original content. The application can still run, but affected elements have no Code Inspector identity and therefore cannot participate in the source-return interaction.

### Concrete stack and deliberate non-choices

#### Build-time instrumentation

- **Language/build:** TypeScript monorepo managed with pnpm; package builds use TypeScript and Vite.
- **Text rewriting:** `magic-string` preserves the surrounding module while inserting attributes, props or imports.
- **JSX/TSX:** Babel parse/traverse plus TypeScript, decorators and Vue JSX plugins.
- **Vue:** `@vue/compiler-dom`, Vue SFC parsing and an optional internal `vue-loader` node transform.
- **Svelte:** `svelte/compiler` parsing and AST walking.
- **Astro/MDX:** project-resolved compiler/parser support with scanner fallbacks and an explicit opt-in for full MDX transformation.
- **Bundler adapters:** dedicated packages for Vite, webpack/rspack, esbuild, Turbopack and Mako.

#### Browser runtime

- **UI:** Lit 2 `LitElement` packaged as the `code-inspector-component` custom element.
- **Embedding:** injected into `document.documentElement` of the target page; Lit's shadow root contains the toolbar, overlays, DOM tree and AI panel.
- **Targeting:** capture-phase window events, `composedPath()`, DOM geometry and computed styles.
- **AI presentation:** streamed SSE parsing, Markdown rendering, tool-call/diff blocks and optional pasted images.
- **Terminal:** xterm in the browser connected to an optional `node-pty` process through WebSocket.

#### Local Node runtime

- **HTTP:** Node's built-in HTTP server with `portfinder`; default starting port is 5678.
- **IDE bridge:** `launch-ide` receives file/line/column and editor/open-mode options.
- **Agent processes:** child processes for local CLIs; optional Anthropic, OpenAI and OpenCode SDK peer packages.
- **Streaming:** SSE for agent turns and `ws` for terminal sessions.
- **State:** JSON files for durable chat history, in-memory runtime event buffers and private temporary files for server coordination and image handoff.

#### Deliberate non-choices

- no imported or duplicated visual document;
- no runtime source-map consumer in the browser;
- no DOM-to-selector-to-source search as the primary locator;
- no iframe or remote rendering environment;
- no Code Inspector-owned MCP server or agent tool protocol;
- no built-in Git, commit graph or automatic browser-verification loop.

## The injected source-identity payload

### Primary artifact / source of truth

The target repository's ordinary source files are the primary artifact. Code Inspector derives three narrower layers around them: a compile-time source identity on rendered nodes, transient browser interaction state and optional AI conversation records.

### Compile-time source identity

The central mapping value is a compact string stored under `data-insp-path`:

`<file path>:<1-based line>:<1-based column>:<node name>`

The browser parses this value from the right, preserving colon-bearing file paths such as Windows drive paths. The resulting `SourceInfo` is:

- `path`: relative or absolute source path;
- `line` and `column`: numeric source coordinate;
- `name`: JSX/tag/component name carried by the transform.

`hideDomPathAttr` changes only representation after render: a polling snippet copies the attribute value to a same-named DOM property and removes the visible attribute. The identity remains readable by the injected runtime.

### Component call-site identity

Plain DOM/JSX nodes receive their definition coordinate. React does not automatically forward arbitrary attributes from a component invocation to its DOM root, so the JSX transform also treats `data-insp-path` as a hidden prop contract:

- component calls receive their own source coordinate;
- eligible function/class components read that prop;
- a single resolvable DOM root prefers the propagated call-site coordinate and falls back to its definition coordinate;
- existing props, destructured props, implicit props, `createElement`, conditionals, logical expressions, arrays and portals have dedicated rewrite paths.

This is a derived source identity, not a stable object ID. It can move whenever source lines move and it is regenerated by the build.

### Browser interaction state

The Web Component tracks a selected target node, its source info, overlay geometry, enabled actions, DOM-tree state and AI panel state. The DOM tree is not a copy of the application DOM; it is a transient hierarchy containing only nodes in the event path that expose a source identity.

### AI conversation model

The agent boundary intentionally narrows selected-element context to four fields:

- `file`;
- `line`;
- `column`;
- `name`.

It does not send the selected node's HTML, text, classes, styles, accessibility tree or screenshot as automatic context. A chat message may separately contain user text, display/model text, structured content blocks, the turn's context and user-pasted images. Tool events are normalized into start/input/result records so the panel can render reads, shell commands, edits, web searches and MCP calls made by the underlying provider.

### Runtime session model

Agent turns and terminals use process-local runtime sessions with:

- a generated ID and kind (`agent-turn` or `terminal`);
- lifecycle status from pending through running/detached to a terminal state;
- monotonically increasing event sequence numbers;
- a bounded event buffer, subscribers and provider metadata;
- abort and cleanup hooks.

These sessions support stream reattachment; they are not durable artifact versions.

## Browser-to-agent action path and authority

### Non-agent exits

The selected `SourceInfo` can leave the runtime through four simple paths:

- an HTTP request that launches the configured IDE;
- clipboard text formatted from file/line/column;
- a templated URL opened in a new tab;
- `code-inspector:trackCode`, whose detail carries the selected action and source info.

These exits make the source-coordinate layer usable without any AI provider.

### In-browser coding-agent bridge

When AI is configured, clicking a selected element opens the chat panel with the four-field context. The server builds a prompt containing the project root, a tag name and an `@file#line` reference when the file exists, then invokes one of:

- local Claude Code, Codex or OpenCode CLI;
- optional Claude Agent SDK, Codex SDK or OpenCode SDK integration;
- an interactive CLI hosted in the browser through xterm/node-pty.

First turns include the panel's text history. Resumed provider sessions send only the current turn plus an explicit note that the current DOM context is turn-scoped; global mode instructs the provider to ignore stale element context. Provider session IDs are retained so CLI/SDK-native conversation state can resume.

The plugin forwards provider/model configuration and normalizes provider streams into text, information, session and tool events. It does not implement file-reading/editing tools itself: the configured coding agent owns those capabilities and executes with the target project as its working directory.

### Permission boundary

Agent authority depends on provider configuration, with one important default:

- Codex/OpenCode CLI and SDK options are forwarded when set; Code Inspector does not itself force a Codex sandbox or approval policy.
- Claude CLI defaults `permissionMode` to `bypassPermissions`.
- Claude SDK defaults to 20 turns, `bypassPermissions`, a broad Read/Write/Edit/Glob/Grep/Bash/WebFetch/WebSearch tool set and automatically enables the SDK's dangerous-skip flag unless explicitly overridden.

Enabling Claude with defaults therefore authorizes materially more than merely locating a DOM node. This is part of the actual agent interface and should be configured deliberately.

### What the agent does not receive automatically

The selected node contributes a source coordinate and name, not live browser-control access. Code Inspector does not expose the page DOM, console, network, screenshot or post-edit rendering result as agent tools. A human can observe HMR in the same page, but automated edit verification must come from the agent's separate tools or the repository's test/browser workflow.

## Instrumented runtime and local-service topology

### Instrumented application render

Bundler adapters run only when enabled for development, unless the user overrides the development predicate. Their two jobs are separate:

1. transform eligible source syntax to add source identity;
2. inject the browser runtime into an entry module or HTML document.

Vite uses pre-enforced `load`/`transform` hooks and injects a module script through `transformIndexHtml` for MPA coverage. webpack/rspack installs source-transform and client-injection loaders, with a special internal Vue compiler path. esbuild uses `onLoad` and caches output by original source text. Turbopack and Mako have dedicated adapters for their injection constraints.

For Next.js or file-import mode, Code Inspector writes an `append-code-<port>.js` file into the configured output and imports a no-op client component into an entry. Other paths can prepend the bundled client code directly. The resulting custom element is appended once to `document.documentElement`.

### Same-document overlay

The Web Component runs in the target application's window and document. Its own UI is shadow-DOM isolated, but its event listeners and geometry reads operate against the live page. While selection is active it:

- follows `composedPath()` to include open-shadow-boundary event paths;
- filters for nodes with the injected attribute/property;
- prefers an outer same-geometry node so a propagated component call site can win;
- draws a box-model overlay and source label;
- intercepts the selected click, preventing the target action;
- lets the wheel traverse source-bearing ancestors/descendants;
- builds a source-bearing hierarchy for the right-click tree.

There is no alternate canvas renderer. The application framework still owns layout, paint, state and HMR.

### Local service and stream recovery

The Node server exposes IDE, AI model/chat/history/revert/runtime and terminal endpoints. Agent turns stream over SSE. Terminal mode upgrades only `/ai/terminal` to WebSocket and connects it to a PTY. Refresh recovery stores the runtime session ID plus last sequence cursor in the page session and asks the server to replay buffered events after that cursor.

Cross-process startup is coordinated through a project/output/protocol-scoped runtime directory. Server state is written atomically and verified through a health endpoint carrying project and protocol identity, preventing a merely occupied port from being mistaken for the correct project service.

### Local service trust boundary

All `/ai` HTTP routes and the terminal WebSocket require a random process token injected into the Web Component, and token comparison is timing-safe. IDE launch is a separate unauthenticated route. In default relative-path mode it rejects paths outside the Git project root; in absolute-path mode that containment rule is not applied.

The server sends wildcard CORS headers and calls `server.listen(port)` without an explicit host. The actual bind interfaces therefore depend on Node and the operating system, not the printed `localhost` URL. The AI token reduces blind cross-origin access, but it is delivered into the inspected page runtime and is not an isolation boundary against scripts already executing in that page.

## Mapping pipeline, framework coverage, and failure modes

### Framework transforms

The framework-specific transforms share the same output contract but use different parsers:

- Vue templates receive attributes through compiler AST positions or the optional `vue-loader` node transform;
- JSX/TSX uses Babel traversal and handles both JSX syntax and `createElement` calls;
- Svelte uses its compiler AST after blanking script/style contents to preserve offsets;
- Astro tries the project's compiler and uses guarded tag scanning where needed;
- MDX is opt-in because the transform must coexist with varying remark/rehype/compiler pipelines.

Escaped tags such as `style`, `script`, templates, transitions, slots, portals/teleports, suspense and fragments do not receive a direct identity. User-configured tag patterns can extend that list.

### React call-site propagation

The JSX transformer goes beyond adding an attribute to literal DOM tags. It discovers likely component functions/classes and follows their render expression through identifiers, conditionals, logical expressions, arrays, fragments, `createPortal` and `createElement`. It propagates the invocation identity only when the estimated output has at most one DOM root. Multi-root fragments/arrays keep definition-site identities on individual roots instead of falsely assigning one call-site coordinate to several nodes.

This improves selection of component usage, but it is still a source rewrite heuristic. Computed `React["createElement"]` calls, dynamically constructed elements, unsupported syntax and roots that cannot be resolved statically can fall back or remain unmapped.

### Runtime target resolution

At runtime, source identity is read directly from the attribute/property. Parsing from the right makes both relative POSIX paths and colon-bearing Windows paths usable. When nested instrumented nodes occupy the same rectangle, the selection loop prefers the later composed-path candidate to surface the propagated component invocation. The wheel and DOM-tree controls let the user choose a different source-bearing layer explicitly.

### Repository/path mapping

`pathType` chooses relative paths by default or absolute paths for multi-repository/micro-frontend cases. `include` allows selected linked packages under `node_modules` to be transformed, and `mappings` rewrites those resolved dependency paths back to their real workspace source. `match`, `exclude`, `escapeTags`, `injectTo` and per-bundler ordering determine what is actually instrumented.

### Mapping limits

- no source-map consumer validates or repairs the injected coordinate after later transforms;
- source line/column is build-derived identity, not a persistent AST/node ID;
- files omitted by match/exclude/include rules cannot be targeted;
- parser failure silently returns the original source, producing no mapping for that file;
- runtime-generated/raw HTML and closed-shadow-root internals may have no usable instrumented event path;
- component call-site propagation is intentionally withheld for multi-root output;
- path mappings are configured string/regex replacements rather than repository-aware provenance;
- a selected coordinate gives the agent a starting file/line, not a guarantee that the semantic change belongs only at that location.

## Conversation recovery, persistence, and edit reversal

### Page-session recovery

The AI modal serializes its visible state to `sessionStorage` under `__code_inspector_ai_state__`. The record includes messages, selected context, provider session ID, model/provider choices, modal position, turn state, reverted tool IDs and runtime session/cursor. It is tab-scoped and is cleared when the modal is deliberately closed.

If a page refresh occurs while a turn is running, the restored runtime ID/cursor reconnects to the in-process event stream. Agent sessions keep their bounded event buffer while the provider is active; terminal sessions allow a 60-second detach grace period. Completed sessions remain for 60 seconds. A local-service restart loses these runtime sessions.

### Durable conversation history

Completed turns are auto-saved as JSON beneath `<project>/node_modules/.code-inspector/`:

- `history-index.json` stores title, created/updated timestamps, provider and message count;
- `<conversation-id>.json` stores cumulative messages, selected context, provider session ID, provider/model and reverted tool IDs.

IDs are validated against path traversal. `expireDays` defaults to zero; when positive, opening/listing history removes entries whose creation timestamp exceeds the configured age. Write errors are intentionally silent in the browser UI.

Provider session IDs are distinct from these JSON records. They let the underlying CLI/SDK resume its own conversation, while the JSON history restores the panel's presentation and prompt history.

### Edit reversal

Provider tool events are normalized to capture `file_path`, `old_string` and `new_string`; Codex/OpenCode paths may build full-file before/after snapshots and per-file `diff_blocks`. The Revert control sends those edits to the local server. Reversal is accepted only inside the project root and only when the current file equals the recorded new text or contains that new text for a single replacement. Otherwise it returns `content_mismatch` rather than overwriting unrelated current work.

This is a guarded inverse edit, not a durable version system. It has no redo graph, branch/commit binding, conflict merge, artifact snapshot lineage or guarantee that every provider tool emits reversible edit data.

### What is not versioned

Code Inspector does not bind an instrumented page to a Git commit, persist the transformed DOM identity graph, snapshot the rendered page, or create versions for agent edits. Source history and recovery beyond the narrow Revert action remain the responsibility of Git and the target project.

The private runtime-path JSON used for port/startup coordination is operational metadata, not user artifact or conversation history.

## Implementation and evolution evidence

Repository pinned at `22c8d1e037a17b36acd93a5a3bff0db05f2e4cab`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product, release and license | `README.md`, `LICENSE`, `packages/code-inspector-plugin/package.json` | core click-to-source purpose, umbrella package v2.0.7 and MIT boundary |
| Public AI contract | `docs/en/guide/feature/ai.md`, `docs/en/api/advance.md` | providers/modes, history behavior, permission options, server/path/mapping configuration |
| Shared options/schema | `packages/core/src/shared/type.ts`, `constant.ts` | bundler/behavior/provider options and the injected attribute names/default port |
| Transform dispatcher | `packages/core/src/server/transform/index.ts` | file-type routing, relative/absolute path selection and fail-open parse behavior |
| JSX/call-site mapping | `packages/core/src/server/transform/transform-jsx.ts` | static identity injection, hidden-prop propagation, single-root analysis and `createElement` handling |
| Other framework mapping | `transform-vue.ts`, `transform-vue-node.ts`, `transform-svelte.ts`, `transform-astro.ts`, `transform-mdx.ts` | Vue/Svelte/Astro/MDX parser and scanner strategies |
| Runtime injection | `packages/core/src/server/use-client.ts` | entry/HTML code generation, custom-element creation, AI token injection and Next.js/file injection |
| Browser selection/UI | `packages/core/src/client/index.ts` | right-parsed source info, composed-path selection, overlays, actions, AI orchestration and refresh recovery |
| Chat/tool protocol | `packages/core/src/ai/client/ai.ts` | four-field context, message/tool model, SSE client, history requests and revert API |
| Page-session state | `packages/core/src/ai/client/ai-persist.ts` | exact `sessionStorage` recovery record |
| Local routes/security | `packages/core/src/server/server.ts`, `packages/core/src/ai/server/ai-auth.ts` | IDE/AI routes, containment check, wildcard CORS, token gate and listen behavior |
| Agent dispatch/prompt | `packages/core/src/ai/server/ai.ts`, `ai-provider-common.ts`, `ai-provider-claude.ts`, `ai-provider-opencode.ts` | provider selection, contextual prompt, CLI/SDK execution, tool normalization and provider defaults |
| Stream lifecycle | `packages/core/src/ai/server/runtime-session.ts`, `ai-terminal.ts` | replay cursor, bounded in-memory events, abort/detach/retention and terminal WebSocket/PTY path |
| Durable chat history | `packages/core/src/ai/server/ai-history.ts` | index/per-conversation JSON, ID safety and expiry cleanup |
| Revert implementation | `packages/core/src/ai/server/ai.ts`, `packages/core/src/client/index.ts` | extraction of per-file inverse edits, project-root guard and content-match writeback |
| Runtime coordination | `packages/core/src/shared/runtime-path.ts`, `packages/core/src/shared/record-cache/server-state.ts`, `packages/core/src/server/server-lock.ts` | project-scoped private runtime path, atomic state publication and cross-process startup lock |
| Bundler integration | `packages/vite/src/index.ts`, `packages/webpack/src/index.ts`, `packages/webpack/src/loader.ts`, `packages/esbuild/src/index.ts` | concrete transform and client-injection hooks |
| Verification surface | `test/core/server/transform/`, `test/core/server/ai/`, `test/core/server/runtime-session.test.ts`, `e2e/tests/l2-locate.spec.ts` | repository-authored transform, AI/revert/runtime and locate coverage |

### Historical commit evidence

**Pinned revision:** `22c8d1e037a17b36acd93a5a3bff0db05f2e4cab`

| Claim | Evidence at pinned revision |
|---|---|
| Code Inspector is an MIT-licensed click-to-source developer tool and the umbrella package is v2.0.7 | [`README.md`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/README.md), [`LICENSE`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/LICENSE), [`packages/code-inspector-plugin/package.json`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/code-inspector-plugin/package.json) |
| The public AI surface supports Claude Code, Codex and OpenCode in CLI/SDK/terminal modes and stores project-local history | [`docs/en/guide/feature/ai.md`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/docs/en/guide/feature/ai.md) |
| Source identity is a `data-insp-path` file/line/column/node value and transform failure returns original content | [`packages/core/src/shared/constant.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/shared/constant.ts), [`packages/core/src/server/transform/index.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/server/transform/index.ts) |
| JSX mapping injects static coordinates and propagates invocation identity to eligible single DOM roots | [`packages/core/src/server/transform/transform-jsx.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/server/transform/transform-jsx.ts) |
| Vue, Svelte, Astro and MDX have explicit framework transforms rather than runtime stack inference | [`transform-vue.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/server/transform/transform-vue.ts), [`transform-svelte.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/server/transform/transform-svelte.ts), [`transform-astro.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/server/transform/transform-astro.ts), [`transform-mdx.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/server/transform/transform-mdx.ts) |
| The injected runtime appends one Lit custom element to the target document and embeds the AI auth token | [`packages/core/src/server/use-client.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/server/use-client.ts) |
| Browser selection parses coordinates from the right, uses composed paths, favors a same-geometry call site and offers wheel/tree selection | [`packages/core/src/client/index.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/client/index.ts) |
| Selected-element agent context contains only file, line, column and name | [`packages/core/src/ai/client/ai.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/client/ai.ts), [`packages/core/src/ai/server/ai-provider-common.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai-provider-common.ts) |
| Agent turns dispatch to the configured provider, stream through a replayable runtime session and can be aborted or reattached | [`packages/core/src/ai/server/ai.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai.ts), [`packages/core/src/ai/server/runtime-session.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/runtime-session.ts) |
| Claude CLI/SDK defaults use bypass permissions while Codex sandbox/approval options are only forwarded when configured | [`packages/core/src/ai/server/ai-provider-claude.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai-provider-claude.ts), [`packages/core/src/ai/server/ai-provider-common.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai-provider-common.ts) |
| AI HTTP/terminal routes use a random token, while IDE launch relies on relative-mode project containment and the server has wildcard CORS/no explicit listen host | [`packages/core/src/ai/server/ai-auth.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai-auth.ts), [`packages/core/src/server/server.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/server/server.ts), [`packages/core/src/ai/server/ai-terminal.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai-terminal.ts) |
| Refresh state is tab-scoped; durable histories are project-local JSON records with optional created-time expiry | [`packages/core/src/ai/client/ai-persist.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/client/ai-persist.ts), [`packages/core/src/ai/server/ai-history.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai-history.ts) |
| Edit reversal uses provider-derived before/after data, project-root containment and current-content matching rather than a version snapshot graph | [`packages/core/src/client/index.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/client/index.ts), [`packages/core/src/ai/server/ai.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai.ts), [`packages/core/src/ai/server/ai-provider-common.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/core/src/ai/server/ai-provider-common.ts) |
| Vite, webpack and esbuild adapters explicitly combine source transforms with client injection | [`packages/vite/src/index.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/vite/src/index.ts), [`packages/webpack/src/index.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/webpack/src/index.ts), [`packages/esbuild/src/index.ts`](https://github.com/zh-lx/code-inspector/blob/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab/packages/esbuild/src/index.ts) |

## Evidence boundary

- **Fact:** package/release state, compile-time coordinate injection, framework transforms, Web Component runtime, provider dispatch, prompt/context shape, local routes, history and guarded edit reversal are established by the pinned source.
- **Inference:** Code Inspector is best classified as a source-return and agent-context primitive rather than a design editor because its only authoritative artifact is the target repository and its visual surface does not own layout/design state.
- **Established discontinuity:** the browser has an exact build-injected source coordinate but sends the agent no automatic rendered-node semantics beyond file/line/column/name; the agent must inspect source and verify output through separate capabilities.
- **Unknown/unverified here:** this dossier did not install v2.0.7 into live Vite/webpack/Next/Astro applications, launch an IDE, run a real Claude/Codex/OpenCode turn or measure the server's actual interfaces on each OS.
- **Not established:** source-map-backed identity, persistent DOM/node IDs, a design artifact graph, automatic post-edit browser verification, collaborative source versions or Git-aware rollback.

## Research gaps

- Browser-validate the ordinary-user loop from DOM selection through source edit, HMR rerender and visual verification for each provider mode.
- Measure component call-site accuracy across React function/class components, fragments, portals, server/client boundaries and nested same-geometry wrappers.
- Test mapping correctness after downstream Babel/SWC/framework transforms and with linked monorepo packages plus `mappings`.
- Reproduce silent transform failures for Astro/MDX/Svelte edge syntax and document visible diagnostics or recovery options.
- Exercise per-tool and multi-file Revert after intervening edits, file creation/deletion and provider streams that omit before/after content.
- Verify server bind interfaces, cross-origin behavior, page-script access to the AI token and absolute-path IDE exposure on Windows/macOS/Linux.
- Quantify build/HMR overhead and the runtime cost of large pages with dense source attributes.
- Confirm terminal detach/reconnect behavior and durable history semantics across dev-server restarts.

## Primary sources

- https://github.com/zh-lx/code-inspector/tree/22c8d1e037a17b36acd93a5a3bff0db05f2e4cab
- https://inspector.fe-dev.cn/en/guide/introduction.html
- https://inspector.fe-dev.cn/en/guide/feature/ai.html
- https://inspector.fe-dev.cn/en/api/advance.html
