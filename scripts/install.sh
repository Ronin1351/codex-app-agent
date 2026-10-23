#!/usr/bin/env bash
set -euo pipefail

ALL=false
PROJECT_ONLY=false
PROJECT_PATH="$(pwd)"
for arg in "$@"; do
  case "$arg" in
    --all) ALL=true ;;
    --project-only) PROJECT_ONLY=true ;;
    --project=*) PROJECT_PATH="${arg#*=}" ;;
    *) echo "Unknown option: $arg" >&2; exit 2 ;;
  esac
done

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
SKILL_DEST="$CODEX_HOME/skills/codex-app-agent"
PROJECT_DEST="$PROJECT_PATH/.codex-app-agent"

install_skill() {
  mkdir -p "$SKILL_DEST"
  cp -R "$REPO/skills/codex-app-agent/." "$SKILL_DEST/"
  echo "Installed skill: $SKILL_DEST"
}

install_project() {
  mkdir -p "$PROJECT_DEST/references" "$PROJECT_DEST/prompts"
  cp -R "$REPO/references/." "$PROJECT_DEST/references/"
  cp -R "$REPO/prompts/." "$PROJECT_DEST/prompts/"
  cp "$REPO/templates/AGENTS.md" "$PROJECT_DEST/AGENTS.md.template"
  cp "$REPO/templates/agent-session.md" "$PROJECT_DEST/agent-session.md.template"
  echo "Installed project references: $PROJECT_DEST"
}

if $PROJECT_ONLY; then install_project; exit 0; fi
if $ALL; then install_skill; install_project; exit 0; fi

echo 'Codex App Agent guided installer'
select choice in 'Install the Codex skill' 'Install project references and prompts' 'Install both'; do
  case "$REPLY" in
    1) install_skill; break ;;
    2) install_project; break ;;
    3) install_skill; install_project; break ;;
    *) echo 'Choose 1, 2, or 3.' ;;
  esac
done
