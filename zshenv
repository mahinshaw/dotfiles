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

# environment variables.
# X11
# export PATH=$PATH:/opt/X11/bin
# JVM
if [[ "$OSTYPE" == darwin* ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
  export SCALA_HOME=/usr/local/Cellar/scala/libexec
  export GROOVY_HOME=/usr/local/Cellar/groovy/libexec
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
  NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
else 
  export JAVA_HOME=/usr/lib/jvm/java-8-oracle
fi
