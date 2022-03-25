# oh-my-zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

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
plugins=(git)

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

# User configuration
#
# tool: bat https://github.com/sharkdp/bat
alias cat='bat -p'

# tool: ag https://github.com/ggreer/the_silver_searcher
alias ag='ag --path-to-ignore ~/.ignore'

# tool: tree
alias tree='tree -I "__pycache__"'

# tool: fzf https://github.com/junegunn/fzf
# ctrl+r /     vim **<tab> /kill -9 <tab> /    uset/export/unalias <tab>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,vendor} --type f --ignore-file ~/.config/ignore"
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(bat --style=numbers --color=always --line-range :500 {} || cat {}) 2> /dev/null | head -500'"
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**'

# tool: direnv https://direnv.net/
# direnv
eval "$(direnv hook zsh)"

# develop env: gvm https://github.com/moovweb/gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
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

