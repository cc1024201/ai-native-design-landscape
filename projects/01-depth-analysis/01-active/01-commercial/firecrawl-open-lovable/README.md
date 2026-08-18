# Firecrawl Open Lovable

Firecrawl Open Lovable defines design as **reconstruction from observed evidence** — it treats the design as already existing somewhere on the web, and its act is to capture that evidence and turn it into editable React.

The loop starts from a URL, screenshot or prompt. Firecrawl routes scrape website content, screenshots and brand styles; generation routes then run inside an isolated Vercel or E2B sandbox. The product reads the sandbox files back, streams AI patches over them, detects packages and Vite errors against them, and renders the result as a live preview.

The distinctive mechanism is that **the sandbox is current authority, not durable history**. The ordinary loop operates on the live sandbox file set: kill/restart/resume routes manage the runtime, an `apply-ai-code-stream` route applies bounded source changes, and ZIP creation exports a copy.

There is no account-level project, build snapshot or version ledger in the inspected upstream — losing the sandbox without exporting can lose the continuing artifact. That makes this a deliberately thin reference implementation: design authority is a transient file tree, and persistence is a manual export handoff rather than a managed state service.

It complements the surrounding Firecrawl platform by demonstrating the evidence→sandbox→preview→patch loop as an open product, leaving the durable delivery model (a built artifact with its own history) to the separate Argus line.

[Evidence: pinned `69bd93ba`](https://github.com/firecrawl/open-lovable) · [site evidence route](https://github.com/firecrawl/open-lovable/blob/69bd93bae7a9c97ef989eb70aabe6797fb3dac89/app/api/scrape-url-enhanced/route.ts) · [streamed source apply](https://github.com/firecrawl/open-lovable/blob/69bd93bae7a9c97ef989eb70aabe6797fb3dac89/app/api/apply-ai-code-stream/route.ts) · [ZIP export](https://github.com/firecrawl/open-lovable/blob/69bd93bae7a9c97ef989eb70aabe6797fb3dac89/app/api/create-zip/route.ts)
