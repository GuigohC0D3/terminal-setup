# terminal-setup

Backup do ambiente PowerShell + Windows Terminal. Restaura tudo automaticamente após formatar.

## O que está incluído

- `powershell/Microsoft.PowerShell_profile.ps1` — perfil PowerShell (oh-my-posh, PSReadLine, aliases)
- `windows-terminal/settings.json` — configurações do Windows Terminal
- `bootstrap.ps1` — script de restauração automática

## Pré-requisitos

- Windows 10 / 11
- PowerShell 5.1+
- Git instalado
- winget disponível (App Installer — vem por padrão no Windows 11)

## Instalação após formatar

```powershell
git clone https://github.com/guilhermewerneck/terminal-setup
cd terminal-setup
.\bootstrap.ps1
```

## Fontes (passo manual)

O tema oh-my-posh requer uma **Nerd Font**. Após rodar o bootstrap:

1. Acesse [nerdfonts.com](https://www.nerdfonts.com/font-downloads)
2. Baixe **CascadiaCode** ou **FiraCode** Nerd Font
3. Instale os arquivos `.ttf`
4. No Windows Terminal: Configurações → Perfil → Aparência → Tipo de letra

## Módulos instalados pelo bootstrap

| Módulo | Finalidade |
|---|---|
| `posh-git` | Status git no prompt |
| `Terminal-Icons` | Ícones em `Get-ChildItem` |
| `PSReadLine` | Histórico, sugestões, autocomplete |
| oh-my-posh | Tema do prompt (via winget) |
