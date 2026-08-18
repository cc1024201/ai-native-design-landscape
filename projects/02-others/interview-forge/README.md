# InterviewForge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

InterviewForge makes system-design diagrams part of a staged interview artifact. Generation, validation, persistence and export are implemented as a dedicated whiteboard module rather than an incidental Markdown renderer.

## A diagram belongs to an interview stage

At [`637fd964`](https://github.com/azaddon/interview-forge/tree/637fd96434c1d078a5bd295d8bc21cf702484bd9), whiteboard records are stored through a repository and database migration. Regeneration replaces the relevant stage artifact instead of losing it in chat history.

## Validation and fallback protect the session

The service requests Mermaid and checks the result before use. A fallback keeps the interview flow available when generation fails. This is operational resilience rather than proof that every diagram is semantically correct.

## Editable delivery has a bounded converter

The Mermaid-to-draw.io converter creates native nodes and edges for supported flowcharts. It is deterministic and tested but is not a universal Mermaid compiler; the dossier keeps that supported subset explicit.

## Evidence

- [Pinned repository](https://github.com/azaddon/interview-forge/tree/637fd96434c1d078a5bd295d8bc21cf702484bd9)
- [Whiteboard service](https://github.com/azaddon/interview-forge/blob/637fd96434c1d078a5bd295d8bc21cf702484bd9/interview-forge-whiteboard/src/main/java/com/interviewforge/whiteboard/service/WhiteboardDiagramServiceImpl.java)
- [Persistence migration](https://github.com/azaddon/interview-forge/blob/637fd96434c1d078a5bd295d8bc21cf702484bd9/interview-forge-whiteboard/src/main/resources/db/migration/V9__whiteboard.sql)
- [Draw.io converter](https://github.com/azaddon/interview-forge/blob/637fd96434c1d078a5bd295d8bc21cf702484bd9/interview-forge-whiteboard/src/main/java/com/interviewforge/whiteboard/export/MermaidToDrawioConverter.java)
- [Converter tests](https://github.com/azaddon/interview-forge/blob/637fd96434c1d078a5bd295d8bc21cf702484bd9/interview-forge-whiteboard/src/test/java/com/interviewforge/whiteboard/export/MermaidToDrawioConverterTest.java)
