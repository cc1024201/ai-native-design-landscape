# AI UI Generator / Design Engine

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI UI Generator is a small browser workspace that maps a natural-language site request into JSX composed from a fixed local component vocabulary. The important technical choice is constraint: the model may arrange `Navbar`, `Hero`, `Section`, `Card`, `Table`, `Input` and `Button`, and `react-live` evaluates that JSX against exactly those supplied components.

## One JSX string holds authority

[`ai.tsx`](https://github.com/Dhruv-Suyal/Ai-ui-generator/blob/f689a5cd4925894c69c389227729b79b7977ea94/client/src/services/ai.tsx) sends the brief and component grammar to Groq's OpenAI-compatible endpoint, requires a JSON object containing `code`, and removes common Markdown fences. A successful turn replaces the entire current JSX string rather than applying a semantic patch to selected elements.

[`liveRunner.tsx`](https://github.com/Dhruv-Suyal/Ai-ui-generator/blob/f689a5cd4925894c69c389227729b79b7977ea94/client/src/components/ui/liveRunner.tsx) supplies the component scope to `LiveProvider`; evaluation errors appear next to the rendered page. The preview is thus a live projection of the same JSX held by application state.

## Persistence is shallower than the advertised version control

[`App.tsx`](https://github.com/Dhruv-Suyal/Ai-ui-generator/blob/f689a5cd4925894c69c389227729b79b7977ea94/client/src/App.tsx) saves current code and chat messages to browser `localStorage`. It pushes prior code into an in-memory stack before generation, so rollback works only during the current page process; the stack itself is not restored after reload.

The code pane is explicitly disabled in [`codeEditor.tsx`](https://github.com/Dhruv-Suyal/Ai-ui-generator/blob/f689a5cd4925894c69c389227729b79b7977ea94/client/src/components/ui/codeEditor.tsx). Users correct through another full prompt, not direct source editing. The pinned source also exposes no project export, deployment transaction, responsive screenshot gate or multi-file application model. Its verified product loop is narrower: prompt, constrained JSX replacement, live preview and session rollback.

## Evidence

- [Pinned repository](https://github.com/Dhruv-Suyal/Ai-ui-generator/tree/f689a5cd4925894c69c389227729b79b7977ea94)
- [Component library scope](https://github.com/Dhruv-Suyal/Ai-ui-generator/tree/f689a5cd4925894c69c389227729b79b7977ea94/client/src/components/library)
