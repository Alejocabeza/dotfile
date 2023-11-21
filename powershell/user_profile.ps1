# Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim
Set-Alias py python
New-Alias -Name ch -Value changeDirectory
New-Alias -Name www -Value changeWorkspaceDirectory
New-Alias -Name dot -Value changeDotfileDirectory
New-Alias -Name nvim_config -Value changeNvimDirectory
New-Alias -Name ln -Value linkSymbol

#PSread
Set-PSReadLineOption -PredictionViewStyle ListView

#imports
Import-Module Terminal-Icons

#fnm
fnm env --use-on-cd | Out-String | Invoke-Expression

#starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\dotfile\starship.toml"

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

function changeNvimDirectory() {
  return Set-Location '~\AppData\Local\nvim'
}

function linkSymbol($target, $path) {
  return New-Item -ItemType SymbolicLink -Path "$path" -Target "$target" 
}
