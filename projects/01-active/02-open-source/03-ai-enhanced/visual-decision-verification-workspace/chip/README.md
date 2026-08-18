# CHIP

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

CHIP is a prototype operations cockpit for agentic design systems. Instead of answering component questions, it frames cross-platform parity drift as a proposal that a design-system lead can inspect, approve, reject or modify before downstream work begins.

## Approval is the visible state transition

The checked-in cockpit combines component/platform health, readiness tasks, simulations and a five-phase Monitor → Analyze → Plan → Execute → Knowledge strip. Approving the demo proposal moves checklist state, creates an audit entry and withholds automatic merge. [`app.js`](https://github.com/emcdanie/chip/blob/3f13e0a2bac0a774b24547426562d2cadc19bc2b/docs/artifacts/chip-cockpit-v0/app.js) implements those transitions.

```text
surface/parity signals -> agent proposal + readiness evidence
-> operator approve / reject / modify
-> audit event + planned downstream actions -> knowledge loop
```

[`server.js`](https://github.com/emcdanie/chip/blob/3f13e0a2bac0a774b24547426562d2cadc19bc2b/server/server.js) can proxy Ask CHIP to a managed agent with Notion context. The repository is unusually explicit about its boundary: the cockpit interactions and live query path are real; parity numbers, Jira/Storybook/Figma links and notification effects are synthetic in v0. This is a product definition and working interaction artifact, not evidence of deployed automation.

The project is MIT-licensed. The maintainer profile reports Barcelona, Spain.

## Sources

- [Pinned repository](https://github.com/emcdanie/chip/tree/3f13e0a2bac0a774b24547426562d2cadc19bc2b)
- [Cockpit markup](https://github.com/emcdanie/chip/blob/3f13e0a2bac0a774b24547426562d2cadc19bc2b/docs/artifacts/chip-cockpit-v0/index.html)
- [Cockpit data](https://github.com/emcdanie/chip/blob/3f13e0a2bac0a774b24547426562d2cadc19bc2b/docs/artifacts/chip-cockpit-v0/data.js)
- [Agent prompt](https://github.com/emcdanie/chip/blob/3f13e0a2bac0a774b24547426562d2cadc19bc2b/server/AGENT_PROMPT.md)
- [MIT license](https://github.com/emcdanie/chip/blob/3f13e0a2bac0a774b24547426562d2cadc19bc2b/LICENSE)
