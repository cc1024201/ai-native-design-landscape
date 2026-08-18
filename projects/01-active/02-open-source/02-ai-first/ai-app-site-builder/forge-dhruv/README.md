# Forge by Dhruv Bansal

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Dhruv's Forge is kept separate from the Piyush tutorial cluster because its source defines a different project protocol: validated planning and file generation are followed by explicit modify repair and immutable version-restore endpoints.

## Generation is a bounded project transition

[generate/route.ts](https://github.com/dhruvb2028/AI-App-Builder/blob/9f9fb99b5c301e35392f42dcec80e644575c65e9/app/api/projects/%5BprojectId%5D/generate/route.ts) advances a named project through generation while validating planned files. The API contract makes project status and accepted file graph explicit.

## Modify and repair are different operations

[modify/route.ts](https://github.com/dhruvb2028/AI-App-Builder/blob/9f9fb99b5c301e35392f42dcec80e644575c65e9/app/api/projects/%5BprojectId%5D/modify/route.ts) applies requested changes to existing authority. [repair/route.ts](https://github.com/dhruvb2028/AI-App-Builder/blob/9f9fb99b5c301e35392f42dcec80e644575c65e9/app/api/projects/%5BprojectId%5D/repair/route.ts) handles invalid or broken artifacts as a separately represented recovery path.

## Complete versions can be promoted back to current

[versions/route.ts](https://github.com/dhruvb2028/AI-App-Builder/blob/9f9fb99b5c301e35392f42dcec80e644575c65e9/app/api/projects/%5BprojectId%5D/versions/route.ts) exposes saved versions and [restore/route.ts](https://github.com/dhruvb2028/AI-App-Builder/blob/9f9fb99b5c301e35392f42dcec80e644575c65e9/app/api/projects/%5BprojectId%5D/versions/%5BversionId%5D/restore/route.ts) restores a selected graph. Preview and export routes consume the promoted project files rather than an unrelated rendering cache.

## Evidence

- [Canonical repository](https://github.com/dhruvb2028/AI-App-Builder)
- [Inspected tree](https://github.com/dhruvb2028/AI-App-Builder/tree/9f9fb99b5c301e35392f42dcec80e644575c65e9)
- Commit: 9f9fb99b5c301e35392f42dcec80e644575c65e9
