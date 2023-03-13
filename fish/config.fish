set fish_greeting ""
eval (ssh-agent -c)
eval (ssh-add ~/.ssh/github)
eval (ssh-add ~/.ssh/bitbucket)

# Aliases
alias grep "grep --color=auto"
alias ls "exa --all --group-directories-first"
alias tree "exa -T"
alias dotfiles "git --git-dir $HOME/dotfiles/ --work-tree $HOME"

# git
alias g 'git'

alias reset 'source ~/.config/fish/config.fish'

# directory
alias www 'cd ~/www'
alias erp 'cd ~/www/algoritmoo-erp'
alias fish 'vim ~/.config/fish/config.fish'
alias nvim_config 'cd ~/.config/nvim'

alias docker_stop 'docker ps -aq | xargs docker stop'

#neovim
alias vim 'nvim'

# Prompt
starship init fish | source
