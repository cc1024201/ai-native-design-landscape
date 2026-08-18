# Backdraft

Backdraft answers "what is design" by pointing at the source files that already exist in a project folder. Existing HTML, CSS, React, Tailwind and TypeScript are the authority; the canvas is only a live projection of them. The documentation is explicit that this is not generation into a proprietary design model — there is no separate artifact to export from. The design **is** the code, and the editor's job is to make editing that code feel visual.

## The canvas is a projection; the Concrete Syntax Tree is the writer

The decisive mechanism is CST patching. A visual edit targets the existing syntax — its exact tree nodes — and rewrites only the corresponding CSS or JSX, preserving surrounding routing, API calls, business logic and source formatting instead of regenerating the whole component. Selecting and moving an element updates the underlying source; changing the code rebuilds every affected tile. Because edits are patches into the live syntax tree, the projection and the source cannot drift the way a generated model's output can. [Bidirectional code–design mechanism](https://backdraftai.com/bidirectional-code-design)

## The agent adds bounded mutation plus visual verification

Beyond direct visual patching, an integrated agent reads and searches project files, makes bounded multi-file changes and captures screenshots at chosen viewports. Tiles rebuild so layout regressions are visible before any Git commit, and an annotation queue hands the agent exact visual targets. External CLI agents — Claude Code, Codex, Gemini CLI — can be run from the same chat surface, all converging on the same source files. [Feature and agent surface](https://backdraftai.com/features)

```text
source files -> parse/render -> spatial canvas
     ^                            |
     |------ CST visual patch ----|
     |------ agent file edit + screenshot verification
```

Figma and Webflow imports materialize into editable source rather than a parallel object graph, and GitHub commits, Netlify deploys and the local dev server all advance those same files — there is no separate export stage for normal shipping. [Docs](https://backdraftai.com/docs.html)

The implementation is closed, so this stays at the architecture level: documentation establishes the CST behavior and source authority, but not the exact parser libraries, patch conflict rules, or persistence database. [Product surface](https://backdraftai.com/)
