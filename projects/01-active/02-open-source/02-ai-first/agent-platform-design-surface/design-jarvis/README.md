# Design Jarvis

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design Jarvis is a VS Code design team made of an orchestrator plus research, UX, UI, content, operations and review specialists. It is organized around explicit review gates and persistent project memory rather than a single persona that claims to perform every discipline at once.

## Memory and review gates preserve design decisions

Wireframe and high-fidelity skills create inspectable artifacts while specialists contribute bounded findings. A three-tier memory structure separates durable project facts, working decisions and local session context. The lead agent advances work only after the relevant review gate, so later agents can distinguish accepted intent from unresolved exploration.

The filesystem artifacts and memory records are authoritative; rendered views are evidence. This gives the repository a coherent design-workspace boundary even though it is delivered as agent and skill files inside an editor.

- [Pinned repository](https://github.com/renfei-design/design-jarvis/tree/b7415b24d91986ec860c80de27132b8d4c11f22d)
- [Lead-agent contract](https://github.com/renfei-design/design-jarvis/blob/b7415b24d91986ec860c80de27132b8d4c11f22d/.github/agents/design-lead.agent.md)
- [Memory skill](https://github.com/renfei-design/design-jarvis/blob/b7415b24d91986ec860c80de27132b8d4c11f22d/.skills/memory/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/renfei-design)
