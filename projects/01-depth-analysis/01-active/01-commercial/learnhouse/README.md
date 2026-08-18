# LearnHouse

LearnHouse treats design as the act of authoring **executable interactive
artifacts**, not static pictures: its design object is generated HTML whose
behavior still runs, and "done" means the artifact is saved and published
inside a course platform. Generation is one step in a longer loop whose final
authority is a saveable, publishable platform object.

The core mutation is **iterative over the current artifact rather than from
empty**. At the pinned commit, the playground generator streams HTML and can
receive the current document during a revision, while Redis-backed session
state preserves generation context instead of throwing it away between turns
— so each change builds on what exists. The playground editor closes the
loop: it previews the result, lets the human change the source directly, and
saves it. Because the outcome stays executable rather than collapsing to a
screenshot, the design and its behavior remain the same object.
[Playground generation service](https://github.com/learnhouse/learnhouse/blob/f18d05be5991917a4e870a8ba15985567beaada3/apps/api/src/services/playgrounds/playgrounds_generator.py) ·
[Playground editor](https://github.com/learnhouse/learnhouse/blob/f18d05be5991917a4e870a8ba15985567beaada3/apps/web/components/Playground/PlaygroundEditor.tsx)

LearnHouse also carries durable boards with collaborative infrastructure and
AI "magic block" routes, a separate surface sharing the same application and
ownership boundary. Combined, the platform's answer to design is: make
something that can be edited, re-run and published as a maintained course
object — with the executable document as the persistent artifact and
generation as a revisable input to it.
[AI magic blocks](https://github.com/learnhouse/learnhouse/blob/f18d05be5991917a4e870a8ba15985567beaada3/apps/api/src/services/ai/magicblocks.py) ·
[Board persistence](https://github.com/learnhouse/learnhouse/blob/f18d05be5991917a4e870a8ba15985567beaada3/apps/api/src/db/boards.py)
