<div align="center">

# ⚡ NP Optimizer

**Android Emulator Optimizer & Modifier** — BlueStacks · LDPlayer · Nox · MEmu

[![Latest Release](https://img.shields.io/github/v/release/SLGxLEADER1/NP-Optimizer-New-Update-V5?label=latest&color=brightgreen)](https://github.com/SLGxLEADER1/NP-Optimizer-New-Update-V5/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/SLGxLEADER1/NP-Optimizer-New-Update-V5/total?color=blue)](https://github.com/SLGxLEADER1/NP-Optimizer-New-Update-V5/releases)
[![Platform](https://img.shields.io/badge/platform-Windows-0078D6)](#)
[![.NET](https://img.shields.io/badge/.NET-8.0-512BD4)](#)

[📥 Download Latest](https://github.com/SLGxLEADER1/NP-Optimizer-New-Update-V5/releases/latest) · [💬 Discord](https://discord.gg/4h8DckZpH) · [📖 Wiki](../../wiki)

</div>

---

## 📦 About

This is the **official release repository** for NP Optimizer. Only signed release builds (`.zip` / installer `.exe`) live here under [Releases](../../releases) — no source code is published in this repo.

NP Optimizer is a Windows desktop app for tuning, modifying and managing Android emulators over ADB, with live resource dashboards, one-click optimization presets, app management, Game Boost mode, season-themed UI, and license-based activation.

## ⬇️ Installation

1. Grab the latest installer from [**Releases**](../../releases/latest)
2. Run `NPOptimizer-Setup-x.x.x.exe` and follow the setup wizard
3. Launch NP Optimizer and activate using the Hardware ID shown on first run

## 🔄 Updates

NP Optimizer checks for updates automatically. When a new version is published here, the app shows an **Update available** badge and can download, verify and apply it in one click.

## 🛠️ For maintainers — publishing a release

Run on the machine holding `npo_private.pem`:

```powershell
.\Release.ps1 -Version 5.4.0 -Notes "What's new"
```

This publishes the app, zips it as `NPOptimizer-5.4.0.zip`, signs the update manifest, creates the GitHub release (needs the GitHub CLI `gh`, logged in) and writes the signed `update.json` into the updater repo folder. Commit and push `update.json` in [`NPO-Updater-Theme-Changer-V5`](https://github.com/SLGxLEADER1/NPO-Updater-Theme-Changer-V5). Users see the update badge within ~6 hours.

> ⚠️ Order matters: the release zip must exist before `update.json` is pushed.

## 💬 Support

- 🎮 [Discord](https://discord.gg/4h8DckZpH) — community & support
- 💬 In-app WhatsApp button — direct contact for licensing

---

<div align="center">
<sub>Credit: <a href="https://www.youtube.com/channel/UCVfr-kGIWiXnalRK-VR4-hg">YouTube Channel</a></sub>
</div>
