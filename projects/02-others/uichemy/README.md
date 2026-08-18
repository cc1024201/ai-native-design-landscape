# UiChemy

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UiChemy defines design-to-code translation as design-to-**native WordPress objects**. Its current product contract includes an AI Mode but the decisive Figma plugin and cloud converter are not in this repository; the open source proves the WordPress receiving side and the destination authority.

## Product loop and artifact handoff

The versioned [`readme.txt`](https://github.com/posimyth/uichemy/blob/b1f6ce2303532469fcbe725291b67fd393ac526e/readme.txt) describes four user steps: prepare a Figma design; run the UiChemy Figma plugin; connect a WordPress site; import. It explicitly says the destination is not static HTML: frames layers Auto Layout typography colors and spacing become editable Elementor widgets Gutenberg blocks or Bricks elements. The 5.0 changelog records “AI Mode” and MCP support.

This yields two authorities in sequence. Figma owns the source design before conversion. After import the native WordPress page-builder graph owns further editing and publication.

## What the open repository proves

[`class-uich-elementor.php`](https://github.com/posimyth/uichemy/blob/b1f6ce2303532469fcbe725291b67fd393ac526e/includes/admin/class-uich-elementor.php) integrates controls into Elementor rather than inserting one opaque iframe. Media import classes create WordPress attachments and preserve source metadata. Bricks and Atomic Element handlers normalize images styles and builder-specific data before writing destination objects.

[`class-uich-mcp-server.php`](https://github.com/posimyth/uichemy/blob/b1f6ce2303532469fcbe725291b67fd393ac526e/includes/mcp/class-uich-mcp-server.php) exposes an authenticated WordPress MCP transport and aggregates tools from the UiChemy plugin family. In this snapshot UiChemy itself no longer registers its own tool list; it should not be described as a complete standalone coding agent.

## Closed boundary

The Figma plugin and UiChemy cloud conversion service decide how source nodes map into builder objects and where AI Mode participates. Their implementation is unavailable here. Therefore this dossier can establish the artifact boundary and destination materialization but not the model orchestration or conversion algorithm at source level.

## Evidence and location

- [Canonical repository](https://github.com/posimyth/uichemy)
- [Inspected tree](https://github.com/posimyth/uichemy/tree/b1f6ce2303532469fcbe725291b67fd393ac526e)
- [WordPress product contract](https://github.com/posimyth/uichemy/blob/b1f6ce2303532469fcbe725291b67fd393ac526e/readme.txt)
- Commit: `b1f6ce2303532469fcbe725291b67fd393ac526e`

The maintainer organization's [GitHub profile](https://github.com/posimyth) states USA; team region is recorded as USA.
