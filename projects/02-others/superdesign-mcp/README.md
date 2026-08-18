# Superdesign MCP Server

> Research status: **Source-level** · Last reviewed: **2026-08-12**

This record is not another name for upstream Superdesign. It is an independently maintained MCP distribution that translates Superdesign's design method into executable Claude Code tools and owns its own filesystem iteration/gallery loop.

## What the server actually owns

The server exposes tools for creating a first design, iterating an existing file, extracting a reusable system, listing designs and building a gallery. It returns structured execution specifications to the IDE's model; the model writes HTML/SVG files under `design_iterations/`. The gallery then discovers those files and renders them together for comparison.

That boundary matters:

- upstream Superdesign supplies the method and product precedent;
- this server supplies a different agent interface and local artifact topology;
- Claude Code performs generation;
- HTML/SVG files remain the recoverable artifact authority.

## Commit-level trace

Pinned commit [`dd2e0b1`](https://github.com/jonthebeef/superdesign-mcp-claude-code/commit/dd2e0b110d801cf6ca77ff49deb7f08f0f34ae04) concentrates the implementation in [`src/index.ts`](https://github.com/jonthebeef/superdesign-mcp-claude-code/blob/dd2e0b110d801cf6ca77ff49deb7f08f0f34ae04/src/index.ts). Its README documents the five tool contracts, naming rules, extraction JSON and gallery auto-discovery. A clean TypeScript build completed during this review.

## Iteration and selection

An iteration points to an existing design file and returns constraints for producing another version rather than overwriting the only artifact. Gallery generation turns the directory into a visual comparison surface; selected outcomes can then be carried into normal repository history. There is no separate managed database or hidden canvas graph.

## Licensing and identity limits

No license file or declared SPDX license was present at the pinned revision. “Source-level” here describes evidence depth only and is not a claim that reuse rights have been granted. The maintainer's public GitHub location is Manchester; this supports a United Kingdom region label but not a larger company inference.

## Decisive sources

- [Repository README](https://github.com/jonthebeef/superdesign-mcp-claude-code/blob/dd2e0b110d801cf6ca77ff49deb7f08f0f34ae04/README.md)
- [MCP implementation](https://github.com/jonthebeef/superdesign-mcp-claude-code/blob/dd2e0b110d801cf6ca77ff49deb7f08f0f34ae04/src/index.ts)
- [Maintainer profile](https://github.com/jonthebeef)
- [Upstream Superdesign](https://github.com/superdesigndev/superdesign)
