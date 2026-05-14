#Requires -Version 5.1
<#
.SYNOPSIS
  Restaura o ambiente PowerShell/Windows Terminal após formatação.
  Uso: .\bootstrap.ps1
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Step { param([string]$msg) Write-Host "`n==> $msg" -ForegroundColor Cyan }
function Write-OK   { param([string]$msg) Write-Host "    [OK] $msg" -ForegroundColor Green }
function Write-Warn { param([string]$msg) Write-Host "    [!!] $msg" -ForegroundColor Yellow }

# ---------- 1. Verificar winget ----------
Write-Step "Verificando winget..."
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget nao encontrado. Instale o App Installer pela Microsoft Store e tente novamente."
}
Write-OK "winget disponivel"

# ---------- 2. Instalar oh-my-posh ----------
Write-Step "Instalando oh-my-posh..."
winget install --id JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements --accept-source-agreements
Write-OK "oh-my-posh instalado"

# ---------- 3. Instalar modulos PSGallery ----------
Write-Step "Instalando modulos PowerShell..."
$modules = @('posh-git', 'Terminal-Icons', 'PSReadLine')
foreach ($mod in $modules) {
    if (-not (Get-Module -ListAvailable -Name $mod)) {
        Install-Module $mod -Scope CurrentUser -Force -SkipPublisherCheck
        Write-OK "$mod instalado"
    } else {
        Write-OK "$mod ja instalado"
    }
}

# ---------- 4. Copiar perfil PowerShell ----------
Write-Step "Configurando perfil PowerShell..."
$profileDir = Split-Path $PROFILE -Parent
if (-not (Test-Path $profileDir)) { New-Item -ItemType Directory -Force $profileDir | Out-Null }
$scriptDir = Split-Path $MyInvocation.MyCommand.Path -Parent
Copy-Item "$scriptDir\powershell\Microsoft.PowerShell_profile.ps1" $PROFILE -Force
Write-OK "Profile copiado para $PROFILE"

# ---------- 5. Copiar settings do Windows Terminal ----------
Write-Step "Configurando Windows Terminal..."
$wtPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
if (Test-Path $wtPath) {
    Copy-Item "$scriptDir\windows-terminal\settings.json" "$wtPath\settings.json" -Force
    Write-OK "settings.json copiado"
} else {
    Write-Warn "Windows Terminal nao encontrado em $wtPath. Instale pelo site ou Microsoft Store primeiro."
}

# ---------- 6. Aviso: Nerd Font ----------
Write-Host ""
Write-Host "============================================================" -ForegroundColor Magenta
Write-Host " PASSO MANUAL NECESSARIO: Instalar Nerd Font" -ForegroundColor Magenta
Write-Host "============================================================" -ForegroundColor Magenta
Write-Host " 1. Acesse: https://www.nerdfonts.com/font-downloads"
Write-Host " 2. Baixe: CascadiaCode ou FiraCode Nerd Font"
Write-Host " 3. Instale a fonte (.ttf) e configure no Windows Terminal"
Write-Host "============================================================" -ForegroundColor Magenta
Write-Host ""

Write-Host "Restauracao concluida! Reinicie o PowerShell." -ForegroundColor Green
