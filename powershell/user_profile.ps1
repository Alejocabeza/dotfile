# Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim

#fnm
fnm env --use-on-cd | Out-String | Invoke-Expression

#starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\powershell\starship.toml"
