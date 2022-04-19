# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/yfoeillet/.oh-my-zsh"

export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin:$HOME/bin"
export PATH="/usr/local/share/dotnet:/usr/local/opt/mysql-client/bin:$PATH"


# GOSS and DGOSS
export GOSS_USE_ALPHA=1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="apple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  kubectl
  brew
  minikube
  osx
  ssh-agent
  tmux
  z
  zsh-navigation-tools
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

ssh-add --apple-use-keychain /Users/yfoeillet/.ssh/id_ed25519
ssh-add --apple-use-keychain /Users/yfoeillet/.ssh/pivotal_rsa
ssh-add --apple-use-keychain /Users/yfoeillet/.ssh/tf_rsa

zstyle :omz:plugins:ssh-agent agent-forwarding on
source $ZSH/oh-my-zsh.sh

export GIT_COMMITTER_NAME="Yannick Foeillet"
export GIT_COMMITTER_EMAIL="bzhtux@gmail.com"
export GIT_AUTHOR_NAME="Yannick Foeillet"
export GIT_AUTHOR_EMAIL="bzhtux@gmail.com"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi='vim'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit'
alias gp='git push'
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kgs='kubectl get services'
alias customers='cd /Users/yfoeillet/workdir/src/Customers'

# CUSTOM FUNCTIONS
function bw_login {
  if ! bw login --check >/dev/null; then
    BW_SESSION=$(bw login --raw)
    export BW_SESSION
  else
    BW_SESSION=$(bw unlock --raw)
    export BW_SESSION
  fi
  bw sync
} 


# Source Extra File for custom and hidden alias or other job stuff ;-)
if [ -f "$HOME/.zsh-extras" ];
then
  . "$HOME/.zsh-extras"
fi

# direnv
eval "$(direnv hook zsh)"

# silver_search
if [ -f "/usr/local/share/zsh/site-functions" ];
then
  . '/usr/local/share/zsh/site-functions'
fi

# GCLOUD
if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ];
then
	. '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
fi

if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ];
then
	. '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# KIND
if [ -f "/usr/local/share/zsh/site-functions/_kind" ];
then
  # . "/usr/local/share/zsh/site-functions/_kind"
  autoload -U compinit
  compinit
fi

# KUBECTL
if [ -f "/usr/local/share/zsh/site-functions/_kubectl" ];
then
	. "/usr/local/share/zsh/site-functions/_kubectl"
fi

# CURL
if [ -f "/usr/local/opt/curl/share/zsh/site-functions" ];
then
  . "/usr/local/opt/curl/share/zsh/site-functions"
fi

# BITWARDEN
# if ! bw list folders >/dev/null 2>&1; then
#     if ! bw login --check >/dev/null; then
#         BW_SESSION=$(bw login --raw)
#         export BW_SESSION
#     else
#         BW_SESSION=$(bw unlock --raw)
#         export BW_SESSION
#     fi
# fi
# bw sync

# if [ -f "/Users/yfoeillet/.fzf.zsh" ]
# then
#   . "/Users/yfoeillet/.fzf.zsh"
# fi

##thefuck
#eval $(thefuck --alias)
#
## You can use whatever you want as an alias, like for Mondays:
#eval $(thefuck --alias FUCK)

compdef _ansible ansible-playbook

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/yfoeillet/.travis/travis.sh ] && source /Users/yfoeillet/.travis/travis.sh
export PATH="/usr/local/opt/helm@2/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yfoeillet/.sdkman"
[[ -s "/Users/yfoeillet/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yfoeillet/.sdkman/bin/sdkman-init.sh"

# TANZU COMPLETION
source <(tanzu completion zsh)

# K8S Context in PS1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1) '$PS1

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
