# UML Transcoder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UML Transcoder makes the design–implementation boundary bidirectional: code can become an editable UML model, and UML—including an uploaded image—can become code through a structured intermediate form.

## Structured JSON is the hinge

Inputs are converted into a JSON representation of nodes, properties, and UML relationships before reaching the visual editor or code generator. The custom `.RohanUML` format preserves that structured model for later import. This avoids treating vision output as a finished image.

## Three evidence paths have different uncertainty

Text/code-to-UML preserves machine-readable source context; UML-to-code begins from a designed graph; image-to-code first relies on visual interpretation. The inspected backend uses Hugging Face's `meta-llama/Llama-3.2-11B-Vision-Instruct` for the multimodal route, so errors can enter before code generation.

## Transcoding is not equivalence

The visual editor supports relationship correction and dynamic layout, but no conversion proves behavioral equivalence between diagram and program. Generated code and reverse-engineered UML each require compilation and domain review.

## Pinned evidence

- Repository: [RohanDey02/uml-transcoder](https://github.com/RohanDey02/uml-transcoder)
- Inspected full-stack tree: [`3f731b3c77ea05f657d3e2e4e6d4426fbffb3939`](https://github.com/RohanDey02/uml-transcoder/tree/3f731b3c77ea05f657d3e2e4e6d4426fbffb3939)
- Immutable revision: [commit `3f731b3`](https://github.com/RohanDey02/uml-transcoder/commit/3f731b3c77ea05f657d3e2e4e6d4426fbffb3939)
