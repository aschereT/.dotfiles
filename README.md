# zshrc
Custom zshrc build


# Steps

- Set up git (keys)
- `ssh -t ed25519`
- Install `oh-my-zsh` https://github.com/ohmyzsh/ohmyzsh
- `rm -r ~/.oh-my-zsh/custom`
- `git clone --depth=1 --recurse-submodules git@github.com:aschereT/.zshrccust.git ~/.oh-my-zsh/custom`
- `cd ~/.oh-my-zsh/custom && ./init.sh`
