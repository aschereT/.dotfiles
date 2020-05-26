alias gitc='git clone --depth=1 --recurse-submodules --shallow-submodules --single-branch -j$(nproc)'

if [[ "$OSTYPE" == "darwin"* ]]; then
    mac/init.sh
fi

git submodule update --init --recursive && git submodule update --remote --merge
[ -f $HOME/.zshrc ] && rm -f $HOME/.zshrc; ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
[ -f $HOME/.gitconfig ] && rm -f $HOME/.gitconfig; cp $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
cd $HOME && gitc https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
curl -s https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | zsh

#neovim setup
#install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p "$HOME/.config/" && ln -s "$HOME/.dotfiles/other-configs/nvim/" "$HOME/.config/nvim"
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
