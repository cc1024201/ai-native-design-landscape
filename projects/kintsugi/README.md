# Kintsugi

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Kintsugi turns source-code annotations into a governed content-editing contract. An AI-generated site can expose text, images, styles, code, slots and structured data to a human CMS or visiting agent without giving either party unrestricted authority over the whole codebase.

## Source annotations compile into a manifest

[`scanner.ts`](https://github.com/VeriTeknik/kintsugi/blob/59f49ba9371b7db5440996d05d184d06895cac4b/packages/core/src/parser/scanner.ts) finds annotations across supported source dialects. [`generator.ts`](https://github.com/VeriTeknik/kintsugi/blob/59f49ba9371b7db5440996d05d184d06895cac4b/packages/core/src/manifest/generator.ts) turns them into `kintsugi.json`, and [`schema.ts`](https://github.com/VeriTeknik/kintsugi/blob/59f49ba9371b7db5440996d05d184d06895cac4b/packages/core/src/manifest/schema.ts) constrains access modes and agent intent.

This contract distinguishes editable, locked, AI-only and human-only regions. Cross-reference and constraint rules catch an agent procedure that targets a missing annotation or a value that violates its declared surface before publication.

## Revision history preserves who changed what

[`filesystem.ts`](https://github.com/VeriTeknik/kintsugi/blob/59f49ba9371b7db5440996d05d184d06895cac4b/packages/core/src/registry/filesystem.ts) stores per-annotation revisions with author kind, channel and timestamp and can roll back to an earlier value. The core parser, manifest, validator and registry are working source; the advertised CLI and runtime sidecar remain incomplete, so this dossier does not overstate the current CMS UI.

## Evidence

- [Pinned repository](https://github.com/VeriTeknik/kintsugi/tree/59f49ba9371b7db5440996d05d184d06895cac4b)
- [Constraint validator](https://github.com/VeriTeknik/kintsugi/blob/59f49ba9371b7db5440996d05d184d06895cac4b/packages/core/src/validator/constraint-check.ts)
- [Agent brief command](https://github.com/VeriTeknik/kintsugi/blob/59f49ba9371b7db5440996d05d184d06895cac4b/packages/cli/src/commands/agent-brief.ts)
