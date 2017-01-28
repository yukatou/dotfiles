#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Android
export PATH=$PATH:/Users/yukatou/Library/Android/sdk/platform-tools/


# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
export PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# chefdk
#eval "$(chef shell-init zsh)"

export EDITOR=vim

# docker 
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
