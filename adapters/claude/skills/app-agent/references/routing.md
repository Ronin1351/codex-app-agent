# Routing (Claude Code): one skill per job, with a fallback

Use the **Primary** column when it is available (plugin ON in `capabilities`, built-in, or the connector is in your tool list); otherwise use the **Fallback**. When you used a fallback, say so in the completion report, so a skipped review is never mistaken for a clean one.

Project instructions (`CLAUDE.md`, `AGENTS.md`) outrank every skill below. When a skill's defaults conflict with them, name the conflict in one line and follow the stricter rule.

| Job | Primary | Fallback |
|---|---|---|
| Shape an idea or decision | `mattpocock-skills:grill-with-docs` (records ADRs and glossary) | `mattpocock-skills:grilling` |
| Turn it into tracked work | `mattpocock-skills:to-spec` → `to-tickets` (needs `/setup-matt-pocock-skills` once) | `docs/specs/<name>.md` with a ticket checklist |
| Work longer than one session | `mattpocock-skills:wayfinder` | A decision list in the spec, plus a handoff each session |
| Build a feature or fix | `mattpocock-skills:tdd` | The same loop by hand: failing test, smallest change, refactor |
| Implement tickets | `mattpocock-skills:implement` | `tdd`, one ticket at a time |
| Bug, failing test, regression | `mattpocock-skills:diagnosing-bugs` | Reproduce with a failing test, then bisect (`git bisect`, `graphify path`) |
| Module shape, refactor | `mattpocock-skills:codebase-design`, `improve-codebase-architecture` | — |
| Clean up a finished diff | built-in `/simplify` | — |
| Domain terms, ADRs | `mattpocock-skills:domain-modeling` | — |
| Throwaway try-out | `mattpocock-skills:prototype` | — |
| Coding discipline while editing | `andrej-karpathy-skills:karpathy-guidelines` | — |
| Rendered UI check | Desktop app preview tools (`preview_start`, screenshot, console, resize) or Claude in Chrome | A Playwright script against the local dev server |
| UX flow critique | `intent:evaluate` | Screenshots at phone width, with findings tied to each step |
| Diff review (defects) | built-in `/code-review` (pick an effort level) | Read the diff against the merge-base, file by file |
| Diff review (standards + spec) | `mattpocock-skills:code-review` (needs setup) | `/code-review`, with the ticket text pasted in |
| Security on a diff | built-in `/security-review` | `/code-review` focused on the `risk` security checks; report "security review not run" |
| Database: inspect, advisors | Supabase connector (`list_tables`, `get_advisors`, read-only `execute_sql`) | The project's own read-only connection or CLI |
| Database: change schema | Migration file plus a local test; the owner applies it | — |
| Deploy status, logs, runtime errors | Vercel connector (`list_deployments`, `get_deployment_build_logs`, `get_runtime_errors`) | `<helper> deploy` (GitHub deployments API), `gh run list` |
| Steps only the owner can do | `mattpocock-skills:wizard` | A numbered checklist with exact commands |
| PR body | `mattpocock-skills:pr` | — |
| End a session | `mattpocock-skills:handoff`, then copy it to the project's handoff folder | Write the handoff by hand (sections in `modes.md`) |
| Unsure which skill | `mattpocock-skills:ask-matt` | This table |
| Code map, blast radius | `graphify` | `git grep`, plus reading imports |

## Connector rules

- **Supabase connector**: reads are open. `apply_migration`, a writing `execute_sql`, branch merge/reset, and project pause/restore are approval-gated. Iterate on schema only against a local database.
- **Vercel connector**: reads are open. Deploy, promote, rollback, env edits, firewall changes, domain changes and project updates are approval-gated.
- **GitHub (`gh`)**: reads are open. Push, PR create/merge, comments and releases are approval-gated.

## Notes on specific skills

- `mattpocock-skills:handoff` saves to the OS temp folder by design. Copy the file into the project's handoff folder (`handoffDir` in the project config) when the project keeps handoffs.
- `/i-have-adhd` is user-invoked only. The agent follows the focus-mode rules in SKILL.md when the user asks for it.
- `/code-review` and `/security-review` review the current diff. Run them after `<helper> risk`, so the review knows which areas carry risk.
