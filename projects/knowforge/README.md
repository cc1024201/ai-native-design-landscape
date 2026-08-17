# KnowForge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KnowForge uses document retrieval to produce a one-shot Mermaid explanation. It qualifies as a visual coordination surface but deliberately occupies the weakest persistence end of this batch.

## Retrieval context reaches Gemini

At commit [`03bcae0e`](https://github.com/khusburai28/KnowForge/tree/03bcae0e7fa64165ac47a9c2e06a9e3703fcd8f3), backend services collect relevant document context and ask Gemini for Mermaid source. The frontend diagram modal renders that response for the user.

## The diagram is ephemeral

There is no implemented diagram record, source editor or version history. Raw Mermaid is mainly surfaced when rendering fails. Closing the modal ends the artifact's product lifecycle unless the user captures it externally.

## Why retain it

This project demonstrates a real but thin definition of AI Design: visual explanation generated inside a knowledge workflow. Recording its limits prevents the landscape from conflating “can render Mermaid” with native authoring.

## Evidence

- [Pinned repository](https://github.com/khusburai28/KnowForge/tree/03bcae0e7fa64165ac47a9c2e06a9e3703fcd8f3)
- [Gemini client](https://github.com/khusburai28/KnowForge/blob/03bcae0e7fa64165ac47a9c2e06a9e3703fcd8f3/backend/app/services/gemini_client.py)
- [Diagram modal](https://github.com/khusburai28/KnowForge/blob/03bcae0e7fa64165ac47a9c2e06a9e3703fcd8f3/frontend/src/components/DiagramModal.jsx)
- [Application integration](https://github.com/khusburai28/KnowForge/blob/03bcae0e7fa64165ac47a9c2e06a9e3703fcd8f3/frontend/src/App.jsx)
