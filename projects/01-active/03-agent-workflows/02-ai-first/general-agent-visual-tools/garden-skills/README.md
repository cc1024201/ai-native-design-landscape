# Garden Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Garden Skills is a mixed skill collection with two independently substantial Design workflows: `web-design-engineer` for browser products and `web-video-presentation` for chapter-based animated presentations. It is included for those executable systems, not for the unrelated retrieval or image utilities in the same repository.

## Web design and recorded presentation use different artifact grammars

[`web-design-engineer`](https://github.com/ConardLi/garden-skills/blob/aaf9a82f5efd73e87cc0998edc398e75bfc35901/skills/web-design-engineer/SKILL.md) begins with calibration and a selected direction, composes source blocks, and requires browser acceptance rather than trusting code inspection. Its references separate recipes from rules: a project may borrow a visual thesis while still resolving real content, responsive behavior and runtime side effects.

[`web-video-presentation`](https://github.com/ConardLi/garden-skills/blob/aaf9a82f5efd73e87cc0998edc398e75bfc35901/skills/web-video-presentation/SKILL.md) uses a different model. A scaffold contains chapter registries, typed content and animation code; theme directories pair machine-readable metadata with CSS tokens. Recording guidance converts the browser performance into video only after the live presentation is correct.

```text
web: brief -> calibrated direction -> source implementation -> browser acceptance
video deck: outline -> chapter registry + theme tokens -> live playback -> recording
```

In both cases, source files remain authoritative and Git supplies history. The recorded video is a projection of the presentation runtime. This collection has no common visual canvas or hosted persistence service, so its two workflows should not be flattened into a native-editor architecture.

The project is MIT-licensed. The maintainer profile reports Beijing, China.

## Pinned evidence

- [Repository](https://github.com/ConardLi/garden-skills/tree/aaf9a82f5efd73e87cc0998edc398e75bfc35901)
- [Browser acceptance contract](https://github.com/ConardLi/garden-skills/blob/aaf9a82f5efd73e87cc0998edc398e75bfc35901/skills/web-design-engineer/references/browser-acceptance.md)
- [Presentation scaffold](https://github.com/ConardLi/garden-skills/tree/aaf9a82f5efd73e87cc0998edc398e75bfc35901/skills/web-video-presentation/templates)
- [Theme registry](https://github.com/ConardLi/garden-skills/tree/aaf9a82f5efd73e87cc0998edc398e75bfc35901/skills/web-video-presentation/themes)
- [MIT license](https://github.com/ConardLi/garden-skills/blob/aaf9a82f5efd73e87cc0998edc398e75bfc35901/LICENSE)
