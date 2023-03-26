export SDKMAN_DIR="$HOME/.sdkman"

assert_directory "$SDKMAN_DIR" 'sdkman' || return 1

[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
