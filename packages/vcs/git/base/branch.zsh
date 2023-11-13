function __git::branch::create_and_track () {
  export SWRC_GIT_BRANCH_WORKING=$1
  git switch -c $1
}