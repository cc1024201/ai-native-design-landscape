# KronEditor

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KronEditor is an industrial control IDE where an agent can author Ladder Diagram and Structured Text, compile them through LLVM, simulate them, observe a live machine, and promote approved changes to hardware.

## Two editors converge on executable PLC logic

Visual Ladder elements and Monaco-authored IEC 61131-3 Structured Text represent control programs and variables. A Go agent handles project files, compilation, simulation, and deployment. Generated logic ultimately becomes C/native binaries for x86_64 or ARM targets, so the artifact authority extends beyond the canvas.

## Every agent mutation is a proposed diff

Claude, Gemini, OpenAI-compatible, or Ollama models can call tools to create POUs, edit variables, write Structured Text, and draw Ladder. The UI requires approval before applying each diff. This is a materially stronger safety boundary than free-form code insertion.

## Live state makes deployment consequential

The agent can stream variables, diagnose oscillating or stuck behavior, and hot-swap online changes while preserving state. Compilation and simulation are gates, not guarantees: machine safety, timing, I/O mapping, and operational authorization still require engineering controls outside an LLM review.

## Pinned evidence

- Repository: [Krontek/KronEditor](https://github.com/Krontek/KronEditor)
- Inspected IDE and runtime: [`42f64fc6655c12238a863f41fb2e4ab5e881c7b2`](https://github.com/Krontek/KronEditor/tree/42f64fc6655c12238a863f41fb2e4ab5e881c7b2)
- Immutable revision: [commit `42f64fc`](https://github.com/Krontek/KronEditor/commit/42f64fc6655c12238a863f41fb2e4ab5e881c7b2)
