# Pinvou Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Pinvou is a desktop agent with a dedicated Design mode. The important product boundary is that a generated page becomes an inspectable artifact: a user can select elements, edit properties directly and ask the agent to revise the same work.

## Design mode closes the edit–revise loop

The bundled [`visual-design` skill](https://github.com/Pinvou/pinvou-agent/blob/e07d767f69b100927bee56e3a67b677b2e669796/pinvou3-app/src-tauri/resources/common/bundle/skills/visual-design/SKILL.md) instructs the agent how to create visual artifacts. [`design-runtime.js`](https://github.com/Pinvou/pinvou-agent/blob/e07d767f69b100927bee56e3a67b677b2e669796/pinvou3-app/src/features/artifacts/design-runtime.js) runs the result, and `DesignInspectorPanel` exposes element-level inspection and editing rather than treating the render as a static preview.

```text
Design mode brief -> agent-created HTML artifact -> live runtime
-> select element / edit property / ask revision
-> artifact persistence commands -> reopen in session
```

Rust artifact commands own filesystem/session persistence, while the smoke test protects entry into Design mode. The editable HTML/runtime artifact is the working authority; screenshots are previews. The repository does not evidence a collaborative branch/version model, so recoverability should be understood at the local artifact and session level.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Decisive evidence

- [Pinned repository](https://github.com/Pinvou/pinvou-agent/tree/e07d767f69b100927bee56e3a67b677b2e669796)
- [Design runtime](https://github.com/Pinvou/pinvou-agent/blob/e07d767f69b100927bee56e3a67b677b2e669796/pinvou3-app/src/features/artifacts/design-runtime.js)
- [Inspector panel](https://github.com/Pinvou/pinvou-agent/blob/e07d767f69b100927bee56e3a67b677b2e669796/pinvou3-app/src/features/artifacts/DesignInspectorPanel.jsx)
- [Artifact persistence commands](https://github.com/Pinvou/pinvou-agent/blob/e07d767f69b100927bee56e3a67b677b2e669796/pinvou3-app/src-tauri/src/app/commands/artifacts.rs)
- [Design-mode smoke test](https://github.com/Pinvou/pinvou-agent/blob/e07d767f69b100927bee56e3a67b677b2e669796/tests/design_mode_entry_smoke.js)
- [MIT license](https://github.com/Pinvou/pinvou-agent/blob/e07d767f69b100927bee56e3a67b677b2e669796/LICENSE)
