# WebLy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WebLy treats the current HTML string inside a frame as the website artifact. The model is useful only insofar as its streamed response becomes that source and survives later direct manipulation.

## A frame is both preview and persistence boundary

[`PlayGroundContent.tsx`](https://github.com/AyushmanGupta21/WebLy/blob/a350c50f53fbd0b51cec3cd1c92b57b6bc4b7d01/app/playground/%5BprojectId%5D/PlayGroundContent.tsx) sends the initial brief or the current design plus a correction to an OpenRouter-backed streaming route. It accumulates the returned HTML and writes the accepted string to the frame API. [`WebsiteDesign.tsx`](https://github.com/AyushmanGupta21/WebLy/blob/a350c50f53fbd0b51cec3cd1c92b57b6bc4b7d01/app/playground/_components/WebsiteDesign.tsx) projects that string into an iframe and serializes user-edited iframe markup back into the same frame record.

This makes `frame.designCode` authoritative rather than the chat transcript or rendered DOM alone. [`frames/route.ts`](https://github.com/AyushmanGupta21/WebLy/blob/a350c50f53fbd0b51cec3cd1c92b57b6bc4b7d01/app/api/frames/route.ts) stores source separately from chat messages while [`WebPageTools.tsx`](https://github.com/AyushmanGupta21/WebLy/blob/a350c50f53fbd0b51cec3cd1c92b57b6bc4b7d01/app/playground/_components/WebPageTools.tsx) turns the accepted source into a downloadable HTML file.

## Evidence

- [Canonical repository](https://github.com/AyushmanGupta21/WebLy)
- [Inspected tree](https://github.com/AyushmanGupta21/WebLy/tree/a350c50f53fbd0b51cec3cd1c92b57b6bc4b7d01)
- [Live product](https://web-ly.vercel.app/)
- Commit: `a350c50f53fbd0b51cec3cd1c92b57b6bc4b7d01`
