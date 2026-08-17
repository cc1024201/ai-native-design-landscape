# Qt Agent Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Qt Agent Skills is the Qt Company's installable collection for agent-assisted QML engineering. Its Design-specific chain moves from UI reasoning through Figma token and component extraction into production QML controls, then audits the resulting declarative source.

## Figma context becomes explicit QML authority

`qt-figma-token-extraction` reads variables, text styles and tokens and emits `design-tokens.json` plus QML singleton values. `qt-figma-component-generation` consumes those tokens and component metadata to generate controls aligned with Qt Quick Controls 2. The conversion creates a new source authority; it does not imply a durable bidirectional node binding back to Figma.

`qt-ui-design` supplies platform-aware layout, navigation and UX constraints for desktop, web and embedded targets. `qt-qml-review` adds deterministic lint rules and specialist analysis for bindings, layout, loaders, delegates, states and performance. These surfaces belong to one released skill collection rather than separate products.

## Execution and evidence boundary

QML source, token JSON and generated controls are durable artifacts. Build, profiler and test skills project that source through the Qt runtime and reports. The repository proves its transformations and rules; it does not expose Figma's storage internals or guarantee visual fidelity for every custom component.

- [Pinned Qt Agent Skills revision](https://github.com/TheQtCompanyRnD/agent-skills/tree/71d6c10da78b9a764468ae11c86ab3bc4ca4921f)
- [Collection capability registry](https://github.com/TheQtCompanyRnD/agent-skills/blob/71d6c10da78b9a764468ae11c86ab3bc4ca4921f/README.md)
- [Figma token extraction skill](https://github.com/TheQtCompanyRnD/agent-skills/blob/71d6c10da78b9a764468ae11c86ab3bc4ca4921f/skills/qt-figma-token-extraction/SKILL.md)
- [Figma component generation skill](https://github.com/TheQtCompanyRnD/agent-skills/blob/71d6c10da78b9a764468ae11c86ab3bc4ca4921f/skills/qt-figma-component-generation/SKILL.md)
