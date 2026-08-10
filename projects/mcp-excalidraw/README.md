# mcp_excalidraw

> Research status: **Source-level for the yctimlin implementation; live CLI + browser journey exercised · v1.0** · Last reviewed: **2026-08-11**

| Field | Verified value |
|---|---|
| Maintainer | yctimlin, with contributors |
| Product | Unofficial local Excalidraw workbench for coding agents |
| Category | Agent-driven diagram canvas, interchange tool and repository-artifact producer |
| Recommended control route | Bundled agent skill → CLI; MCP stdio and REST are alternative front ends |
| Advertised source-HEAD surface | 26 MCP tools, a command-oriented CLI, REST API, React/Excalidraw canvas and WebSocket bridge |
| Live scene authority | Process-memory element, snapshot and file maps in the canvas server |
| Durable artifacts | Explicitly exported <code>.excalidraw</code>, Obsidian <code>.excalidraw.md</code>, PNG or SVG files; an optional encrypted excalidraw.com URL |
| Normally obtainable npm version | <code>mcp-excalidraw-server@1.1.0</code>, published 2026-07-06 UTC |
| Source-HEAD release intent | <code>2.0.0</code>; merged, built and containerized, but not tagged, released or published to npm in this snapshot |
| License | MIT; not affiliated with the Excalidraw team |
| Pinned source revision | [<code>6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8</code>](https://github.com/yctimlin/mcp_excalidraw/tree/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8) |
| npm <code>1.1.0</code> source commit | [<code>e7a48eb587c9a6b7c8abb1711ad18b87787476c0</code>](https://github.com/yctimlin/mcp_excalidraw/tree/e7a48eb587c9a6b7c8abb1711ad18b87787476c0) |

## Identity first: this is the local workbench, not the official MCP App

The seed name was ambiguous. This dossier resolves it to
[<code>yctimlin/mcp_excalidraw</code>](https://github.com/yctimlin/mcp_excalidraw): it is the
exact-name repository, began in March 2025, and has a continuous history from an MCP server to the
current skill/CLI/canvas toolkit.

The later [official <code>excalidraw/excalidraw-mcp</code> repository at its pinned
revision](https://github.com/excalidraw/excalidraw-mcp/tree/157aa23ceb1976008aadc89eb05e3444060f09d6)
is a different product route: an MCP App rendered inside supporting chat clients. Its
[pinned README](https://github.com/excalidraw/excalidraw-mcp/blob/157aa23ceb1976008aadc89eb05e3444060f09d6/README.md)
and [tool registration](https://github.com/excalidraw/excalidraw-mcp/blob/157aa23ceb1976008aadc89eb05e3444060f09d6/src/server.ts)
expose model-visible <code>read_me</code> and <code>create_view</code> operations plus app-private
checkpoint/export helpers. Claims from that implementation are not merged into this dossier.

## The ordinary-user route ends at a file, not at the live canvas

The project's own
[pinned README](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/README.md#what-it-is)
describes the canvas as a coding-agent workbench. The complete ordinary route is:

1. Install the bundled skill or let a coding agent invoke the CLI. The calling agent supplies
   repository/domain context; this project does not scan or understand application source itself.
2. A canvas-driving command checks the local service identity and, on a loopback URL, starts the
   canvas server when necessary.
3. The user opens <code>http://127.0.0.1:3000</code>. Programmatic element writes arrive through
   CLI, MCP or REST and appear in the Excalidraw browser surface over WebSocket.
4. The agent queries structured state with <code>describe</code>, asks the browser to render a
   screenshot, repairs layout, and repeats.
5. The user or agent explicitly exports a structured diagram into the repository. Until that
   export, the current work remains a volatile process-memory scene.

The [bundled skill](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/skills/excalidraw-skill/SKILL.md)
makes screenshot → inspect → repair part of the operating policy. The
[CLI reference](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/README.md#cli-reference)
turns the same loop into composable commands with JSON output and explicit exit codes.

The resulting causal chain is:

~~~mermaid
flowchart LR
    U["User intent + repository context"] --> A["Calling coding agent"]
    A --> S["Skill policy"]
    S --> C["CLI"]
    A --> M["MCP stdio"]
    A --> H["Raw REST"]
    C --> R["Local canvas server"]
    M --> R
    H --> R
    R --> B["Browser Excalidraw projection"]
    B --> R
    R --> D["describe / query"]
    B --> V["PNG or SVG visual proof"]
    R --> E["Explicit structured export"]
    E --> F["Repo-committable diagram file"]
~~~

The browser-to-server return arrow matters: direct canvas editing is not just a local view change;
after a debounce it can replace the server's complete element map.

## A live journey exposed the real artifact boundary

The source-HEAD journey was exercised rather than inferred from commands:

| Step | Observed result | What it establishes |
|---|---|---|
| Start and connect | The built canvas opened at <code>127.0.0.1:3000</code> and showed <code>Connected</code> | The browser renderer and local service were actually joined |
| Programmatic creation | One CLI patch created a title, three rectangles and two arrows: six server elements | The command route can materialize a structured live scene |
| First visual check | A browser-rendered screenshot showed the title colliding with an Excalidraw hint and a wrapped final label | Structured creation success was not visual acceptance |
| Repair | A second patch moved the title and nodes and widened the last node | Individual element updates support a genuine repair loop |
| Rendered proof | The repaired PNG was 29,526 bytes, SHA-256 <code>0A321F238D7B9BE19F075EB5E16361943A6B2FF1A9D2C17A7103955973A93E14</code> | A browser tab produced a user-obtainable visual artifact |
| Structured export | The first <code>.excalidraw</code> file was 8,662 bytes with nine expanded native elements, SHA-256 <code>E5B37E804C990B73A6C6151C001A6854B979F08EB6330B11539F62327BEE01F3</code> | Six agent elements are not the final interchange graph; labels become native bound text nodes |
| No-op re-export | A second export was byte-identical | The deterministic export claim held for the exercised scene |
| Direct manipulation | Dragging the <code>agent</code> node 45 px in the browser changed the server from six to nine elements after the 1.2-second sync delay | Human edits return a full native scene to the server |
| Post-edit export | The new file hash became <code>1FFBA4323C5468CAF4B22347E9E38FCE1E75F8C4AA87024E3FC730D8F713451A</code> | The explicit artifact changed with the browser edit |

The browser console produced no warnings or errors during this run. The test artifacts were
temporary research outputs, not additions to this landscape repository.

## One scene, five roles

The interfaces are related but not equivalent authorities:

| Role | Implementation responsibility | State it actually owns |
|---|---|---|
| Agent skill | Layout heuristics, command preference and visual verification policy | Instructions only |
| CLI | Command parsing, file I/O and a direct human/agent shell route | No independent canvas state |
| MCP server | Registers 26 tools and translates calls into the same core/HTTP operations | Protocol-session machinery; canvas data stays elsewhere |
| REST canvas server | Validates mutations and owns element, snapshot and file maps | The current server-side scene |
| Browser | Converts to native Excalidraw elements, renders, accepts direct edits and performs rendering-only work | A tab-local Excalidraw scene that can later overwrite the server scene |

The [MCP factory](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/mcp-server.ts#L13-L72)
builds a fresh server per connection/probe. Static discovery and tool-list results carry a
five-minute public cache hint, while canvas contents only travel through non-cacheable tool calls.
The separate
[canvas-state module](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/canvas-state.ts#L3-L33)
exists specifically so protocol-era or connection changes do not create a second canvas.

Source HEAD supports both initialization-based 2025 clients and the
<code>2026-07-28</code> envelope/discovery route. The
[wire test](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/scripts/check-mcp-stdio.mjs)
covers modern discovery, calls without initialize, unsupported-version refusal, malformed metadata
and legacy <code>2025-06-18</code> initialization. That statement applies to source HEAD, not to the
still-current npm <code>1.1.0</code> package.

## The decisive mechanism: REST memory with browser full-scene return

Three exported maps are the live storage layer:

- <code>elements: Map&lt;string, ServerElement&gt;</code>
- <code>snapshots: Map&lt;string, Snapshot&gt;</code>
- <code>files: Map&lt;string, ExcalidrawFile&gt;</code>

They are declared together in
[<code>src/types.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/types.ts#L281-L300).
REST mutations update the element map and broadcast granular create/update/delete events. A newly
connected browser receives the current elements and files over WebSocket
([server connection path](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L58-L114)).

Direct browser edits take the opposite route:

1. The tab records pointer or keyboard interaction; subsequent Excalidraw
   <code>onChange</code> callbacks are then eligible to schedule writeback.
2. A 1.2-second debounce gathers every active element in the tab.
3. The browser POSTs the whole native scene to <code>/api/elements/sync</code>.
4. The server clears its map, inserts each submitted element with
   <code>source: frontend_sync</code> and resets its server metadata version to <code>1</code>.
5. The server broadcasts only an <code>elements_synced</code> count/confirmation event.

The browser half is visible in
[the sync implementation](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/App.tsx#L794-L890)
and [Excalidraw change handler](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/App.tsx#L965-L994);
the destructive replacement is explicit in
[the server sync route](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L783-L855).

This is synchronization in the practical “copy this scene” sense, not CRDT/OT collaboration or an
optimistic-concurrency protocol.

### Multiple tabs are last-writer-wins

Every WebSocket client receives granular server mutations, but a browser-originated full sync tells
other tabs only how many elements were accepted; it does not send the replacement scene
([message handler](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/App.tsx#L486-L555)).
Therefore two open tabs can diverge and a later interaction in the stale tab can overwrite the
server with its complete older view. No element version precondition or scene revision rejects that
write.

There is a related recovery edge: both the initial HTTP loader and
<code>initial_elements</code> handler apply server state only when the array is non-empty
([load/connection path](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/App.tsx#L377-L500)).
After a server restart, an already-open tab is not cleared by the empty initial response. If the
user then edits it, that tab can repopulate the new process. This is a source-derived consequence;
the one-tab live run did not exercise the restart race.

## The element model changes shape when the browser writes back

The server starts with an agent-friendly schema. Shapes may carry
<code>label: { text }</code>; arrows use <code>start</code>/<code>end</code> element references
([server element type](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/types.ts#L123-L144)).
The frontend converts that compact representation into native Excalidraw elements and explicitly
allows one input shape to expand into a shape plus bound text
([conversion path](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/App.tsx#L258-L304)).

Once a human edit triggers full-scene sync, the native representation becomes server state:

- the original shape's compact <code>label</code> may now be a standalone bound text element;
- arrow <code>startBinding</code>/<code>endBinding</code> replace the agent-side
  <code>start</code>/<code>end</code> convention;
- the stored element count rises;
- server-side version metadata is reset rather than preserving an edit lineage.

The observed six-to-nine transition is direct evidence of this phase change. It also changes tool
semantics. A CLI query for <code>label.text</code> can find a compact shape before browser sync and
stop finding it afterward because the text is now a separate node. The
[scene description function](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/describe.ts)
can describe either <code>text</code> or <code>label.text</code>, but it is reporting the current
server representation, not a normalized semantic graph.

Arrow repair has the same boundary. Server-side rerouting looks only for agent-side
<code>start</code>/<code>end</code> references
([binding and reroute code](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L602-L682)).
In the live probe, after browser sync had replaced those with native bindings, moving a bound shape
through the CLI left the server arrow coordinates unchanged. The browser can still render native
bindings, but server/export geometry no longer receives the same reroute guarantee.

## Seeing is a separate, browser-dependent operation

<code>describe</code> is cheap structured awareness: ids, types, positions, labels, bounding box,
groups and native bindings. It cannot establish that text is legible or that arrows overlap.

PNG/SVG export and screenshots use a different distributed path:

1. The server refuses when no browser client is connected.
2. It rebroadcasts the canonical elements/files, waits 800 ms, then asks every tab to render.
3. It collects responses for three seconds and chooses the largest payload.
4. The total request timeout is 30 seconds.

The request/selection logic is in
[<code>/api/export/image</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L900-L1037);
actual rendering uses Excalidraw's browser export functions in
[<code>App.tsx</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/App.tsx#L558-L648).
“Largest response” is a pragmatic completeness heuristic, not proof that a particular tab rendered
a named scene revision.

Mermaid conversion is browser-only too. The REST route broadcasts the definition to every tab and
returns “sent” immediately
([server route](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L742-L781));
each tab independently converts, merges and later full-syncs
([frontend handler](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/App.tsx#L730-L766)).
There is no request-correlated conversion result, so a successful CLI/MCP response proves dispatch,
not completed conversion or single-tab application.

The MCP <code>get_resource(scene)</code> surface should not be mistaken for real browser viewport
or selection state. Its theme, viewport and selection come from initialization defaults in
[<code>canvas-state.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/canvas-state.ts#L10-L22);
only the group compatibility map is mutated by MCP handlers.

## Persistence is a verb, not a property

| State/artifact | Lifetime and authority | Consequence |
|---|---|---|
| Live elements | Canvas-server process memory | Restart starts blank |
| Named snapshots | Same process-memory map; stores an array of current element object references | Useful short-lived checkpoints, not durable version history |
| Image files | Separate process-memory map | Elements, snapshots and files do not share one lifecycle |
| Browser theme | The only browser value stored in <code>localStorage</code> | The drawing itself is not a browser-persisted document |
| <code>.excalidraw</code> | Explicit filesystem export | Durable editable interchange artifact suitable for version control |
| <code>.excalidraw.md</code> | Explicit Obsidian-native wrapper | Durable vault artifact with text block references and Drawing JSON |
| PNG/SVG | Browser-rendered explicit export | Durable visual result, but not an editable scene model |
| Share URL | Encrypted ciphertext uploaded to excalidraw.com; key in URL fragment | External delivery, not local-only persistence |

The structured exporter expands compact labels and arrows into native nodes, carries the file map
and canonicalizes ids, seeds, key order and timestamps
([scene builder](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/scene-io.ts#L19-L46),
[expansion implementation](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/expand-elements.ts)).
The Obsidian wrapper derives stable eight-character text ids, rewires bindings and imports plain or
compressed Drawing blocks with LF or CRLF endings
([Obsidian implementation](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/obsidian-md.ts)).

Named snapshots are weaker. Saving uses <code>Array.from(elements.values())</code> without cloning
([snapshot route](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L1181-L1256)).
In an exercised compact-agent scene, moving a shape mutated the bound arrow's <code>points</code>
inside the previously saved snapshot from <code>[[0,0],[164,0]]</code> to
<code>[[0,0],[284,0]]</code>. Restoring that snapshot nevertheless recovered the original
coordinates in this case because batch creation rerouted the saved agent-bound arrow from the
snapshot's shape positions. The precise conclusion is that snapshot content can drift through
shallow aliasing; the observed restore was not corrupt.

Files have another split lifecycle. Clear removes only elements
([clear route](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L399-L424)),
while export includes every file in the file map. A live probe added one file, cleared the
already-empty canvas and exported zero elements; the resulting scene still contained the orphan
file. Snapshots also exclude files, and replace-import clears elements before adding imported files.

The encrypted share path uses AES-GCM 128 and keeps the decryption key in the URL fragment, but it
constructs <code>files: {}</code>
([share implementation](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/share-url.ts#L23-L96)).
Therefore scenes containing image elements can lose their image payload in the share route even
though ordinary structured export includes it.

## “One call” does not mean transaction

| Operation | Actual mutation order | Failure boundary |
|---|---|---|
| CLI <code>apply</code> | Batch create, then each update sequentially, then each delete sequentially | An error after creation leaves earlier mutations applied |
| Batch create | Parse all requested entries, resolve bindings, then store them | Stronger within that one sub-operation, but it does not make a larger <code>apply</code> atomic |
| Align/distribute/group/lock | Several independent REST reads/writes, including parallel update groups | One member can fail after others changed |
| Snapshot restore | Clear, then batch-create snapshot elements | A rejected restore can leave the canvas blank |
| Import with <code>--replace</code> | Parse first, clear live elements, then batch-create; files are best-effort afterward | A batch failure occurs after the old scene has been cleared |
| Delete | Remove exactly one element id | No cascade removes bound arrows, bound text or file blobs |
| Browser full sync | Clear whole map, then accept submitted elements one by one | No scene revision, rollback or compare-and-swap |

The command order is explicit in
[<code>apply</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/cli/commands/elements.ts#L15-L80);
multi-element layout writes are implemented in
[<code>geometry.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/geometry.ts);
replace-import's destructive boundary is called out in
[<code>scene-io.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/scene-io.ts#L55-L119).

A live negative test sent an <code>apply</code> that first created
<code>partial-create</code> and then updated a missing id. The command exited with code 1, but
<code>partial-create</code> remained queryable. The command is a convenient mutation envelope, not
a transaction.

## Local-by-default is the security boundary

The server defaults to <code>127.0.0.1:3000</code>, and the README explicitly warns that
<code>HOST=0.0.0.0</code> has no built-in authentication
([security note](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/README.md#60-second-quick-start-cli)).
The process uses unrestricted <code>cors()</code> and a WebSocket server without an Origin gate
([server initialization](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L40-L59)).
On loopback this is a same-machine trust model; exposing it directly to a LAN materially broadens
who can read, replace, clear or export the scene.

Auto-start adds useful accidental-collision defenses:

- health must identify <code>service: mcp-excalidraw-canvas</code>;
- the CLI caches that identity for three seconds before ordinary API requests;
- automatic spawn is limited to loopback;
- start checks both IPv4 and IPv6 loopback listeners to avoid split-brain;
- stop signals only the pid self-reported by a live, correctly identified service.

These controls are implemented across
[<code>spawn.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/spawn.ts),
[the canvas-client identity probe](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/canvas-client.ts#L269-L365)
and [the dual-stack bind guard](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts#L1315-L1405).
They prevent common foreign-service accidents, not a malicious same-user process that can imitate
the marker.

MCP file operations resolve paths under <code>EXCALIDRAW_EXPORT_DIR</code>, defaulting to the
server's current working directory
([path check](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/normalize.ts#L1-L16)).
The user-invoked CLI intentionally reads and writes the path it is given
([CLI file route](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/cli/commands/scene.ts#L67-L113)).
The MCP check is lexical <code>path.resolve</code>, not filesystem <code>realpath</code>; a junction
or symlink traversal is therefore a source-derived potential escape that was not exercised here.

At the 2026-08-11 registry/advisory snapshot, <code>npm audit --omit=dev</code> on the exact source
lockfile reported 20 production dependency findings: 1 low, 12 moderate and 7 high, with no
critical finding. Direct affected dependency chains included Excalidraw/Mermaid, Express and
<code>ws</code>; one relevant upstream record is
[GHSA-39h7-pwv7-rc3x](https://github.com/advisories/GHSA-39h7-pwv7-rc3x).
This is an advisory-surface snapshot, not a claim that every transitive finding is reachable. The
most important established exposure facts remain browser-side Mermaid conversion and an unauthenticated
server if the operator deliberately binds beyond loopback.

## There is no application-source mapping

The durable <code>.excalidraw</code> file can live beside source code, but its node ids are diagram
identities only. The project has no repository scanner, AST transform, file/line identity, design
token join, component mapper or code generator. A coding agent may inspect the repository before
drawing, and a human may commit the resulting diagram, but that workflow continuity does not
create a diagram-node → application-source binding.

The user-visible consequence is simple: the tool can document an architecture and later reopen the
diagram, but it cannot detect that a source component moved or automatically return a selected
shape to the implementing file.

## Failure atlas

| Boundary | Status in this dossier | User-visible effect |
|---|---|---|
| Live scene restart | Established by source | Server state disappears unless explicitly exported |
| Browser direct edit model phase | Observed live | Compact labels/bindings become native nodes; tool filters and rerouting semantics can change |
| Stale second tab overwrite | Source-derived | A later full-scene sync can replace newer server work |
| Empty-server/open-tab resurrection | Source-derived | An old tab can survive restart and later repopulate the new process |
| Screenshot with several tabs | Source-derived | Largest response wins without a scene revision proof |
| Mermaid completion | Established by source | Dispatch can report success before conversion/sync succeeds |
| Partial <code>apply</code> | Observed live | Command failure can leave earlier mutations committed |
| Snapshot shallow aliasing | Observed live | Snapshot contents can drift, although the exercised restore rerouted correctly |
| Replace import failure | Established by source | Old canvas is already gone if batch recreation fails |
| File lifecycle split | Observed live | Clear can leave orphan blobs that later exports include |
| Share URL with images | Established by source | Image payloads are omitted from the uploaded scene |
| Network exposure | Established configuration boundary | Non-loopback bind exposes an unauthenticated mutation API |
| Diagram-to-code traceability | Confirmed absent from source | Exported nodes do not return to app files/components |

## Implementation map

| Concern | Pinned implementation |
|---|---|
| CLI entry and dispatch | [<code>src/bin.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/bin.ts), [<code>src/cli/run.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/cli/run.ts) |
| Auto-start, identity and lifecycle | [<code>src/core/spawn.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/spawn.ts), [<code>src/core/pidfile.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/pidfile.ts) |
| MCP registration and dispatch | [<code>src/core/mcp-server.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/mcp-server.ts), [<code>src/core/mcp-dispatch.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/mcp-dispatch.ts), [<code>src/core/mcp-tools.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/mcp-tools.ts) |
| REST, WebSocket, memory maps and browser requests | [<code>src/server.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/server.ts), [<code>src/types.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/types.ts) |
| Browser projection and full-scene writeback | [<code>frontend/src/App.tsx</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/App.tsx) |
| Agent/native model conversion | [<code>src/core/normalize.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/normalize.ts), [<code>src/core/expand-elements.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/expand-elements.ts) |
| Structured import/export | [<code>src/core/scene-io.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/scene-io.ts), [<code>src/core/obsidian-md.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/obsidian-md.ts) |
| Browser-side Mermaid conversion | [<code>frontend/src/utils/mermaidConverter.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/frontend/src/utils/mermaidConverter.ts) |
| Encrypted share URL | [<code>src/core/share-url.ts</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/src/core/share-url.ts) |
| Agent operating policy | [<code>skills/excalidraw-skill/SKILL.md</code>](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/skills/excalidraw-skill/SKILL.md) |

## History changes the product conclusion

| Date | Commit | What changed in the product model |
|---|---|---|
| 2025-03-16 | [<code>860e905</code>](https://github.com/yctimlin/mcp_excalidraw/commit/860e905b565a893c17af154be20564b1703539c1) | Began as an MCP server with element operations and Docker support |
| 2025-05-12 | [<code>110bb19</code>](https://github.com/yctimlin/mcp_excalidraw/commit/110bb19642cd6f79b67e348c8e5a2b5552b4d9c4) | Added the npm/npx distribution route |
| 2025-07-11 | [<code>1be9f3b</code>](https://github.com/yctimlin/mcp_excalidraw/commit/1be9f3b47bef82089cbace0aceb1283a4ab62aa3) | Added the React frontend and live canvas server |
| 2025-08-07 | [<code>b1f2aac</code>](https://github.com/yctimlin/mcp_excalidraw/commit/b1f2aacfad710dc06fd1de0daf8759f6d90d51c3) | Removed frontend document storage and made HTTP the mutation path |
| 2025-11-07 | [<code>27a7c65</code>](https://github.com/yctimlin/mcp_excalidraw/commit/27a7c65b556ce4eb49615265b4b6884f3becb5ed) | Added browser-side Mermaid conversion |
| 2026-01-26 | [<code>d73fa53</code>](https://github.com/yctimlin/mcp_excalidraw/commit/d73fa53cde9f80816da23e1637ed11b880e7312e) | Added the agent skill and made workflow policy part of the product |
| 2026-02-12 | [<code>4a17c47</code>](https://github.com/yctimlin/mcp_excalidraw/commit/4a17c47b543383466afed8c41e9293fe98bbfce9) | Expanded into the v2 canvas toolkit |
| 2026-03-05–06 | [<code>6dfae34</code>](https://github.com/yctimlin/mcp_excalidraw/commit/6dfae347d1a1eb122afdeaab65dab254d07bbd47), [<code>ec60927</code>](https://github.com/yctimlin/mcp_excalidraw/commit/ec609277683d83da32bdcdf7ea7611fe87240be5) | Repaired API-created arrow bindings and introduced the browser autosync/diagram-quality loop |
| 2026-04-25 | [<code>cd8d64c</code>](https://github.com/yctimlin/mcp_excalidraw/commit/cd8d64cc8e01d18a0d001c2b1efa811b33c8bfc5) | Added the dual-stack split-brain guard |
| 2026-07-06 | [<code>e7a48eb</code>](https://github.com/yctimlin/mcp_excalidraw/commit/e7a48eb587c9a6b7c8abb1711ad18b87787476c0) | Made the CLI the preferred route and published npm <code>1.1.0</code> |
| 2026-07-18–22 | [<code>6494e45</code>](https://github.com/yctimlin/mcp_excalidraw/commit/6494e45ec6fe9ebb19d70caba82adcc87e4c3147), [<code>505f4c6</code>](https://github.com/yctimlin/mcp_excalidraw/commit/505f4c6e0ca1fe2489b4c18c9fedc24ac50a9002) | Added Obsidian interchange and repaired duplicate browser sockets/Mermaid id collisions |
| 2026-08-04 | [<code>2930519</code>](https://github.com/yctimlin/mcp_excalidraw/commit/293051981ebb01c7daf3a0c335b6854a9b58d20b), [<code>ecf3cac</code>](https://github.com/yctimlin/mcp_excalidraw/commit/ecf3caca7c55cbd79423b6333a85c837c701a41e) | Hardened export fidelity and preservation of edited bound text |
| 2026-08-08 | [<code>0db05c4</code>](https://github.com/yctimlin/mcp_excalidraw/commit/0db05c4261fb99cadbba4d0ef38df50867443f9a) | Migrated source HEAD to MCP <code>2026-07-28</code> and SDK v2 |
| 2026-08-09 | [<code>6ddbe98</code>](https://github.com/yctimlin/mcp_excalidraw/commit/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8) | Merged the <code>2.0.0</code> release-intent PR |

The history changes the high-level description. “MCP wrapper around Excalidraw” fits the initial
repository, but not the current source: the preferred interface is now a skill-guided CLI, the
browser participates in state authority, and the durable result is an interchange file produced
after a visual repair loop.

## Source version is not release truth

The pinned [package manifest](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/package.json)
and README say <code>2.0.0</code>, require Node 20 and depend on
<code>@modelcontextprotocol/core</code>/<code>server</code> <code>2.0.0</code>. But the live
[npm registry record](https://registry.npmjs.org/mcp-excalidraw-server) still exposes
<code>latest: 1.1.0</code>, Node 18 and the older
<code>@modelcontextprotocol/sdk</code> dependency. No Git tag or GitHub Release exists in this
snapshot.

[PR #99](https://github.com/yctimlin/mcp_excalidraw/pull/99) explicitly listed npm publish,
<code>v2.0.0</code> tag and GitHub Release as post-merge work. The
[publish workflow](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/.github/workflows/npm-publish.yml)
runs only for a published GitHub Release or manual dispatch, and no run was present.

Source HEAD itself did pass
[CI](https://github.com/yctimlin/mcp_excalidraw/actions/runs/31265985832) and
[Docker Build & Push](https://github.com/yctimlin/mcp_excalidraw/actions/runs/31265985833).
The GHCR <code>latest</code>/<code>main</code>/<code>sha-6ddbe98</code> manifests were available
for both MCP and canvas images during verification. The practical distribution is therefore split:
the recommended README <code>npx -y mcp-excalidraw-server</code> route obtains <code>1.1.0</code>,
while source checkout or current containers can carry the unreleased <code>2.0.0</code> code.

## Verification performed for this dossier

At pinned source revision <code>6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8</code>:

- installed the exact lockfile with <code>npm ci</code> under Node 24.16.0 and npm 11.13.0;
- passed <code>npm run type-check</code>;
- passed the five MCP stdio wire cases;
- the first composite <code>npm test</code> run timed out in the random-port local-bind subprocess;
  the direct bind test then passed, and a complete rerun passed both MCP and bind suites;
- passed <code>npm run build</code>: 2,007 frontend modules plus the TypeScript server build; only
  frontend chunk-size warnings remained;
- confirmed the build left tracked source clean;
- exercised the ordinary CLI → live browser → screenshot → repair → deterministic structured export
  journey described above;
- exercised direct browser writeback, post-write model expansion, native-binding reroute behavior,
  partial <code>apply</code>, snapshot aliasing and orphan-file retention;
- checked live npm, GitHub tags/releases/actions and GHCR manifests;
- ran the production-only dependency audit summarized above.

This verification proves source/build/wire coherence and one real local diagram journey. It does
not make source <code>2.0.0</code> an npm release.

## Evidence boundary and remaining gaps

### Established directly

- Canonical project identity, license, source chronology and interface surface.
- Current npm/source/container version split.
- REST/WebSocket/browser authority flow and in-memory state model.
- Agent-to-native element conversion and deterministic structured export implementation.
- Browser-dependent screenshot, image export, viewport and Mermaid routes.
- Explicit file/snapshot/share lifecycles.
- Local source build/test result and the exercised ordinary-user journey.
- The observed partial mutation, snapshot-alias and orphan-file behaviors.
- Absence of repository/source-mapping implementation in this codebase.

### Source-derived inference, labeled rather than presented as observed

- Stale-tab last-writer-wins overwrite and open-tab resurrection after server restart.
- Junction/symlink escape through the lexical MCP export-directory check.
- Share-link image loss follows directly from the empty <code>files</code> object, but the external
  upload was not executed.
- “No application-source mapping” is an implementation absence, not a claim that a calling coding
  agent cannot manually relate a diagram to source.

### Still unknown or unverified here

- A real two-browser race and behavior under several simultaneous MCP/CLI callers.
- A live external share round trip, complex embedded-image fidelity and large-scene performance.
- Client-specific permission/approval UX for mutations and exports.
- Whether a future npm publish, tag or release will close the <code>1.1.0</code>/<code>2.0.0</code>
  split after this review date.
- Practical exploitability of each current transitive dependency advisory.
- Long-running durability under process crashes; there is no durable live-state store to test.

## Primary sources

- [Pinned repository](https://github.com/yctimlin/mcp_excalidraw/tree/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8)
- [Pinned product README](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/README.md)
- [Pinned package manifest](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/package.json)
- [Pinned MIT license](https://github.com/yctimlin/mcp_excalidraw/blob/6ddbe98093eba9c8c0606ca40bc4f3a41495d8d8/LICENSE)
- [npm registry metadata](https://registry.npmjs.org/mcp-excalidraw-server)
- [npm package page](https://www.npmjs.com/package/mcp-excalidraw-server)
- [Release-intent PR #99](https://github.com/yctimlin/mcp_excalidraw/pull/99)
- [Source-HEAD CI run](https://github.com/yctimlin/mcp_excalidraw/actions/runs/31265985832)
- [Source-HEAD Docker run](https://github.com/yctimlin/mcp_excalidraw/actions/runs/31265985833)
- [GHCR MCP image](https://github.com/yctimlin/mcp_excalidraw/pkgs/container/mcp_excalidraw)
- [GHCR canvas image](https://github.com/yctimlin/mcp_excalidraw/pkgs/container/mcp_excalidraw-canvas)
- [Pinned official Excalidraw MCP App repository, kept separate](https://github.com/excalidraw/excalidraw-mcp/tree/157aa23ceb1976008aadc89eb05e3444060f09d6)
