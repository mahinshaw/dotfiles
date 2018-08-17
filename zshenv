# -*- mode: shell-script;-*-
#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Fix issue where path_helper in El Cap runs later than it used to.
export PATH=$PATH:/usr/local/bin

# completions in home dir
fpath=("$HOME/.zfunc" $fpath)

# environment variables.
# X11
# export PATH=$PATH:/opt/X11/bin
# JVM
if [[ "$OSTYPE" == darwin* ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
    export SCALA_HOME=/usr/local/Cellar/scala/libexec
    export GROOVY_HOME=/usr/local/Cellar/groovy/libexec
    export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
else
    export JAVA_HOME=/usr/lib/jvm/java-8-oracle
fi

# local tools
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export MANPATH=:/usr/local/opt/erlang/man
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$HOME/workspace/go/bin

# Perl things
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}";
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"$HOME/perl5\"";
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";

export PATH="$HOME/.cargo/bin:$PATH"

# Confluent tools
export CONFLUENT_HOME="$HOME/tools/confluent-5.0.0"
export CONFLUENT_CURRENT="$CONFLUENT_HOME/var"
export PATH="$CONFLUENT_HOME/bin:$PATH"

# .Net and mono
export MONO_GAC_PREFIX="/usr/local";

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true;

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--inline-info'

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

# nvm use >> /dev/null
