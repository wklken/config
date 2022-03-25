# oh-my-zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7


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

# User configuration
#
# tool: bat https://github.com/sharkdp/bat
alias cat='bat -p'

# tool: fzf https://github.com/junegunn/fzf
# ctrl+r /     vim **<tab> /kill -9 <tab> /    uset/export/unalias <tab>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,vendor} --type f --ignore-file ~/.config/ignore"
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(bat --style=numbers --color=always --line-range :500 {} || cat {}) 2> /dev/null | head -500'"
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**'

# tool: direnv https://direnv.net/
# direnv
eval "$(direnv hook zsh)"

# develop env: gvm https://github.com/moovweb/gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# develop env: pyenv https://github.com/pyenv/pyenv 
# pyenv update
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# alias
# source ~/.zsh_aliases
# source ~/.git_aliases
