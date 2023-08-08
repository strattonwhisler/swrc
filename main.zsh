# SWRC

## Preinit
setopt prompt_subst

typeset -gx SWRC_DIR="$(dirname $0)"

source "$SWRC_DIR/theme.zsh"

print -P "Loading %F{026}S%F{032}W%F{063}R%F{056}C${swrc_gray}...%f"
#---

## Autoload
fpath=("$SWRC_DIR/autoload" $fpath)
autoload "$SWRC_DIR/autoload/"*

## Theme
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

print -P "Using packages $swrc_gray($swrc_lgray${swrc_packages[@]}$swrc_gray)%f"

for _package in "${swrc_packages[@]}"; do
  swpkg load "$_package"
done

autoload -Uz compinit && compinit

#---
print -P "${swrc_green}Done%f"
