# Velocity AI Coder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Velocity AI Coder is a mobile-first prompt-to-source builder by Dishan Naik. It is distinct from the OptimiLabs product also named Velocity: here a direct client-to-model request returns a file map, the app stores it on the device, and the user inspects the files or associates the project with an externally running preview URL.

## The implemented product is smaller than the advertised architecture

Pinned revision: `d35d1d54685a87c9d71fefa5792c388a0fdd814d`.

`useGenerate` sends a structured prompt directly to Groq, Gemini, OpenRouter, Ollama or an OpenAI-compatible endpoint and accepts a JSON file map. It then deterministically adds a specification, Supabase placeholders, theme components and GitHub scaffolding. The so-called self-healing loop retries provider and JSON failures; it does not compile the output or feed runtime errors back into the model.

Generated projects are real artifacts. Web builds serialize the complete map to AsyncStorage, while native builds write the files beneath the Expo document directory with an AsyncStorage fallback. Project metadata is a separate local index. The editor currently reads and displays files but does not write manual edits back, so the generated map—not the editor buffer—is authoritative.

## Preview is an attached URL rather than a live sandbox

The preview screen stores a per-project URL and loads it in a WebView. It can point at a deployed site or a LAN development server, but the repository never mounts generated files into WebContainer. `initializeSandboxRuntime` only returns a fabricated `velocity.sandbox.app` URL and optimistic status flags; `deployToVercelCloud` similarly constructs a successful-looking URL and placeholder environment values without making a provider request. The editor's deploy button shows an alert rather than invoking either function.

The useful design loop is therefore prompt → local file set → inspection/export scaffolding → separately hosted visual evidence. Claims about bi-directional canvas mapping, verified runtime correction and one-click deployment are architectural sketches in this revision, not product facts.

## Pinned evidence

- [Repository](https://github.com/dr-week/AI-CODER-APP)
- [Direct model generation and deterministic file injection](https://github.com/dr-week/AI-CODER-APP/blob/d35d1d54685a87c9d71fefa5792c388a0fdd814d/artifacts/ai-coder-app/lib/useGenerate.ts)
- [Device-local project authority](https://github.com/dr-week/AI-CODER-APP/blob/d35d1d54685a87c9d71fefa5792c388a0fdd814d/artifacts/ai-coder-app/lib/saveProject.ts)
- [Read-only file inspector and deploy alert](https://github.com/dr-week/AI-CODER-APP/blob/d35d1d54685a87c9d71fefa5792c388a0fdd814d/artifacts/ai-coder-app/app/editor.tsx)
- [External-URL WebView preview](https://github.com/dr-week/AI-CODER-APP/blob/d35d1d54685a87c9d71fefa5792c388a0fdd814d/artifacts/ai-coder-app/app/preview.tsx)
- [Synthetic sandbox status](https://github.com/dr-week/AI-CODER-APP/blob/d35d1d54685a87c9d71fefa5792c388a0fdd814d/artifacts/ai-coder-app/lib/sandboxRuntime.ts)
- [Synthetic deployment result](https://github.com/dr-week/AI-CODER-APP/blob/d35d1d54685a87c9d71fefa5792c388a0fdd814d/artifacts/ai-coder-app/lib/cloudDeploy.ts)
