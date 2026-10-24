# Codex App Agent

Reusable, cross-project operating guidance for app-development agents.

This repository packages a portable Codex skill, lifecycle prompts, skill-audit references, and installers. It can be installed one skill at a time for first-time users or installed as a complete bundle. A Claude Code version lives in [`adapters/claude/`](adapters/claude/README.md).

## How to use it

Both versions follow the same playbook: pick a mode (start of day, feature, bug, review, end of day…), do the work, ask before anything risky, and finish with evidence. Only the way you call them differs.

| | Codex | Claude Code |
|---|---|---|
| Install (once) | `./scripts/install.ps1 -All -ProjectPath <your app>` | `./adapters/claude/install.ps1` |
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
   This adds the `codex-app-agent` skill to Codex and copies the prompts and references into `<your app>/.codex-app-agent/`.
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

### Claude Code

1. **Install** (for you, in `~/.claude`):
   ```powershell
   ./adapters/claude/install.ps1
   ```
   ```bash
   ./adapters/claude/install.sh
   ```
   Then start a new Claude Code session.
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

### What both will and won't do

They read code, run local tests and builds, and inspect git, PRs and deployments on their own. They **ask first, one action at a time,** before writing to hosted databases or services, deploying, changing secrets or settings, committing, pushing, opening or merging PRs, or installing packages. They don't claim something works without fresh command output.

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

The complete installation includes the `codex-app-agent` skill and copies the reusable references and prompts into the selected project. It does not install dependencies, change application source code, deploy, commit, push, or alter hosted services.

## Project setup

After installation, add the provided `templates/AGENTS.md` guidance to the target project, or ask the agent to use `codex-app-agent` for the current project. The agent should read the relevant prompt for the current situation rather than loading every reference on every turn.

## Updating

Pull a newer release, review the changelog or diff, then rerun the installer. Use a pinned tag when reproducibility matters. The installer is intentionally idempotent and only manages files inside its destination directories.

## Safety model

The package may inspect repositories and run local verification, but it must ask before hosted-data writes, deployment, secrets/settings changes, commits, pushes, or destructive actions. Completion claims require fresh evidence.

## Claude and other agents

The portable references and prompts are platform-neutral. Claude Code has its own adapter in [`adapters/claude/`](adapters/claude/README.md) (see **How to use it** above). Keep shared operating rules in `references/` and keep tool-specific invocation syntax in the platform adapter or skill entrypoint.
