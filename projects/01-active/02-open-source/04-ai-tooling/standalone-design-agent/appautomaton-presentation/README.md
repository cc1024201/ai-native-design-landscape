# App Automaton Presentation

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

App Automaton Presentation is a four-skill production system rather than one monolithic slide prompt. A consultant skill owns the argument, a brand-system skill owns identity, and separate PDF and PPT skills materialize the same upstream decisions in different artifact forms.

## Plain-file handoffs are the orchestration layer

The consultant writes a storyboard describing what every slide must prove. Brand work produces `brand-brief.md` and `identity.js`. The PDF route uses HTML and Playwright for pixel-controlled output; the PPT route maps a grid and slot-budget contract to native `pptxgenjs` objects.

That split makes the storyboard and identity durable cross-renderer inputs. A PDF is the fixed visual delivery; an editable PPTX is a separate native graph, not a PDF wrapped in Office. Because each skill can run alone, the repository is best understood as one composable presentation suite with four internal components rather than four unrelated products.

- [Pinned repository](https://github.com/appautomaton/presentation/tree/478a912386108fdf737642463407b02ef237d093)
- [PPT production skill](https://github.com/appautomaton/presentation/blob/478a912386108fdf737642463407b02ef237d093/deck-design-ppt/SKILL.md)
- [Brand-system skill](https://github.com/appautomaton/presentation/blob/478a912386108fdf737642463407b02ef237d093/brand-system/SKILL.md)
- [Organization profile checked; no location published](https://github.com/appautomaton)
