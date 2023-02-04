# oh-my-zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="af-magic"
# curl https://raw.githubusercontent.com/wklken/af-magic-left/master/af-magic-left.zsh-theme -o ~/.oh-my-zsh/themes/af-magic-left.zsh-theme
ZSH_THEME="af-magic-left"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# Preferred editor for local and remote sessions
export EDITOR='vim'
export PAGER=cat

# History
export HISTSIZE=50000
export HISTFILESIZE=50000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups #忽略重复
export HISTFILE="$HOME/.history" #记录的文件
export HISTTIMEFORMAT='%F %T ' #格式 日期+命令
# export HISTCONTROL=erasedups
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTIGNORE="ls:ll:pwd:clear;gs"

# Plugins
# linux
[ -f  ~/.zplug/init.zsh ] && source ~/.zplug/init.zsh
# macos
[ -f  /usr/local/opt/zplug/init.zsh ] && source /usr/local/opt/zplug/init.zsh
[ -f  /opt/homebrew/opt/zplug/init.zsh ] && source /opt/homebrew/opt/zplug/init.zsh

# manage zplug itself like other packages
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
# zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-completions"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
# zplug "plugins/gitfast",   from:oh-my-zsh
zplug "plugins/git-extras",   from:oh-my-zsh
zplug "plugins/autojump",    from:oh-my-zsh
zplug "plugins/git",    from:oh-my-zsh
# zplug "plugins/zsh-256color",   from:oh-my-zsh
# zplug "plugins/extract",   from:oh-my-zsh
# zplug "plugins/redis-cli",   from:oh-my-zsh
# zplug "plugins/encode64",   from:oh-my-zsh
# zplug "plugins/npm",   from:oh-my-zsh
# # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectx
# zplug "plugins/kubectl",   from:oh-my-zsh
# zplug "plugins/helm",   from:oh-my-zsh
# zplug "plugins/docker",   from:oh-my-zsh
# zplug "superbrothers/zsh-kubectl-prompt", use:kubectl.zsh
# https://github.com/wfxr/forgit
# zplug 'wfxr/forgit'
# zplug "plugins/ruby",   from:oh-my-zsh
# zplug "plugins/gem",   from:oh-my-zsh
# zplug "plugins/npm",   from:oh-my-zsh
# zplug "plugins/node",   from:oh-my-zsh
# zplug "plugins/golang",   from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

#=============== plug settings begin =============
# D: zsh-autosuggestions
# http://askubuntu.com/questions/558280/changing-colour-of-text-and-background-of-terminal
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'
#
# D: zsh-history-substring-search
# add zsh-history-substring-search to plugins
# git cl + ctrl'P
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

#=============== plug settings end =============

# for all brew install binaries
export PATH="/opt/homebrew/bin/:$PATH"

# User configuration
#
# tool: bat https://github.com/sharkdp/bat
alias cat='bat -p'

# tool: ag https://github.com/ggreer/the_silver_searcher
alias ag='ag --path-to-ignore ~/.ignore'

# tool: tree
alias tree='tree -I "__pycache__"'

# tool: fzf https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ctrl+r /     vim **<tab> /kill -9 <tab> /    uset/export/unalias <tab>
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,vendor} --type f --ignore-file ~/.config/ignore"
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(bat --style=numbers --color=always --line-range :500 {} || cat {}) 2> /dev/null | head -500'"
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**'

# tool: direnv https://direnv.net/
# direnv
eval "$(direnv hook zsh)"

# tool: tldr https://github.com/tldr-pages/tldr
alias help='tldr'

# tool: scc https://github.com/boyter/scc
alias loc='scc --exclude-dir vendor'

# tool: fd https://github.com/sharkdp/fd
# Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND='fd --type f'
# If you want the command to follow symbolic links and don't want it to exclude hidden files
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# tool: kube-prompt https://github.com/c-bata/kube-prompt
alias kp='kube-prompt'

# develop env: gvm https://github.com/moovweb/gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
# go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# export PPROF_TMPDIR=$HOME/workspace/tmp/

# develop env: pyenv https://github.com/pyenv/pyenv
# pyenv update
export PATH="$HOME/.pyenv/bin:$PATH" # TODO: not ok with macos
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# develop env: nvm  https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias
source ~/.zsh.aliases
source ~/.git.aliases

# sed for mac
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
