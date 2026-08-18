# Vibe Otter Lite

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Vibe Otter Lite is the inspectable educational distribution of the broader Vibe Otter product. It contains two deliberately small implementations: a real Claude-to-HTML preview and a hybrid GrapesJS canvas whose local generator inserts a deterministic starting section.

## The open hybrid demonstrates the handoff point

The [basic agent server](https://github.com/VibeOtter/VibeOtterLite/blob/53fb1291baa14deb2ac929b2ac558d30f33d1a03/1-basic-agent/server.js) sends a brief to Anthropic and extracts HTML for preview. The [hybrid server](https://github.com/VibeOtter/VibeOtterLite/blob/53fb1291baa14deb2ac929b2ac558d30f33d1a03/2-grapejs-hybrid/server.js) instead returns a safe local placeholder section. [`visual-editor.html`](https://github.com/VibeOtter/VibeOtterLite/blob/53fb1291baa14deb2ac929b2ac558d30f33d1a03/2-grapejs-hybrid/visual-editor.html) loads that section into GrapesJS, where the user can edit components and download combined HTML/CSS.

```text
brief -> Claude HTML preview                 (basic example)
brief -> deterministic section -> GrapesJS -> direct edit -> HTML export
                                                    (hybrid example)
```

The open source therefore proves both endpoints but not the full hosted product's claimed intelligence, project persistence or publishing. GrapesJS state is session-local and standalone HTML is the portable artifact. Counting this as `active-transition` preserves that distinction.

The project is Apache-2.0 licensed. No reliable team-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/VibeOtter/VibeOtterLite/tree/53fb1291baa14deb2ac929b2ac558d30f33d1a03)
- [Hybrid editor documentation](https://github.com/VibeOtter/VibeOtterLite/blob/53fb1291baa14deb2ac929b2ac558d30f33d1a03/2-grapejs-hybrid/README.md)
- [Apache-2.0 license](https://github.com/VibeOtter/VibeOtterLite/blob/53fb1291baa14deb2ac929b2ac558d30f33d1a03/LICENSE)
