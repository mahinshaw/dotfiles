# -*- mode: shell-script;-*-
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Mark Hinshaw <mahinshaw@gmail.com>
#

# return early if it's intellij
if [ -n "$INTELLIJ_ENVIRONMENT_READER" ]; then
  exit 0
fi

# Add homebrew-installed package completions to fpath
if command -v brew > /dev/null; then
    fpath+=$(brew --prefix)/share/zsh/site-functions
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Chruby is awesome, let it do its magic
# if [[ -e /usr/local/share/chruby ]]; then
#   source /usr/local/share/chruby/chruby.sh
#   source /usr/local/share/chruby/auto.sh
#   chruby $(cat ~/.ruby-version)
# fi

# kubernetes is special.
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi
if [ $commands[minikube] ]; then
    source <(minikube completion zsh)
fi

# gh cli
if [ $commands[gh] ]; then
  source <(gh completion -s zsh)
fi

# disable fzf key bindings to avoid conflicts with tv
FZF_CTRL_R_COMMAND= FZF_ALT_C_COMMAND= source <(fzf --zsh)
if [ $commands[fzf] ]; then
  source <(fzf --zsh)
fi

# zoxide
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
fi

# use direnv https://direnv.net/
if [ -x "$(command -v direnv)" ]; then
  eval "$(direnv hook zsh)"
fi

# init mise
if [ -x "$(command -v mise)" ]; then
  eval "$(mise activate zsh)"
fi

# init tv
if [ -x "$(command -v tv)" ]; then
  eval "$(tv init zsh)"
fi

# ================ALIASES===================
# nvim all the things
nvim --version > /dev/null 2>&1
NVIM_INSTALLED=$?
if  [ $NVIM_INSTALLED -eq 0 ]; then
  alias vim="nvim"
  alias vi="nvim"
fi

# use gfind over find
alias find="/opt/homebrew/bin/gfind"

# *rc file editing
alias ve="vim ~/.config/nvim/init.lua"
alias ze="vim ~/.zshrc"
alias zr="source ~/.zshrc"

# zmv is cool, lets use it. No quotes and allow wildcards as valid syntax.
autoload -U zmv
alias zmv='noglob zmv -W'

# alias mappings - not related to a plugin
# human readable outputs
alias df='df -h'
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi
alias du='du -h -d 2'
alias ...='../..'

# Show/Hide hidden files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias _gitignore_to_regex="(cat .gitignore 2> /dev/null || echo '') | sed 's/^\///' | tr '\n' '|'"
alias trig='tree -I $(_gitignore_to_regex)'

#Browser
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
  alias chrome-debug='chrome --remote-debugging-port=9222 &'
  alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
  alias canary-debug='canary --remote-debugging-port=9222 &'
fi

# get vars that you don't want in git.
source ~/.zshrc.local
