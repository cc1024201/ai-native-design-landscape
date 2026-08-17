# Backdraft

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

| Field | Value |
|---|---|
| Team | Backdraft · operating region not established |
| Surface | macOS desktop and web code-native visual editor |
| Authority | existing HTML CSS React Tailwind and TypeScript source files |
| Writer | deterministic CST patches for visual edits; bounded file operations for agent edits |
| Lifecycle | active |

## The source file is not an export target

Backdraft opens an existing project folder and renders pages as tiles on a spatial canvas. Selecting and moving a visual element updates the corresponding CSS or JSX; changing the code updates every affected tile. Its documentation explicitly distinguishes this from generation into a proprietary design model.

The decisive implementation claim is Concrete Syntax Tree patching. A visual edit targets the existing syntax while retaining surrounding routing state API calls business logic and source formatting instead of regenerating the whole component. That makes the canvas a live projection of source authority.

## Agent loop adds evidence to mutation

The integrated agent can read and search project files make bounded multi-file changes and capture screenshots at selected viewports. Tiles rebuild after edits so layout regressions can be observed before a Git commit. An annotation queue gives the agent exact visual targets; CLI agents such as Claude Code Codex and Gemini CLI can be run from the same chat surface.

```text
source files -> parse/render -> spatial canvas
     ^                            |
     |------ CST visual patch ----|
     |------ agent file edit + screenshot verification
```

Figma and Webflow imports materialize into editable source. GitHub commits Netlify deployment and a local dev server advance those same files; there is no separate export stage for normal shipping.

## Evidence boundary

The product implementation is closed. Documentation establishes CST behavior and source authority but not the exact parser libraries patch conflict rules or persistence database.

## Primary evidence

- [Backdraft product surface](https://backdraftai.com/)
- [Backdraft documentation](https://backdraftai.com/docs.html)
- [Bidirectional editing mechanism](https://backdraftai.com/bidirectional-code-design)
- [Backdraft feature and agent surface](https://backdraftai.com/features)
