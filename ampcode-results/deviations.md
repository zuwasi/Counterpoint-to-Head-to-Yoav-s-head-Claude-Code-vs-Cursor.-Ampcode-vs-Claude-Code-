# Ampcode — Deviations from Original Article Process

## Intentional Deviation

| # | What Deviated | Original Article | Our Run | Justification |
|---|---|---|---|---|
| 0 | Tool used | Cursor Composer 1.5 / 200k | Ampcode | Purpose of counterpoint study |

## Implementation Deviations (documented by Ampcode proactively)

| # | What | Design Log Said | What Ampcode Did | Why |
|---|---|---|---|---|
| 1 | handleDirectRequest | Merge in all paths | Only merges in preRender (cached) path | Direct path sends full ViewState to client without pre-rendering; merge only meaningful in preRender flow |
| 2 | Component jay-html path | Resolve from contract | Convention: template in same dir as .ts with matching name | More reliable than deriving from contract path |
| 3 | Props to slowlyRender | Pass props from parent tag | Called with empty props | Parent-provided props extraction from jay:Tag attributes deferred — requires tag attribute parsing not yet built |
