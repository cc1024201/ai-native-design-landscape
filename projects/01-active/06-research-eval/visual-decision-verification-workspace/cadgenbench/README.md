# CADGenBench

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CADGenBench is Hugging Face's benchmark and baseline agent for generative and editing tasks over real CAD solids. It measures whether a candidate is valid, geometrically similar, topologically faithful and compatible at intended interfaces rather than accepting a plausible render.

## Engineering identity is decomposed into independent tests

The evaluation pipeline aligns candidate and reference models, checks kernel-level validity, computes shape and topology matches, and visualizes interface differences. Editing tasks retain explicit diffs. The included baseline agent generates CadQuery or build123d programs, packages their artifacts and runs them through the same evaluator.

STEP/CAD solids and their executable source are the candidate authorities; standardized renders are diagnostic projections. This makes the project a constraint-driven verification workspace, not an image-to-3D gallery.

## Evidence

- [Pinned repository](https://github.com/huggingface/cadgenbench/tree/33304cf771fc5639144b1df9611e347251052cf8)
- [Evaluation pipeline](https://github.com/huggingface/cadgenbench/blob/33304cf771fc5639144b1df9611e347251052cf8/src/cadgenbench/eval/evaluate.py)
- [CAD validity contract](https://github.com/huggingface/cadgenbench/blob/33304cf771fc5639144b1df9611e347251052cf8/docs/metrics/cad_validity.md)
- [Baseline agent](https://github.com/huggingface/cadgenbench/blob/33304cf771fc5639144b1df9611e347251052cf8/src/cadgenbench/baseline/agent.py)
