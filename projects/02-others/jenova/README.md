# Jenova UI prototype generator

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

| Field | Value |
|---|---|
| Team | Jenova AI · team region not established |
| Ordinary job | turn a product idea or sketch into a coherent multi-screen visual prototype and keep revising it by conversation |
| Authority | the saved Jenova prototype plus its remembered design-system context |
| Delivery boundary | visual prototype and sharing rather than generated source code |
| Lifecycle | active |

## Memory is more important than the first render

Jenova's dedicated UI agent accepts a brief or sketch and generates screens for web iOS or Android. Its distinctive contract is continuity: colors typography spacing components and interaction choices are remembered across sessions and reused when the user asks for another screen or a correction. The working artifact is therefore not merely the latest screenshot; it is a hosted multi-screen prototype interpreted through persistent project memory.

The agent can make conversational changes and keep visual consistency but Jenova explicitly positions this surface as visual prototyping without code output. A handoff to implementation crosses an authority boundary: the prototype can guide a team but public evidence does not show a source repository or native Figma graph synchronized with later changes.

## What is and is not established

The first-party product pages establish prompt and sketch inputs multi-screen generation revision cross-device access history and saved design context. They do not expose the prototype schema version graph component identity model interaction representation or an implementation API. Marketing claims about quality speed or model superiority are not used as evidence.

## Primary evidence

- [Jenova UI/UX prototype workflow](https://www.jenova.ai/en/resources/ai-ui-ux-prototype-generator-202606)
- [Jenova AI UI generator product boundary](https://www.jenova.ai/en/resources/ai-ui-generator)
