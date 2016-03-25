export EDITOR='nvim'
export DEFAULT_USER='tombeynon'

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
# antigen bundle brew
antigen bundle bundler
antigen bundle osx
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# fzf
antigen bundle urbainvaes/fzf-marks

# Load the theme.
antigen theme norm

# Tell antigen that you're done.
antigen apply

# 10ms for key sequences
KEYTIMEOUT=1

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# User configuration

export PATH="./bin:./node_modules/.bin:$HOME/bin:$HOME/.rbenv/bin:/usr/local/var/rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export TERM=screen-256color

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias mux=tmuxinator
alias vi=nvim
alias vim=nvim

export DISABLE_AUTO_TITLE=true

export PATH="/Applications/android-sdk/tools:/Applications/android-sdk/platform-tools:$PATH"

envfile="$HOME/.zshrc-osx.sh"
if [ -r $envfile ]; then
    . $envfile
fi

eval "$(rbenv init - --no-rehash)"

source ~/.iterm2_shell_integration.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --depth=10 -f -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:61,bg+:235,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'
