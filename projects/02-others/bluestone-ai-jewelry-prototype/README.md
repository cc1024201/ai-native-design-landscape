# BlueStone AI Jewelry Prototype

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This repository is counted as Shivam Mishra's independent commerce prototype—not as an official BlueStone product. Its Design loop sits inside a product-detail page where a shopper proposes jewelry imagery and explicitly approves the result.

## Generated image is a proposal

[`pdp.js`](https://github.com/Mishrashivam-SKM/panel/blob/f797df5eebce32f271e413534f212cbdd8af19a8/js/pdp.js) sends the prompt directly to Vertex AI image generation and displays the returned image. If the API fails it substitutes stock imagery; that fallback is a simulation and does not establish model authority.

## Approval creates retained commerce state

[`product-detail.html`](https://github.com/Mishrashivam-SKM/panel/blob/f797df5eebce32f271e413534f212cbdd8af19a8/product-detail.html) places generation alongside ordinary purchase decisions. [`status-page.js`](https://github.com/Mishrashivam-SKM/panel/blob/f797df5eebce32f271e413534f212cbdd8af19a8/js/status-page.js) reads the locally retained order/design record after submission. The approved prompt and image therefore cross from transient proposal into prototype order state.

The inspected client embeds a provider credential and lacks production persistence. Those weaknesses limit maturity but do not erase the demonstrated human-selection loop.

## Source evidence

- [Canonical repository](https://github.com/Mishrashivam-SKM/panel)
- [Inspected tree](https://github.com/Mishrashivam-SKM/panel/tree/f797df5eebce32f271e413534f212cbdd8af19a8)
- Commit: `f797df5eebce32f271e413534f212cbdd8af19a8`
