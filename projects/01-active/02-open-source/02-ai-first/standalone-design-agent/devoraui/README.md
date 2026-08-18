# DevoraUI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DevoraUI connects AI component creation to a reusable component-library release path. That publication step makes its definition of design system work materially different from a transient preview generator.

## BYOK generation produces library-shaped source

[aiComponent.controller.js](https://github.com/prit-zalavadiya-78/DevoraUI/blob/cea44b0d8a5b097e190548622ac6d44707202017/server/controllers/aiComponent.controller.js) submits the brief through OpenRouter and returns component code. The user-supplied key is part of the provider boundary; no evidence supports treating unconfigured output as equivalent provider authorship.

## Mongo records components as named assets

[component.model.js](https://github.com/prit-zalavadiya-78/DevoraUI/blob/cea44b0d8a5b097e190548622ac6d44707202017/server/models/component.model.js) stores name code props owner visibility and publication metadata. The component record is current authority; there is no separate historical revision model.

## Governance culminates in a package

[LiveComponentPreview.jsx](https://github.com/prit-zalavadiya-78/DevoraUI/blob/cea44b0d8a5b097e190548622ac6d44707202017/client/src/components/LiveComponentPreview.jsx) runs sanitized source through react-live. For administrators [component.controller.js](https://github.com/prit-zalavadiya-78/DevoraUI/blob/cea44b0d8a5b097e190548622ac6d44707202017/server/controllers/component.controller.js) writes the approved component into the library index then builds and publishes the npm package. Preview selection and governed delivery therefore meet at the saved record.

## Evidence

- [Canonical repository](https://github.com/prit-zalavadiya-78/DevoraUI)
- [Inspected tree](https://github.com/prit-zalavadiya-78/DevoraUI/tree/cea44b0d8a5b097e190548622ac6d44707202017)
- Commit: cea44b0d8a5b097e190548622ac6d44707202017
