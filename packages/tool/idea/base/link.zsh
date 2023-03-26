function __idea::link () {
  local idea_prefix

  case "$1" in
    'studio')   idea_prefix='as' ;;
    'appcode')  idea_prefix='ac' ;;
    'aqua')     idea_prefix='qa' ;;
    'clion')    idea_prefix='cl' ;;
    'datagrip') idea_prefix='dg' ;;
    'goland')   idea_prefix='go' ;;
    'idea')     idea_prefix='ij' ;;
    'phpstorm') idea_prefix='ps' ;;
    'pycharm')  idea_prefix='pc' ;;
    'rider')    idea_prefix='rd' ;;
    'rubymine') idea_prefix='rm' ;;
    'webstorm') idea_prefix='ws' ;;
    *)          print "Unknown jetbrains ide $1!"; return 1 ;;
  esac

  local idea_dir=".idea"
  local prefixed_dir=".$idea_prefix.idea"

  if [[ -a "$idea_dir" && ! -h "$idea_dir" ]]; then
    mv "$idea_dir" "$prefixed_dir"
  fi

  if [[ ! -a "$prefixed_dir" ]]; then
    mkdir "$prefixed_dir"
  fi

  ln -sfn "$prefixed_dir" "$idea_dir"
}
