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
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='code'
fi

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
    zsh-syntax-highlighting
    zsh-autosuggestions
    colored-man-pages
    extract
    git-auto-fetch
    common-aliases
    ripgrep
    git
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# source $ZSH_CUSTOM/scripts/debian.sh

# For a full list of active aliases, run `alias`.
alias zshconfig="$EDITOR ~/.zshrc && source ~/.zshrc"
alias gitc="git clone --depth=1 --recurse-submodules --shallow-submodules --single-branch -j $(nproc)"
upb () {
    if [[ $(git diff --stat) != '' ]]; then
        echo 'dirty, cancelling'
    else
        local CURRENTBRANCH=$(git rev-parse --abbrev-ref HEAD)
        git checkout master && git pull && git checkout $CURRENTBRANCH && git rebase master && git push --force-with-lease
    fi
}
alias gcle='(git reset --hard; git clean -fd)'
alias l='lsd --group-dirs first -AF'
alias nv='nano --view -x -R -l'

function gacp() {
    git add . && git commit -m $1 && git push
}

# show dir entries on cd
function cd() {
    builtin cd "$@" && l
}

[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env

cleanGit() {
    fd -uu -t 'd' '^\.git$' 2>/dev/null | while read bn; do
        bash -c "cd $bn/.. && git pull && git remote prune origin && git tag -l | xargs git tag -d && git fetch --tags && git gc --prune=all --aggressive"
    done
}
dr() {
    docker run --rm -dt --name $(echo $1 | tr -dC '[:alpha:]') $1 >/dev/null && docker exec -it $(echo $1 | tr -dC '[:alpha:]') ${2:-sh}
    docker kill $(echo $1 | tr -dC '[:alpha:]') >/dev/null
}