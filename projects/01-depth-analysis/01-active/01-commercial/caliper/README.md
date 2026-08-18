# Caliper

Caliper's answer to "what is design" is stubbornly code-native: design is the act of changing the source that renders an application, and the visual canvas is only the incentive to get there. A person manipulates what they see; an agent rewrites the owning repository file.

## The rendered app is a front for a source-rewrite agent

The implementation turns the running application into the editable surface. Unlike a screenshot canvas, a direct visual edit does not persist because it looks right — it is useful only when the agent materializes a corresponding file change and the app rerenders successfully. What makes this distinctive is not the live-edit gimmick but the conditioning: the project profile remembers *accepted, rejected and refined* changes together with conventions and commits, so later agent actions are shaped by a design history rather than the current pixels alone. That accumulated decision history is what the source-rewrite agent reads as context.

## Branches are candidate histories, not screenshot lists

The advertised design history offers step-back, branching, comparison and recovery, and the dossier reads this as promotion at the *source* level — a branch is an alternative line of candidate edits, not a gallery of generated images. The evidence boundary is real: the implementation is closed and early-access, so DOM-to-source identity, AST rewriting, history schema and merge semantics are not publicly disclosed. What is established is the authority arrangement — source authoritative, visual mutation instrumental, memory as prior decisions — and that is enough to know why Caliper works the way it does. [Product](https://www.calipr.design/)
