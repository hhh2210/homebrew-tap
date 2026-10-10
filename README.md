# Homebrew Tap

Homebrew formulae and casks for tools and independently maintained apps that are
not currently available in Homebrew's official repositories.

## Install

Install a formula directly:

```sh
brew install hhh2210/tap/lark-cli
brew install hhh2210/tap/binance-cli
brew install hhh2210/tap/native-space-kit
brew install hhh2210/tap/mihomo-smart
brew install --cask hhh2210/tap/glance-face-unlock
```

Or add the tap first:

```sh
brew tap hhh2210/tap
brew install lark-cli binance-cli native-space-kit mihomo-smart
```

| Formula | Description | Upstream |
| --- | --- | --- |
| `lark-cli` | Lark/Feishu CLI | [larksuite/cli](https://github.com/larksuite/cli) |
| `binance-cli` | Binance REST API CLI | [binance/binance-cli](https://github.com/binance/binance-cli) |
| `native-space-kit` | Native macOS Space control (`nsk`, macOS only) | [Fjx-dylanZ/native-space-kit](https://github.com/Fjx-dylanZ/native-space-kit) |
| `mihomo-smart` | mihomo with the Smart proxy group (`mihomo-smart`, macOS only) | [vernesong/mihomo](https://github.com/vernesong/mihomo) |

## Glance Fork

```sh
brew install --cask hhh2210/tap/glance-face-unlock
brew upgrade --cask hhh2210/tap/glance-face-unlock
```

The `glance-face-unlock` cask installs [hhh2210/glance](https://github.com/hhh2210/glance),
an independent fork with guided enrollment feedback, as `Glance Fork.app`.
It supports macOS 15 or later on Apple Silicon and Intel. Its app identity,
preferences, Keychain service and encrypted face store are separate from the
upstream app. Quit upstream Glance before using the fork and complete the fork's
own enrollment and permissions setup.

The release is ad-hoc signed and not notarized by Apple. Homebrew verifies the
download checksum but does not bypass Gatekeeper; macOS may require per-app
first-launch approval in Privacy & Security. Camera and Accessibility permissions
are separate, and an update may require granting Accessibility again. No app
updates are fetched from the upstream Glance feed.

Homebrew 7 may request trust before loading a third-party cask. To explicitly
trust just this cask, use `brew trust --cask hhh2210/tap/glance-face-unlock`.
The cask's CI audits and installs the published artifact into an isolated app
directory without launching it or requesting camera access.

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

## mihomo-smart

This packages the prebuilt `Prerelease-Alpha` binary of vernesong's mihomo
fork, which adds the `smart` proxy-group type that homebrew/core's `mihomo`
rejects. It installs as `mihomo-smart`, so both can be installed side by side.
No service is installed. A process already running keeps its old binary until
it is restarted.

Upstream rebuilds the same rolling tag and replaces its assets, so the old
download URL disappears with every build. The formula version is the arm64
asset's upload time (`YYYY.MM.DD.HHMM`); the build commit is in the URL and in
`mihomo-smart -v`. Until the daily updater picks up a new build, `brew
reinstall` of the previous version can fail; an installed binary is unaffected.

## Updates

The `lark-cli`, `binance-cli` and `mihomo-smart` formulae define Homebrew `livecheck` blocks. A scheduled GitHub Actions
workflow checks upstream releases daily. When a version changes, the workflow
updates the formula and only pushes it after Homebrew style, strict audit,
installation, test, and livecheck validation pass.

`native-space-kit` updates are maintained manually against upstream release tags;
the existing scheduled updater does not change it.

The scripts under `scripts/` provide the same update logic for local maintenance.
`sync-lark-cli-skills` is an optional, fail-closed helper for synchronizing a
selected set of official Lark skills after a CLI upgrade; it is not run by the
formula during installation.
