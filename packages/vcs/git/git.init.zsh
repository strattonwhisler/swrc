assert_command 'git' || return 1

git config --global include.path "$package_dir/.global.gitconfig"
git config --global core.excludesfile "$package_dir/.global.gitignore"

