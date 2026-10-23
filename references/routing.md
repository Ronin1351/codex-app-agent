# Routing: one skill per job, with a fallback

Run `node .agents/skills/codex-app-agent/scripts/repository capability check` first. Use the **Primary** column when its plugin is ON, and the **Fallback** column otherwise. Tell the user which column was used whenever it was the fallback, so a missing scan is never mistaken for a clean one.

House rules in `AGENTS.md` (database, releases, secrets) outrank every skill below. Where a skill's own instructions conflict with them, the house rule wins: name the conflict in one line and keep the stricter rule.

| Job | Primary (plugin) | Fallback |
|---|---|---|
| Shape an idea or decision | `grill-with-docs` (mattpocock) | `grill-me` |
| Turn it into tracked work | `to-spec` → `to-tickets` (mattpocock; needs `setup-matt-pocock-skills` once) | A written spec in `docs/specs/<name>.md` with a ticket checklist |
| Work longer than one session | `wayfinder` (mattpocock) | `docs/specs/<name>.md` decision list plus `handoff` |
| Build a feature or fix | `tdd` (mattpocock) | Same loop by hand: failing Vitest test, smallest change, refactor |
| Implement tickets | `implement` / `implement-spec` (mattpocock) | `tdd`, one ticket at a time |
| Bug, failing test, regression | `diagnosing-bugs` (mattpocock) | Reproduce with a failing test, then bisect with `graphify path` and `git log -L` |
| Module shape, refactor | `codebase-design`, `improve-codebase-architecture` (mattpocock) | — |
| Domain terms, ADRs | `domain-modeling` (mattpocock) | — |
| Throwaway UI or logic try-out | `prototype` (mattpocock) | — |
| Rendered UI check | `frontend-testing-debugging` (build-web-apps) | Browser plugin, or `playwright-cli` with the runtime Playwright from `capabilities` |
| React / Next.js quality | `react-best-practices` (build-web-apps) | Skip; mention it in the completion report |
| UX flow critique | `audit` (product-design) | Browser screenshots at 360px, with findings tied to each step |
| Diff review (defects) | `review-agent` (system) | — |
| Diff review (standards + spec) | `code-review` (mattpocock; needs setup) | `review-agent`, plus the ticket text pasted in |
| Security on a diff | `security-diff-scan` (codex-security) | `review-agent` given the `risk` security checks. Report "security scan not run (plugin off)" |
| Security baseline | `define-security-policy` → `threat-model` → `security-scan` (codex-security) | Not possible; tell the owner the plugin is needed |
| Postgres, RLS, migrations | `supabase` + `supabase-postgres-best-practices` (supabase) | House rules plus the `risk` migration checks |
| Deploy status, logs | `vercel-cli`, `deployments-cicd` (vercel; needs the `vercel` CLI) | `deployment status check` (GitHub deployments API), `gh run list --branch master` |
| Works locally, not on Vercel | `verification` (vercel) | `deployment status check`, then reproduce against the preview URL in the browser |
| Steps only the owner can do | `wizard` (mattpocock) | A numbered checklist with the exact commands |
| PR body | `pr` (mattpocock) | — |
| End a session | `handoff`, `retro` (mattpocock) | Write the handoff file by hand (sections in `modes.md`) |
| Unsure which skill | `ask-matt` (mattpocock) | This table |
| Code map, blast radius | `graphify` (user skill) | `git grep`, plus reading imports |

## House overrides by skill

- **supabase**: iterate with `execute_sql` / `supabase db query` against the local stack only. Its advice to grant `anon`/`authenticated` plus RLS policies does not fit here: this repo grants `service_role` only.
- **vercel deployments-cicd / vercel-cli**: inspecting is open. `vercel --prod`, `promote`, `rollback` and env edits are owner actions; production moves only by merging to `master`.
- **codex-security**: keep `security-scan` (repo), `security-diff-scan` (diff) and `deep-security-scan` (exhaustive) separate. A lighter scan is not a substitute for a heavier one the user asked for.
- **frontend-app-builder** (build-web-apps): only for a brand-new surface. For changes to existing screens, use `frontend-testing-debugging`.
- **superpowers**: this agent does not route to it. If it is on, the table above still decides overlaps; its `using-superpowers` skill defers to AGENTS.md.

## Situational (pick only when the task names it)

- `vercel-firewall`: rate limits for `/login`, in addition to `login_attempts`.
- `custom-metrics`: send the `lib/performance.ts` counters to Vercel.
- `flags-sdk`: shadow or staged release of training-intelligence features.
- `cdn-caching`: stale pages. Most pages are `force-dynamic`, so check that first.
- `access-protected-vercel-deployment`: an automated preview check hits a login wall.
- `imagegen`: badge art, followed by `npm run validate:badges`.
- `research`: library or API facts, written to a sourced Markdown file.
- `openai-docs`: questions about Codex itself.
