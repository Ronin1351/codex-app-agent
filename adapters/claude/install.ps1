[CmdletBinding()]
param(
  # Install into <ProjectPath>\.claude instead of the user's ~/.claude (shared with the team via git).
  [switch]$Project,
  [string]$ProjectPath = (Get-Location).Path,
  # Also copy the project templates (CLAUDE.md.template, app-agent.json if missing).
  [switch]$Templates,
  # Also install the bundled Claude Code plugins listed in plugins\plugins.json (uses the network via the claude CLI).
  [switch]$Plugins,
  [string]$ClaudeHome = (Join-Path $HOME '.claude')
)
# Copies files only. No network, dependency installs, commits, pushes or hosted-service calls,
# except -Plugins, which asks the Claude Code CLI to add the plugins in plugins\plugins.json.
$ErrorActionPreference = 'Stop'
$adapter = $PSScriptRoot
$root = if ($Project) { Join-Path (Resolve-Path -LiteralPath $ProjectPath).Path '.claude' } else { $ClaudeHome }

$skillDest = Join-Path $root 'skills\app-agent'
New-Item -ItemType Directory -Path $skillDest -Force | Out-Null
Copy-Item -Path (Join-Path $adapter 'skills\app-agent\*') -Destination $skillDest -Recurse -Force
Write-Host "Installed skill:    $skillDest"

# Shared skill: single source in skills\execution-checklist (agents\ is Codex-only metadata).
$checklistDest = Join-Path $root 'skills\execution-checklist'
New-Item -ItemType Directory -Path $checklistDest -Force | Out-Null
Copy-Item -LiteralPath (Join-Path (Split-Path -Parent (Split-Path -Parent $adapter)) 'skills\execution-checklist\SKILL.md') -Destination $checklistDest -Force
Write-Host "Installed skill:    $checklistDest"

# Shared skill: doc-coauthoring (Apache-2.0, see THIRD_PARTY_NOTICES.md).
$docDest = Join-Path $root 'skills\doc-coauthoring'
New-Item -ItemType Directory -Path $docDest -Force | Out-Null
Copy-Item -LiteralPath (Join-Path (Split-Path -Parent (Split-Path -Parent $adapter)) 'skills\doc-coauthoring\SKILL.md') -Destination $docDest -Force
Write-Host "Installed skill:    $docDest"

# Shared skills: Lancer Loop + Lancer Foundation (agents\ is Codex-only metadata).
foreach ($lancer in 'lancer-loop', 'lancer-foundation') {
  $lancerDest = Join-Path $root "skills\$lancer"
  New-Item -ItemType Directory -Path $lancerDest -Force | Out-Null
  Copy-Item -LiteralPath (Join-Path (Split-Path -Parent (Split-Path -Parent $adapter)) "skills\$lancer\SKILL.md") -Destination $lancerDest -Force
  Write-Host "Installed skill:    $lancerDest"
}

# Shared skill: Idea Lab (SKILL.md + references; agents\ is Codex-only metadata).
$ideaLabSrc = Join-Path (Split-Path -Parent (Split-Path -Parent $adapter)) 'skills\idea-lab'
$ideaLabDest = Join-Path $root 'skills\idea-lab'
New-Item -ItemType Directory -Path (Join-Path $ideaLabDest 'references') -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $ideaLabSrc 'SKILL.md') -Destination $ideaLabDest -Force
Copy-Item -Path (Join-Path $ideaLabSrc 'references\*.md') -Destination (Join-Path $ideaLabDest 'references') -Force
Write-Host "Installed skill:    $ideaLabDest"

$agentDest = Join-Path $root 'agents'
New-Item -ItemType Directory -Path $agentDest -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $adapter 'agents\app-agent-verifier.md') -Destination $agentDest -Force
Write-Host "Installed subagent: $(Join-Path $agentDest 'app-agent-verifier.md')"

if ($Templates) {
  $projClaude = Join-Path (Resolve-Path -LiteralPath $ProjectPath).Path '.claude'
  New-Item -ItemType Directory -Path $projClaude -Force | Out-Null
  $cfg = Join-Path $projClaude 'app-agent.json'
  if (Test-Path -LiteralPath $cfg) { Write-Host "Kept existing:      $cfg" }
  else { Copy-Item -LiteralPath (Join-Path $adapter 'templates\app-agent.json') -Destination $cfg; Write-Host "Created config:     $cfg" }
  Copy-Item -LiteralPath (Join-Path $adapter 'templates\CLAUDE.md') -Destination (Join-Path $projClaude 'CLAUDE.md.template') -Force
  Write-Host "Template:           $(Join-Path $projClaude 'CLAUDE.md.template') (merge into your CLAUDE.md by hand)"
}

# Bundled Claude Code plugins (plugins\plugins.json). Opt-in because it reaches the network.
$manifest = Get-Content -Raw -LiteralPath (Join-Path (Split-Path -Parent (Split-Path -Parent $adapter)) 'plugins\plugins.json') | ConvertFrom-Json
if ($Plugins) {
  $scope = if ($Project) { 'project' } else { 'user' }
  if (Get-Command claude -ErrorAction SilentlyContinue) {
    $failed = $false
    Push-Location (Resolve-Path -LiteralPath $ProjectPath).Path
    try {
      foreach ($p in $manifest.plugins) {
        & claude plugin marketplace add $p.marketplace --scope $scope
        if ($LASTEXITCODE -eq 0) { & claude plugin install $p.plugin --scope $scope }
        if ($LASTEXITCODE -eq 0) { Write-Host "Installed plugin:   $($p.plugin) ($scope)" }
        else { Write-Warning "Plugin FAILED: $($p.plugin)  (run: claude plugin marketplace add $($p.marketplace); claude plugin install $($p.plugin))"; $failed = $true }
      }
    } finally { Pop-Location }
    if ($failed) { Write-Warning 'Some plugins did not install; the skills above are installed either way.' }
  } else {
    Write-Host "Claude Code CLI ('claude') not found. Install the bundled plugins from inside Claude Code:"
    foreach ($p in $manifest.plugins) { Write-Host "  /plugin marketplace add $($p.marketplace)"; Write-Host "  /plugin install $($p.plugin)" }
  }
} else {
  Write-Host "Bundled plugins not installed (rerun with -Plugins): $(($manifest.plugins | ForEach-Object { $_.name }) -join ', ')"
}
Write-Host 'Restart Claude Code (or start a new session) so it picks up the skills, subagent and plugins.'
