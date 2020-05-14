![Update submodules](https://github.com/aschereT/.zshrccust/workflows/Update%20submodules/badge.svg)
# zshrc
Custom zshrc build

# Steps

- Set up git (keys)
  - `sudo apt update && sudo apt upgrade && sudo apt install git zsh`
- `ssh-keygen -t ed25519`
- Install `oh-my-zsh` https://github.com/ohmyzsh/ohmyzsh
- `rm -r ~/.oh-my-zsh/custom`
- `git clone --depth=1 --recurse-submodules --shallow-submodules --single-branch git@github.com:aschereT/.zshrccust.git ~/.oh-my-zsh/custom`
- Install Meslo fonts: `https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/S/Regular/complete`
- `cd ~/.oh-my-zsh/custom/scripts && ./init.sh`
- `nvim` and then `:PlugInstall`

## Script form
```
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
gpg --full-gen-key --expert
```
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
rm -r ~/.oh-my-zsh/custom && \
git clone --depth=1 --recurse-submodules --shallow-submodules --single-branch git@github.com:aschereT/.zshrccust.git ~/.oh-my-zsh/custom && \
cd ~/.oh-my-zsh/custom/scripts && ./init.sh
```
