# Codex App Agent

Reusable, cross-project operating guidance for app-development agents.

This repository packages a portable Codex skill, lifecycle prompts, skill-audit references, and installers. It can be installed one skill at a time for first-time users or installed as a complete bundle.

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

The portable references and prompts are platform-neutral. Platform-specific adapters may be added under `adapters/` in future releases. Keep shared operating rules in `references/` and keep tool-specific invocation syntax in the platform adapter or skill entrypoint.
