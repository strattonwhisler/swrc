export PNPM_HOME="$HOME/.local/share/pnpm"

if [[ ! -d "$PNPM_HOME" ]]; then print -P "$fg[red]${1} is not installed!$reset_color"; return 1; fi

export PATH="$PNPM_HOME:$PATH"
