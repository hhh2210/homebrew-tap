# Homebrew Tap

Homebrew formulae for command-line tools that are not currently available in
`homebrew/core`.

## Install

Install a formula directly:

```sh
brew install hhh2210/tap/lark-cli
brew install hhh2210/tap/binance-cli
brew install hhh2210/tap/native-space-kit
```

Or add the tap first:

```sh
brew tap hhh2210/tap
brew install lark-cli binance-cli native-space-kit
```

| Formula | Description | Upstream |
| --- | --- | --- |
| `lark-cli` | Lark/Feishu CLI | [larksuite/cli](https://github.com/larksuite/cli) |
| `binance-cli` | Binance REST API CLI | [binance/binance-cli](https://github.com/binance/binance-cli) |
| `native-space-kit` | Native macOS Space control (`nsk`, macOS only) | [Fjx-dylanZ/native-space-kit](https://github.com/Fjx-dylanZ/native-space-kit) |

## native-space-kit

This is a community distribution of upstream's Homebrew formula, accepted in
[PR #1](https://github.com/Fjx-dylanZ/native-space-kit/pull/1). It builds the
`v0.1.0` release from source and applies the checksum-pinned, upstream-merged
[display selector change](https://github.com/Fjx-dylanZ/native-space-kit/pull/2).
The patch can be removed when an upstream release includes it.

Homebrew owns the installed `nsk` executable; no source checkout is needed after
installation. Start with the read-only commands `nsk --version`, `nsk capabilities`,
and `nsk list`. Native Space IDs are not Desktop numbers. The tool uses private
macOS APIs, so availability must be rechecked after OS updates. No service or
background daemon is installed.

## Updates

The `lark-cli` and `binance-cli` formulae define Homebrew `livecheck` blocks. A scheduled GitHub Actions
workflow checks upstream releases daily. When a version changes, the workflow
updates the formula and only pushes it after Homebrew style, strict audit,
installation, test, and livecheck validation pass.

`native-space-kit` updates are maintained manually against upstream release tags;
the existing scheduled updater does not change it.

The scripts under `scripts/` provide the same update logic for local maintenance.
`sync-lark-cli-skills` is an optional, fail-closed helper for synchronizing a
selected set of official Lark skills after a CLI upgrade; it is not run by the
formula during installation.
