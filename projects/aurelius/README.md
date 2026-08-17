# Aurelius

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Aurelius is an agent-integrated application framework whose design path starts from Figma, Canva, InDesign or conversation and ends in tested application code. Its defining mechanism is a gated design-to-code pipeline, not the large number of bundled personas.

## A lockfile sits between extraction and implementation

Figma intake produces a build specification and token lock. Tests are written before component implementation, then the running application is compared against the design for up to five visual-diff iterations. Browser tests, cross-browser captures, responsive screenshots and token verification feed a final build report.

Conversation-first work initially renders HTML mockups and sends them through Figma MCP to create a real design file; that URL then enters the same pipeline. Thus Figma can be an intermediate design authority even when the request began as prose. For code delivery, repository source and token lock become authoritative while Figma and screenshots remain targets/evidence.

- [Pinned repository](https://github.com/PMDevSolutions/Aurelius/tree/a06be2bbbf03901dab6b01d1616617e33d9feb59)
- [Figma pipeline contract](https://github.com/PMDevSolutions/Aurelius/blob/a06be2bbbf03901dab6b01d1616617e33d9feb59/README.md)
- [Visual-diff implementation](https://github.com/PMDevSolutions/Aurelius/blob/a06be2bbbf03901dab6b01d1616617e33d9feb59/scripts/visual-diff.js)
- [Organization location evidence](https://github.com/PMDevSolutions)
