export RBENV_DIR="$HOME/.rbenv"

if [[ ! -d "$RBENV_DIR" ]]; then print -P $fg[red]'rbenv is not installed!'$reset_color; return 1; fi

(( ! $+commands[rbenv] )) && export PATH="$RBENV_DIR/bin:$PATH"

eval "$(rbenv init -)"
[[ -s "$RBENV_DIR/completions/rbenv.zsh" ]] && source "$RBENV_DIR/completions/rbenv.zsh"
