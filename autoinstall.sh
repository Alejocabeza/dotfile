# install package and dependenci

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# add key ssh
ln -s ~/.doctfile/.ssh ~/.ssh
ssh-keygen -f ~/.ssh/bitbucket -C "bitbucket"
ssh-keygen -f ~/.ssh/github -C "github"

# move file of my doctfil
ln -s ~/doctfile/nvim ~/.config/nvim
ln -s ~/doctfile/qtile ~/.config/qtile
ln -s ~/doctfile/openbox ~/.config/openbox
ln -s ~/doctfile/pycritty ~/.config/pycritty
ln -s ~/doctfile/alacritty ~/.config/alacritty
ln -s ~/doctfile/.zshrc ~/.zshrc
ln -s ~/doctfile/.gitconfig ~/.gitconfig
ln -s ~/doctfile/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/doctfile/tmux/.tmux.conf.osx ~/.tmux.conf.osx
ln -s ~/doctfile/tmux/.tmux.powerline.conf ~/.tmux.powerline.conf
ln -s ~/doctfile/tmux/.tmux.statusline.conf ~/.tmux.statusline.conf
