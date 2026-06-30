# GUNDAM Homebrew Tap

Homebrew tap for installing GUNDAM on macOS

## Install

```sh
brew tap gundam-organization/tap
brew install gundam
```

Or without adding the tap first:

```sh
brew install gundam-organization/tap/gundam
```

## Bottles

Pull requests run `brew test-bot` on both Apple Silicon and Intel macOS runners.
When the checks pass, add the `pr-pull` label to the pull request. The publish
workflow then runs `brew pr-pull`, uploads the bottles to GHCR, and commits the
generated `bottle do` block back to `main`.
