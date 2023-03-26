__swpkg::command::load () {
  local swpkg_paths=("${SWPKG_PATH[@]}")

  for swpkg_path in $swpkg_paths; do
    __swpkg::load_package "$1"
  done

  swpkgs+=("$1")
}

__swpkg::load_package () {
  local package_name=${1:t}
  package_dir="$swpkg_path/$1"

  # package/
  #   autoload/
  #   <package>.init.zsh
  #   <package>.plugin.zsh

  # <package>.init.zsh
  if [[ -a "$package_dir/$package_name.init.zsh" ]]
  then
    source "$package_dir/$package_name.init.zsh" || return 1
  fi

  # <package> autoloads
  if [[ -d "$package_dir/autoload" ]]
  then
    fpath=("$package_dir/autoload" $fpath)
    autoload "$package_dir/autoload/"* || return 1
  fi

  # <package>.plugin.zsh
  if [[ -a "$package_dir/$package_name.plugin.zsh" ]]
  then
    source "$package_dir/$package_name.plugin.zsh" || return 1
  fi

  unset package_dir
}
