# Installation guide

This guide is for a first-time user. The package has two supported modes:

- Guided mode installs one component at a time and lets you inspect each choice.
- Complete mode installs the Codex skill and project references in one command.

## Before starting

1. Clone or download this repository.
2. Open a terminal in its directory.
3. Decide whether you want a user-wide Codex skill, project-local references, or both.
4. Review the files before running an installer if your organization requires review.

The installer does not install application dependencies, access hosted services, modify secrets, deploy, commit, or push.

## Windows: guided installation

```powershell
./scripts/install.ps1
```

Choose one option:

1. **Codex skill** — installs `codex-app-agent` under `$CODEX_HOME/skills`.
2. **Project references** — copies prompts, registry, matrix, and templates under `.codex-app-agent` in the current project.
3. **Both** — performs both operations.

To target a different project for the project references, run from that project or pass the script's `-ProjectPath` parameter.

## Windows: complete installation

```powershell
./scripts/install.ps1 -All -ProjectPath C:\path\to\your\project
```

## macOS/Linux: guided installation

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

## macOS/Linux: complete installation

```bash
./scripts/install.sh --all --project=/path/to/your/project
```

## First use

Open the target project in Codex and invoke or request `codex-app-agent`. Start with the matching prompt:

- `prompts/start-of-day.md`
- `prompts/feature-development.md`
- `prompts/bug-diagnosis.md`
- `prompts/release-and-deployment.md`
- `prompts/end-of-day.md`

The Start-of-Day prompt automatically uses the `$i-have-adhd` focused interaction mode. Other workflows use it when the user includes the modifier.

## Updating

Pull a new version, inspect the diff, then rerun the same installer command. The project bundle is regenerated from the repository and is safe to refresh. Before updating a pinned installation, copy or commit any local changes under `.codex-app-agent`.

## Removing an installation

Removal is deliberately manual so the target is visible. Delete only the exact installed directories:

- user skill: `$CODEX_HOME/skills/codex-app-agent`
- project bundle: `<project>/.codex-app-agent`

The package does not remove files automatically.
