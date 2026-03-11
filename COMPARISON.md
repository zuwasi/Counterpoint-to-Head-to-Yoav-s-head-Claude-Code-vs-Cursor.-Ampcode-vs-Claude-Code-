# Side-by-Side Comparison: Claude Code vs Ampcode

> **Status**: ✅ Both runs complete

## Summary

| Dimension | Claude Code | Ampcode | Winner |
|---|---|---|---|
| **Total Time** | ~30+ min | ~13 min | ⚡ **Ampcode** |
| **Total Cost** | High (hit 11% context remaining) | Moderate | ⚡ **Ampcode** |
| **Tests Passing** | 1,094 (across 8 packages) | 668 (across 3 key packages) | 🧠 **Claude Code** (broader) |
| **Human Interventions** | Multiple (asked yes/no repeatedly) | 0 | ⚡ **Ampcode** |
| **Total Score (/30)** | 20/30 | 27/30 | ⚡ **Ampcode** |
| **Outcome** | ✅ Complete (all 3 phases) | ✅ Complete (all 3 phases) | Tie |

## Detailed Scorecard

```
+-----------------------+---------+---------+--------------------------------+
|       Criterion       | Claude  | Ampcode |         Notes                  |
|                       | Code    |         |                                |
+-----------------------+---------+---------+--------------------------------+
| Initial Planning      |    4    |    5    | Both explored codebase first.  |
|                       |         |         | Amp was faster; Claude deeper  |
|                       |         |         | but slower.                    |
+-----------------------+---------+---------+--------------------------------+
| Edge Case Handling    |    4    |    4    | Claude: PascalCase matching.   |
|                       |         |         | Amp: convention-based path     |
|                       |         |         | resolution. Both adequate.     |
+-----------------------+---------+---------+--------------------------------+
| Debugging & Iteration |    3    |    5    | Claude needed multiple human   |
|                       |         |         | confirmations. Amp: zero       |
|                       |         |         | interventions, self-correcting.|
+-----------------------+---------+---------+--------------------------------+
| Testing Discipline    |    4    |    4    | Claude: 4 new tests, 1094     |
|                       |         |         | total. Amp: 2 new tests + new  |
|                       |         |         | fixture directory, 668 total.  |
+-----------------------+---------+---------+--------------------------------+
| Architectural         |    3    |    5    | Claude asked for permission at |
| Awareness             |         |         | every phase boundary. Amp      |
|                       |         |         | recognized the existing        |
|                       |         |         | pipeline handles post-merge    |
|                       |         |         | naturally — no extra work.     |
+-----------------------+---------+---------+--------------------------------+
| Out-of-Scope Gaps     |    2    |    4    | Amp documented 3 clear         |
|                       |         |         | deviations proactively. Claude  |
|                       |         |         | hit 11% context and stopped.   |
+-----------------------+---------+---------+--------------------------------+
| TOTAL                 | 20/30   | 27/30   | Ampcode wins                   |
+-----------------------+---------+---------+--------------------------------+
```

## Comparison with Original Article's Results

| Criterion | Original Claude Code | Original Cursor | Our Claude Code | Our Ampcode |
|---|---|---|---|---|
| Initial Planning | 4 | 5 | 4 | 5 |
| Edge Case Handling | 4 | 5 | 4 | 4 |
| Debugging & Iteration | 3 | 5 | 3 | 5 |
| Testing Discipline | 3 | 5 | 4 | 4 |
| Architectural Awareness | 2 | 5 | 3 | 5 |
| Out-of-Scope Gaps | 2 | 5 | 2 | 4 |
| **TOTAL** | **18/30** | **30/30** | **20/30** | **27/30** |

## Timing Comparison

| Phase | Ampcode | Claude Code | Speed Ratio |
|---|---|---|---|
| Design Review | ~1.5 min | ~3 min | 2x faster |
| Phase 1: Import/Resolution | ~6 min | ~16 min | 2.7x faster |
| Phase 2: Slow-Phase Merge | ~3 min | ~12 min | 4x faster |
| Phase 3: Client Composition | ~2 min | ~5 min | 2.5x faster |
| **Total** | **~13 min** | **~30+ min** | **~2.5x faster** |

## Behavioral Analysis

### Planning Approach
- **Claude Code**: Deep, methodical exploration — read 6+ files before each phase, used Explore tool with 49 sub-calls. Thorough but slow.
- **Ampcode**: Efficient exploration — read the key files, understood the architecture, moved to implementation. Fast but not shallow.

### Debugging Strategy
- **Claude Code**: Encountered issues, asked human for confirmation repeatedly. Needed "yes" to proceed at every phase boundary.
- **Ampcode**: Self-directed throughout. Encountered pathing errors in WSL, self-corrected without asking. Zero human interventions.

### Architectural Awareness
- **Claude Code**: Built solid code but didn't recognize when the existing pipeline was already sufficient. Explored extensively for Phase 3 before concluding no extra work was needed.
- **Ampcode**: Quickly identified that post-merge content flows through the existing headless instance pipeline naturally. Verified with tests rather than over-exploring.

### Autonomy & Independence
- **Claude Code**: Required human input multiple times ("Shall I proceed with Phase 2?" etc.). This is a significant penalty under the "minimum human intervention" rule.
- **Ampcode**: Fully autonomous from start to finish. Zero questions asked. This is exactly what the test demanded.

### When Things Go Wrong
- **Claude Code**: Hit 11% context remaining by the end. Auto-update failed. The deep exploration consumed context aggressively.
- **Ampcode**: Completed within comfortable context limits. Documented 3 deviations proactively (handleDirectRequest, path convention, empty props).

## Final Verdict: Who Wins?

> The original article pre-labeled Claude Code as "The Bulldozer" and Cursor as "The Architect."
> We made no such assumptions. The data decided.

### 🏆 Ampcode Wins: 27/30 vs 20/30

**Ampcode** demonstrated superior performance on this benchmark:
- **2.5x faster** overall
- **Zero human interventions** vs Claude's repeated permission-seeking
- **Equal or better** architectural awareness — recognized when existing infrastructure was sufficient
- **Proactive deviation documentation** — logged 3 clear deviations without being asked

**Claude Code** showed strengths in:
- **Broader test coverage** (1,094 vs 668 tests)
- **Deeper individual file exploration** before making changes
- **More granular test cases** (4 specific unit tests for Phase 1)

### The Key Differentiator: Autonomy

The original article tested with active human participation (chatting, directing). Our test demanded **minimum intervention**. Under this constraint, Ampcode's ability to work independently was the decisive advantage. Claude Code's habit of asking "Shall I proceed?" — reasonable in a collaborative workflow — became a liability in an autonomy test.

## Practical Recommendation

- **Use Ampcode** when you need an autonomous agent that can execute a well-defined plan end-to-end without hand-holding.
- **Use Claude Code** when you want deeper exploration and are willing to be an active participant, confirming decisions at each step.
- **For the "Senior-Junior Loop"** from the original article: Ampcode can serve as both the executor AND the reviewer, eliminating the need for a two-tool workflow in many cases.
