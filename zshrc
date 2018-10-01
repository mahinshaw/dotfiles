# -*- mode: shell-script;-*-
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


# fasd for fast file searching
# only init if installed.
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# use direnv https://direnv.net/
eval "$(direnv hook zsh)"

# init opam env
if [ -x "$(command -v opam)" ]; then
  eval `opam config env`;
fi

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

# jump to recently used items
alias a='fasd -a' # any
alias s='fasd -si' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # interactive directory jump

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

# gpg is easier that gpg2 (brew/osx thing)
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias gpg='gpg2'
fi

# Show/Hide hidden files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias _gitignore_to_regex="(cat .gitignore 2> /dev/null || echo '') | sed 's/^\///' | tr '\n' '|'"
alias trig='tree -I $(_gitignore_to_regex)'

# Mono
alias fsi='fsharpi --nologo --consolecolors'

#Browser
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
  alias chrome-debug='chrome --remote-debugging-port=9222 &'
  alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
  alias canary-debug='canary --remote-debugging-port=9222 &'
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--inline-info'
