$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$python = Join-Path $repoRoot "venv\Scripts\python.exe"
$stdout = Join-Path $repoRoot "logs\uvicorn-web.stdout.log"
$stderr = Join-Path $repoRoot "logs\uvicorn-web.stderr.log"

New-Item -ItemType Directory -Path (Split-Path -Parent $stdout) -Force | Out-Null

if (Test-Path -LiteralPath $stdout) {
    Clear-Content -LiteralPath $stdout
}

if (Test-Path -LiteralPath $stderr) {
    Clear-Content -LiteralPath $stderr
}

$psi = [System.Diagnostics.ProcessStartInfo]::new()
$psi.FileName = $python
$psi.WorkingDirectory = $repoRoot
$psi.Arguments = "-m uvicorn reply_server:app --host 127.0.0.1 --port 8090"
$psi.UseShellExecute = $false
$psi.RedirectStandardOutput = $false
$psi.RedirectStandardError = $false
$psi.CreateNoWindow = $true
$process = [System.Diagnostics.Process]::Start($psi)
"pid=$($process.Id)"
