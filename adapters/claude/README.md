# App Agent for Claude Code

The Claude Code adapter for this package. It runs the same operating model as the Codex skill: one mode per task, skills chosen by what is actually enabled, approval gates before anything external, and a completion contract backed by fresh evidence. It is written in Claude Code's own formats: a skill, a subagent, and a project config.

| Piece | Path after install | What it does |
|---|---|---|
| Skill `app-agent` | `~/.claude/skills/app-agent/` | Picks the mode, routes to skills, runs the gates, writes the completion report. Invoke with `/app-agent`. |
| Subagent `app-agent-verifier` | `~/.claude/agents/app-agent-verifier.md` | Read-only "is it done?" pass in its own context: risk checks, CI, a defect review, and a verdict. |
| Helper `app-agent.mjs` | inside the skill, `scripts/` | Read-only Node script: `capabilities`, `risk`, `deploy`. No dependencies. |
| Project config | `<project>/.claude/app-agent.json` | The project's base branch, CI commands, handoff folder and extra risk rules. Optional. |

## Requirements

- Claude Code (CLI, desktop app or IDE extension), plus `git` and Node 18+.
- Recommended: the `mattpocock-skills` plugin (most routes use it) and `gh`, logged in, for `deploy` and PR status.
- Optional: `graphify`, `i-have-adhd` and `intent` plugins; Supabase, Vercel and GitHub connectors.

Nothing is required beyond git and Node. Every missing piece has a fallback, and the agent reports which fallbacks it used.

## Install

From a clone of this repository:

```powershell
./adapters/claude/install.ps1                                         # for you, in ~/.claude
./adapters/claude/install.ps1 -Project -ProjectPath C:\path\to\app    # for the team, in <app>/.claude (commit it)
./adapters/claude/install.ps1 -Templates -ProjectPath C:\path\to\app  # also add app-agent.json and a CLAUDE.md template
```

```bash
./adapters/claude/install.sh
./adapters/claude/install.sh --project --path=/path/to/app
./adapters/claude/install.sh --templates --path=/path/to/app
```

Then start a new Claude Code session so it picks up the new skill and subagent. The installers only copy files. They never overwrite an existing `app-agent.json`, and they never touch your `CLAUDE.md`.

**User or project install?** Use a user install to try it out or for solo work. A project install (committed under `.claude/`) gives everyone on the repo the same agent and version.

## Set up a project (about 5 minutes)

1. **Rules in one place.** Put the project's hard rules (data access model, how releases happen, secrets) in `AGENTS.md`, so Codex and Claude read the same file. Then give `CLAUDE.md` an `@AGENTS.md` line plus the short App agent section from `templates/CLAUDE.md`.
2. **Config.** Edit `.claude/app-agent.json`:
   - `baseBranch`: the branch production deploys from (`main`, `master`).
   - `ci`: the exact commands your CI runs. Left out, they come from `package.json` scripts (`typecheck`, `lint`, `test`, `build`).
   - `productionEnvironment`: the GitHub deployment environment name (Vercel uses `Production`).
   - `handoffDir`: where end-of-day handoffs are kept.
   - `sessionFile`: local working memory. Gitignore it.
   - `extraRules`: project-specific risk rules (see below). `rules` replaces the defaults entirely.
3. **Check it.** In the project, run:
   ```bash
   node ~/.claude/skills/app-agent/scripts/app-agent.mjs capabilities
   ```
   and confirm the base branch, the CI commands and the plugins are right.

## Daily use

| You type | What happens |
|---|---|
| `/app-agent start of day` | Read-only: git and PR status, deploy state, last handoff, tests, then up to 3 ranked tasks. Focus mode is on. |
| `/app-agent feature: <what>` | Grill → spec/tickets → test-first build of one ticket → risk checks. |
| `/app-agent bug: <symptom>` | A red reproduction first, the root cause shown before the fix, then a green rerun. |
| `/app-agent migration: <change>` | A migration file plus a local test plus the owner's apply steps. Nothing is applied to hosted databases. |
| `/app-agent review` | Risk checks, `/code-review`, `/security-review` when risky areas changed, fresh CI, a PR body. Nothing is pushed. |
| `/app-agent incident: <what broke>` | Read-only investigation, then a recommendation to roll back or fix forward. |
| `/app-agent end of day` | Fresh CI, review, proposed commits (it waits for your yes), graph refresh, a handoff copied into `handoffDir`. |
| `/app-agent weekly` | Read-only health pass written to a report. |
| "use the app-agent-verifier" | A separate-context check of whether the current change is really done. |

Add `$i-have-adhd` to any request, or turn on `/i-have-adhd`, for one-next-action replies with Now / Next / Later.

## What it will and won't do on its own

**Without asking:** read code, run tests and builds locally, read git, PRs, deployments, logs and database advisors, and write files inside the task's scope.

**Only after your explicit yes, one action at a time:** writes to hosted databases or services (SQL, migrations, settings, env vars, secrets); deploy, promote or roll back; push, open or merge a PR, commit to the base branch; install or upgrade dependencies. Your project's `AGENTS.md` can make these stricter.

**Hard stop:** if `risk` finds a secret file (`.env`, keys, keystores) in the change, it exits with code 2 and the agent stops.

## The risk check

`app-agent.mjs risk [base]` lists every file changed since the merge-base with `baseBranch`, committed or not. It matches the paths against rules, then prints a checklist the agent must close out.

The default rule groups are: secret files (block), migrations, auth/session, API routes, CI/deploy config, dependencies and UI. Add project rules in `.claude/app-agent.json`:

```json
"extraRules": [
  { "id": "billing", "label": "Billing", "pattern": "^src/billing/",
    "checks": ["Run the Stripe test-mode suite", "Owner reviews price or plan changes"] }
]
```

`pattern` is a JavaScript regular expression tested against repo-relative paths with forward slashes. `block: true` makes a match exit with code 2.

## How routing works

`references/routing.md` gives each job one primary skill and one fallback. Examples: `mattpocock-skills:tdd` for building, `mattpocock-skills:diagnosing-bugs` for bugs, the built-in `/code-review` and `/security-review` for reviews, the Vercel connector or `app-agent.mjs deploy` for deploy state. The agent uses the primary when it is available and says when it used a fallback. "Security review not run" is always stated, never implied.

## Updating and removing

- **Update:** pull this repo, read the diff under `adapters/claude/`, rerun the same install command. Your `app-agent.json` is kept.
- **Remove:** delete `~/.claude/skills/app-agent` and `~/.claude/agents/app-agent-verifier.md`, or the same paths under `<project>/.claude/`. Delete `.claude/app-agent.json` if you no longer want the config.

## Troubleshooting

| Symptom | Fix |
|---|---|
| `/app-agent` is not offered | Start a new session; check that `~/.claude/skills/app-agent/SKILL.md` exists. |
| `capabilities` shows the wrong base branch | Set `baseBranch` in `.claude/app-agent.json`. |
| `deploy` says "could not read deployments" | Run `gh auth login`. If your host doesn't report deployments to GitHub, use its connector or CLI instead. |
| `risk` reports hundreds of files | The base is old: pass one explicitly, e.g. `risk origin/main`, or rebase. |
| Connectors (Supabase/Vercel) not detected | `capabilities` only sees `.mcp.json`. Connectors added in claude.ai show up in Claude's tool list, which the agent checks itself. |
| A plugin skill isn't used | Check `enabledPlugins` in `~/.claude/settings.json`. Some skills (such as `/i-have-adhd` and `/setup-matt-pocock-skills`) can only be started by you. |

## Relationship to the Codex skill

Same modes, gates and completion contract as `skills/codex-app-agent`. The differences are only in the format of each platform:

| | Codex | Claude Code |
|---|---|---|
| Entry point | `$codex-app-agent` skill | `/app-agent` skill plus the `app-agent-verifier` subagent |
| Reviews | `review-agent`, codex-security | Built-in `/code-review`, `/security-review` |
| Plugin state | `~/.codex/config.toml` | `enabledPlugins` in `~/.claude/settings.json` |
| Project rules | `AGENTS.md` | `CLAUDE.md` importing `AGENTS.md` |
