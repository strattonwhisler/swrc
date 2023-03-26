export PYENV_ROOT="$HOME/.pyenv"

assert_directory "$PYENV_ROOT" 'pyenv' || return 1

(( ! $+commands[pyenv] )) && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
