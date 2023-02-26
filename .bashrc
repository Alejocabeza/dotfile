eval "$(fnm env --use-on-cd)"
eval "$(starship init bash)"
eval "$(ssh-agent)"
eval "$(ssh-add ~/.ssh/Github)"
eval "$(ssh-add ~/.ssh/Bitbucket)"

# directory
alias erp='cd C:\\xampp\\htdocs\\algoritmoo-erp'
alias www='cd ~/www'
alias ubuntu='cd \\wsl.localhost\Ubuntu\home\alejo\www'

# List Directory
alias ll='ls -la'

# Git
alias g='git'
alias gi='git init'
alias ga='git add .'
alias gst='git status'
alias gc='git commit -m'
alias gcl='git clone'
alias gch='git checkout'
alias gp='git push origin'
alias gpl='git pull origin'
alias gb='git branch'
alias gs='git stash'
alias gsp='git stash pop'
alias gss='git stash show'

# vim
alias vim='nvim'
