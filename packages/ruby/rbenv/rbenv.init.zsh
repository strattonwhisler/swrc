export RBENV_DIR="$HOME/.rbenv"

assert_directory "$RBENV_DIR" 'rbenv' || return 1

(( ! $+commands[rbenv] )) && export PATH="$RBENV_DIR/bin:$PATH"

eval "$(rbenv init -)"
[[ -s "$RBENV_DIR/completions/rbenv.zsh" ]] && source "$RBENV_DIR/completions/rbenv.zsh"
