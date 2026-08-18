# Cofounder

Cofounder treats design as a staged, inspectable corridor instead of a single prompt-to-code jump. The product brief does not become a blob; it is decomposed into product requirements, UX sitemap, backend contracts, a structured visual-layout layer and versioned React views that only then export a runnable application. Design, in Cofounder's own vocabulary, is the intermediate material the model reasons over before any code is authoritative.

## Project state is addressed by semantic operations

The decisive mechanism is a project-state tree that named operations mutate rather than free-form file writes. [`project.js`](https://github.com/nraiden/cofounder/blob/19ba19f61737d654493175208df468395e2193f4/cofounder/api/system/functions/op/project.js) maps operations such as product requirements, UX sitemap, database schema, backend server, layout and React view to paths inside that tree. Every view record carries explicit `{id}/{version}` coordinates, and a preference record decides which version the exported app actually consumes. The machine does not own a canvas; it owns a versioned semantic graph.

## Layout is an intermediate Design artifact

The [`layoutv1` designer](https://github.com/nraiden/cofounder/blob/19ba19f61737d654493175208df468395e2193f4/cofounder/api/system/functions/designer/layoutv1.js) asks the model to reason over a product view and a primitive ontology, then emit an SVG layout made of bounded semantic rectangles; a render operation turns that SVG into an image for reference. This is a structured design checkpoint with documented intent, not a screenshot that just happens to be generated.

## Architecture grounds code generation

[`ux/sitemap.js`](https://github.com/nraiden/cofounder/blob/19ba19f61737d654493175208df468395e2193f4/cofounder/api/system/functions/ux/sitemap.js) materializes unique and shared views plus cross-links, and [`webapp/view.js`](https://github.com/nraiden/cofounder/blob/19ba19f61737d654493175208df468395e2193f4/cofounder/api/system/functions/webapp/view.js) generates each React view against product documents, backend specs, global state and the chosen layout direction. The Artifact is therefore produced inside a lattice of earlier decisions, not in isolation.

Export resolves placeholder imports through Vite and lets users invoke component iteration from the running app. Files become the delivery authority while the local state tree preserves the upstream rationale and the rejected alternatives. The repository labels itself unstable early alpha, so these are implemented mechanisms, not a production-reliability claim. [Evidence: nraiden/cofounder @ 19ba19f6](https://github.com/nraiden/cofounder) · [project site](https://cofounder.openinterface.ai/)
