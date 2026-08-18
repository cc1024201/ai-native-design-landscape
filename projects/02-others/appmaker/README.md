# AppMaker

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

AppMaker deliberately treats a small app as one self-contained HTML document rather than a repository. A user can generate without an account; signing in makes that document durable and enables prompt-based refinement.

## The file-shaped JSON is narrower than it looks

Pinned revision: `ca36f5e2021a0560886e9418c2bcd09f6b597102`.

`generated_code` has a general `{ entry, files }` envelope but the current implementation always packs one `index.html`. The iframe, copy action and download all read that same entry, so there is no hidden runtime representation to reconcile.

## History records intent rather than restorable source

Refinement replaces `apps.generated_code` and appends an `iterations` row containing prompt, provider, model and duration. The history page therefore explains how the current app was reached but cannot restore old HTML: the iteration record has no code snapshot. This is audit continuity, not version control.

## Delivery is the authority escape hatch

The durable Supabase row is current authority while signed in. Copy, new-tab preview and `.html` download let the user take the exact current document outside the service.

## Pinned evidence

- [Repository](https://github.com/philipposk/AppMaker-vibecode)
- [Artifact envelope](https://github.com/philipposk/AppMaker-vibecode/blob/ca36f5e2021a0560886e9418c2bcd09f6b597102/src/lib/appmaker-db.ts)
- [Generate and refine persistence](https://github.com/philipposk/AppMaker-vibecode/blob/ca36f5e2021a0560886e9418c2bcd09f6b597102/src/app/api/generate/route.ts)
- [History projection](https://github.com/philipposk/AppMaker-vibecode/blob/ca36f5e2021a0560886e9418c2bcd09f6b597102/src/app/my-apps/%5Bid%5D/page.tsx)
- [Preview and export surface](https://github.com/philipposk/AppMaker-vibecode/blob/ca36f5e2021a0560886e9418c2bcd09f6b597102/src/components/AppEditor.tsx)
