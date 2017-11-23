# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# disable JAVA_TOOL_OPTIONS
unset JAVA_TOOL_OPTIONS

# set default user
DEFAULT_USER="ishan"

# set promptline
# source .shell_prompt.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# tmux help at https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmux
plugins=(git python pip pyvenv sudo git-flow brew jira web-search vagrant docker encode64, go)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/ishan/.rvm/bin"

# put laravel into path
export PATH="$PATH:$HOME/.composer/vendor/bin"

# put google cloud sdk in path
export PATH="$PATH:$HOME/google-cloud-sdk/path.zsh.inc"

# put mysql on path on mac
export PATH="$PATH:/usr/local/mysql/bin"

# put rust on path
export PATH="$PATH:$HOME/.cargo/bin"

export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
#source $ZSH/templates/zshrc.zsh-template

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# enable suggestion for package if command not found
# not required as command-not-found is now in plugins

# git specific custom aliases
alias glrh="git ls-remote --heads"
alias gctb="git checkout --track -b"      # followed by <local_branch_name> <origin/remote_branch_name>
alias gpsup="git push --set-upstream"      # useful for first time push of new branches
alias gbvv="git branch -vv"
[[ -s "/home/ishan/.gvm/scripts/gvm" ]] && source "/home/ishan/.gvm/scripts/gvm"

# alias for tumx unicode support
alias tmux="tmux -u2"

# set 256 color support for tmux
if [ "$TMUX" = "" ]; then
    export TERM=screen-256color
    echo "starting tmux"
    tmux
    exit

fi

# alias for starting android studio
alias androidstudio="/home/ishan/android-studio/bin/studio.sh & disown"

# add search highlighting for less & man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# GOPATH and default version
# gvm use go1.5 > /dev/null
export GOPATH=~/godev

# aliases for xclip
alias xclip-copy="xclip -selection c"
alias xclip-paste="xclip -selection clipboard -o"
alias xclip-clear="xclip -selection c -i /dev/null"

# alias for starting erlang docs
alias erldocs="cd ~/docs-19.0/;python -m SimpleHTTPServer"

export NVM_DIR="/home/ishan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export JIRA_URL="vegfru.atlassian.net"
JIRA_RAPID_BOARD="true"

# enable jump word on iterm2
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ishan/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/ishan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ishan/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/ishan/google-cloud-sdk/completion.zsh.inc'; fi
