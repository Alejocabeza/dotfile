# SSH

This is my configuration for generate the key ssh for github and bitbucket that is the repositories that more frequently used when i am worked

The file .config is the that save the configuration for managing the keys

# autoinstall.sh

the execute of autoinstall.sh will installing and configuring the keys of bitbucket and github.

nothing else left to configure your bashrc or your zsh by pasting and copying this code

```bash
eval "$(ssh-agent -s)"
eval "$(ssh-add ~/.ssh/bitbucket)"
eval "$(ssh-add ~/.ssh/github)"
```