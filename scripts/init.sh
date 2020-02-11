alias gitc='git clone --depth=1 --recurse-submodules -j`nproc`'

git submodule update --init --recursive && git submodule update --remote --merge
[ -f ~/.zshrc ] && rm -f ~/.zshrc; ln -s ~/.oh-my-zsh/custom/.zshrc ~/.zshrc
[ -f ~/.gitconfig ] && rm -f ~/.gitconfig; ln -s ~/.oh-my-zsh/custom/.gitconfig ~/.gitconfig
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
gitc https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
gitc https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
gitc https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
cd $HOME && gitc https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | zsh