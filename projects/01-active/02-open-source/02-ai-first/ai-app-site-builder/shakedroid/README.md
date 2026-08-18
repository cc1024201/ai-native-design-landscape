# Shakedroid

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Shakedroid is a materially extended Shakespeare distribution aimed at Android application delivery. It keeps Shakespeare's browser-owned project repository and AI editing loop, then adds an APK build target and browser-side signing machinery. The unchanged upstream README obscures that distinction; the repository identity and source delta establish it.

## The fork inherits a complete browser source workspace

Pinned revision: `a3a019a1fd24b8f618eed1d70464f2bfe7411dcd`.

Projects still live in LightningFS/IndexedDB, use isomorphic-git for history and synchronization, and compile through the in-browser esbuild pipeline. Agent tools read and replace actual project files, while the preview consumes compiled output. Compared with the pinned Shakespeare tree, Shakedroid shares 589 paths but changes 199 common files and adds 25 more; this is not a renamed one-file mirror.

## Android delivery is a separate artifact stage

The new APK Builder adapter requires an existing `dist/index.html`, packages the compiled tree, sends it with app name, package id and build type to a configurable Capacitor build service, polls the job and retrieves an APK. The project repository remains the editable authority; the APK is a produced delivery artifact.

Shakedroid also implements local keystore import/export and APK v1/v2 signing. Its signing path rewrites the ZIP signature entries, aligns the package and inserts an Android signing block before returning a downloadable blob. Signing credentials and the source project therefore have different lifecycles, and rebuilding an APK does not create a new source version unless the user also commits the project.

## Why this is counted apart from Shakespeare

The core conversational design definition is inherited, but the ordinary-user outcome changes from a browser-deployed web application to an installable and signable Android package. Marlowe and the Shakespeare deployment mirror retain the upstream artifact boundary and are consolidated into Shakespeare; Shakedroid crosses it with implemented mobile-release machinery and is recorded as a derived product lineage.

## Pinned evidence

- [Repository](https://github.com/derekross/shakedroid)
- [APK build-service adapter](https://github.com/derekross/shakedroid/blob/a3a019a1fd24b8f618eed1d70464f2bfe7411dcd/src/lib/deploy/APKBuilderAdapter.ts)
- [Browser-side APK signing](https://github.com/derekross/shakedroid/blob/a3a019a1fd24b8f618eed1d70464f2bfe7411dcd/src/lib/apk/signing.ts)
- [Keystore boundary](https://github.com/derekross/shakedroid/blob/a3a019a1fd24b8f618eed1d70464f2bfe7411dcd/src/lib/apk/keystore.ts)
- [Inherited project and Git authority](https://github.com/derekross/shakedroid/blob/a3a019a1fd24b8f618eed1d70464f2bfe7411dcd/src/lib/ProjectsManager.ts)
- [In-browser build output](https://github.com/derekross/shakedroid/blob/a3a019a1fd24b8f618eed1d70464f2bfe7411dcd/src/lib/build/index.ts)
