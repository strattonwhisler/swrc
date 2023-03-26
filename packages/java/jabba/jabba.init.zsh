export JABBA_DIR="$HOME/.jabba"

if [[ ! -d "$JABBA_DIR" ]]; then print -P $fg[red]'jabba is not installed!'$reset_color; return 1; fi

[[ -s "$JABBA_DIR/jabba.sh" ]] && source "$JABBA_DIR/jabba.sh"
