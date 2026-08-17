# Local Design Canvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Local Design Canvas is a filesystem bridge between Claude Code and a browser design gallery. Claude reads neighboring product repositories writes standalone HTML candidates and can receive revision prompts from the canvas without the browser pretending to host the model.

## A file watcher closes the loop

At commit [`4b8ea79`](https://github.com/nguyenyenlinh03/Claude_Design/tree/4b8ea79be370245f694441cdec375b504236f33f) `design.config.json` declares context projects and an output directory. The [`/design` command](https://github.com/nguyenyenlinh03/Claude_Design/blob/4b8ea79be370245f694441cdec375b504236f33f/.claude/commands/design.md) directs Claude to produce or revise HTML. The server watches those files and the canvas live-reloads the changed card.

Prompts submitted in the browser enter `prompts/inbox.jsonl`; a running Claude Code session explicitly monitors that queue. Attachments are written to disk and per-design prompts identify the target file so revisions overwrite the intended candidate. Replies and clarification questions return through an API-backed chat pane.

```text
browser prompt -> JSONL inbox -> Claude Code -> HTML source -> watcher -> canvas
```

The generated HTML is source authority and can later be applied to another repository only after an explicit user request. The model runtime is external and must be started separately. Public evidence did not establish the maintainer region.

## Pinned evidence

- [Canvas application](https://github.com/nguyenyenlinh03/Claude_Design/blob/4b8ea79be370245f694441cdec375b504236f33f/canvas/src/App.jsx)
- [Design guidelines](https://github.com/nguyenyenlinh03/Claude_Design/blob/4b8ea79be370245f694441cdec375b504236f33f/prompts/design-guidelines.md)
- [Pinned README](https://github.com/nguyenyenlinh03/Claude_Design/blob/4b8ea79be370245f694441cdec375b504236f33f/README.md)
