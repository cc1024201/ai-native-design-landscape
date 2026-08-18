# AIWebGenerator by Kuroda Kayn

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AIWebGenerator is a local-first Nuxt authoring system in which HTML files sit inside a branching version graph. Models, rules, messages and files are all explicit records rather than hidden service state.

## A response becomes a versioned file

[`chat.ts`](https://github.com/KurodaKayn/AIWebGenerator/blob/5c7390259fd2b3f78654a0dc420ef11ee8dcfb2b/app/composables/chat.ts) streams through the selected AI SDK provider and persists the message history against a new version. [`chat/root.vue`](https://github.com/KurodaKayn/AIWebGenerator/blob/5c7390259fd2b3f78654a0dc420ef11ee8dcfb2b/app/components/chat/root.vue) extracts the returned HTML fence, creates a file record and links it to a parent version. Direct Monaco edits go through the same graph as draft user files before later model corrections.

## The browser database is the project authority

[`dexie.ts`](https://github.com/KurodaKayn/AIWebGenerator/blob/5c7390259fd2b3f78654a0dc420ef11ee8dcfb2b/app/composables/dexie.ts) defines IndexedDB tables for projects, files, versions, messages, model credentials and reusable rules. [`html.vue`](https://github.com/KurodaKayn/AIWebGenerator/blob/5c7390259fd2b3f78654a0dc420ef11ee8dcfb2b/app/components/preview/html.vue) projects the selected file through a sandboxed `srcdoc`; React, Vue, Svelte and Lit exports are derived from that file rather than replacing it.

## Evidence

- [Canonical repository](https://github.com/KurodaKayn/AIWebGenerator)
- [Inspected tree](https://github.com/KurodaKayn/AIWebGenerator/tree/5c7390259fd2b3f78654a0dc420ef11ee8dcfb2b)
- Commit: `5c7390259fd2b3f78654a0dc420ef11ee8dcfb2b`
