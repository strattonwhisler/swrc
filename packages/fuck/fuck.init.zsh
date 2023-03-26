if (( ! $+commands[thefuck] )); then print -P $fg[red]'thefuck is not installed!'$reset_color; return 1; fi

eval $(thefuck --alias)
