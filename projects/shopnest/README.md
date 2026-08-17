# ShopNest

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ShopNest is a structured AI website builder for local businesses. Instead of handing Gemini an unconstrained page request, it begins with a validated business brief and persists business data, section records, theme choice and media separately so editing and delivery remain deterministic.

## Business facts and sections survive regeneration

[`website.ts`](https://github.com/karanvirsingh011998/ai-website-builder/blob/01498ac9cea5b2ac19deba7f68339dcf0824363d/types/website.ts) validates contact information, hours, products, brand color and generated content. The wizard establishes that factual layer; Gemini creates typed hero, service, product, FAQ, testimonial and SEO values. Editor actions update one section, theme or brand color without replacing the whole site.

```text
business wizard -> validated brief -> Gemini section content
-> Supabase business/section/theme/media records -> React renderer
-> direct section/theme edits or scoped regeneration
-> publish / JSON roundtrip / static HTML+data ZIP
```

[`services/editor.ts`](https://github.com/karanvirsingh011998/ai-website-builder/blob/01498ac9cea5b2ac19deba7f68339dcf0824363d/services/editor.ts) implements section mutation, JSON import/export and portable source packaging. The ZIP contains rendered HTML plus the structured snapshot, preserving more recovery information than HTML alone. Supabase records are live authority; exported JSON is a transferable checkpoint.

No license file was present. The maintainer profile reports Chandigarh, India.

## Sources

- [Pinned repository](https://github.com/karanvirsingh011998/ai-website-builder/tree/01498ac9cea5b2ac19deba7f68339dcf0824363d)
- [Gemini integration](https://github.com/karanvirsingh011998/ai-website-builder/blob/01498ac9cea5b2ac19deba7f68339dcf0824363d/lib/ai/gemini.ts)
- [Editor server actions](https://github.com/karanvirsingh011998/ai-website-builder/blob/01498ac9cea5b2ac19deba7f68339dcf0824363d/actions/editor.ts)
- [Core tests](https://github.com/karanvirsingh011998/ai-website-builder/blob/01498ac9cea5b2ac19deba7f68339dcf0824363d/lib/__tests__/core.test.ts)
