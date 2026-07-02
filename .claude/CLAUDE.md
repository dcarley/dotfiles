# Global instructions

Cross-project working preferences. Apply everywhere unless a project's own
CLAUDE.md / memory overrides.

## PR handoff
- Opening a PR automatically (finishing work, no explicit ask this turn) → open
  it as a **draft**.
- When I explicitly ask you to open a PR → open it **non-draft** (ready for
  review).
- Don't promote a draft to ready (`gh pr ready`) unless I ask. Tell worker
  agents the same.

## Commits
- Multi-change work → atomic, bisect-safe commits ordered to avoid broken
  intermediate states. Describe the change in prose, leading with the *why*
  (not just the what); include real command + output examples when the change
  was verified by running something.
- Wrap component and variable names (and other code identifiers) in backticks in
  commit messages.
- Changes addressing review feedback → always make them as `fixup!` commits
  (`git commit --fixup=<sha>`) targeting the original commit that added that
  functionality, so they autosquash cleanly into it (`git rebase --autosquash`).

## Code comments
- No historical information or change intent in code comments — that belongs in
  the commit message. Comments explain the code as it is now (why it's written
  this way), not what changed or why it moved/refactored. e.g. in a comment
  describing what some code does, drop a trailing "…moved here so both services
  can share it" — keep the description, put the rationale in the commit.

## Refactoring
- When moving functionality between modules, don't leave a re-export / alias at
  the old location — update the call sites to import from the new location
  instead.

## Tests
- Prefer one assertion pinning the full result shape (list / dict / set
  equality) over `any(...)` + `not any(...)` pairs; filter to the meaningful
  subset first if there's incidental noise. (pytest / Rust / Go / TS.)
- Independence/negative tests ("A doesn't affect B") must assert that A and B
  each produced something — a side that's never queried lets a refactor
  silently empty it while the test passes vacuously. Completion-status checks
  ("event completed") pass on empty outcomes; assert outcome counters instead.
- When a refactor changes test *setup mechanics* (removing a setting, changing
  a fixture), treat every test call site fixed "just to compile" as a vacuity
  suspect — re-derive what makes each test's scenario fire under the new
  mechanism.

## Specs / planning artifacts
- Design specs and implementation plans (from brainstorming / planning
  workflows) go in the repo's `.claude/specs/` directory, named
  `YYYY-MM-DD-<topic>-design.md`. This overrides any skill's default location
  (e.g. the superpowers default of `docs/superpowers/specs/`).
