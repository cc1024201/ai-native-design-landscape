# SEO Image Renamer

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

SEO Image Renamer is a narrow Figma delivery agent: it looks at selected image pixels, proposes a semantic filename, and writes that decision into the layer name that Figma later uses during ordinary export.

## A small mutation can be the durable design decision

```mermaid
flowchart LR
    S["Selected image layers"] --> D["Downscaled pixels"]
    D --> M["Claude or GPT-4o vision"]
    M --> N["Descriptive filename candidate"]
    N --> F["Figma layer rename"]
    F --> E["Ordinary asset export and developer handoff"]
```

The visual composition is not regenerated. The model supplies semantics for delivery: a name such as a generic frame identifier becomes a content-addressable description for photo libraries, screenshots, illustrations or developer handoff. Figma's native graph remains authoritative because the accepted text is persisted as the layer name and standard export consumes it.

## Privacy and semantic authority are coupled

The creator says the user chooses Claude or GPT-4o, brings the corresponding API key, and sends a downscaled image directly to that provider. The key remains local and no intermediary product server is used. That is a useful boundary, but it does not mean the pixels remain local.

The public contract does not document prompt structure, collision handling, filename normalization, batch retries, review-before-write behavior, accessibility context or provider retention settings. A visually accurate noun phrase can still be a poor SEO name or expose sensitive content, so the native rename is an auditable proposal that needs human review.

## Primary evidence

- [Creator release and complete workflow](https://forum.figma.com/showcase-your-work-14/new-plugin-seo-image-renamer-rename-exported-images-based-on-what-s-actually-in-the-picture-55874)
- [Figma Community plugin 1655043623186594415](https://www.figma.com/community/plugin/1655043623186594415)

No public source repository, stable maintainer identity beyond the creator handle, or first-party team-location evidence was found.
