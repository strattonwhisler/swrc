export PNPM_HOME="$HOME/.local/share/pnpm"

assert_directory "$PNPM_HOME" 'pnpm' || return 1

export PATH="$PNPM_HOME:$PATH"
