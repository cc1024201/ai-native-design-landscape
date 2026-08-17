# ApexNeural AI Website Builder for WordPress

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Three repositories expose one product lineage: two frontend revisions and a companion Flask backend. The user creates or edits one React page with natural language, can directly edit its source, runs it through a WebContainer, generates supporting images and publishes converted HTML plus media to WordPress.

## One editable component anchors the authoring loop

Backend revision: `b1caf72555bc6f0551f32235952b59a90211a6dd`. Frontend revisions: `65f7d82eda2a4a5f626a4bc02d4a48f4092815c9` and `1bcdae3548edfcf1a9d7eb11d5c14a50ad0d1df0`.

The backend's create/edit routes return the `EditablePage` source. Monaco and AI changes update that same component, and the WebContainer hook writes it into a fixed Vite shell. Image generation produces separate raster assets that can be selected for the page.

## WordPress publication is a lossy authority transfer

The publish route converts the generated site to HTML, uploads referenced images into the WordPress media library and creates a published post through the WordPress API. The resulting post is a delivery copy: later WordPress edits do not flow back into `EditablePage`, and later builder edits are not published automatically.

## Recovery limit

No project database or version ledger is established in this lineage. The current browser source and downloaded/published copies can diverge, so publication is not a substitute for editor recovery.

## Pinned evidence

- [Backend repository](https://github.com/apexneural-akshaay/WordPress-backend)
- [Creation, editing and publishing routes](https://github.com/apexneural-akshaay/WordPress-backend/blob/b1caf72555bc6f0551f32235952b59a90211a6dd/routes/generate_code.py)
- [WordPress publisher](https://github.com/apexneural-akshaay/WordPress-backend/blob/b1caf72555bc6f0551f32235952b59a90211a6dd/utils/wordpress_publisher.py)
- [Frontend repository](https://github.com/apexneural-akshaay/WordPress-frontend)
- [WebContainer hook](https://github.com/apexneural-akshaay/WordPress-frontend/blob/65f7d82eda2a4a5f626a4bc02d4a48f4092815c9/src/hooks/useWebContainer.js)
