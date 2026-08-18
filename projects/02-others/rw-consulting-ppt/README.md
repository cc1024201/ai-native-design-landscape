# RW Consulting PPT

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RW Consulting PPT packages two related agent workflows: an image-led consulting-deck creator and a reconstruction route that turns existing slide imagery back into editable PowerPoint. They belong to one maintained collection because one repository and release boundary governs both.

## Image authority and editable reconstruction remain explicit

The consulting route intentionally treats page images as composition authority and packages them into a deck with [`package_image_deck.py`](https://github.com/Pikapika260214/rw-consulting-ppt/blob/7bc64c506356cffe31c8ff1bc97728d8888bbc31/skills/rw-consulting-ppt/scripts/package_image_deck.py). The separate `ppt-to-editable` route extracts crops, performs OCR, writes a text-layout manifest and reconstructs native objects.

[`deck_controller.py`](https://github.com/Pikapika260214/rw-consulting-ppt/blob/7bc64c506356cffe31c8ff1bc97728d8888bbc31/skills/ppt-to-editable/scripts/deck_controller.py) coordinates that conversion. Layout fitting, ink-refined bounding boxes, native editability inspection and render QA make the hybrid boundary auditable: retained visual crops preserve difficult artwork while text and selected shapes regain native authority. No reliable team-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/Pikapika260214/rw-consulting-ppt/tree/7bc64c506356cffe31c8ff1bc97728d8888bbc31)
- [Reconstruction contract](https://github.com/Pikapika260214/rw-consulting-ppt/blob/7bc64c506356cffe31c8ff1bc97728d8888bbc31/skills/ppt-to-editable/references/reconstruction-contract.md)
- [Render QA](https://github.com/Pikapika260214/rw-consulting-ppt/blob/7bc64c506356cffe31c8ff1bc97728d8888bbc31/skills/ppt-to-editable/scripts/run_reconstruction_qa.py)
