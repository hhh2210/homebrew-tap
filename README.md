# Homebrew Tap

Homebrew formulae for command-line tools that are not currently available in
`homebrew/core`.

## Install

Install a formula directly:

```sh
brew install hhh2210/tap/lark-cli
brew install hhh2210/tap/binance-cli
```

Or add the tap first:

```sh
brew tap hhh2210/tap
brew install lark-cli binance-cli
```

| Formula | Description | Upstream |
| --- | --- | --- |
| `lark-cli` | Lark/Feishu CLI | [larksuite/cli](https://github.com/larksuite/cli) |
| `binance-cli` | Binance REST API CLI | [binance/binance-cli](https://github.com/binance/binance-cli) |

## Updates

Both formulae define Homebrew `livecheck` blocks. A scheduled GitHub Actions
workflow checks upstream releases daily. When a version changes, the workflow
updates the formula and only pushes it after Homebrew style, strict audit,
installation, test, and livecheck validation pass.

The scripts under `scripts/` provide the same update logic for local maintenance.
`sync-lark-cli-skills` is an optional, fail-closed helper for synchronizing a
selected set of official Lark skills after a CLI upgrade; it is not run by the
formula during installation.
