set fish_greeting ""
eval (ssh-agent -c)
eval (ssh-add ~/.ssh/github)
eval (ssh-add ~/.ssh/bitbucket)

# Aliases
alias grep "grep --color=auto"
alias ls "exa --all --group-directories-first"
alias tree "exa -T"
alias dotfiles "git --git-dir $HOME/dotfile/ --work-tree $HOME"

# git
alias g 'git'

alias reset 'source ~/.config/fish/config.fish'

# directory
alias www 'cd ~/workspace'
alias erp 'cd ~/workspace/algoritmoo-erp'
alias theme_imnova "cd ~/workspace/wordpress-dockerization/wp-content/themes/theme-imnova"
alias fish 'vim ~/.config/fish/config.fish'
alias nvim_config 'cd ~/.config/nvim'

alias docker_stop 'docker ps -aq | xargs docker stop'
alias start 'make start && make server'
alias migration 'make migration && make update-db'

# alias for windows
alias erp-win 'cd /mnt/c/xampp/htdocs/algoritmoo-erp'

#neovim
alias vim 'nvim'

# Prompt
starship init fish | source
