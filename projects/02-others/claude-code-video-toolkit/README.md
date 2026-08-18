# Claude Code Video Toolkit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claude Code Video Toolkit defines AI video design as a production workspace whose intermediate decisions remain files. Claude Code supplies orchestration; the repository supplies the repeatable vocabulary of projects, commands, media tools, templates and review practices.

## The project directory is the edit model

`/video` creates or continues a project rather than returning only an MP4. Scripts, a video specification, narration, music, generated or recorded footage and Remotion source remain available for correction. The [toolkit registry](https://github.com/digitalsamba/claude-code-video-toolkit/blob/9826feb491cffe18367e85f6f759bffcfb93d3da/_internal/toolkit-registry.json) is the machine-readable inventory of capabilities; templates such as [SprintReview.tsx](https://github.com/digitalsamba/claude-code-video-toolkit/blob/9826feb491cffe18367e85f6f759bffcfb93d3da/templates/sprint-review-v2/src/SprintReview.tsx) turn those inputs into a deterministic composition.

```text
brief -> script + VIDEO-SPEC -> generated/recorded media
-> timed Remotion composition -> frame/audio review -> MP4
                  ^ source and assets remain editable
```

The toolkit mixes generative services with ordinary media machinery: voice and music generators, browser recording, alignment, pacing, FFmpeg and Remotion rendering. That composition is its defining technical bet. A failed visual does not require regenerating the whole film; the user or agent can replace one asset, change timing or patch the composition.

The final video is a delivery projection. Repository files are the recoverable authority and Git provides version history. The project is MIT-licensed. The organization profile reports Barcelona, Spain.

## Decisive evidence

- [Pinned repository](https://github.com/digitalsamba/claude-code-video-toolkit/tree/9826feb491cffe18367e85f6f759bffcfb93d3da)
- [Example video specification](https://github.com/digitalsamba/claude-code-video-toolkit/blob/9826feb491cffe18367e85f6f759bffcfb93d3da/projects/sprint-review-cho-oyu/VIDEO-SPEC.md)
- [Timing synchronizer](https://github.com/digitalsamba/claude-code-video-toolkit/blob/9826feb491cffe18367e85f6f759bffcfb93d3da/tools/sync_timing.py)
- [Playwright review guidance](https://github.com/digitalsamba/claude-code-video-toolkit/blob/9826feb491cffe18367e85f6f759bffcfb93d3da/_internal/reviews/playwright-review.md)
- [MIT license](https://github.com/digitalsamba/claude-code-video-toolkit/blob/9826feb491cffe18367e85f6f759bffcfb93d3da/LICENSE)
