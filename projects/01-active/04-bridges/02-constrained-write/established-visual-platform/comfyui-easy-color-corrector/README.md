# ComfyUI EasyColorCorrector

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ComfyUI EasyColorCorrector is a visual color-finishing suite inside the ComfyUI graph. It combines content-aware analysis with conventional grading controls so a person can begin with an automatic correction and then tune the result rather than accepting a one-shot image.

## Analysis and manual grading coexist in one node graph

[`image_analysis.py`](https://github.com/regiellis/ComfyUI-EasyColorCorrector/blob/fe86b8af5f857f536d6af2d8a62b8c07b1e4b39e/src/utils/image_analysis.py) classifies image content and detects faces; [`color_functions.py`](https://github.com/regiellis/ComfyUI-EasyColorCorrector/blob/fe86b8af5f857f536d6af2d8a62b8c07b1e4b39e/src/utils/color_functions.py) implements the grading operations. The JavaScript extension provides mode-sensitive controls and selective execution for preview.

Auto, preset and manual modes all produce images inside the authoritative ComfyUI workflow. Histogram and palette outputs expose evidence for correction, while the workflow JSON preserves parameters and graph connections. The maintainer's first-party profile identifies Florida, United States.

## Evidence

- [Pinned repository](https://github.com/regiellis/ComfyUI-EasyColorCorrector/tree/fe86b8af5f857f536d6af2d8a62b8c07b1e4b39e)
- [ComfyUI extension](https://github.com/regiellis/ComfyUI-EasyColorCorrector/blob/fe86b8af5f857f536d6af2d8a62b8c07b1e4b39e/js/comfyui-easycolorcorrection.js)
- [Example workflow](https://github.com/regiellis/ComfyUI-EasyColorCorrector/blob/fe86b8af5f857f536d6af2d8a62b8c07b1e4b39e/example_workflows/Easy%20Color%20Corrector.json)
- [Maintainer profile](https://github.com/regiellis)
