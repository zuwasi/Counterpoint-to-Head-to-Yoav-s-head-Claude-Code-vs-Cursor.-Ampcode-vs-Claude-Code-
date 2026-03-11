# Methodology

## How This Test Is Conducted

### Ground Rules

1. **Same starting point**: Both tools start from the identical git commit of the Jay Framework
2. **Same prompt**: The initial prompt is word-for-word identical for both tools
3. **Same design log**: Design Log #102 is frozen and identical for both
4. **Same methodology rules**: The Design Log Methodology rules are provided to both (via their respective rule-loading mechanisms)
5. **Same machine**: Both tests should run on the same machine to eliminate hardware variables
6. **Same evaluation**: Both scored on the same 6 criteria, 1-5 scale, by the same person
7. **Minimum human intervention**: Neither tool receives hints, suggestions, or redirections. Only respond to explicit questions or provide error output when requested.

### Order of Operations

1. **Claude Code runs first** (as requested by user)
2. **Ampcode runs second** on a fresh clone at the same commit
3. **Scoring happens after both complete** to avoid bias

### What Counts as "Human Intervention"

| Allowed (not an intervention) | Counts as intervention (must document) |
|---|---|
| Starting the session | Suggesting a fix or approach |
| Pasting the design log | Pointing out a bug |
| Answering an explicit question from the agent | Redirecting the agent's strategy |
| Providing error output the agent requests | Adding context the agent didn't ask for |
| Restarting after a crash | Modifying code yourself |

### Design Log Methodology (Summary)

From [yoavaa/design-log-methodology](https://github.com/yoavaa/design-log-methodology):

- **Read Before You Write**: Check existing logs and codebase before coding
- **Design Before You Implement**: No code until the design is reviewed
- **Immutable History**: The Design section is frozen once implementation starts
- **Document Deviations**: All differences from the design go in Implementation Results
- **Test After Each Phase**: Run tests and record results

### Scoring Rubric

| Score | Meaning |
|---|---|
| 1 | Failed completely at this criterion |
| 2 | Significant issues; required major human rescue |
| 3 | Acceptable but notable weaknesses |
| 4 | Good performance with minor issues |
| 5 | Excellent — matched or exceeded expectations |
