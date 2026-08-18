# Floor Plan Interior Render

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Floor Plan Interior Render addresses a failure that prompt-only image generation cannot solve: the same furnished room must remain the same scene from every camera. It therefore freezes geometry, catalog identity and seeds before generating pixels.

## A content-hashed scene graph owns the room

Floor-plan images or PDFs become calibrated room/wall/opening records. A design agent retrieves real catalog products and places them in an immutable [scene schema](https://github.com/umairwaheed/floorplan-interior-render/blob/649d635b355f62cb047ce2802456c9b80672a1e6/backend/schemas/scene.py). Each camera projects depth, segmentation and wireframe conditioning from that exact graph.

```text
floor plan -> calibrated geometry + catalog index -> placed scene graph/hash
-> camera buffers -> conditioned image generation -> independent judge
-> keep best retry / patch one object -> renders + exact BOM + scores
```

The BOM is a graph traversal, not image recognition. Surgical regeneration preserves untouched instance seeds. [`verify/service.py`](https://github.com/umairwaheed/floorplan-interior-render/blob/649d635b355f62cb047ce2802456c9b80672a1e6/backend/verify/service.py) scores layout, identity and consistency and retains the best attempt. The repository publishes weaker full-floor-plan scores beside its tuned example, making model limitations part of the evidence rather than hiding them.

JSON scene state is authority; renders are projections. The project is MIT-licensed. The maintainer profile reports Pakistan.

## Decisive evidence

- [Pinned repository](https://github.com/umairwaheed/floorplan-interior-render/tree/649d635b355f62cb047ce2802456c9b80672a1e6)
- [Placement engine](https://github.com/umairwaheed/floorplan-interior-render/blob/649d635b355f62cb047ce2802456c9b80672a1e6/backend/design/placement.py)
- [Geometry rasterizer](https://github.com/umairwaheed/floorplan-interior-render/blob/649d635b355f62cb047ce2802456c9b80672a1e6/backend/render/raster.py)
- [Pipeline](https://github.com/umairwaheed/floorplan-interior-render/blob/649d635b355f62cb047ce2802456c9b80672a1e6/backend/services/pipeline.py)
- [MIT license](https://github.com/umairwaheed/floorplan-interior-render/blob/649d635b355f62cb047ce2802456c9b80672a1e6/LICENSE)
