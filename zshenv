# -*- mode: shell-script;-*-
#
# Defines environment variables.
#
# Authors:
#   Mark Hinshaw <mahinshaw@gmail.com>
#

# shell startup profiling - see ~/.dotfiles/README.md or `zprofile-startup`
if [[ -n "$ZSH_PROFILE_STARTUP" ]]; then
  zmodload zsh/zprof
fi

if [[ -n "$ZSH_XTRACE_STARTUP" ]]; then
  zmodload zsh/datetime
  setopt prompt_subst
  PS4=$'+$EPOCHREALTIME %N:%i> '
  exec 3>&2 2>"${ZSH_XTRACE_LOG:-/tmp/zsh_startup_trace.$$}"
  setopt xtrace
fi

# Cache generated init/completion scripts and one-off command output so we
# don't fork a slow binary (or pay this machine's EDR per-exec scan tax) on
# every new shell. Regenerates when the cache is missing, older than
# max_age seconds, or the source binary is newer. Defined here (zshenv) so
# both zshenv and zshrc can use it.
_zsh_cache_file() {
  emulate -L zsh
  zmodload zsh/datetime zsh/stat 2>/dev/null

  local name=$1 max_age=$2 ext=$3
  shift 3
  (( $# )) || return 1

  local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh-init"
  local cache_file="$cache_dir/$name.$ext"
  local mtime=0 bin_mtime=0
  local bin_path="${commands[$1]}"

  [[ -d "$cache_dir" ]] || command mkdir -p "$cache_dir"
  [[ -s "$cache_file" ]] && zstat -A mtime +mtime "$cache_file" 2>/dev/null
  [[ -n "$bin_path" ]] && zstat -A bin_mtime +mtime "$bin_path" 2>/dev/null

  if (( mtime == 0 || bin_mtime > mtime || EPOCHSECONDS - mtime > max_age )); then
    "$@" >| "$cache_file" 2>/dev/null
  fi

  [[ -s "$cache_file" ]] || return 1
  print -r -- "$cache_file"
}

# cache lifetime for generated init/completion scripts and values (7 days)
typeset -gi _ZSH_INIT_CACHE_AGE=604800

# source a cached init/completion script, regenerating it as needed
_zsh_cached_init() {
  local name=$1 max_age=$2
  shift 2
  local cache_file
  cache_file=$(_zsh_cache_file "$name" "$max_age" zsh "$@") || return 1
  source "$cache_file"
}

# print a cached command's stdout (e.g. for use in `$(...)`), regenerating as needed
_zsh_cached_value() {
  local name=$1 max_age=$2
  shift 2
  local cache_file
  cache_file=$(_zsh_cache_file "$name" "$max_age" val "$@") || return 1
  print -rn -- "$(<"$cache_file")"
}

ZDOTDIR=$HOME
export ZDOTDIR

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Fix issue where path_helper in El Cap runs later than it used to.
# moved homewbrew to zprofile.
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH:/usr/local/bin

# completions in home dir
fpath=("$HOME/.zfunc" $fpath)

# homebrew compeltions
fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)

# environment variables.
export XDG_CONFIG_HOME="$HOME/.config"

#Homebrew configs
export HOMEBREW_BUNDLE_FILE="$HOME/.dotfiles/Brewfile"
export HOMEBREW_NO_ANALYTICS=1

# JVM
if [[ "$OSTYPE" == darwin* ]]; then
    export JAVA_HOME=$(_zsh_cached_value java-home $_ZSH_INIT_CACHE_AGE /usr/libexec/java_home)
else
    export JAVA_HOME=/usr/lib/jvm/java-8-oracle
fi

# local tools
# fails as it's not yet on the path?
# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export GOPATH="$HOME/workspace/go"

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/workspace/go/bin:$PATH"

# build related
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export C_INCLUDE_PATH=/usr/local/include

# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs  --hidden'
export FZF_DEFAULT_OPTS='--inline-info'

#zoxide
export _ZO_DATA_DIR="$HOME/.local/share"

# mojo lang
export MODULAR_HOME="$HOME/.modular"
export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

# export UV_MANAGED_PYTHON=true

#dotnet
export PATH="$HOME/.dotnet/tools:$PATH"

# azure dev cli
# no thanks on telemetry
export AZURE_DEV_COLLECT_TELEMETRY=no

# Azure cli shouldn't collect my data.
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT='true'

#postgresql
# export PATH="/opt/homebrew/opt/postgresql@16/libexec/bin:$PATH"

# get vars that you don't want in git.
source ~/.zshenv.local

# zprof

# claude - https://code.claude.com/docs/en/setup
export DISABLE_AUTOUPDATER=1
export CLAUDE_CONFIG_DIR="$HOME/.claude"
