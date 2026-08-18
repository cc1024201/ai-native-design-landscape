# StyleKit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

StyleKit treats a named visual style as a portable implementation contract. Its catalog supplies examples and component recipes, while an agent skill and export APIs materialize the chosen direction as tokens, CSS variables, framework themes and AI rules.

## A style leaves the catalog as governed project state

The [`SKILL.md`](https://github.com/AnxForever/stylekit/blob/b491996c68bf7e419a8106d1dedb9fde8f91936f/SKILL.md) tells an agent how to select and apply one of the maintained styles. Per-style API routes expose [tokens](https://github.com/AnxForever/stylekit/tree/b491996c68bf7e419a8106d1dedb9fde8f91936f/app/api/styles/%5Bslug%5D/tokens), [Claude rules](https://github.com/AnxForever/stylekit/tree/b491996c68bf7e419a8106d1dedb9fde8f91936f/app/api/styles/%5Bslug%5D/claude-rules) and [Cursor rules](https://github.com/AnxForever/stylekit/tree/b491996c68bf7e419a8106d1dedb9fde8f91936f/app/api/styles/%5Bslug%5D/cursorrules).

The catalog itself is not the decisive artifact. Exported tokens and rules become the source-level constraints inside the target project, and the rendered application is their live projection.

## Evidence

- [Pinned repository](https://github.com/AnxForever/stylekit/tree/b491996c68bf7e419a8106d1dedb9fde8f91936f)
- [Style showcase implementation](https://github.com/AnxForever/stylekit/tree/b491996c68bf7e419a8106d1dedb9fde8f91936f/app/%5Blocale%5D/styles/%5Bslug%5D/showcase)
- [Maintainer profile: China](https://github.com/AnxForever)
