# LearnHouse

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

LearnHouse uses AI to author interactive learning widgets, including diagrams and simulations, inside a course platform. Its key design object is executable HTML with a save-and-publish lifecycle.

## Generation is iterative over the current artifact

At [`f18d05be`](https://github.com/learnhouse/learnhouse/tree/f18d05be5991917a4e870a8ba15985567beaada3), the playground generator streams HTML and can receive the current document during revision. Redis-backed session state preserves generation context rather than starting every change from an empty prompt.

## Editor and publication complete the loop

The playground editor previews the result, lets the user change source and saves it as a platform object that can be published. The artifact is not restricted to screenshots; its behavior remains executable.

## Boards are a separate collaborative authority

LearnHouse also has durable boards with collaborative infrastructure and AI “magic block” routes. These are related surfaces inside one platform record rather than separate products because they share the same application and ownership boundary.

## Evidence

- [Pinned monorepo](https://github.com/learnhouse/learnhouse/tree/f18d05be5991917a4e870a8ba15985567beaada3)
- [Playground generation service](https://github.com/learnhouse/learnhouse/blob/f18d05be5991917a4e870a8ba15985567beaada3/apps/api/src/services/playgrounds/playgrounds_generator.py)
- [Playground editor](https://github.com/learnhouse/learnhouse/blob/f18d05be5991917a4e870a8ba15985567beaada3/apps/web/components/Playground/PlaygroundEditor.tsx)
- [AI magic blocks](https://github.com/learnhouse/learnhouse/blob/f18d05be5991917a4e870a8ba15985567beaada3/apps/api/src/services/ai/magicblocks.py)
- [Board persistence](https://github.com/learnhouse/learnhouse/blob/f18d05be5991917a4e870a8ba15985567beaada3/apps/api/src/db/boards.py)
