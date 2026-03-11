# Claude Code (Opus 4.6 / 1M) — Head-to-Head Runbook

## Counterpoint Test: Reproducing Yoav Abrahami's Head-to-Head Methodology

> **Original article**: [Head to head: Claude Code (Opus 4.6 / 1M) vs Cursor (Composer 1.5 / 200k)](https://medium.com/wix-engineering/head-to-head-claude-code-opus-4-6-1m-vs-cursor-composer-1-5-200k-f15c537428ea)
>
> **This test**: Claude Code (Opus 4.6 / 1M) vs **Ampcode** — replicating the identical task, methodology, and evaluation criteria.
>
> **This document**: Step-by-step runbook for the **Claude Code** side of the test.

---

## 🎯 Objective

Reproduce the exact same test performed in Yoav Abrahami's article:
- **Task**: Implement Design Log #102 — Nested Headfull Full-Stack Components in the [Jay Framework](https://github.com/jay-framework/jay)
- **Methodology**: [Design Log Methodology](https://github.com/yoavaa/design-log-methodology)
- **Tool**: Claude Code CLI (Opus 4.6 / 1M context)
- **Minimum human intervention**: The agent must work autonomously. Only intervene for environment errors, crashes, or clarifications that the agent explicitly requests.

---

## 📋 Pre-Flight Checklist

### Environment Setup

- [ ] **Node.js**: Install version from `.nvmrc` in Jay repo
- [ ] **Claude Code CLI**: Install latest (`npm i -g @anthropic-ai/claude-code` or latest method)
- [ ] **Claude Code version**: Record exact version (`claude --version`)
- [ ] **Model**: Confirm Opus 4.6 with 1M context is active
- [ ] **API billing**: Note starting credit balance / billing state
- [ ] **Machine specs**: Record CPU, RAM, OS for reproducibility

### Repository Setup

```bash
# 1. Clone Jay Framework
git clone https://github.com/jay-framework/jay.git
cd jay

# 2. Create a clean branch for Claude Code work
git checkout -b counterpoint-claude-code-run

# 3. Install dependencies
npm i -g corepack
corepack enable
yarn set version 3.6.4
yarn install
yarn build

# 4. Verify all tests pass BEFORE starting
yarn confirm
```

- [ ] Record initial test count and all-pass status
- [ ] Record `git log --oneline -1` (starting commit hash)

### Design Log Methodology Setup

```bash
# 5. Set up Design Log rules for Claude Code
mkdir -p .claude/rules
# Copy design-log-rules.md content (from https://github.com/yoavaa/design-log-methodology)
```

- [ ] Confirm `design-log/` directory exists
- [ ] Confirm `.claude/rules/design-log-rules.md` is in place

---

## ⏱️ Timing Protocol

| Checkpoint | Record |
|---|---|
| **T0 — Session Start** | Exact timestamp when Claude Code session begins |
| **T1 — Design Review Complete** | When Claude Code acknowledges the design log and is ready to implement |
| **T2 — Phase 1 Complete** | Import/Resolution phase done (parser + load-page-parts) |
| **T3 — Phase 2 Complete** | Slow-Phase Merge implemented |
| **T4 — Phase 3 Complete** | Client Composition / Hydration implemented |
| **T5 — Tests Pass** | All existing + new tests pass |
| **T6 — Fake-Shop Working** | Example app runs correctly |
| **T7 — Session End** | Final timestamp (task complete OR agent stuck/halted) |
| **Total Duration** | T7 - T0 |

---

## 💰 Cost Tracking

| Metric | Value |
|---|---|
| **Starting API balance** | $ ______ |
| **Ending API balance** | $ ______ |
| **Total cost** | $ ______ |
| **Input tokens** | ______ |
| **Output tokens** | ______ |
| **Total tokens** | ______ |
| **Cache reads** | ______ |
| **Model** | Opus 4.6 (1M context) |
| **Claude Code version** | v ______ |

---

## 🚀 Execution Steps

### Step 1: Start Claude Code Session

```bash
cd /path/to/jay
claude
```

Record **T0** timestamp.

### Step 2: Provide the Design Log

Paste the **exact** design log #102 as the initial prompt. The design log is available at:
- [Design Log #102 — Nested Headfull Full-Stack Components](https://gist.github.com/yoavaa/5ce521d602704d5395e326382c4f004b)

**Initial prompt** (paste design log then add):

```
Plan to implement the above design log #102 for nested headfull full-stack components.
Read the design log methodology rules first, then review the design log,
review the codebase to understand the current architecture, and then implement
the three phases as described.

Follow the Design Log Methodology:
- Read before you write
- Design before you implement
- Log every deviation in the Implementation Results section
- Run tests after each phase
- Do not modify the Design section once implementation starts

Start with Phase 1: Import and Resolution.
```

### Step 3: Let Claude Code Work Autonomously

**Rules for minimal intervention:**

1. ✅ **DO** let Claude Code run without interruption
2. ✅ **DO** answer if Claude Code explicitly asks a question
3. ✅ **DO** provide error output if Claude Code requests it
4. ✅ **DO** restart the session if Claude Code crashes (note it as a deviation)
5. ❌ **DO NOT** suggest fixes or approaches
6. ❌ **DO NOT** point out bugs you notice
7. ❌ **DO NOT** redirect Claude Code's approach
8. ❌ **DO NOT** provide hints about the codebase

### Step 4: Record Key Observations

For each phase, record in `claude-code-results/phase-X-log.md`:

1. **Approach taken** (procedural vs exploratory)
2. **Files read before modifying**
3. **Files modified**
4. **Tests written/modified**
5. **Errors encountered and how they were resolved**
6. **Deviations from Design Log #102**
7. **Time spent**
8. **Human interventions (if any, with justification)**

### Step 5: Capture the Following Data Points

These match the original article's evaluation criteria:

#### A. Initial Planning (Score 1-5)
- Did it explore the codebase first or jump to coding?
- Did it identify lifecycle gaps before writing code?
- Did it understand the existing architecture?

#### B. Edge Case Handling (Score 1-5)
- How did it handle import name resolution (PascalCase matching vs type analysis)?
- How did it handle path/extension resolution?
- Did it handle absolute vs relative paths correctly?

#### C. Debugging & Iteration (Score 1-5)
- How did it handle the "vs1 is not defined" SSR error?
- How did it handle the "Expected '>' but found 'type'" Vite error?
- How many iterations to fix each bug?

#### D. Testing Discipline (Score 1-5)
- Did it use `toContain` (bad) or full fixture comparison (good)?
- Did it create proper expected fixtures?
- Did it use `prettifyHtml` for comparison?

#### E. Architectural Awareness (Score 1-5)
- Did it realize when the Design Log was insufficient?
- Did it identify hydration gaps?
- "Bulldozer" (force-implements) vs "Architect" (flags design gaps)?

#### F. Out-of-Scope Gaps (Score 1-5)
- Did it proactively identify missing foundational support?
- Did it address root causes or just symptoms?

---

## 📁 Output Structure

All Claude Code results go in the `claude-code` branch:

```
claude-code-results/
├── session-transcript.md          # Full Claude Code session log
├── timing-log.md                  # Timestamps for each checkpoint
├── cost-log.md                    # Token usage and costs
├── phase-1-log.md                 # Phase 1: Import/Resolution details
├── phase-2-log.md                 # Phase 2: Slow-Phase Merge details
├── phase-3-log.md                 # Phase 3: Client Composition details
├── deviations.md                  # All deviations from original article's process
├── scores.md                      # Evaluation scores (A-F criteria above)
├── human-interventions.md         # Every human intervention with justification
└── screenshots/                   # Terminal screenshots if relevant
```

---

## 🔀 Deviations from Original Article

Document any unavoidable deviations here. For each:

| # | Deviation | Why Unavoidable | Impact |
|---|---|---|---|
| 1 | _Example: Different Claude Code version_ | _Original used v2.1.59; latest is vX.Y.Z_ | _Minimal — same model_ |

**Principle**: If a deviation CAN be avoided, avoid it. Only document truly unavoidable ones.

---

## ✅ Completion Criteria

The test is complete when ONE of these is true:

1. **Success**: All three phases implemented, tests pass, fake-shop example works
2. **Partial Success**: Some phases complete, agent identifies architectural gaps and recommends design pivot
3. **Failure**: Agent gets stuck in a loop, produces non-functional code, or burns excessive budget

Record which outcome occurred and why.

---

## 📊 Final Scorecard Template

Fill this in after the run:

```
+-----------------------+--------+--------------------------------+
|       Criterion       | Score  |         Justification          |
|                       | (1-5)  |                                |
+-----------------------+--------+--------------------------------+
| Initial Planning      |        |                                |
+-----------------------+--------+--------------------------------+
| Edge Case Handling    |        |                                |
+-----------------------+--------+--------------------------------+
| Debugging & Iteration |        |                                |
+-----------------------+--------+--------------------------------+
| Testing Discipline    |        |                                |
+-----------------------+--------+--------------------------------+
| Architectural         |        |                                |
| Awareness             |        |                                |
+-----------------------+--------+--------------------------------+
| Out-of-Scope Gaps     |        |                                |
+-----------------------+--------+--------------------------------+
| TOTAL                 |   /30  |                                |
+-----------------------+--------+--------------------------------+
```

---

## 🔗 References

- **Original Article**: https://medium.com/wix-engineering/head-to-head-claude-code-opus-4-6-1m-vs-cursor-composer-1-5-200k-f15c537428ea
- **Jay Framework**: https://github.com/jay-framework/jay
- **Design Log Methodology**: https://github.com/yoavaa/design-log-methodology
- **Design Log #102**: https://gist.github.com/yoavaa/5ce521d602704d5395e326382c4f004b
- **Results Repository**: https://github.com/zuwasi/Counterpoint-to-Head-to-Yoav-s-head-Claude-Code-vs-Cursor.-Ampcode-vs-Claude-Code-
