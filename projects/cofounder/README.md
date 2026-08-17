# Cofounder

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Cofounder is an early-alpha local full-stack application generator. Instead of jumping from a brief directly to one code blob it builds product documents UX architecture backend contracts a structured visual-layout layer and versioned React views before exporting a runnable application.

## Project state is addressed by semantic operations

[`project.js`](https://github.com/nraiden/cofounder/blob/19ba19f61737d654493175208df468395e2193f4/cofounder/api/system/functions/op/project.js) maps named operations such as product requirements UX sitemap database schema backend server layout and React view to paths inside a project-state tree. View records carry explicit `{id}/{version}` coordinates and a preference record chooses which version the exported app consumes.

## Layout is an intermediate Design artifact

The [`layoutv1` designer](https://github.com/nraiden/cofounder/blob/19ba19f61737d654493175208df468395e2193f4/cofounder/api/system/functions/designer/layoutv1.js) asks a model to reason over a product view and a primitive ontology then emit an SVG layout made of bounded semantic rectangles. The render operation turns that SVG into an image for reference. This is a structured design checkpoint rather than a screenshot-only generator.

## Architecture grounds code generation

[`ux/sitemap.js`](https://github.com/nraiden/cofounder/blob/19ba19f61737d654493175208df468395e2193f4/cofounder/api/system/functions/ux/sitemap.js) materializes unique and shared views plus cross-links. [`webapp/view.js`](https://github.com/nraiden/cofounder/blob/19ba19f61737d654493175208df468395e2193f4/cofounder/api/system/functions/webapp/view.js) generates each React view against product documents backend specifications global state and the chosen layout direction.

## Export makes versions executable

Project operations write backend specifications SQL server code React state roots versioned view components and layout images into an ordinary application directory. Placeholder imports are resolved through Cofounder's Vite integration and users can invoke component iteration from the running app. Files become the delivery authority while the local state tree preserves upstream rationale and alternatives.

## Maturity boundary

The repository explicitly labels itself unstable early alpha and identifies major iteration and validation modules as incomplete. The mechanisms above are implemented but should not be read as a production-reliability claim.

## Pinned evidence

- [Repository](https://github.com/nraiden/cofounder)
- [Inspected tree](https://github.com/nraiden/cofounder/tree/19ba19f61737d654493175208df468395e2193f4)
- [Project site](https://cofounder.openinterface.ai/)
- Commit: `19ba19f61737d654493175208df468395e2193f4`
