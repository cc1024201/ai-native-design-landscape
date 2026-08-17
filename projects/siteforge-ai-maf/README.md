# SiteForge AI by Maf-Kelvin

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This SiteForge implementation uses a structured website bundle as its correction boundary. The model returns HTML, CSS, JavaScript and descriptive metadata; the server normalizes those fields into the full document used by the rest of the workspace.

## Structured generation is normalized before use

[`server/index.js`](https://github.com/Maf-Kelvin/ai-website-generator/blob/e642c54952c731da4ed51a406fe19a1496cc85ff/server/index.js) constrains Groq's Llama response to JSON fields for source and metadata, parses the result and constructs `fullHtml` when necessary. Its refinement route includes the whole current bundle with a follow-up instruction and expects another complete bundle, making replacement explicit rather than pretending to apply an AST patch.

## Preview history and delivery have different durability

[`App.jsx`](https://github.com/Maf-Kelvin/ai-website-generator/blob/e642c54952c731da4ed51a406fe19a1496cc85ff/src/App.jsx) renders `fullHtml` in an iframe and exposes the current source alongside it. A five-entry history lives only in React state and is not a durable project or version store. ZIP delivery writes the full document plus separate CSS, JavaScript and README files, so export survives even though workspace history does not.

## Evidence

- [Canonical repository](https://github.com/Maf-Kelvin/ai-website-generator)
- [Inspected tree](https://github.com/Maf-Kelvin/ai-website-generator/tree/e642c54952c731da4ed51a406fe19a1496cc85ff)
- Commit: `e642c54952c731da4ed51a406fe19a1496cc85ff`
