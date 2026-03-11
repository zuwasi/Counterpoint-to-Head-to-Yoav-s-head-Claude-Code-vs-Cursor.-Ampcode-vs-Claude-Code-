# Counterpoint: Ampcode vs Claude Code — Head-to-Head

## Reproducing Yoav Abrahami's AI Coding Agent Comparison

This repository is a **counterpoint study** to Yoav Abrahami's article:
> [Head to head: Claude Code (Opus 4.6 / 1M) vs Cursor (Composer 1.5 / 200k)](https://medium.com/wix-engineering/head-to-head-claude-code-opus-4-6-1m-vs-cursor-composer-1-5-200k-f15c537428ea)

**Instead of Cursor, we test Ampcode** against Claude Code using the **identical task, methodology, and evaluation criteria**.

---

## 🧪 The Test

| Dimension | Detail |
|---|---|
| **Task** | Implement Design Log #102 — Nested Headfull Full-Stack Components in the [Jay Framework](https://github.com/jay-framework/jay) |
| **Methodology** | [Design Log Methodology](https://github.com/yoavaa/design-log-methodology) |
| **Tool A** | Claude Code (Opus 4.6 / 1M context) |
| **Tool B** | Ampcode (replacing Cursor from original article) |
| **Evaluation** | 6 criteria, scored 1-5 each (max 30) |

---

## 📂 Repository Structure

### Branches

| Branch | Purpose |
|---|---|
| `main` | Comparison documents, runbooks, final analysis |
| `claude-code` | Claude Code session results, transcripts, scores |
| `ampcode` | Ampcode session results, transcripts, scores |

### Main Branch Contents

```
├── README.md                      # This file
├── CLAUDE-CODE-RUNBOOK.md         # Step-by-step instructions for Claude Code run
├── AMPCODE-RUNBOOK.md             # Step-by-step instructions for Ampcode run
├── DESIGN-LOG-102.md              # The design log used as input (frozen)
├── COMPARISON.md                  # Side-by-side comparison (filled after both runs)
├── METHODOLOGY.md                 # How the test was conducted
└── DEVIATIONS-FROM-ORIGINAL.md    # Differences from original article (with justification)
```

### Claude Code Branch (`claude-code`)

```
claude-code-results/
├── session-transcript.md
├── timing-log.md
├── cost-log.md
├── phase-1-log.md
├── phase-2-log.md
├── phase-3-log.md
├── deviations.md
├── scores.md
└── human-interventions.md
```

### Ampcode Branch (`ampcode`)

```
ampcode-results/
├── session-transcript.md
├── timing-log.md
├── cost-log.md
├── phase-1-log.md
├── phase-2-log.md
├── phase-3-log.md
├── deviations.md
├── scores.md
└── human-interventions.md
```

---

## 📊 Evaluation Criteria

Directly from Yoav's article — unchanged:

| # | Criterion | What We Measure |
|---|---|---|
| A | **Initial Planning** | Codebase exploration before coding, lifecycle gap identification |
| B | **Edge Case Handling** | Import name resolution, path/extension handling |
| C | **Debugging & Iteration** | SSR failures, Vite errors, iteration count |
| D | **Testing Discipline** | Fixture-based testing vs `toContain`, `prettifyHtml` usage |
| E | **Architectural Awareness** | "Bulldozer" vs "Architect" — does the agent flag design gaps? |
| F | **Out-of-Scope Gaps** | Proactive identification of missing foundations |

---

## 🔀 Key Deviation from Original

| What Changed | Why |
|---|---|
| **Cursor → Ampcode** | This is the purpose of the study — to see how Ampcode compares to Claude Code on the same benchmark |

Everything else is kept identical: same task, same design log, same prompt, same evaluation criteria, same scoring rubric, same methodology rules.

---

## ⏱️ Timeline

| Step | Status |
|---|---|
| 1. Create runbooks | ✅ Done |
| 2. Run Claude Code test | ⬜ Pending |
| 3. Run Ampcode test | ⬜ Pending |
| 4. Score both runs | ⬜ Pending |
| 5. Write comparison | ⬜ Pending |
| 6. Publish results | ⬜ Pending |

---

## 🔗 References

- **Original Article**: https://medium.com/wix-engineering/head-to-head-claude-code-opus-4-6-1m-vs-cursor-composer-1-5-200k-f15c537428ea
- **Jay Framework**: https://github.com/jay-framework/jay
- **Design Log Methodology**: https://github.com/yoavaa/design-log-methodology
- **Design Log #102 (Gist)**: https://gist.github.com/yoavaa/5ce521d602704d5395e326382c4f004b
- **Ampcode**: https://ampcode.com
