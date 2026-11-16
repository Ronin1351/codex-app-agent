# Codex App Agent

Reusable, cross-project operating guidance for app-development agents.

This repository packages a portable Codex skill, lifecycle prompts, skill-audit references, and installers. It can be installed one skill at a time for first-time users or installed as a complete bundle. A Claude Code version lives in [`adapters/claude/`](adapters/claude/README.md).

## How to use it

Both versions follow the same playbook: pick a mode (start of day, feature, bug, review, end of day…), do the work, ask before anything risky, and finish with evidence. Only the way you call them differs.

| | Codex | Claude Code |
|---|---|---|
| Install (once) | `./scripts/install.ps1 -All -ProjectPath <your app>` | `./adapters/claude/install.ps1 -Plugins` |
| Call it | `$codex-app-agent` | `/app-agent` |
| Example | `Use $codex-app-agent: start of day` | `/app-agent start of day` |

### Codex

1. **Install.** From a clone of this repo, run the complete install and point it at your app:
   ```powershell
   ./scripts/install.ps1 -All -ProjectPath C:\path\to\your\app
   ```
   ```bash
   ./scripts/install.sh --all --project=/path/to/your/app
   ```
   This adds the `codex-app-agent`, `execution-checklist`, `doc-coauthoring`, `lancer-loop`, `lancer-foundation`, `idea-lab` and `set-goal` skills to Codex and copies the prompts and references into `<your app>/.codex-app-agent/`.
2. **Tell the project about it.** Copy `.codex-app-agent/AGENTS.md.template` into your app's `AGENTS.md` (merge it if you already have one), and add your project's own rules there: how data is accessed, how releases happen, what must never be done.
3. **Open Codex in your app and type one of these:**

   | Type | What happens |
   |---|---|
   | `Use $codex-app-agent: start of day` | Read-only status (git, PRs, tests, unfinished work), then the highest-value task. Focus mode (`$i-have-adhd`) turns on automatically. |
   | `Use $codex-app-agent: feature <what>` | Clarify, plan, build test-first, verify. |
   | `Use $codex-app-agent: bug <symptom>` | Reproduce, find the cause, fix with a regression test. |
   | `Use $codex-app-agent: release` | Check target, environment and rollback, then wait for your yes. |
   | `Use $codex-app-agent: end of day` | Fresh test and build results, uncommitted work, and the next small task. |

   The full text of each workflow is in `.codex-app-agent/prompts/`. If Codex says it can't find a prompt or reference, tell it they are in `.codex-app-agent/` in your project.
4. **Focus mode anywhere else:** add `$i-have-adhd` to any request.
5. **Documents:** `Use $doc-coauthoring: <what you are writing>` walks a spec, proposal or decision doc through context gathering, section-by-section drafting and a fresh-reader test. In Claude Code it is `/doc-coauthoring`.
6. **Task checklists:** `Use $execution-checklist: compile <task brief>` builds an evidence-gated execution checklist; `Use $execution-checklist: audit <checklist>` audits one. In Claude Code the same skill is installed by the adapter and called as `/execution-checklist`.
7. **Builder-critic agent loops:** `Use $lancer-foundation` takes a project that has nothing built yet to an approved walking skeleton (brief, risk spikes, direction, architecture contract, scaffold, gate) and writes `FOUNDATION.md`. `Use $lancer-loop` interviews you, routes to the best loop for the situation (Anchored Gauntlet, Spec Gauntlet, Tournament or Red-Team), then emits the filled prompt or runs it. It reads `FOUNDATION.md` when present. In Claude Code they are `/lancer-foundation` and `/lancer-loop`.
8. **Ideas and specs:** `Use $idea-lab` takes a domain to 20 ideas, researches prior art and demand, scores them with an independent jury, and can carry the winner through validation and a risk gate to `SPEC.md` and `CLAUDE.md`. Hand the spec to `$lancer-foundation` to build it. In Claude Code it is `/idea-lab`.
9. **Goal briefs:** `Use $set-goal` turns a rambling description of a project into `GOAL.md` for an unattended run: what and why, a locked pass/fail quality bar, tools, creative freedom, how each check is verified, milestones, and Green/Pre-approved/Red limits with hour and spend caps. It also writes a resumable `goal-status.md` and runs a pre-flight (permissions, dependencies, rule clashes, dry run) before you walk away. In Claude Code it is `/set-goal`.

### Claude Code

1. **Install** (for you, in `~/.claude`):
   ```powershell
   ./adapters/claude/install.ps1 -Plugins
   ```
   ```bash
   ./adapters/claude/install.sh --plugins
   ```
   This installs the `app-agent`, `execution-checklist`, `doc-coauthoring`, `lancer-loop`, `lancer-foundation`, `idea-lab` and `set-goal` skills, the `app-agent-verifier` subagent, and, with `-Plugins`/`--plugins`, the bundled Claude Code plugins listed below. Then start a new Claude Code session.
2. **Optional, recommended project setup.** Run `./adapters/claude/install.ps1 -Templates -ProjectPath C:\path\to\your\app` (or `install.sh --templates --path=/path/to/your/app`). Then edit `<your app>/.claude/app-agent.json`: base branch, CI commands, and extra risk rules. Add `@AGENTS.md` to your `CLAUDE.md` so Claude reads the same project rules as Codex.
3. **Open Claude Code in your app and type:**

   | Type | What happens |
   |---|---|
   | `/app-agent start of day` | Read-only status, deploy state, last handoff and tests, then up to 3 tasks. Focus mode turns on automatically and stays on until you say "stop adhd mode". |
   | `/app-agent feature: <what>` | Clarify, spec, build one piece test-first, then risk checks. |
   | `/app-agent bug: <symptom>` | A failing reproduction first, the cause shown before the fix, then a passing rerun. |
   | `/app-agent migration: <change>` | Migration file, local test, and the steps for you to apply it. Nothing is applied to hosted databases. |
   | `/app-agent review` | Risk checks, code and security review, fresh CI, and a PR description. Nothing is pushed. |
   | `/app-agent end of day` | Fresh CI, review, proposed commits (it waits for your yes), and a handoff. |
   | "use the app-agent-verifier" | A separate read-only check that ends with a ready / not ready verdict. |

   Full guide: [`adapters/claude/README.md`](adapters/claude/README.md).

### Bundled skills and plugins

| Name | Kind | Codex | Claude Code | What it adds |
|---|---|---|---|---|
| `codex-app-agent` / `app-agent` | skill | yes | yes | The operating model: modes, routing, gates, completion contract |
| `execution-checklist` | skill | yes | yes | Evidence-gated task checklists (compile / audit) |
| `doc-coauthoring` | skill | yes | yes | Three-stage document co-authoring (Anthropic, Apache-2.0) |
| `lancer-foundation` | skill | yes | yes | From-scratch foundation: brief, spikes, architecture contract, walking skeleton, gate |
| `lancer-loop` | skill | yes | yes | Interview-driven router to builder-critic agent loops (Gauntlet, Tournament, Red-Team) |
| `idea-lab` | skill | yes | yes | Idea generation with prior-art/demand research, independent jury scoring, validation, risk gate, and SPEC.md + CLAUDE.md |
| `set-goal` | skill | yes | yes | Ramble → checkable 7-part goal brief with milestones, resumable progress log and pre-flight, for unattended runs |
| Spartan AI Toolkit (`ai-toolkit@spartan-marketplace`) | plugin | — | `--plugins` | `/spartan:*` workflow commands, rules, skills and agents (MIT) |
| PlanetScale (`planetscale@planetscale`) | plugin | — | `--plugins` | PlanetScale MCP server plus MySQL/Postgres/Vitess safety skills (Apache-2.0) |

The plugins are listed in [`plugins/plugins.json`](plugins/plugins.json) and installed through the Claude Code CLI (`claude plugin marketplace add` then `claude plugin install`). If `claude` is not on your PATH, the installer prints the `/plugin` commands to run inside Claude Code instead. Without `--plugins` nothing touches the network. Spartan overlaps the superpowers and Matt Pocock workflows; app-agent keeps those as primary and uses `/spartan:*` commands only when you name one. Attribution: [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).

### What both will and won't do

They read code, run local tests and builds, and inspect git, PRs and deployments on their own. They **ask first, one action at a time,** before writing to hosted databases or services, deploying, changing secrets or settings, committing, pushing, opening or merging PRs, or installing packages. They don't claim something works without fresh command output.

## Skill reference

Every skill in this package: what it's for, how to call it, and where it fits. Codex calls use `$name`, Claude Code calls use `/name`. All skills install user-wide (`$CODEX_HOME/skills/` or `~/.claude/skills/`) and work in any project you open.

| Skill | Use it when | Codex | Claude Code | Produces |
|---|---|---|---|---|
| `codex-app-agent` / `app-agent` | Day-to-day app work in a repo | `Use $codex-app-agent: <mode>` | `/app-agent <mode>` | The mode's work plus an evidence report |
| `idea-lab` | You need an idea, or need to score and validate one | `Use $idea-lab` | `/idea-lab` | `idea-lab-runs/<date>-<domain>/`: jury scores, `SPEC.md`, `CLAUDE.md` |
| `set-goal` | Before a long autonomous run, or when a goal is still a ramble | `Use $set-goal` | `/set-goal` | `GOAL.md`, `goal-status.md`, goal prompt |
| `lancer-foundation` | Nothing is built yet | `Use $lancer-foundation` | `/lancer-foundation` | `BRIEF.md`, `ARCHITECTURE.md`, `FOUNDATION.md`, running skeleton |
| `lancer-loop` | Multi-round build or polish against a bar | `Use $lancer-loop` | `/lancer-loop` | `loop-prompt.md`, and `loop-status.md` when run |
| `execution-checklist` | Handing a task to another agent, or checking a handoff | `Use $execution-checklist: compile\|audit …` | `/execution-checklist compile\|audit …` | Checklist, evidence ledger, decision register, or audit findings |
| `doc-coauthoring` | Writing a doc people will read | `Use $doc-coauthoring: <doc>` | `/doc-coauthoring <doc>` | The finished document |
| `app-agent-verifier` (subagent, Claude only) | Checking whether a change is really done | — | "use the app-agent-verifier" | Ready / not ready verdict |

Typical order on a new project: `idea-lab` → `set-goal` → `lancer-foundation` → `lancer-loop` (or `app-agent feature:`) → `app-agent review` → `app-agent-verifier`.

### `codex-app-agent` / `app-agent`

- **Use case:** the operating model for app development: picks one mode per task, routes to the skills you actually have enabled, enforces approval gates, and finishes with fresh evidence.
- **How:** `Use $codex-app-agent: start of day` / `/app-agent start of day`. Modes: start of day, feature, bug, release (Codex), migration, review, incident, end of day, weekly (Claude Code). Full tables are in **How to use it** above.
- **Where:** inside an app repository whose `AGENTS.md` (Codex) or `CLAUDE.md` with `@AGENTS.md` (Claude Code) adopts it. Use it every working day.

### `idea-lab`

- **Use case:** a staged ideation pipeline for product or business ideas. Mode A (Generate): frame a domain, generate 20 ideas across 5 lenses, cull to 6, research prior art and demand with graded sources (E1–E4), then score with an independent jury. Mode B (Spec): take an idea you already have through goal and constraints, 3 concept variations, a hybrid, a jury, real-world validation tests, a risk gate (privacy, legal, safety, security), and a build brief. Mode C runs both.
- **How:** `Use $idea-lab` / `/idea-lab`, then give a domain ("pet services in the Philippines") or an idea. It asks for domain, geography, assets, budget/timeline and idea type up front, stops for your approval at 5 checkpoints, and runs every jury in a fresh subagent (or hands you a jury prompt to run in a new session).
- **Where:** before a project exists, in any working folder. Each run lives in `idea-lab-runs/<YYYY-MM-DD>-<domain>/` with a `ledger.md` you can resume. Step details load on demand from `references/` (rules, generate, spec, ledger template). It ends with `SPEC.md` + `CLAUDE.md`, which feed `set-goal` or `lancer-foundation`. Validation tests are designed for you to run; it never marks demand proven from interviews alone, and its risk gate is a checklist, not legal advice.

### `set-goal`

- **Use case:** turns a messy description of a project into a goal brief an agent can run unattended. The 7 parts: what and why (with a real metric), a locked pass/fail quality bar, tools, creative freedom, how each check is verified, delivery split into milestones, and autonomy: Green (just do it), Pre-approved (normally gated, cleared for this run), Red (always stop: push/merge to base, deploy, hosted-data writes, messages, secrets, spending over the limit), plus hour and spend limits.
- **How:** `Use $set-goal` / `/set-goal`, then talk for as long as you like (voice-to-text is fine). It asks only about the gaps (at most 3 questions per round), proposes the milestone split, writes `GOAL.md` and `goal-status.md`, rereads them as a cold executor would, and asks for your yes. Then it runs a **pre-flight** with you: permissions set so the run never waits on a prompt, dependencies installed, clashes with `AGENTS.md`/`CLAUDE.md` resolved, and milestone-1 checks dry-run. Example: `/set-goal I want a landing page for my K9 training business that books consults`.
- **Where:** in the project root, at the start of any substantial piece of work you want to run without supervision. Paste the goal prompt into a fresh session and leave. The executor works one milestone at a time, logs progress in `goal-status.md`, parks a blocked step and moves on to independent milestones, and ends with a fresh-context review.
- **Limits:** it writes the brief but doesn't run or watch the run. If the session dies (crash, sleep, usage limit), paste the same goal prompt into a new session and it resumes from `goal-status.md`. Keep the computer awake and online.

### `lancer-foundation`

- **Use case:** takes a project that has nothing built yet to an approved, running anchor: brief, scope cut, risk spikes, direction, architecture contract, scaffold, quality harness, walking skeleton, backlog, then a gate.
- **How:** `Use $lancer-foundation` / `/lancer-foundation`. It stops at three checkpoints (brief, architecture contract, gate) for your approval. Feed it `GOAL.md` when you have one.
- **Where:** in an empty or near-empty repository, once per project, before any loop or feature work.

### `lancer-loop`

- **Use case:** interviews you, then deterministically picks and fills the right builder-critic loop: Anchored Gauntlet, Spec Gauntlet, Tournament, Red-Team, or a chain of them.
- **How:** `Use $lancer-loop` / `/lancer-loop`. Answer the interview, approve the route, then choose "emit prompt" or "run now". It reads `FOUNDATION.md` when present.
- **Where:** large, multi-round build or polish work against a clear bar. A single feature or bug goes through `app-agent` instead.

### `execution-checklist`

- **Use case:** an execution contract with evidence gates: what may change, what must stay true, order of work, what proves success, and where the executor's authority ends.
- **How:** `Use $execution-checklist: compile <task brief or GOAL.md>` or `… audit <checklist>`. In Claude Code: `/execution-checklist compile …`.
- **Where:** whenever work crosses agents (Claude → Codex, lead → subagent), or when you want to audit a handoff before trusting it.

### `doc-coauthoring`

- **Use case:** a three-stage workflow for documents people will read (specs, proposals, PRDs, decision docs, RFCs): context gathering, section-by-section drafting, then a fresh-reader test.
- **How:** `Use $doc-coauthoring: <what you are writing>` / `/doc-coauthoring <what you are writing>`.
- **Where:** human-facing documents. Agent-facing files (`AGENTS.md`, `CLAUDE.md`, skills) follow `mattpocock-skills:writing-for-agents` instead. Vendored from Anthropic under Apache-2.0 (see `THIRD_PARTY_NOTICES.md`).

### `app-agent-verifier` (Claude Code subagent)

- **Use case:** a separate-context, read-only "is it done?" pass: risk checks, CI, a defect review, and a ready / not ready verdict.
- **How:** say "use the app-agent-verifier" in Claude Code.
- **Where:** after `/app-agent review` or before you approve a commit or PR. Installed to `~/.claude/agents/` by the Claude adapter.

## Quick start

### Guided installation

Run the installer without `-All` and choose the components interactively:

```powershell
./scripts/install.ps1
```

```bash
./scripts/install.sh
```

### Complete installation

Install the complete Codex bundle into the user skill directory:

```powershell
./scripts/install.ps1 -All
```

```bash
./scripts/install.sh --all
```

The complete installation includes the `codex-app-agent`, `execution-checklist`, `doc-coauthoring`, `lancer-loop`, `lancer-foundation`, `idea-lab` and `set-goal` skills and copies the reusable references and prompts into the selected project. It does not install dependencies, change application source code, deploy, commit, push, or alter hosted services.

## Project setup

After installation, add the provided `templates/AGENTS.md` guidance to the target project, or ask the agent to use `codex-app-agent` for the current project. The agent should read the relevant prompt for the current situation rather than loading every reference on every turn.

## Updating

Pull a newer release, review the changelog or diff, then rerun the installer. Use a pinned tag when reproducibility matters. The installer is intentionally idempotent and only manages files inside its destination directories.

## Safety model

The installers copy files only; the one exception is the Claude adapter's opt-in `--plugins` switch, which asks the Claude Code CLI to fetch the bundled plugins from their marketplaces. The package may inspect repositories and run local verification, but it must ask before hosted-data writes, deployment, secrets/settings changes, commits, pushes, or destructive actions. Completion claims require fresh evidence.

## Claude and other agents

The portable references and prompts are platform-neutral. Claude Code has its own adapter in [`adapters/claude/`](adapters/claude/README.md) (see **How to use it** above). Keep shared operating rules in `references/` and keep tool-specific invocation syntax in the platform adapter or skill entrypoint.
