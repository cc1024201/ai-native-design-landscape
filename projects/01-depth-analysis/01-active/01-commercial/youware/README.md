# YouWare

YouWare defines design as the delivery of a working application, not the production of mockups: [its ordinary job is to generate the app and then alternate among agent, visual and source edits before deploying or exporting it](https://www.youware.com/features/web-app-builder). A React application with interface structure and logic — plus attached backend functions for authentication, database and file storage — is what it produces, and product delivery is primary the whole way through.

The mechanism is that every edit path converges on one hosted source project. Users can click the UI to edit it, ask AI for changes, or open a code editor; all three mutate the same managed source, which drives the live preview, [binds to YouBase state and deploys via Cloudflare](https://www.youware.com/features/ai-code-editor). Because visual and AI edits land in the same working code and runtime rather than producing disconnected screenshots, YouWare reads more like a full-stack delivery product than a mockup generator.

Authority and persistence follow the hosted project. Inside the product the source-bearing managed application is canonical; [an exported repository can become a new authority outside the product](https://www.youware.com/features/ai-website-builder), and because public pages do not establish import of external changes or a Git round trip, export is recorded as a transfer boundary rather than permanent synchronization. The closed implementation leaves file schema, patch strategy, backend migration and rollback unverified, so "full code access" must be weighed against plan- and generation-scope. The design is the runnable, deployable application — hosting, backend and export all orbit that one source of truth.

- [YouWare web app builder](https://www.youware.com/features/web-app-builder)
- [YouWare AI code editor](https://www.youware.com/features/ai-code-editor)
- [YouWare website builder and export boundary](https://www.youware.com/features/ai-website-builder)
