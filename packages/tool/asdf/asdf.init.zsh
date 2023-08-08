export ASDF_DIR="$HOME/.asdf"

assert_directory "$ASDF_DIR" 'asdf' || return 1

source "$ASDF_DIR/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

