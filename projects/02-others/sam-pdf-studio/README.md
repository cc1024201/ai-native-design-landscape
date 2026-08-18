# Sam PDF Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Sam PDF Studio is a direct PDF correction workspace with a native macOS canvas and a local agent-addressable engine. It supports in-place text replacement, annotations, redlines, signatures, page composition, OCR and conversion while treating the original file as protected input.

## Undo walks real document versions rather than UI commands

[`DocumentSession.swift`](https://github.com/wassermanproductions/sam-pdf-studio/blob/6673af9266a2f952217afeb6ebef34d3364f35f8/Sources/SamPDFStudio/Models/DocumentSession.swift) routes every successful change to a new file in a private version stack. Undo and redo move through those complete artifacts; branching discards only the abandoned future; the source is overwritten only by explicit Save. The session semantics are exercised independently in [`qa_session_semantics.swift`](https://github.com/wassermanproductions/sam-pdf-studio/blob/6673af9266a2f952217afeb6ebef34d3364f35f8/Tests/qa_session_semantics.swift).

The local [`pdf_engine.py`](https://github.com/wassermanproductions/sam-pdf-studio/blob/6673af9266a2f952217afeb6ebef34d3364f35f8/Engine/pdf_engine.py) performs redaction-overlay text replacement and page operations. The bundled MCP wrapper calls that same engine headlessly and always writes a new output path, preserving the same non-destructive boundary. The standalone MCP repository is therefore a component, not a second PDF authority.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/sam-pdf-studio/tree/6673af9266a2f952217afeb6ebef34d3364f35f8)
- [Engine client boundary](https://github.com/wassermanproductions/sam-pdf-studio/blob/6673af9266a2f952217afeb6ebef34d3364f35f8/Sources/SamPDFStudio/Services/PDFEngineClient.swift)
- [Agent control contract](https://github.com/wassermanproductions/sam-pdf-studio/blob/6673af9266a2f952217afeb6ebef34d3364f35f8/mcp/README.md)
