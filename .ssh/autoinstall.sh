# add key ssh
ln -s ~/.doctfile/.ssh ~/.ssh
ssh-keygen -f ~/.ssh/bitbucket -C "bitbucket"
ssh-keygen -f ~/.ssh/github -C "github"