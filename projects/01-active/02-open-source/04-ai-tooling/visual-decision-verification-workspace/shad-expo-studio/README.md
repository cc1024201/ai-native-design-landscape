# Shad Expo Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Shad Expo Studio is a React Native component workspace built around deterministic visual evidence. It is intended for teams using coding agents: every component carries a machine-readable example that generates both its Storybook story and the Chromatic baseline reviewed in CI.

## One component tree, three runtime surfaces

The canonical authority is the React Native source using `StyleSheet` and `Pressable`. The same tree renders in iOS, Android and web; web Storybook supplies the hosted inspection and visual-regression surface, while an on-device Storybook route exposes native review. This is not three component implementations.

Example files are dual-purpose artifacts: a coding agent can consume them as usage contracts, and generation tooling turns them into stories. CI checks that the installable registry matches source. Chromatic then compares deterministic web renders against locked baselines, making a visual change visible before source is promoted through the pull request.

## What the baseline can and cannot prove

The studio catches rendered drift in the web projection and connects that evidence to the same source used by the app shell. It does not prove pixel equivalence on iOS or Android, nor does it give Chromatic authority to edit the component. Source and Git remain canonical.

- [Pinned Shad Expo Studio revision](https://github.com/Ge-limin/shad-expo-studio/tree/08d6f91666c59a8b1f9a3e9af6bf3e13f43b329e)
- [Studio and baseline contract](https://github.com/Ge-limin/shad-expo-studio/blob/08d6f91666c59a8b1f9a3e9af6bf3e13f43b329e/README.md)
- [Story generator](https://github.com/Ge-limin/shad-expo-studio/blob/08d6f91666c59a8b1f9a3e9af6bf3e13f43b329e/apps/expo/.rnstorybook/generate-stories.js)
- [Deterministic button example](https://github.com/Ge-limin/shad-expo-studio/blob/08d6f91666c59a8b1f9a3e9af6bf3e13f43b329e/packages/ui/src/native/common/button.examples.tsx)
