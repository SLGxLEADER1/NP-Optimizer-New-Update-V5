# Build + sign + publish a new NP Optimizer release.
param(
    [Parameter(Mandatory)][string]$Version,          # e.g. 5.4.0  (must be higher than the installed version)
    [string]$Notes = "",
    [string]$Solution = "..\..",                      # folder that contains NPOptimizer.sln
    [string]$UpdaterRepo = "..\NPO-Updater-Theme-Changer-V5"
)
$ErrorActionPreference = "Stop"
$Solution = (Resolve-Path $Solution).Path
$UpdaterRepo = (Resolve-Path $UpdaterRepo).Path
$work = Join-Path $PSScriptRoot "build"
$out = Join-Path $work "publish"
$zip = Join-Path $work "NPOptimizer-$Version.zip"
Remove-Item $work -Recurse -Force -ErrorAction SilentlyContinue
New-Item $out -ItemType Directory | Out-Null

Write-Host "1/4 publishing..."
dotnet publish "$Solution\NPOptimizer\NPOptimizer.csproj" -c Release -r win-x64 --self-contained false -p:Version=$Version -o $out
if ($LASTEXITCODE) { throw "publish failed" }
Get-ChildItem $out -Include *.pdb -Recurse | Remove-Item -Force

Write-Host "2/4 zipping..."
Compress-Archive -Path "$out\*" -DestinationPath $zip -Force

Write-Host "3/4 signing manifest (asks for your key password)..."
$url = "https://github.com/SLGxLEADER1/NP-Optimizer-New-Update-V5/releases/download/v$Version/NPOptimizer-$Version.zip"
Push-Location "$Solution\NPOKeygen"      # npo_private.pem lives here
dotnet run -c Release -- signupdate --version $Version --url $url --zip $zip --notes $Notes --out "$UpdaterRepo\update.json"
Pop-Location
if ($LASTEXITCODE) { throw "signing failed" }

Write-Host "4/4 GitHub release..."
if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh release create "v$Version" $zip --repo SLGxLEADER1/NP-Optimizer-New-Update-V5 --title "NP Optimizer $Version" --notes $Notes
} else {
    Write-Host "GitHub CLI (gh) not found. Create release v$Version by hand on GitHub and upload: $zip"
}
Write-Host "`nDone. Now commit + push update.json in: $UpdaterRepo"
