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

  # <package> base/*.zsh
  if [[ -d "$package_dir/base" ]]
  then
    local -aU load_files

    load_files+=( "$package_dir/base"/*.zsh(N-.) )

    if (( $#load_files == 0 )); then
      return 1
    fi

    fpath=(
      "${load_files[@]:h}"
      "${fpath[@]}"
    )

    for load_file in "${load_files[@]}"
    do
      if (( $+functions[$load_file] )); then
        # already defined
        continue
      fi

      autoload -Uz "${load_file:t}" &&
        eval "${load_file:t}"       &&
        unfunction "${load_file:t}"
    done
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
