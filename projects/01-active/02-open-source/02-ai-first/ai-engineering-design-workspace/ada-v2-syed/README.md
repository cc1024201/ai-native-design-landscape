# A.D.A by Syed Daiam

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Syed Daiam's A.D.A is an independently maintained derivative of Nazir Louis's ADA V2 codebase. It retains the voice, gesture, Three.js, build123d and printer workflow while adding a provider abstraction so text/CAD work can use Gemini or an OpenAI-compatible endpoint.

## Provider portability changes the agent boundary, not CAD authority

The derivative routes live and text generation through provider interfaces and tests conversion and fallback behavior. The CAD loop still saves generated Python, executes it, retries errors and exports timestamped STL for the desktop viewer. Browser automation remains Gemini-specific, which the repository documents instead of implying full provider parity.

The near-identical product name and inherited artifact graph are recorded in the identity map. Material provider-layer commits and separate maintenance justify a qualified derivative record; they do not justify claiming an unrelated invention.

- [Pinned repository](https://github.com/SyedDaiam9101/A.D.A/tree/1f79006648174e5cb01eee9773e543e91ef0d50a)
- [Provider factory](https://github.com/SyedDaiam9101/A.D.A/blob/1f79006648174e5cb01eee9773e543e91ef0d50a/backend/providers/factory.py)
- [CAD agent implementation](https://github.com/SyedDaiam9101/A.D.A/blob/1f79006648174e5cb01eee9773e543e91ef0d50a/backend/cad_agent.py)
- [Maintainer location evidence](https://github.com/SyedDaiam9101)
