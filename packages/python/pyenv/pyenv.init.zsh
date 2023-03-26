export PYENV_ROOT="$HOME/.pyenv"

if [[ ! -d "$PYENV_ROOT" ]]; then print -P $fg[red]'pyenv is not installed!'$reset_color; return 1; fi

(( ! $+commands[pyenv] )) && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
