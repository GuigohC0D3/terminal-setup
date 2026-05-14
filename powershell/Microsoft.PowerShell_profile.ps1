# ========== FORÇA UTF-8 NO CONSOLE ==========
try { & chcp.com 65001 > $null } catch {}            # code page UTF-8 (Windows)
try {
  [Console]::InputEncoding  = [Text.Encoding]::UTF8
  [Console]::OutputEncoding = [Text.Encoding]::UTF8
} catch {}
# ===========================================

# ---------- MENSAGEM DE BOAS-VINDAS ----------
# Emojis como strings (suporta codepoints > 0xFFFF)
$emojiPc    = [char]::ConvertFromUtf32(0x1F4BB)  # 💻
$emojiConf  = [char]::ConvertFromUtf32(0x1F389)  # 🎉
$charAAgudo = [char]0x00E1                       # á

$banner = ('{0}  Ol{1}, Guigoh! Bem-Vindo ao Terminal {2}' -f $emojiPc, $charAAgudo, $emojiConf)

Write-Host ""
Write-Host $banner -ForegroundColor Cyan
Write-Host "-------------------------------------------" -ForegroundColor DarkGray
Write-Host ""


# ===== oh-my-posh config oficial (robusto) =====
$themeFile = 'craver.omp.json'
$themeCandidates = @()

if ($env:POSH_THEMES_PATH) {
  $themeCandidates += (Join-Path $env:POSH_THEMES_PATH $themeFile)
}
$themeCandidates += @(
  "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\$themeFile",
  "$env:ProgramFiles\oh-my-posh\themes\$themeFile",
  "$HOME\oh-my-posh\themes\$themeFile"
)

$theme = $themeCandidates | Where-Object { $_ -and (Test-Path $_) } | Select-Object -First 1

if ($theme) {
  try { oh-my-posh init pwsh --config $theme | Invoke-Expression } catch {
    Write-Host "⚠️ Oh My Posh não inicializou: $($_.Exception.Message)" -ForegroundColor Yellow
  }
} else {
  Write-Host "⚠️ Tema não encontrado. Verifique POSH_THEMES_PATH ou instale '$themeFile'." -ForegroundColor Yellow
}
# ==============================================

# ---------- Módulos ----------
Import-Module posh-git -ErrorAction SilentlyContinue
Import-Module Terminal-Icons -ErrorAction SilentlyContinue
Import-Module PSReadLine -ErrorAction SilentlyContinue

# ---------- PSReadLine (histórico e sugestões) ----------
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -MaximumHistoryCount 5000

# TAB abre menu; Shift+Tab volta
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key Shift+Tab -Function TabCompletePrevious

# ↑/↓ filtram histórico pelo prefixo
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Previsões quando suportado (PS 7.1+ / PSReadLine 2.1+)
$cmd = Get-Command Set-PSReadLineOption -ErrorAction SilentlyContinue
if ($cmd -and $cmd.Parameters.ContainsKey('PredictionSource')) {
  Set-PSReadLineOption -PredictionSource History
  if ($cmd.Parameters.ContainsKey('PredictionViewStyle')) {
    Set-PSReadLineOption -PredictionViewStyle ListView
  }
  try { Set-PSReadLineKeyHandler -Key RightArrow -Function AcceptNextSuggestionWord } catch {}
  try { Set-PSReadLineKeyHandler -Key "Ctrl+RightArrow" -Function AcceptSuggestion } catch {}
}

# ---------- Qualidade de vida ----------
Set-Alias ll Get-ChildItem
function which { param([string]$name) (Get-Command $name -EA SilentlyContinue).Source }
try { git config --global color.ui true | Out-Null } catch {}
