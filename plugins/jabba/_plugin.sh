[ -s "~/.jabba/jabba.sh" ] && source "~/.jabba/jabba.sh"

export JAVA_HOME="$(jabba which "$(jabba current)")"
export PATH=$PATH:$JAVA_HOME/bin
