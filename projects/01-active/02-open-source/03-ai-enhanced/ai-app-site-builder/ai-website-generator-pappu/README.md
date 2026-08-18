# AI Website Generator by Pappu Kumar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Laravel implementation moves a generated site out of request-local state and into a database record. Business idea, category and design style are retained with the resulting artifact.

## Controller owns the generation transaction

[`WebsiteController.php`](https://github.com/pappu-kumar-sarkar/ai-website-generator/blob/a9ecb448127f3e28b9c3dfdf706df9cb8e5e66ad/app/Http/Controllers/WebsiteController.php) validates intent, calls Gemini through the configured service and creates or retrieves generated-site records. [`GeneratedWebsite.php`](https://github.com/pappu-kumar-sarkar/ai-website-generator/blob/a9ecb448127f3e28b9c3dfdf706df9cb8e5e66ad/app/Models/GeneratedWebsite.php) defines the durable artifact envelope.

[`index.blade.php`](https://github.com/pappu-kumar-sarkar/ai-website-generator/blob/a9ecb448127f3e28b9c3dfdf706df9cb8e5e66ad/resources/views/index.blade.php) supplies the ordinary-user form and generated preview. The database retains accepted generations but does not expose a branching revision graph.

## Pinned evidence

- [Canonical repository](https://github.com/pappu-kumar-sarkar/ai-website-generator)
- [Inspected tree](https://github.com/pappu-kumar-sarkar/ai-website-generator/tree/a9ecb448127f3e28b9c3dfdf706df9cb8e5e66ad)
- [Maintainer region evidence](https://github.com/pappu-kumar-sarkar)
- Commit: `a9ecb448127f3e28b9c3dfdf706df9cb8e5e66ad`
