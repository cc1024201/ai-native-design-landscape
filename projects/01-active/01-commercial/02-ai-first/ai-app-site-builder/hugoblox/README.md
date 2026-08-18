# HugoBlox

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

HugoBlox defines AI site building around portable source ownership: its hosted Hugo Chat proposes a site as structured Markdown, while the open kit renders that source through reusable Hugo blocks. The product promise is not merely “AI makes a page”; it is “AI writes an artifact you can keep editing and deploy elsewhere.”

## The open authority starts after generation

[`modules/blox/schemas/blocks.json`](https://github.com/HugoBlox/kit/blob/68cbf3353012a6f962093df1dac3ed571df7b93d/modules/blox/schemas/blocks.json) describes the block vocabulary the Markdown selects. Theme data and module templates deterministically materialize it into a site. The ordinary loop is therefore:

```text
natural-language intent -> hosted Hugo Chat -> structured Markdown
-> open block schema and Hugo renderer -> direct source edits -> portable deployment
```

The repository establishes the artifact format, rendering kit, themes and deployment portability. It does not expose the hosted generator's prompts, model orchestration or revision store, so this dossier stops at architecture-level evidence instead of inventing a source path for the closed stage.

The HugoBlox GitHub organization reports a United Kingdom location.

## Evidence

- [Pinned kit and product contract](https://github.com/HugoBlox/kit/tree/68cbf3353012a6f962093df1dac3ed571df7b93d)
- [Block schema](https://github.com/HugoBlox/kit/blob/68cbf3353012a6f962093df1dac3ed571df7b93d/modules/blox/schemas/blocks.json)
- [Block module](https://github.com/HugoBlox/kit/tree/68cbf3353012a6f962093df1dac3ed571df7b93d/modules/blox)
- [Maintainer location evidence](https://github.com/HugoBlox)
