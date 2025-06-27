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

# volta is set here as it's clobbered by zprezto/init
export PATH="$VOLTA_HOME/bin:$PATH"

# ================ALIASES===================
# use macvim in the terminal if it exits
nvim --version > /dev/null 2>&1
NVIM_INSTALLED=$?
if  [ $NVIM_INSTALLED -eq 0 ]; then
  alias vim="nvim"
  alias vi="nvim"
fi

#alias python to `uv run python`
if [ $commands[uv] ]; then
  alias pip="uv pip"
  alias python="uv run python"
else
  alias python="python3"
  alias pip="pip3"
fi

# use gfind over find
alias find="/opt/homebrew/bin/gfind"

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

# get vars that you don't want in git.
source ~/.zshrc.local

# make sure zeillij tabs have directories as names
# https://www.reddit.com/r/zellij/comments/10skez0/does_zellij_support_changing_tabs_name_according/
# https://www.reddit.com/r/zellij/comments/1bzycys/pane_frame_title_question/
zellij_tab_name_update() {
  if [[ -n $ZELLIJ ]]; then
    tab_name=''
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        tab_name+=$(basename "$(git rev-parse --show-toplevel)")/
        tab_name+=$(git rev-parse --show-prefix)
        tab_name=${tab_name%/}
    else
        tab_name=$PWD
            if [[ $tab_name == $HOME ]]; then
         	tab_name="~"
             else
         	tab_name=${tab_name##*/}
             fi
    fi
    command nohup zellij action rename-tab $tab_name >/dev/null 2>&1
    #command nohup zellij action rename-pane $tab_name >/dev/null 2>&1
  fi
}
# zellij_tab_name_update
chpwd_functions+=(zellij_tab_name_update)

# use the last session if it exists
# export ZELLIJ_AUTO_START=true
# shut down the shell when zellij exits
# export ZELLIJ_AUTO_EXIT=true

#run zellij
# eval "$(zellij setup --generate-auto-start zsh)"
if [[ -z "$ZELLIJ" ]]; then
  zellij attach -c root
  
  if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
    exit 0
  fi
fi
