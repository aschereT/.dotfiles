[ -f ~/.zshrc ] && rm -f ~/.zshrc; ln -s ~/.oh-my-zsh/custom/.zshrc ~/.zshrc
[ -f ~/.gitconfig ] && rm -f ~/.gitconfig; ln -s ~/.oh-my-zsh/custom/.gitconfig ~/.gitconfig
cd && git clone --depth=1 --recurse-submodules https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | zsh
