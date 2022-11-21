neofetch
set fish_greeting ""
eval (ssh-agent -c)
eval (ssh-add ~/.ssh/github)
eval (ssh-add ~/.ssh/bitbucket)

# Aliases
alias cat "bat --style=plain --paging=never"
alias grep "grep --color=auto"
alias ls "exa --all --group-directories-first"
alias tree "exa -T"
alias dotfiles "git --git-dir $HOME/dotfiles/ --work-tree $HOME"

# git
alias g 'git'
alias gi 'git init'
alias ga 'git add .'
alias gst 'git status'
alias gc 'git commit -m'
alias gcl 'git clone'
alias gch 'git checkout'
alias gp 'git push origin'
alias gpl 'git pull origin'
alias gs 'git stash'
alias gsp 'git stash pop'
alias gss 'git stash show'
alias gb 'git branch'

#neovim
alias vim 'nvim'

# Prompt
starship init fish | source
