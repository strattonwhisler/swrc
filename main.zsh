# SWRC
print 'Loading SWRC'

typeset -gx SWRC_DIR="$(dirname $0)"

fpath=("$SWRC_DIR/autoload" $fpath)
autoload "$SWRC_DIR/autoload/"*

# OhMyZsh
ZSH_THEME=""

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

## Theme
source "$SWRC_DIR/theme.zsh"
source "$SWRC_DIR/af-magic-s.zsh-theme"

## Path
export PATH=$HOME/bin:$PATH

## Aliases
alias q="exit"
alias clr="clear"
alias rrc="source ~/.zshrc"
alias desu="sudo !!"

## Editor
export EDITOR='nvim'
alias view="nvim -R"

## SWPKG
source "$SWRC_DIR/swpkg/init.zsh"

export SWPKG_PATH="$SWRC_DIR/packages"

print -P "Using packages $swrc_gray($swrc_lgray${swrc_packages[@]}$swrc_gray)$reset_color"

for _package in "${swrc_packages[@]}"; do
  swpkg load "$_package"
done

print -P $swrc_green'Done'
