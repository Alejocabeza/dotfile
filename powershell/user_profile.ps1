# Prompt
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\alejandro.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Icons
Import-Module terminal-icons

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# FZF
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'ctrl+r'

# ALIAS
Set-Alias vim nvim
Set-Alias g git
Set-ALias ll ls
