# ExFig

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ExFig is a cross-platform design-asset compiler. A Figma or Penpot file supplies colors, typography, icons and images; one configuration then materializes platform-native resources for iOS, Android, Flutter and web repositories.

## It governs drift through repeatable export

The Swift package separates source clients, a shared export core and target plugins. Each target has typed configuration and exporters: Android XML and Compose, iOS asset catalogs and code, Dart constants and web files. [`BatchExecutor.swift`](https://github.com/DesignPipe/exfig/blob/232871000edf21a78a2e71530c36dae98558de04/Sources/ExFigCLI/Batch/BatchExecutor.swift) coordinates multi-entry runs.

Caching is part of the authority relationship rather than only performance. File versions and node hashes let unchanged design inputs reuse outputs; checkpoints support interrupted batch recovery. JSON reports and exit codes make the exporter usable in CI. The related agent plugin and MCP surface let a coding agent configure, review and invoke the same deterministic compiler.

```text
Figma/Penpot native assets -> normalized export plan + cache
-> iOS / Android / Flutter / web source -> CI report
-> later native change -> repeat export -> Git diff
```

The design file owns upstream intent and the generated repository files own shipped implementation. ExFig does not claim a reverse write-back from code to Figma or Penpot. Manual edits to generated files are therefore liable to be replaced on the next run.

The project is MIT-licensed. The organization profile reports Kazakhstan.

## Source anchors

- [Pinned repository](https://github.com/DesignPipe/exfig/tree/232871000edf21a78a2e71530c36dae98558de04)
- [Architecture docs](https://github.com/DesignPipe/exfig/blob/232871000edf21a78a2e71530c36dae98558de04/Sources/ExFigCLI/ExFig.docc/Architecture.md)
- [Checkpoint model](https://github.com/DesignPipe/exfig/blob/232871000edf21a78a2e71530c36dae98558de04/Sources/ExFigCLI/Cache/BatchCheckpoint.swift)
- [MIT license](https://github.com/DesignPipe/exfig/blob/232871000edf21a78a2e71530c36dae98558de04/LICENSE)
