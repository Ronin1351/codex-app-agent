[CmdletBinding()]
param(
  # Install into <ProjectPath>\.claude instead of the user's ~/.claude (shared with the team via git).
  [switch]$Project,
  [string]$ProjectPath = (Get-Location).Path,
  # Also copy the project templates (CLAUDE.md.template, app-agent.json if missing).
  [switch]$Templates,
  [string]$ClaudeHome = (Join-Path $HOME '.claude')
)
# Copies files only. No network, dependency installs, commits, pushes or hosted-service calls.
$ErrorActionPreference = 'Stop'
$adapter = $PSScriptRoot
$root = if ($Project) { Join-Path (Resolve-Path -LiteralPath $ProjectPath).Path '.claude' } else { $ClaudeHome }

$skillDest = Join-Path $root 'skills\app-agent'
New-Item -ItemType Directory -Path $skillDest -Force | Out-Null
Copy-Item -Path (Join-Path $adapter 'skills\app-agent\*') -Destination $skillDest -Recurse -Force
Write-Host "Installed skill:    $skillDest"

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
Write-Host 'Restart Claude Code (or start a new session) so it picks up the skill and subagent.'
