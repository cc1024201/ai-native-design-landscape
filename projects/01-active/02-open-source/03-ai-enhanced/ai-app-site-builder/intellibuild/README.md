# IntelliBuild

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

IntelliBuild is a browser-local dual-mode website builder. Gemini writes one HTML document; the code editor, live preview and DOM-based drag reordering all feed changes back into that same string.

## Visual moves rewrite source

[`VisualEditor.jsx`](https://github.com/upendra-coder/Intellibuild/blob/02b2fec04f127e50d5d3197c6dd768110f7b2b35/src/components/Editor/VisualEditor.jsx) parses the HTML into React, makes supported elements draggable, then applies a drop by moving the corresponding source DOM node and serializing the full document. This is not an independent component graph: HTML remains authority and the visual surface is an editor projection.

```text
brief/chat -> Gemini HTML -> code editor + live preview
-> DOM drag reorder -> serialized HTML
-> localStorage project autosave -> ZIP -> Netlify deploy API
```

[`useProjectManager.js`](https://github.com/upendra-coder/Intellibuild/blob/02b2fec04f127e50d5d3197c6dd768110f7b2b35/src/hooks/useProjectManager.js) persists multiple projects in localStorage. [`useDeployment.js`](https://github.com/upendra-coder/Intellibuild/blob/02b2fec04f127e50d5d3197c6dd768110f7b2b35/src/hooks/useDeployment.js) packages the current document and calls Netlify. Visual editing is limited to reordering elements with usable IDs; arbitrary property editing and server recovery are not established.

No license file or reliable maintainer-region evidence was found.

## Sources

- [Pinned repository](https://github.com/upendra-coder/Intellibuild/tree/02b2fec04f127e50d5d3197c6dd768110f7b2b35)
- [Gemini client](https://github.com/upendra-coder/Intellibuild/blob/02b2fec04f127e50d5d3197c6dd768110f7b2b35/src/services/gemini.js)
- [HTML parser](https://github.com/upendra-coder/Intellibuild/blob/02b2fec04f127e50d5d3197c6dd768110f7b2b35/src/utils/codeParser.js)
