[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

export JAVA_HOME="$(jabba which "$(jabba current)")"
export PATH=$PATH:$JAVA_HOME/bin
