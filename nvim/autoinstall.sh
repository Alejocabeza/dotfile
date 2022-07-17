#!/bin/bash

# Command for to know you system Operation
installDependencesOfLSP()
{
    npm install -g typescript typescript-language-server # typescript and javascript
    npm install -g vim-language-server # vimscript
    npm install -g intelephense # intelephense
    npm i -g bash-language-server # bash
    npm install -g dockerfile-language-server-nodejs #dockerfile
    npm install -g yarn
    yarn global add yaml-language-server #yaml
    yarn global add diagnostic-languageserver #diagnostic
}
installDependencesOfLSP
