# install package and dependenci

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install dependencies for 
npm install -g typescript typescript-language-server # typescript and javascript
npm install -g vim-language-server # vimscript
npm install -g intelephense # intelephense
npm i -g bash-language-server # bash
npm install -g dockerfile-language-server-nodejs #dockerfile
npm install -g yarn
yarn global add yaml-language-server #yaml
yarn global add diagnostic-languageserver #diagnostic

# add key ssh
ln -s ~/.doctfile/.ssh ~/.ssh
ssh-keygen -f ~/.ssh/bitbucket -C "bitbucket"
ssh-keygen -f ~/.ssh/github -C "github"

# move file of my doctfil
ln -s ~/.doctfile/nvim ~/.config/nvim
ln -s ~/.doctfile/qtile ~/.config/qtile
ln -s ~/.doctfile/openbox ~/.config/openbox
ln -s ~/.doctfile/pycritty ~/.config/pycritty
ln -s ~/.doctfile/alacritty ~/.config/alacritty
ln -s ~/.doctfile/.tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.doctfile/.zshrc ~/.zshrc
ln -s ~/.doctfile/.gitconfig ~/.gitconfig