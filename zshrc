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

# fasd for fast file searching
# only init if installed.
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

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
alias ll='ls -alGh'
alias ls='ls -Gh'
alias du='du -h -d 2'
alias ...='../..'

# aliases because I cannot type
alias brwe='brew'
