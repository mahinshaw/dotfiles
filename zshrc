# -*- mode: shell-script;-*-
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Mark Hinshaw <mahinshaw@gmail.com>
#

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

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# gh cli
if [ $commands[gh] ]; then
  source <(gh completion -s zsh)
fi

# zoxide
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
fi

# use direnv https://direnv.net/
if [ -x "$(command -v direnv)" ]; then
  eval "$(direnv hook zsh)"
fi

# init opam env
if [ -x "$(command -v opam)" ]; then
  eval `opam config env`;
fi

# nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ================ALIASES===================
# use macvim in the terminal if it exits
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if  [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# *rc file editing
alias ve="vim ~/.vimrc"
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

# Mono
alias fsi='fsharpi --nologo --consolecolors'

# Nodejs
# alias node="env NODE_NO_READLINE=1 rlwrap node"

#Browser
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
  alias chrome-debug='chrome --remote-debugging-port=9222 &'
  alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
  alias canary-debug='canary --remote-debugging-port=9222 &'
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Azure cli shouldn't collect my data.
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT='true'
