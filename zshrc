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

# Note: homebrew's site-functions dir is already added to fpath statically
# in zshenv, so there's no need to fork `brew --prefix` here too.

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
# (_zsh_cached_init/_zsh_cached_value/_ZSH_INIT_CACHE_AGE are defined in zshenv)
if (( $+commands[kubectl] )); then
  _zsh_cached_init kubectl-completion $_ZSH_INIT_CACHE_AGE kubectl completion zsh
fi
if (( $+commands[minikube] )); then
  _zsh_cached_init minikube-completion $_ZSH_INIT_CACHE_AGE minikube completion zsh
fi

# gh cli
if (( $+commands[gh] )); then
  _zsh_cached_init gh-completion $_ZSH_INIT_CACHE_AGE gh completion -s zsh
fi

# fzf - ctrl-r/alt-c bindings disabled to avoid conflicts with tv
if (( $+commands[fzf] )); then
  FZF_CTRL_R_COMMAND= FZF_ALT_C_COMMAND= _zsh_cached_init fzf-init $_ZSH_INIT_CACHE_AGE fzf --zsh
fi

# zoxide
if (( $+commands[zoxide] )); then
  _zsh_cached_init zoxide-init $_ZSH_INIT_CACHE_AGE zoxide init zsh
fi

# use direnv https://direnv.net/
if (( $+commands[direnv] )); then
  _zsh_cached_init direnv-hook $_ZSH_INIT_CACHE_AGE direnv hook zsh
fi

# init mise
# note: this only caches the one-time activation script. mise itself still
# forks `mise hook-env` on every prompt/cd via its precmd/chpwd hooks - that
# recurring cost isn't fixed by caching. See `mise activate zsh --shims` for
# a fork-free alternative if that per-prompt lag is the bigger complaint.
if (( $+commands[mise] )); then
  _zsh_cached_init mise-activate $_ZSH_INIT_CACHE_AGE mise activate zsh
fi

# init tv
if (( $+commands[tv] )); then
  _zsh_cached_init tv-init $_ZSH_INIT_CACHE_AGE tv init zsh
fi

# starship prompt - Prezto's prompt theme is disabled (see zpreztorc) in
# favor of initializing directly here so it goes through the same cache.
if (( $+commands[starship] )); then
  _zsh_cached_init starship-init $_ZSH_INIT_CACHE_AGE starship init zsh
fi

# ================ALIASES===================
# nvim all the things
if [ $commands[nvim] ]; then
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

# ==============SHELL PROFILING===============
# Measure where zsh startup time goes. See ~/.dotfiles/README.md.
zsh-startup-report() {
  emulate -L zsh
  local runs=${1:-10}

  print -P "%F{cyan}== wall-clock startup time (hyperfine, $runs runs) ==%f"
  hyperfine --warmup 3 --min-runs "$runs" 'zsh -i -c exit'

  print -P "\n%F{cyan}== zprof: cumulative time per function/plugin ==%f"
  ZSH_PROFILE_STARTUP=1 zsh -i -c exit

  local trace_log="/tmp/zsh_startup_trace.$$"
  print -P "\n%F{cyan}== xtrace: slowest individual commands ==%f"
  ZSH_XTRACE_STARTUP=1 ZSH_XTRACE_LOG="$trace_log" zsh -i -c exit
  if [[ -s "$trace_log" ]]; then
    awk '
      /^\+[0-9]/ {
        ts = $1
        sub(/^\+/, "", ts)
        if (prev != "") printf "%.6f %s\n", ts - prev, prevline
        prev = ts
        prevline = $0
      }
    ' "$trace_log" | sort -rn | head -30
    print -P "%F{yellow}full trace: $trace_log%f"
  fi
}

#Browser
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
  alias chrome-debug='chrome --remote-debugging-port=9222 &'
  alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
  alias canary-debug='canary --remote-debugging-port=9222 &'
fi

# get vars that you don't want in git.
source ~/.zshrc.local

# shell startup profiling - see ~/.dotfiles/README.md or `zprofile-startup`
if [[ -n "$ZSH_PROFILE_STARTUP" ]]; then
  zprof
fi

if [[ -n "$ZSH_XTRACE_STARTUP" ]]; then
  unsetopt xtrace
  exec 2>&3 3>&-
  echo "zsh xtrace written to ${ZSH_XTRACE_LOG:-/tmp/zsh_startup_trace.$$}" >&2
fi
