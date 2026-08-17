# Synapse App Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Synapse is not merely an AI page prompt inside GrapesJS. Its model proposes a typed application plan that can span data, state, behavior, automation and visual pages; only a validated plan is allowed to mutate the managed application.

## BuildPlan is the cross-domain artifact proposal

[`BuildPlan.php`](https://github.com/andrecorugda/synapse-app-builder/blob/76babfa39ed9a0f594f95c1933fabc49daf7eccf/src/Ai/BuildPlan.php) defines collections, states, functions, flows, watchers, pages, partials and application settings. [`AppBuilderService.php`](https://github.com/andrecorugda/synapse-app-builder/blob/76babfa39ed9a0f594f95c1933fabc49daf7eccf/src/Ai/AppBuilderService.php) joins the user's brief with live application context and prior conversation before calling the configured gateway.

## Validation separates proposal from mutation

[`BuildPlanValidator.php`](https://github.com/andrecorugda/synapse-app-builder/blob/76babfa39ed9a0f594f95c1933fabc49daf7eccf/src/Ai/BuildPlanValidator.php) checks slugs, field types, state and runtime types, flow triggers, node vocabulary, pages and home-page consistency before application. [`BuildPlanApplier.php`](https://github.com/andrecorugda/synapse-app-builder/blob/76babfa39ed9a0f594f95c1933fabc49daf7eccf/src/Ai/BuildPlanApplier.php) is the explicit write boundary into durable records.

## Visual editing remains one view of a larger graph

GrapesJS manages page components and styling while Filament resources expose collections, functions, flows and configuration. Page revisions preserve visual changes, but the managed app project—not the canvas alone—is authoritative. The AI gateway is optional for manual building yet required for model-generated plans.

## Pinned evidence

- [Canonical repository](https://github.com/andrecorugda/synapse-app-builder)
- [Page revision model](https://github.com/andrecorugda/synapse-app-builder/blob/76babfa39ed9a0f594f95c1933fabc49daf7eccf/src/Models/PageRevision.php)
- [Inspected tree](https://github.com/andrecorugda/synapse-app-builder/tree/76babfa39ed9a0f594f95c1933fabc49daf7eccf)
- Commit: `76babfa39ed9a0f594f95c1933fabc49daf7eccf`
