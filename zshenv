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
export PATH=$PATH:/Users/Mark/bin
export PATH=$PATH:/Users/Mark/.cargo/bin
export RUST_SRC_PATH=/usr/local/src/rust/src
export MANPATH=:/usr/local/opt/erlang/man
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

#Navis Related
export PATH=$PATH:/Users/Mark/projects/team/scripts

# Perl things
export PATH="/Users/Mark/perl5/bin${PATH:+:${PATH}}";
export PERL5LIB="/Users/Mark/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
export PERL_LOCAL_LIB_ROOT="/Users/Mark/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"/Users/Mark/perl5\"";
export PERL_MM_OPT="INSTALL_BASE=/Users/Mark/perl5";

# .Net and mono
export MONO_GAC_PREFIX="/usr/local"
