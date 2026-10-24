# Modes

Each mode ends on its **Done when** line. `<helper>` is `node <base>/scripts/app-agent.mjs` (see SKILL.md); "CI" means the commands `<helper> capabilities` prints. Paths such as `handoffDir` come from the project config (`.claude/app-agent.json`).

## Start of day (read-only; focus mode on)
1. `git status`, the branch, ahead/behind the base branch (fetch only), and open PRs (`gh pr list --author @me`).
2. `<helper> deploy` (or the Vercel connector), and `<helper> capabilities`.
3. Read the newest handoff in `handoffDir` and the session file.
4. `graphify update .` when a graph exists, noting god nodes and communities that moved. This rewrites only the generated `graphify-out/` folder.
5. Run the CI commands, without the build. List failures with file:line.
6. Propose up to 3 tasks: why each matters, its blast radius, and its starting skill. Flag it when the current branch is already merged or behind the base branch.

**Done when:** the user has the status, any failures and a ranked list, and has picked a task. No tracked files changed.

## Feature
1. Shape: grill until behavior, edge cases, data changes and non-goals are written down.
2. Scope: blast radius (`graphify affected`), plus what `<helper> risk` will flag.
3. Plan: spec and tickets. The user approves the first ticket.
4. Build that ticket test-first.
5. Verify: `<helper> risk`, then every printed check.

**Done when:** every printed check is done with evidence, or named as not done.

## Bug
1. Reproduce: a failing test (or a browser script) that goes red on the reported symptom.
2. Diagnose: root cause with file:line evidence, shown before any fix.
3. Fix test-first. Rerun the reproduction and the suites `risk` names.

**Done when:** the reproduction is green now, was red before, and both are quoted.

## Database migration
1. Create the migration with the project's tool. Iterate on a local database only.
2. Grants and row-level security follow the project's access model (its `CLAUDE.md`/`AGENTS.md`).
3. Add an integration test on the local database.
4. Write the owner's apply steps (`wizard` or a checklist): backup first, one environment at a time, order relative to merging.

**Done when:** the file, test and apply steps exist, and nothing has been applied to a hosted project.

## UI change
1. Fuzzy goal: prototype first. Clear goal: build.
2. Rendered check at phone and desktop widths, light and dark: console errors, focus, layout. Take screenshots.

**Done when:** screenshots are shared and there are no console errors.

## Review / before a PR
1. `<helper> risk`, then its checks.
2. `/code-review` on the diff. Add `/security-review` when `risk` printed auth, API, migration or secret sections.
3. The CI commands, run fresh.
4. PR body (`mattpocock-skills:pr`): what and why, tests, migration and rollout notes, screenshots.

**Done when:** the PR text is ready and every finding is fixed or listed. Push or open the PR only on the user's yes.

## Incident (production broken)
1. Read only: the deploy state, recent runtime errors, the failing route in a browser.
2. Find the last good deploy and what changed since (`git log <good>..<bad>`).
3. Recommend roll back (the owner's action) or fix forward (the PR flow), with evidence for each.

**Done when:** the owner has the cause, or the best current hypothesis, and a recommendation.

## End of day
1. The CI commands, run fresh, with results quoted.
2. `<helper> risk` and the review pass on today's diff.
3. Uncommitted and untracked files, with proposed commits. Wait for a yes.
4. `graphify update .` when a graph exists.
5. Handoff (`mattpocock-skills:handoff`) with these sections: Done (commits/PRs), In progress (branch and exact state), Blocked (on whom), First step tomorrow (a command), Open questions, Hosted-environment risk. Copy it into `handoffDir`.
6. Update the session file.

**Done when:** the handoff exists in `handoffDir` and its first step is a command someone can run.

## Weekly (read-only)
Advisors on hosted databases (read-only), a security review of the week's merges, the top 3 architecture candidates, a UX pass of one flow, and skipped/flaky tests plus `npm outdated`.

**Done when:** a weekly report in `handoffDir` lists the findings and asks which to act on.
