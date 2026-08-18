# AI UI Builder by Julian Shen

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Julian Shen's builder separates projects, model generations and compiled previews into durable entities. It is closer to a small component build service than a browser-only prompt demo.

## Generation and preview are separate records

[`generation_service.go`](https://github.com/julianshen/ui-builder/blob/3001c48b0065fd68d0b82f0e6e0f2b11014a3156/internal/domain/generation_service.go) creates a generation under a project and later asks the configured OpenAI-compatible client for source. [`client.go`](https://github.com/julianshen/ui-builder/blob/3001c48b0065fd68d0b82f0e6e0f2b11014a3156/internal/infrastructure/openai/client.go) extracts fenced code and language into that record. A preview is then created independently from a selected generation.

## Compilation is persisted evidence

[`react_compiler.go`](https://github.com/julianshen/ui-builder/blob/3001c48b0065fd68d0b82f0e6e0f2b11014a3156/internal/infrastructure/compiler/react_compiler.go) validates React source and produces HTML with its required runtime and generated Tailwind styles. [`preview_service.go`](https://github.com/julianshen/ui-builder/blob/3001c48b0065fd68d0b82f0e6e0f2b11014a3156/internal/domain/preview_service.go) records the compiled result or failure. The [SQLite migrations](https://github.com/julianshen/ui-builder/blob/3001c48b0065fd68d0b82f0e6e0f2b11014a3156/internal/infrastructure/database/migrations.go) make projects, generations and previews independently recoverable and exportable.

## Evidence

- [Canonical repository](https://github.com/julianshen/ui-builder)
- [Inspected tree](https://github.com/julianshen/ui-builder/tree/3001c48b0065fd68d0b82f0e6e0f2b11014a3156)
- Commit: `3001c48b0065fd68d0b82f0e6e0f2b11014a3156`
