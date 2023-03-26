export SDKMAN_DIR="$HOME/.sdkman"

if [[ ! -d "$SDKMAN_DIR" ]]; then print -P $fg[red]'sdkman is not installed!'$reset_color; return 1; fi

[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
