set fish_greeting ""
neofetch
eval (ssh-agent -c)
eval (ssh-add ~/.ssh/github)
eval (ssh-add ~/.ssh/bitbucket)

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Aliases
alias ls 'ls -p -G'
alias la 'ls -A'
alias ll 'ls -l'
alias lla 'll -A'
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

alias reset 'source ~/.config/fish/config.fish'

# # directory
alias www 'cd ~/workspace'
alias erp 'cd ~/workspace/algoritmoo-erp'
alias theme_imnova "cd ~/workspace/wordpress-dockerization/wp-content/themes/theme-imnova"
alias fish 'vim ~/.config/fish/config.fish'
alias nvim_config 'cd ~/.config/nvim'
alias wp_themes "cd ~/workspace/wordpress/wp-content/themes"
alias wp_plugins "cd ~/workspace/wordpress/wp-content/plugins"

alias docker_stop 'docker ps -aq | xargs docker stop'
alias start 'make stop && make start && make server'
alias migration 'make migration && make update-db'

# Prompt
starship init fish | source
