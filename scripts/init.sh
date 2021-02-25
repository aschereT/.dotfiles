git submodule update --init --recursive && git submodule update --remote --merge
mkdir -p "$HOME/.config" 2>&1 >/dev/null || true
[ -f "$HOME"/.zshrc ] && rm -f "$HOME/.zshrc"; ln -s "$HOME"/.dotfiles/.zshrc "$HOME"/.zshrc
[ -f "$HOME"/.gitconfig ] && rm -f "$HOME"/.gitconfig; cp "$HOME"/.dotfiles/.gitconfig "$HOME"/.gitconfig
[ -f "$HOME"/.p10k.zsh ] && rm -f "$HOME"/.p10k.zsh; ln -s "$HOME"/.dotfiles/other-configs/.p10k.zsh "$HOME"/.p10k.zsh
[ -f "$HOME"/.config/kitty ] && rm -f "$HOME"/.config/kitty; ln -s "$HOME"/.dotfiles/other-configs/kitty "$HOME"/.config/kitty
cd "$HOME" && git clone --depth=1 --recurse-submodules --shallow-submodules --single-branch -j$(nproc) https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf . && cp .tmux/.tmux.conf.local .
curl -s https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | zsh >/dev/null 2>/dev/null

#neovim setup
#install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
[ -f "$HOME"/.config/nvim ] && rm -f "$HOME"/.config/nvim; ln -s "$HOME/.dotfiles/other-configs/nvim" "$HOME/.config/nvim"
