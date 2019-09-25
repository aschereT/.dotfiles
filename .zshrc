# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

export ZSH_THEME=powerlevel10k/powerlevel10k
export DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=1
export TERM=xterm-256color
export EDITOR='nano'
export POWERLEVEL9K_MODE="awesome-patched"
# export ZLE_RPROMPT_INDENT=0
export CFLAGS="-Ofast -fomit-frame-pointer"
export CXXFLAGS="-Ofast -fomit-frame-pointer"
# export ARCHFLAGS="-arch x86_64"
export HIST_STAMPS="yyyy-mm-dd"
export COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    colored-man-pages
    extract
    git-auto-fetch
    common-aliases
    ripgrep
)

# Path to your oh-my-zsh installation.
export ZSH="/home/aschere/.oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
# export ZSH_CUSTOM=~/.zshrccust

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
source $HOME/.cargo/env

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="$EDITOR ~/.zshrc && source ~/.zshrc"
alias gitc="git clone --depth=1 --recurse-submodules"
alias upb='git merge master --no-edit && git push'
alias gcle='(git reset --hard; git clean -fd)'
alias l='ls -aFG'

function gacp() {
    git add . && git commit -m $1 && git push
}

# show dir entries on cd
function cd() {
    builtin cd "$@" && l
}
