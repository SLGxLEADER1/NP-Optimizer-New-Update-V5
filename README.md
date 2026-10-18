# NP-Optimizer-New-Update-V5

Official **release** repository for NP Optimizer. Only the release zips live here (GitHub Releases), no source.

Publishing a new version (on your PC, where `npo_private.pem` is):

```powershell
.\Release.ps1 -Version 5.4.0 -Notes "What's new"
```

It publishes the app, zips it as `NPOptimizer-5.4.0.zip`, signs the update manifest, creates the GitHub release
(needs the GitHub CLI `gh`, logged in) and writes the signed `update.json` into the updater repo folder.
Then commit and push `update.json` in `NPO-Updater-Theme-Changer-V5`. Users see the update badge within ~6 hours.
Order matters: the release zip must exist before `update.json` is pushed.
