<!-- BEGIN platform (synced, do not edit) -->
# Project rules (shared)

This block is synced from the `ios-platform` repo. Edit it there, not here.

The standards behind these rules live in `standards/` of `jjorgemoura/ios-platform`. Read the
relevant file there before changing how a library is built, tested, documented or released.

- Swift 6 language mode with complete strict concurrency (CONC-1).
- A library never depends on another library in this set (API-1).
- Every public symbol has a DocC comment (DOC-1).
- Unit and integration tests use Swift Testing (TEST-1).
- Work starts from a GitHub issue: a spec for a feature, a repro for a bug. The PR closes it
  with `Closes #<n>` (FLOW-1, FLOW-2, FLOW-5).

## Agent skills

### Issue tracker

Issues, specs and tickets are GitHub issues, through `gh`. See `docs/agents/issue-tracker.md`.

### Triage labels

The five default triage labels (`needs-triage`, `needs-info`, `ready-for-agent`,
`ready-for-human`, `wontfix`). See `docs/agents/triage-labels.md`.

### Domain docs

Single-context: `GLOSSARY.md` at the repo root; ADRs and standards are central in
`ios-platform`. See `docs/agents/domain.md`.
<!-- END platform -->

## GPSSwift

A Swift SPM package to track location.

### Layout
- `Sources/GPSSwift/` is the library. Public API needs doc comments, and the DocC catalog
  lives in `GPSSwift.docc`.
- `Tests/GPSSwiftTests/Fixtures/` holds sample files for tests. Name them for what they
  exercise.
- `Examples/DemoApp.xcodeproj` is the demo app.

### Behaviour to preserve
<!-- TODO: Rules a change must not break (strict versus lenient input, output format, ...). -->

### Gotchas
- Build the demo through `GPSSwift.xcworkspace`, never `-project`. The project doesn't declare
  the package, so the `GPSSwift` product only resolves through the workspace.
- SwiftLint caches results locally, so a stale cache can hide violations that CI finds.
  `make lint` skips the cache. For Xcode, run `rm -rf ~/Library/Caches/SwiftLint`.
- CI logic is not in this repo. `.github/workflows/` holds thin callers of the reusable
  workflows in `jjorgemoura/ios-platform`, pinned to a tag. Change CI there, not here.
- Every platform in `Package.swift` is built in CI, and the `platforms` input of the shared
  workflow must match. Adding or dropping a platform means updating both.

### Verifying changes
- Run `make lint` and `make test` before pushing. The `Makefile` has the other targets.
- For anything the demo app touches, build the `DemoApp` scheme from the workspace for both
  iOS Simulator and macOS, and check that `make demo` still opens.
