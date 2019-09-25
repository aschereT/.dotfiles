[ -f ~/.zshrc ] && rm -f ~/.zshrc
ln -s ~/.oh-my-zsh/custom/.zshrc ~/.zshrc
cd && git clone --depth=1 --recurse-submodules https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
