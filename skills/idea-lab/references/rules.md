# Rules, evidence grades, variables

## Global rules (prepend to every step)
```
GLOBAL RULES
- Use the output schema given. "..." and "<n>" mean "repeat the line pattern"; do not output them literally. No preamble, no extra sections.
- Allowed gate statuses: PASS / FAIL / UNKNOWN. UNKNOWN must say what evidence would resolve it.
- Tag every factual, market, or trend claim:
    [USER] = provided by me
    [E1–E4: URL, accessed YYYY-MM-DD] = from a source you retrieved, graded per the evidence grades
    [ASSUMED] = your inference
  Never present [ASSUMED] as fact.
- Reference IDs (C1, S1, I07, V2, H1) instead of restating content.
- Start your output with: CONSUMED: <IDs and files used> | PRODUCES: <IDs created>.
- If an input is missing or contradictory, stop and output: BLOCKED: <what is missing>.
```

## Evidence grades
| Grade | Meaning | Examples |
|---|---|---|
| **E1** | Direct user or market behavior | Reviews, forum complaints, public pricing paid by real customers, sales or traffic data, observed behavior |
| **E2** | Reputable independent secondary | Industry reports, established press, government or academic data |
| **E3** | Vendor or self-interested claim | Competitor marketing pages, press releases, company "traction" claims |
| **E4** | Anecdote, unsourced, or search unavailable | Single blog opinion, AI summary, your own inference |

Rules: prefer sources from the target geography; note when a source covers a different market. When sources conflict, report both and use the lower-confidence reading for scoring.

## Variables
| Variable | Used in | Example |
|---|---|---|
| `{{DOMAIN}}` | Mode A/C | Pet services in the Philippines |
| `{{GEOGRAPHY}}` | All | Philippines (Iloilo / Visayas) |
| `{{BUILDER_ASSETS}}` | Mode A/C | Skills, location, network, capital, existing projects you can reuse |
| `{{BUDGET_TIMELINE}}` | All | ≤ $5k, 3 months, solo builder |
| `{{IDEA_TYPE}}` | All | Business / software product / physical-experience / internal tool |
| `{{SEED}}` | Mode B | Your existing idea |
| `{{TRENDS}}` | Optional | Trend keywords or sources you want included |
| `{{STACK}}` | S8 | React + TypeScript + Vite + Tailwind + Supabase (default) |
| `{{REPO}}` | S8 | `greenfield`, or path/URL of an existing repo |
| `{{OWNER}}` | S8 | Kevin (default owner for open questions) |
| `{{TRANSFER_GOAL}}` | Optional S7 | A second domain to adapt the champion into |
