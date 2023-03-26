if (( ! $+commands[git] )); then print -P $fg[red]'git is not installed!'$reset_color; return 1; fi

git config --global include.path "$package_dir/.global.gitconfig"
git config --global core.excludesfile "$package_dir/.global.gitignore"

