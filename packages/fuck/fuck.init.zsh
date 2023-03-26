assert_command 'thefuck' || return 1

eval $(thefuck --alias)
