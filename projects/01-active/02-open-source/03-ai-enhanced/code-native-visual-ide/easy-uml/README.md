# Easy UML

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Easy UML uses AI only to cross the natural-language-to-DSL boundary. Parsing, layout, editing, and SVG rendering then happen locally in the browser.

## Eleven small languages instead of one opaque model

Each supported diagram family has a constrained textual representation: indented trees, sequence statements, SQL DDL, or purpose-specific line formats. DeepSeek turns a request into that representation. Local parsers convert it into positioned SVG objects, which users can drag, zoom, and edit.

## The privacy boundary is split

The prompt and generated text travel to the configured model endpoint, while parsing and layout remain client-side. The user's API key is stored locally. This is not equivalent to a fully offline product, but it avoids sending the entire editor runtime to a proprietary rendering service.

## SVG is editable output, not the only authority

PNG and SVG exports are delivery forms. The diagram DSL retains more semantic structure for regeneration, while direct SVG manipulation supports correction in the current session. The source does not establish shared project history or multi-user merge semantics.

## Pinned evidence

- Repository: [LilZeeCN/easy-uml](https://github.com/LilZeeCN/easy-uml)
- Inspected browser implementation: [`3e2f9a7f83fc954333a856697fe8c61d5f501a0d`](https://github.com/LilZeeCN/easy-uml/tree/3e2f9a7f83fc954333a856697fe8c61d5f501a0d)
- Immutable revision: [commit `3e2f9a7`](https://github.com/LilZeeCN/easy-uml/commit/3e2f9a7f83fc954333a856697fe8c61d5f501a0d)
