# Verifica read-only dell'ambiente per la build di Chromium su Windows x64.
# Non modifica nulla. Exit code 1 se un requisito obbligatorio manca.
$ErrorActionPreference = 'Continue'
$fail = $false
function Check($name, $ok, $detail) {
    $s = if ($ok) { 'OK  ' } else { 'FAIL' }
    Write-Host "[$s] $name - $detail"
    if (-not $ok) { $script:fail = $true }
}

Check 'OS x64' ([Environment]::Is64BitOperatingSystem) ([Environment]::OSVersion.VersionString)

$drive = (Get-Location).Drive
if ($drive) {
    $freeGB = [math]::Round($drive.Free / 1GB)
    Check 'Spazio disco >= 200 GB' ($freeGB -ge 200) "$freeGB GB liberi su $($drive.Name):"
}

$ramGB = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB)
Check 'RAM >= 32 GB' ($ramGB -ge 32) "$ramGB GB"

foreach ($t in 'git', 'python') {
    $c = Get-Command $t -ErrorAction SilentlyContinue
    Check "$t nel PATH" ($null -ne $c) ($(if ($c) { $c.Source } else { 'non trovato' }))
}
$dt = Get-Command gclient -ErrorAction SilentlyContinue
Check 'depot_tools (gclient) nel PATH' ($null -ne $dt) ($(if ($dt) { $dt.Source } else { 'non trovato' }))

$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (Test-Path $vswhere) {
    $vs = & $vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath
    Check 'Visual Studio con toolchain C++ x64' ([bool]$vs) ($(if ($vs) { $vs } else { 'componente C++ mancante' }))
} else {
    Check 'Visual Studio' $false 'vswhere non trovato'
}

if ($fail) { Write-Host 'Ambiente NON pronto.'; exit 1 } else { Write-Host 'Ambiente pronto.' }
