alias gitc='git clone --depth=1 --recurse-submodules -j`nproc`'

git submodule update --init --recursive && git submodule update --remote --merge
[ -f ~/.zshrc ] && rm -f ~/.zshrc; ln -s ~/.oh-my-zsh/custom/.zshrc ~/.zshrc
[ -f ~/.gitconfig ] && rm -f ~/.gitconfig; ln -s ~/.oh-my-zsh/custom/.gitconfig ~/.gitconfig
cd $HOME && gitc https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
curl -s https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | zsh
gitc https://github.com/amix/vimrc.git ~/.vim_runtime && zsh ~/.vim_runtime/install_awesome_vimrc.sh && python3 ~/.vim_runtime/update_plugins.py
