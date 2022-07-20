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

# move file of my doctfil
cp -r ~/.doctfile/nvim ~/.config/nvim
cp -r ~/.doctfile/qtile ~/.config/qtile
cp -r ~/.doctfile/openbox ~/.config/openbox
cp -r ~/.doctfile/pycritty ~/.config/pycritty
cp -r ~/.doctfile/alacritty ~/.config/alacritty
cp -r ~/.doctfile/.tmux/.tmux.conf ~/.tmux.conf
cp ~/.doctfile/.zshrc ~/.zshrc
cp ~/.doctfile/.gitconfig ~/.gitconfig

# open neovim

