#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Fix issue where path_helper in El Cap runs later than it used to.
export PATH=$PATH:/usr/local/bin

# environment variables.
# X11
# export PATH=$PATH:/opt/X11/bin
# JVM
if [[ "$OSTYPE" == darwin* ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
  export SCALA_HOME=/usr/local/Cellar/scala/libexec
  export GROOVY_HOME=/usr/local/Cellar/groovy/libexec
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
  export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh
else
  export JAVA_HOME=/usr/lib/jvm/java-8-oracle
fi

# local tools
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export MANPATH=:/usr/local/opt/erlang/man
export GOPATH=$HOME/workspace/go:$HOME/workspace/go/work
export PATH=$PATH:$HOME/workspace/go/bin

#Navis Related
export PATH=$PATH:$HOME/projects/team/scripts

# Perl things
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}";
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"$HOME/perl5\"";
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";

# .Net and mono
export MONO_GAC_PREFIX="/usr/local";

# Postgres
export PGDATA="/usr/local/var/postgres";

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true;
