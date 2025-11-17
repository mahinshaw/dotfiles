# -*- mode: shell-script;-*-
#
# Defines environment variables.
#
# Authors:
#   Mark Hinshaw <mahinshaw@gmail.com>
#

# uncomment this and last line for profiling
# zmodload zsh/zprof

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

# JVM
if [[ "$OSTYPE" == darwin* ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
    # export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home
    export SCALA_HOME=/usr/local/Cellar/scala/libexec
    export GROOVY_HOME=/usr/local/Cellar/groovy/libexec
    export JAVA_8=/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home
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

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

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
AZURE_DEV_COLLECT_TELEMETRY=no

#postgresql
# export PATH="/opt/homebrew/opt/postgresql@16/libexec/bin:$PATH"

# get vars that you don't want in git.
source ~/.zshenv.local

# zprof

# claude - https://code.claude.com/docs/en/setup
export DISABLE_AUTOUPDATER=1
