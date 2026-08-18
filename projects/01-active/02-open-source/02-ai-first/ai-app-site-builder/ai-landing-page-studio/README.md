# AI Landing Page Studio

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AI Landing Page Studio defines a comparatively strict product domain around generation: workspace-scoped pages, provider credentials, assets, immutable versions, draft versus published state, domains, and a public renderer.

## Generation enters a versioned domain model

[`LandingPageGenerationService.java`](https://github.com/adityadp12/AI-Landing-Page-Studio/blob/a7980b46407ce3ead062276ecebbe3f9942dd26c/apps/api/src/main/java/com/landingstudio/api/generation/LandingPageGenerationService.java) coordinates provider output and generation records. [`OpenAiLandingPageProvider.java`](https://github.com/adityadp12/AI-Landing-Page-Studio/blob/a7980b46407ce3ead062276ecebbe3f9942dd26c/apps/api/src/main/java/com/landingstudio/api/generation/OpenAiLandingPageProvider.java) is the concrete model path.

## Versions encode release intent

[`LandingPage.java`](https://github.com/adityadp12/AI-Landing-Page-Studio/blob/a7980b46407ce3ead062276ecebbe3f9942dd26c/apps/api/src/main/java/com/landingstudio/api/domain/LandingPage.java) owns status and current references; [`LandingPageVersion.java`](https://github.com/adityadp12/AI-Landing-Page-Studio/blob/a7980b46407ce3ead062276ecebbe3f9942dd26c/apps/api/src/main/java/com/landingstudio/api/domain/LandingPageVersion.java) makes draft and published content immutable historical objects. Publication is therefore an explicit promotion rather than a side effect of generation.

## The renderer consumes published authority

[`PublicPageRenderer.java`](https://github.com/adityadp12/AI-Landing-Page-Studio/blob/a7980b46407ce3ead062276ecebbe3f9942dd26c/apps/api/src/main/java/com/landingstudio/api/publicrender/PublicPageRenderer.java) renders released versions. [`project-studio.tsx`](https://github.com/adityadp12/AI-Landing-Page-Studio/blob/a7980b46407ce3ead062276ecebbe3f9942dd26c/apps/dashboard/src/components/project-studio.tsx) joins generation, sandbox preview, code editing, assets, and publish actions in the user surface.

## Pinned evidence

- [Repository](https://github.com/adityadp12/AI-Landing-Page-Studio)
- [Inspected tree](https://github.com/adityadp12/AI-Landing-Page-Studio/tree/a7980b46407ce3ead062276ecebbe3f9942dd26c)
- Commit: `a7980b46407ce3ead062276ecebbe3f9942dd26c`
