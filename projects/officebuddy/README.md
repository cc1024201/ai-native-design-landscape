# OfficeBuddy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OfficeBuddy edits Word and Excel artifacts through native document operations, then asks the real Microsoft applications—not a look-alike renderer—to prove every change visually. It treats a structurally valid file as insufficient evidence of a successful design edit.

## The accepted render ratchets the visual baseline

Each instruction is planned and applied through typed Word or Excel tools. Word/Excel render the result, page images are diffed against the last accepted baseline, and an independent stateless multimodal verifier sees only the screenshot and step description. A failed render triggers targeted repair and cannot become the next baseline by accident.

The evidence trail retains plans, tool calls, rendered PDFs, screenshots and annotations. The editable `.docx` or `.xlsx` remains authoritative; visual verification controls whether the next edit is allowed to build on it. Render-Truth Bench separately measures the exact cases where byte-level validation passes while layout is visibly broken.

## Evidence

- [Pinned repository](https://github.com/richardChenzhihui/OfficeBuddy/tree/8b581052b19fa5f4dbbeef91b9fe3437f04872e0)
- [Native renderer](https://github.com/richardChenzhihui/OfficeBuddy/blob/8b581052b19fa5f4dbbeef91b9fe3437f04872e0/src/office_agent/render/renderer.py)
- [Page-diff implementation](https://github.com/richardChenzhihui/OfficeBuddy/blob/8b581052b19fa5f4dbbeef91b9fe3437f04872e0/src/office_agent/render/page_diff.py)
- [Typed edit operations](https://github.com/richardChenzhihui/OfficeBuddy/blob/8b581052b19fa5f4dbbeef91b9fe3437f04872e0/src/office_agent/schemas/operations.py)
