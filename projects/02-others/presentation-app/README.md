# Presentation App

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Presentation App is a local web application in which a Claude Agent session creates and revises HTML slides. Its unit of persistence is a session containing messages, context files and slide records; PowerPoint is a delivery projection of that state.

## Conversation mutates stored slides

[`session.py`](https://github.com/jerryjliu/presentation_app/blob/914dc221369bfe5a066260792d02339f9104bd2b/backend/session.py) stores sessions on disk, and [`models.py`](https://github.com/jerryjliu/presentation_app/blob/914dc221369bfe5a066260792d02339f9104bd2b/backend/models.py) makes slide and message structures explicit. The agent can add or revise slide HTML across turns. The React renderer previews the stored HTML, while the Node converter maps the deck to editable PptxGenJS elements.

```text
brief + context files -> agent session -> ordered HTML slide state
-> browser preview -> conversational revision -> PPTX
```

The current UI is primarily conversational rather than a freeform direct editor. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/jerryjliu/presentation_app/tree/914dc221369bfe5a066260792d02339f9104bd2b)
- [Session persistence](https://github.com/jerryjliu/presentation_app/blob/914dc221369bfe5a066260792d02339f9104bd2b/backend/session.py)
- [Slide renderer](https://github.com/jerryjliu/presentation_app/blob/914dc221369bfe5a066260792d02339f9104bd2b/web/src/components/SlideRenderer.tsx)
- [PPTX converter](https://github.com/jerryjliu/presentation_app/blob/914dc221369bfe5a066260792d02339f9104bd2b/backend/pptx_converter/convert.js)
