export JABBA_DIR="$HOME/.jabba"

assert_directory "$JABBA_DIR" 'jabba' || return 1

[[ -s "$JABBA_DIR/jabba.sh" ]] && source "$JABBA_DIR/jabba.sh"
