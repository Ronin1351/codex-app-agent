---
name: app-agent
description: Run app-development work end to end (start of day, feature, bug, database migration, UI change, review/PR, incident, end of day, weekly) with the skills that are actually enabled, the project's approval gates, and evidence at the end. Use for app-development requests in a repository that has adopted it in CLAUDE.md or AGENTS.md.
argument-hint: "[mode or task, e.g. start of day | bug: <symptom> | review]"
---

# App Agent (Claude Code)

Coordinate app work: pick the mode, choose skills that are enabled, apply the project's gates, and finish with evidence. The user keeps every decision that touches hosted data, production, secrets or git history.

`<helper>` below means `node <base>/scripts/app-agent.mjs`, where `<base>` is the "Base directory for this skill" shown when this skill loads (normally `~/.claude/skills/app-agent` or `.claude/skills/app-agent`). Run it from the project root.

## Every task

1. **Ground.** Read the project's `CLAUDE.md` / `AGENTS.md` (their rules outrank everything here), `git status` (keep unrelated changes intact), and the session file named in the project config, when present.
2. **Capabilities.** Run `<helper> capabilities` once per session, and check your own tool list for MCP connectors (Supabase, Vercel, GitHub). Route with [references/routing.md](references/routing.md): primary when available, otherwise the fallback. Say which fallbacks you used.
3. **Mode.** Pick one mode from [references/modes.md](references/modes.md) and work to its **Done when** line. Load a routed skill with the Skill tool before following it.
4. **Scope.** When `graphify-out/graph.json` exists, use `graphify affected` / `path` / `query` before reading many files.
5. **Gates.** Run `<helper> risk` before calling a change ready. Each printed check ends done (with evidence), not done, or not applicable (with a reason). Exit code 2 means a secret file is in the change: stop and point to it.
6. **Finish.** Report with the completion contract. Update the session file (Now / Next / Later / Decisions / Evidence / Open loops).

## Approval gates (ask, then wait for a clear yes)

- Writes to any hosted database or service: SQL, migrations, settings, env vars, secrets.
- Deploy, promote or roll back; changing CI, branch protection or hosting settings.
- `git push`, opening or merging PRs, committing to the base branch.
- Installing or upgrading dependencies.

A yes covers the one action asked about. The next action of the same kind needs its own yes. Reading (logs, deployments, advisors, read-only SQL) needs no approval unless the project's instructions say otherwise.

## Completion contract

- **Changed:** files changed, or "no files changed".
- **Ran:** each command run, with pass/fail counts quoted from fresh output.
- **Checks:** every `risk` check marked done, not done, or not applicable (with a reason).
- **Fallbacks used:** anything unavailable and what replaced it (for example, "security review skipped: no diff").
- **Next:** one concrete next action.

## Focus mode

**Start of day turns it on automatically.** So does `$i-have-adhd` in any request, or `/i-have-adhd` turned on by the user. To turn it on, run `<helper> focus`, read the ruleset file it prints, and follow that file for the rest of the session, until the user says "stop adhd mode" or "normal mode". If no ruleset is installed, use the short rules instead: lead with the single next action, offer at most three choices, use Now / Next / Later, checkpoint after each step, and keep an open-loop list. Gates and the completion contract stay the same either way.
