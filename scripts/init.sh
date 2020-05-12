alias gitc='git clone --depth=1 --recurse-submodules --shallow-submodules --single-branch -j$(nproc)'

if [[ "$OSTYPE" == "darwin"* ]]; then
    mac/init.sh
fi

git submodule update --init --recursive && git submodule update --remote --merge
[ -f ~/.zshrc ] && rm -f ~/.zshrc; ln -s ~/.oh-my-zsh/custom/.zshrc ~/.zshrc
[ -f ~/.gitconfig ] && rm -f ~/.gitconfig; ln -s ~/.oh-my-zsh/custom/.gitconfig ~/.gitconfig
cd $HOME && gitc https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
curl -s https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | zsh

#neovim setup
#install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p "$HOME/.config/" && ln -s "$HOME/.oh-my-zsh/custom/other-configs/nvim/" "$HOME/.config/nvim"
