# Maintenance procedure

## Add or update a skill

1. Add the skill to the appropriate source catalog or plugin.
2. Run the exhaustive audit in the environment where the skill is available.
3. Confirm every catalog entry is `reviewed`, `missing`, or `unreadable`.
4. Update `references/agent-skill-registry.json`, `agent-skill-Names.md`, and `agent-skill-situation-matrix.md` together.
5. Update prompts only when the new skill changes a lifecycle decision.
6. Run JSON parsing, link checks, installer dry runs, and the skill validator.
7. Review the diff for absolute paths, secrets, project-specific names, and duplicated rules.
8. Commit and tag the release.

## Platform adapters

Keep reusable lifecycle rules in `references/` and `prompts/`. Add platform-specific invocation syntax under `adapters/` rather than duplicating the operating model. A future Claude adapter should translate the same gates and verification contract into Claude's project instructions, commands, and agent format.

## Release checklist

- Every registry skill appears in the names list and situation matrix.
- Every registry `source_file` is portable and contains no local absolute path.
- Every skill reference resolves from the installed location.
- PowerShell and shell installers work in guided and complete modes.
- No installer performs network, deployment, commit, push, secret, or hosted-data operations.
- Prompt completion claims require fresh evidence.
- Changes are tagged with a semantic version.
