# Chili Chiplets

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Chili Chiplets is an interactive early-stage 2.5D layout tool where a CNN thermal surrogate gives near-instant feedback on chiplet placement substrate and cooling choices. A finite-difference solver remains available as the physics comparison.

## AI shortens exploration without owning physics truth

At commit [`8a734fc`](https://github.com/eigeneddie/DLtrial/tree/8a734fcacabfd979118018c9291125763bb53a2e) the Streamlit canvas encodes placed dies power conductivity and cooling into a three-channel grid. A checked-in encoder-decoder model predicts a 64×64 heatmap and deterministic post-processing flags CTE stress. Users can switch to the FDM engine or compare both outputs on the same layout.

```text
interactive placement -> Q/k/h grid -> CNN heatmap -> design adjustment
                              \-> FDM comparison / stress overlay
```

The editable artifact is the placed chiplet configuration and material/cooling parameters; heatmaps are analysis projections. The README is explicit that its simplified 2D solver differs materially from high-fidelity 3D HotSpot results so this cannot be treated as tape-out validation.

The first-party profile locates the maintainer in Cambridge Massachusetts United States.

## Evidence

- [Interactive application](https://github.com/eigeneddie/DLtrial/blob/8a734fcacabfd979118018c9291125763bb53a2e/app.py)
- [Physics data generator](https://github.com/eigeneddie/DLtrial/blob/8a734fcacabfd979118018c9291125763bb53a2e/data_generator.py)
- [Pinned README and validation caveat](https://github.com/eigeneddie/DLtrial/blob/8a734fcacabfd979118018c9291125763bb53a2e/README.md)
