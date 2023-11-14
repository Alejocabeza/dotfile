# Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim
New-Alias -Name ch -Value changeDirectory
New-Alias -Name www -Value changeWorkspaceDirectory
New-Alias -Name dot -Value changeDotfileDirectory

#imports
Import-Module Terminal-Icons

#fnm
fnm env --use-on-cd | Out-String | Invoke-Expression

#starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\powershell\starship.toml"

#fuctions
function changeDirectory($link) {
  $ruta = 'E:\' + $link
  return Set-Location $ruta
}

function changeWorkspaceDirectory() {
  return Set-Location 'E:\Documents\workspace'
}

function changeDotfileDirectory() {
  return Set-Location '~\dotfile'
}
