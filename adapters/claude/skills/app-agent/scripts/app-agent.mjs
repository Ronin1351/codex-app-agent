#!/usr/bin/env node
// app-agent helper for Claude Code. Read-only: never writes files, pushes, deploys or touches hosted data.
//   node <skill>/scripts/app-agent.mjs capabilities   plugins, skills, CLIs, project config
//   node <skill>/scripts/app-agent.mjs risk [base]    changed files -> required checks (+ CI commands)
//   node <skill>/scripts/app-agent.mjs deploy         latest production deployment vs the base branch
//   node <skill>/scripts/app-agent.mjs focus          path of the i-have-adhd ruleset, if installed
// Project config: .claude/app-agent.json (or APP_AGENT_CONFIG=<path>). See templates/app-agent.json.
import { execFileSync } from "node:child_process";
import { existsSync, readFileSync, readdirSync, statSync } from "node:fs";
import { homedir } from "node:os";
import path from "node:path";

const sh = (cmd, args, timeout = 20000) => {
  try { return execFileSync(cmd, args, { encoding: "utf8", stdio: ["ignore", "pipe", "ignore"], timeout }).trim(); }
  catch { return null; }
};
// One fetch per run, time-boxed. On failure the local copy of origin/<base> is used, and the output says so.
let fetched = null;
const fetchBase = branch => {
  if (fetched === null) fetched = sh("git", ["fetch", "--quiet", "origin", branch], 30000) !== null;
  if (!fetched) console.log(`(fetch of origin/${branch} failed or timed out; using the local copy)`);
};
const baseExists = branch => sh("git", ["rev-parse", "--verify", "--quiet", `origin/${branch}`]) !== null;
const readJson = p => { try { return JSON.parse(readFileSync(p, "utf8")); } catch { return null; } };
const has = cmd => !!sh(process.platform === "win32" ? "where" : "which", [cmd]);

// ---------- project config ----------
const configPath = process.env.APP_AGENT_CONFIG || path.join(".claude", "app-agent.json");
const config = readJson(configPath) || {};
// Default base: the remote's default branch (origin/HEAD), then "main".
const baseBranch = config.baseBranch
  || (sh("git", ["symbolic-ref", "--quiet", "--short", "refs/remotes/origin/HEAD"]) || "").replace(/^origin\//, "")
  || "main";
const productionEnv = config.productionEnvironment || "Production";

function ciCommands() {
  if (Array.isArray(config.ci) && config.ci.length) return config.ci;
  const scripts = (readJson("package.json") || {}).scripts || {};
  const pick = names => names.find(n => scripts[n]);
  return [pick(["typecheck", "type-check", "tsc"]), pick(["lint"]), pick(["test"]), pick(["build"])]
    .filter(Boolean).map(n => `npm run ${n}`);
}

// Generic defaults. A project's "rules" array replaces them; "extraRules" adds to them.
const DEFAULT_RULES = [
  { id: "secret", label: "SECRET FILE — stop", block: true, pattern: "(^|/)\\.env(?!\\.example$)|\\.(pem|key|jks|keystore|p12|pfx)$",
    checks: ["Remove it from the change; secrets belong in the platform's secret store"] },
  { id: "migration", label: "Database migration", pattern: "(^|/)(supabase/migrations|prisma/migrations|db/migrations|migrations)/",
    checks: ["Built and tested against a local database only", "Grants and row-level security reviewed", "Owner applies to each hosted environment, after a backup"] },
  { id: "auth", label: "Auth / session", pattern: "(^|/)(middleware\\.[jt]s|[^/]*(auth|session|login)[^/]*\\.[jt]sx?)$",
    checks: ["Security review of the diff (/security-review)", "Negative tests: wrong user, expired or forged session"] },
  { id: "api", label: "API route", pattern: "^(src/)?(app|pages)/api/|^(src/)?routes/api/",
    checks: ["Input validation and authorization in the handler", "Security review of the diff"] },
  { id: "ci", label: "CI / deploy config", pattern: "^\\.github/|^(vercel|netlify)\\.(json|toml)$|(^|/)Dockerfile$",
    checks: ["Owner review: this changes how code ships"] },
  { id: "deps", label: "Dependencies", pattern: "(^|/)(package\\.json|package-lock\\.json|pnpm-lock\\.yaml|yarn\\.lock|bun\\.lockb?)$",
    checks: ["Clean install, then the CI commands; name each added package and why"] },
  { id: "ui", label: "UI", pattern: "\\.(tsx|jsx|vue|svelte|css|scss)$",
    checks: ["Rendered check at phone and desktop widths, light and dark", "No console errors"] },
];
const rules = [...(Array.isArray(config.rules) ? config.rules : DEFAULT_RULES), ...(config.extraRules || [])]
  .map(r => ({ ...r, re: new RegExp(r.pattern) }));

// ---------- capabilities ----------
function capabilities() {
  const home = homedir();
  const user = readJson(path.join(home, ".claude", "settings.json")) || {};
  const proj = readJson(path.join(".claude", "settings.json")) || {};
  const plugins = { ...(user.enabledPlugins || {}), ...(proj.enabledPlugins || {}) };
  const on = Object.entries(plugins).filter(([, v]) => v).map(([k]) => k.split("@")[0]);
  const skillsIn = d => existsSync(d) ? readdirSync(d).filter(n => existsSync(path.join(d, n, "SKILL.md"))) : [];
  const mcp = Object.keys((readJson(".mcp.json") || {}).mcpServers || {});

  const watch = [
    ["mattpocock-skills", "tdd, diagnosing-bugs, grill-with-docs, to-spec, handoff, pr, wizard"],
    ["i-have-adhd", "/i-have-adhd output mode (user-invoked)"],
    ["intent", "UX evaluation (intent:evaluate) for flow critiques"],
    ["andrej-karpathy-skills", "coding-behavior guidelines"],
  ];
  console.log("Plugins (enabledPlugins):");
  for (const [p, use] of watch) console.log(`  ${on.includes(p) ? "ON " : "off"}  ${p.padEnd(24)} ${use}`);
  const others = on.filter(p => !watch.some(([w]) => w === p));
  if (others.length) console.log(`  other ON: ${others.join(", ")}`);
  console.log(`User skills: ${skillsIn(path.join(home, ".claude", "skills")).join(", ") || "(none)"}`);
  console.log(`Project skills: ${skillsIn(path.join(".claude", "skills")).join(", ") || "(none)"}`);
  console.log(`Project MCP servers (.mcp.json): ${mcp.join(", ") || "(none)"}  — connectors added in claude.ai do not appear here; check the tool list`);
  console.log(`CLIs: ${["git", "gh", "node", "vercel", "supabase", "graphify"].map(t => `${t}:${has(t) ? "yes" : "no"}`).join("  ")}`);
  console.log(`Graph: ${existsSync("graphify-out/graph.json") ? "graphify-out/graph.json present" : "none"}`);
  console.log(`Project config: ${existsSync(configPath) ? configPath : "none (generic rules, CI from package.json)"}`);
  console.log(`Base branch: ${baseBranch}${baseExists(baseBranch) ? "" : "  (origin/" + baseBranch + " NOT FOUND: set baseBranch)"}   CI: ${ciCommands().join(" && ") || "(none found)"}`);
}

// ---------- focus ----------
// Finds the i-have-adhd ruleset (Claude or Codex plugin cache, or a plain skills folder), newest copy first.
function findFocusRules() {
  const home = homedir();
  const found = [];
  for (const cache of [path.join(home, ".claude", "plugins", "cache"), path.join(process.env.CODEX_HOME || path.join(home, ".codex"), "plugins", "cache")]) {
    if (!existsSync(cache)) continue;
    for (const market of readdirSync(cache)) {
      const pdir = path.join(cache, market, "i-have-adhd");
      if (!existsSync(pdir)) continue;
      for (const ver of readdirSync(pdir)) found.push(path.join(pdir, ver, "skills", "i-have-adhd", "SKILL.md"));
    }
  }
  for (const d of [path.join(home, ".claude", "skills"), path.join(home, ".codex", "skills"), path.join(home, ".agents", "skills")])
    found.push(path.join(d, "i-have-adhd", "SKILL.md"));
  return found.filter(existsSync).sort((a, b) => statSync(b).mtimeMs - statSync(a).mtimeMs)[0] || null;
}
function focus() {
  const f = findFocusRules();
  console.log(f ? `Focus ruleset: ${f}\nRead it and follow it for the rest of the session, until the user says "stop adhd mode" or "normal mode".`
                : "Focus ruleset not installed; use the short focus rules in SKILL.md.");
}

// ---------- risk ----------
function risk(baseArg) {
  if (!baseArg) {
    fetchBase(baseBranch);
    if (!baseExists(baseBranch)) {
      console.log(`origin/${baseBranch} does not exist. Set "baseBranch" in ${configPath}, or pass a base: risk origin/<branch>`);
      process.exitCode = 1;
      return;
    }
  }
  const base = baseArg || sh("git", ["merge-base", "HEAD", `origin/${baseBranch}`]) || `origin/${baseBranch}`;
  const committed = (sh("git", ["diff", "--name-only", `${base}...HEAD`]) || "").split("\n");
  const working = (sh("git", ["status", "--porcelain", "--untracked-files=all"]) || "").split("\n").map(l => l.slice(3).replace(/^"|"$/g, ""));
  const ignore = (config.ignore || ["graphify-out/", ".claude/"]);
  const files = [...new Set([...committed, ...working].filter(Boolean).map(f => f.replace(/\\/g, "/")))]
    .filter(f => !ignore.some(p => f.startsWith(p)));
  console.log(`Base: ${base.slice(0, 12)}  Changed files: ${files.length}`);
  let blocked = false;
  for (const r of rules) {
    const hit = files.filter(f => r.re.test(f));
    if (!hit.length) continue;
    if (r.block) blocked = true;
    console.log(`\n## ${r.label} (${hit.length})`);
    for (const f of hit.slice(0, 8)) console.log(`  - ${f}`);
    if (hit.length > 8) console.log(`  … ${hit.length - 8} more`);
    for (const c of r.checks) console.log(`  [ ] ${c}`);
  }
  console.log("\n## Always");
  for (const c of ciCommands()) console.log(`  [ ] ${c}`);
  if (blocked) process.exitCode = 2;
}

// ---------- deploy ----------
function deploy() {
  const slug = ((sh("git", ["remote", "get-url", "origin"]) || "").match(/github\.com[/:]([^/]+\/[^/.]+)/) || [])[1];
  if (!slug) return console.log("origin is not a GitHub remote");
  const raw = sh("gh", ["api", `repos/${slug}/deployments?environment=${encodeURIComponent(productionEnv)}&per_page=1`]);
  if (!raw) return console.log("gh could not read deployments (not installed or not logged in)");
  const d = JSON.parse(raw)[0];
  if (!d) return console.log(`No "${productionEnv}" deployments recorded on GitHub (set productionEnvironment in the config if it is named differently)`);
  const st = JSON.parse(sh("gh", ["api", d.statuses_url]) || "[]")[0] || {};
  fetchBase(baseBranch);
  const head = sh("git", ["rev-parse", "--verify", "--quiet", `origin/${baseBranch}`]) || "";
  if (!head) console.log(`origin/${baseBranch} does not exist; set "baseBranch" in ${configPath}`);
  console.log(`${productionEnv}: ${d.sha.slice(0, 7)} ${st.state || "unknown"} at ${st.created_at || d.created_at}`);
  console.log(`origin/${baseBranch}: ${head.slice(0, 7)} ${d.sha === head ? "(deployed)" : "(NOT the deployed commit)"}`);
  if (head && d.sha !== head) {
    const n = sh("git", ["rev-list", "--count", `${d.sha}..origin/${baseBranch}`]);
    if (n) console.log(`Commits on ${baseBranch} not yet live: ${n}`);
  }
}

const [cmd, arg] = process.argv.slice(2);
({ capabilities, risk, deploy, focus }[cmd] || (() => console.log("usage: app-agent.mjs capabilities | risk [base] | deploy | focus")))(arg);
