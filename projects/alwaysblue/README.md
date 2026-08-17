# AlwaysBlue

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AlwaysBlue is a Django landing-page generator whose repository contains its evolving production state: prompt records, generated HTML, reusable component retrieval, media, preview editing, and subdomain-oriented delivery.

## A generation is a persisted Django object

[`models.py`](https://github.com/rashedhasan28/Alwaysblue/blob/87b7c2b5e932ed3c9cea7dacaf64f92d3afa8843/landing_builder/models.py) defines the website-generation records and associated images. [`views.py`](https://github.com/rashedhasan28/Alwaysblue/blob/87b7c2b5e932ed3c9cea7dacaf64f92d3afa8843/landing_builder/views.py) connects ordinary-user requests to stored HTML rather than leaving model output only in a response stream.

## Retrieval and reasoning assemble the page

[`reasoning.py`](https://github.com/rashedhasan28/Alwaysblue/blob/87b7c2b5e932ed3c9cea7dacaf64f92d3afa8843/landing_builder/reasoning.py) selects and reasons over component material, and [`creator.py`](https://github.com/rashedhasan28/Alwaysblue/blob/87b7c2b5e932ed3c9cea7dacaf64f92d3afa8843/creator.py) drives generated website creation. This is a component-grounded site workflow, not a static template selector.

## Remix is the correction boundary

[`remix.py`](https://github.com/rashedhasan28/Alwaysblue/blob/87b7c2b5e932ed3c9cea7dacaf64f92d3afa8843/landing_builder/remix.py) and [`remix_views.py`](https://github.com/rashedhasan28/Alwaysblue/blob/87b7c2b5e932ed3c9cea7dacaf64f92d3afa8843/landing_builder/remix_views.py) reconnect existing output to editing. The source also contains a browser preview editor and generated-site corpus. Some paths and committed runtime material remain rough, so the lifecycle is recorded as transition rather than a polished platform.

## Pinned evidence

- [Repository](https://github.com/rashedhasan28/Alwaysblue)
- [Inspected tree](https://github.com/rashedhasan28/Alwaysblue/tree/87b7c2b5e932ed3c9cea7dacaf64f92d3afa8843)
- Commit: `87b7c2b5e932ed3c9cea7dacaf64f92d3afa8843`
