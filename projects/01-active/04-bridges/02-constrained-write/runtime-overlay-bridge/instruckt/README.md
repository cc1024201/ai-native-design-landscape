# Instruckt

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Instruckt turns a running web interface into a feedback surface for coding agents. A reviewer clicks an element, leaves a note or captures a region, and the agent receives structured context through clipboard text or MCP before resolving the annotation.

## DOM anchors and screenshots survive the conversation

The framework-neutral [core repository](https://github.com/joshcirre/instruckt/tree/6f5e911a494a7a4a1b812e3b9eef546a659b9d17) injects the browser toolbar and records element-aware annotations. Adapters keep the same product contract across React, Vue, Svelte, Laravel and Tauri rather than defining separate products.

The Laravel adapter's [`Store.php`](https://github.com/joshcirre/instruckt-laravel/blob/44495d2b6674c54c762aa7306326dd052483a5c5/src/Store.php) persists JSON annotations and PNG screenshots. Its MCP tools enumerate pending findings, return visual evidence and mark a finding resolved. The designed app remains canonical; Instruckt carries runtime visual intent into the repair loop.

The maintainer's first-party profile identifies Phoenix, United States.

## Evidence

- [Pinned core repository](https://github.com/joshcirre/instruckt/tree/6f5e911a494a7a4a1b812e3b9eef546a659b9d17)
- [Pinned Laravel adapter](https://github.com/joshcirre/instruckt-laravel/tree/44495d2b6674c54c762aa7306326dd052483a5c5)
- [MCP pending-annotation tool](https://github.com/joshcirre/instruckt-laravel/blob/44495d2b6674c54c762aa7306326dd052483a5c5/src/Mcp/Tools/GetAllPendingTool.php)
- [Maintainer profile](https://github.com/joshcirre)
