![Update submodules](https://github.com/aschereT/.zshrccust/workflows/Update%20submodules/badge.svg)
# zshrc
Custom zshrc build

# Steps

- Set up git (keys)
  - `sudo apt update && sudo apt upgrade && sudo apt install git zsh fish`
- `ssh-keygen -t ed25519`
- Install `oh-my-zsh` https://github.com/ohmyzsh/ohmyzsh
- `rm -r ~/.oh-my-zsh/custom`
- `git clone --depth=1 --recurse-submodules git@github.com:aschereT/.zshrccust.git ~/.oh-my-zsh/custom`
- Install Meslo fonts: `https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/S/Regular/complete`
- `cd ~/.oh-my-zsh/custom/scripts && ./init.sh`
