# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

for file in ~/.bash/*.bash; do
  source "${file}"
done

export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="/usr/local/opt/libpq:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# VIM
alias v="/usr/local/bin/nvim"

# Shopify specific
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh