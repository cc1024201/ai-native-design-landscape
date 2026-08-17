# OpenPage

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenPage is a JSON-first website builder in which agent generation and human editing operate on the same typed document. This avoids treating generated React source or a rendered DOM as the only recoverable state.

## SiteConfig is the shared authority

[`generate-site.ts`](https://github.com/buildingopen/openpage/blob/9818eb43a88e01b23cb55752e19902d8285a853b/src/lib/generate-site.ts) accepts Gemini or server output only after block, variant and theme validation; a deterministic template is an explicit fallback. The editor reorders blocks, edits properties, switches variants and themes, and exposes the JSON directly. The renderer resolves each registered block from that same config.

```text
prompt -> validated SiteConfig JSON -> block renderer
        -> layers/properties/drag edit -> new JSON snapshot
        -> history restore / local project persistence
        -> standalone HTML export or deployment
```

[`projectsStore.ts`](https://github.com/buildingopen/openpage/blob/9818eb43a88e01b23cb55752e19902d8285a853b/src/store/projectsStore.ts) persists projects locally. Version history keeps configuration snapshots, while [`export-html.ts`](https://github.com/buildingopen/openpage/blob/9818eb43a88e01b23cb55752e19902d8285a853b/src/lib/export-html.ts) materializes a zero-runtime HTML document. Exported HTML is portable delivery, but roundtripping edits from that HTML into JSON is not part of the source contract.

The project is MIT-licensed. The organization profile reports Germany.

## Sources

- [Pinned repository](https://github.com/buildingopen/openpage/tree/9818eb43a88e01b23cb55752e19902d8285a853b)
- [Site types](https://github.com/buildingopen/openpage/blob/9818eb43a88e01b23cb55752e19902d8285a853b/src/blocks/types.ts)
- [Version history UI](https://github.com/buildingopen/openpage/blob/9818eb43a88e01b23cb55752e19902d8285a853b/src/editor/VersionHistory.tsx)
- [Deploy security tests](https://github.com/buildingopen/openpage/blob/9818eb43a88e01b23cb55752e19902d8285a853b/tests/deploy-security.test.ts)
- [MIT license](https://github.com/buildingopen/openpage/blob/9818eb43a88e01b23cb55752e19902d8285a853b/LICENSE)
