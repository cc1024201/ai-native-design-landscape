# Clypra

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Clypra is an open-core desktop video editor. The public source qualifies for this census through one implemented AI path: local Whisper transcription creates word-timed caption clips that enter the ordinary editable timeline. Broader natural-language editing, smart reframing and other advertised Pro features are not attributed to the pinned open-source implementation.

## The timeline project remains authoritative

Video, audio, text and caption clips are structured timeline objects. Captions carry timing, style and optional word-level timestamps; users can edit text and timing, apply styles across a caption track and combine them with the rest of the sequence.

Project autosave runs through [`autoSaveMiddleware.ts`](https://github.com/AIEraDev/Clypra/blob/0dd6a026916d2ec0b64964069724b25f23311be6/src/store/middleware/autoSaveMiddleware.ts). The Tauri [`project commands`](https://github.com/AIEraDev/Clypra/blob/0dd6a026916d2ec0b64964069724b25f23311be6/src-tauri/src/commands/project.rs) persist project JSON atomically through a temporary file and rename. The editable project—not a transcript or rendered video—is the durable authority.

## Local AI creates native caption clips

The [`CaptionsTab`](https://github.com/AIEraDev/Clypra/blob/0dd6a026916d2ec0b64964069724b25f23311be6/src/components/editor/sidebar/tabs/CaptionsTab.tsx) extracts audio from timeline media, invokes `transcribe_audio_local`, parses returned segments and adds each eligible segment as a text clip with `textRole: "caption"`. Word timestamps are converted to clip-relative time for karaoke-style highlighting.

The Tauri [`media command`](https://github.com/AIEraDev/Clypra/blob/0dd6a026916d2ec0b64964069724b25f23311be6/src-tauri/src/commands/media.rs) runs the bundled Python transcription script with the selected local model and language hints. [`transcribe.py`](https://github.com/AIEraDev/Clypra/blob/0dd6a026916d2ec0b64964069724b25f23311be6/src/features/text-effects/transcribe.py) loads OpenAI Whisper, requests word timestamps and emits structured JSON segments.

The resulting loop is concrete and local:

`timeline media → extracted audio → Whisper segments → editable caption clips → preview/export`

## Model and delivery boundaries

Whisper model downloads are managed separately from project files, and caption preferences persist locally. Render and FFmpeg export consume the complete timeline; rendered video and subtitle files are derivatives.

The README simultaneously presents auto-captioning as a Pro or roadmap item even though the source contains a wired local implementation. This dossier follows executable pinned code and makes no claim that hosted pricing, speaker detection or planned natural-language commands are complete.

## Evidence

- [Pinned repository](https://github.com/AIEraDev/Clypra/tree/0dd6a026916d2ec0b64964069724b25f23311be6)
- [Whisper model lifecycle](https://github.com/AIEraDev/Clypra/blob/0dd6a026916d2ec0b64964069724b25f23311be6/src-tauri/src/commands/whisper.rs)
