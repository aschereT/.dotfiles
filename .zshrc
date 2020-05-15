# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# [ -z "$TMUX" ] && { tmux attach || exec tmux new-session && exit; }
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Preferred editor for local and remote sessions
export EDITOR=nvim

function upbrew() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew update && brew upgrade  && brew cask upgrade && brew cleanup
        #local LATEST_NPM=$(npm --version)
        #nvm install node --reinstall-packages-from=node --latest-npm
        #nvm use node
        #if [ "$LATEST_NPM" != "$(npm --version)" ]
        #then
        #	nvm install-latest-npm
        #fi
        #nvm ls --no-alias --no-colors | fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox} -v $(nvm current) | sed $'s/^[ \t]*//' | cut -f 1 -d ' ' | while read ver
        #do
        #	nvm uninstall $ver
        #done
    fi
}

export ZSH_THEME=powerlevel10k/powerlevel10k
export DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=1
export TERM=xterm-256color
export POWERLEVEL9K_MODE="awesome-patched"
# export ZLE_RPROMPT_INDENT=0
export CFLAGS="-Ofast -fomit-frame-pointer"
export CXXFLAGS="-Ofast -fomit-frame-pointer"
# export ARCHFLAGS="-arch x86_64"
export HIST_STAMPS="yyyy-mm-dd"
export COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
export plugins=(
    autoupdate
    zsh-autosuggestions
    fast-syntax-highlighting
    colored-man-pages
    extract
    git-auto-fetch
    common-aliases
    common-aliases-patch
    ripgrep
    git
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# source $ZSH_CUSTOM/scripts/debian/debian.sh
export GOPATH="$HOME/go"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env

# For a full list of active aliases, run `alias`.
alias zshconfig="$EDITOR ~/.zshrc && source ~/.zshrc"
alias gitc="git clone --depth=1 --recurse-submodules --shallow-submodules --single-branch -j$(nproc)"
alias gcle='(git reset --hard; git clean -fd)'
alias l='lsd --group-dirs first -AF'
alias nv='nano --view -x -R -l'

function upb () {
    if [[ $(git diff --stat) != '' ]]; then
        echo 'dirty, cancelling'
    else
        local CURRENTBRANCH=$(git rev-parse --abbrev-ref HEAD)
        git checkout master && git pull && git checkout $CURRENTBRANCH && git rebase master && git push --force-with-lease
    fi
}

function gacp() {
    git add . && git commit -sm $1 && git push
}

# show dir entries on cd
function cd() {
    builtin cd "$@" && l
}

function cleanGit() {
    fd -uu -t 'd' '^\.git$' 2>/dev/null | while read bn; do
        bash -c "cd $bn/.. && git pull && git remote prune origin && git tag -l | xargs git tag -d && git fetch --tags && git gc --prune=all --aggressive"
    done
}

function dr() {
    docker run --rm -dt --name $(echo $1 | tr -dC '[:alpha:]') $1 >/dev/null && docker exec -it $(echo $1 | tr -dC '[:alpha:]') ${2:-sh}
    docker kill $(echo $1 | tr -dC '[:alpha:]') >/dev/null
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
