# WebGalaxy

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

WebGalaxy is one team product represented by multiple public repositories. The canonical team repository and Saanchi Gupta repository share commit ancestry; they are evidence for one identity, not two products.

## Retrieval grounds a fine-tuned generator

[`website_generator_model1.py`](https://github.com/Kriti-Product-Development/WebGalaxy/blob/2ed0b71c4c5d985fccf680f00ce486f833bba781/backend3/website_generator_model1.py) retrieves template details and combines them with the ordinary-user brief before invoking the text-to-HTML model. The model's result is a complete page artifact rather than a template identifier.

## The application stores and returns generated pages

[`main3.py`](https://github.com/Kriti-Product-Development/WebGalaxy/blob/2ed0b71c4c5d985fccf680f00ce486f833bba781/backend3/main3.py) exposes generation and project interactions. The frontend [`GeneratedPage.js`](https://github.com/Kriti-Product-Development/WebGalaxy/blob/2ed0b71c4c5d985fccf680f00ce486f833bba781/frontend/src/pages/GeneratedPage.js) renders the resulting artifact.

## Identity evidence

`gsaanchi/WebGalaxy` contains shared commits including `03d1ce307d`, `bb22470c95`, and earlier team changes, then one later maintainer commit. That establishes a copied/shared product history rather than an independent lineage. The codebase contains several experimental backends and embedded generated repositories, so it remains transitional.

## Pinned evidence

- [Canonical team repository](https://github.com/Kriti-Product-Development/WebGalaxy)
- [Inspected tree](https://github.com/Kriti-Product-Development/WebGalaxy/tree/2ed0b71c4c5d985fccf680f00ce486f833bba781)
- [Shared-history repository](https://github.com/gsaanchi/WebGalaxy)
- Commit: `2ed0b71c4c5d985fccf680f00ce486f833bba781`
