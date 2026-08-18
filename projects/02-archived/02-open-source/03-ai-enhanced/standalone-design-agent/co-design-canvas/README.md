# Co-Design Canvas

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

Co-Design Canvas is an architectural and urban-design prototype that combines a shared drawing surface Google Maps context and ComfyUI image generation. It represents an earlier form of human/AI co-design where generated proposals return to the same spatial board.

## A lightweight server joins canvas and generator

At commit [`2535d48`](https://github.com/Utopia5327/codesigncanvasoffline/tree/2535d48c587be238d9dc0a34cc290b5dd7586610) [`script.js`](https://github.com/Utopia5327/codesigncanvasoffline/blob/2535d48c587be238d9dc0a34cc290b5dd7586610/script.js) manages drawing uploaded images and collaboration state. [`app.py`](https://github.com/Utopia5327/codesigncanvasoffline/blob/2535d48c587be238d9dc0a34cc290b5dd7586610/app.py) connects Firebase storage and local ComfyUI jobs including inpainting workflows.

The board is the coordination surface and generated raster images are editable inputs for another pass. There is no source-level parametric building model so outputs should not be described as BIM or CAD authority.

The source contains machine-specific setup instructions and an older dependency stack. It proves a working prototype boundary rather than a maintained hosted service. The maintainer profile lists New York United States.

## Evidence

- [Pinned README](https://github.com/Utopia5327/codesigncanvasoffline/blob/2535d48c587be238d9dc0a34cc290b5dd7586610/README.md)
- [ComfyUI workflow](https://github.com/Utopia5327/codesigncanvasoffline/blob/2535d48c587be238d9dc0a34cc290b5dd7586610/Inpaint_Anything.json)
- [Browser canvas](https://github.com/Utopia5327/codesigncanvasoffline/blob/2535d48c587be238d9dc0a34cc290b5dd7586610/index.html)
