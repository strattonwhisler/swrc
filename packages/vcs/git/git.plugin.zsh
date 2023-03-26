# Remotes
alias gcl='git clone'
alias gclsm='git clone --recurse-submodules'
alias gl='git pull'
alias gf='git fetch'

# General
alias gst='git status'

# Staging
alias ga='git add'
alias gaa='git add --all'

# Commits
alias gc='git commit'
alias gc!='git commit --amend'
alias grhl="git reset HEAD^"

# Pre-formatted Commits
alias gctt="git commit -m $(cat $package_dir/temp.commit.txt)"
alias gctd="git commit -t $package_dir/drop.commit.txt"
alias gctr="git commit -t $package_dir/reword.commit.txt"
alias gcts="git commit -t $package_dir/squash.commit.txt"
alias gctf="git commit -t $package_dir/fixup.commit.txt"

# Pushing
alias gp='git push'
alias gpup='git push --set-upstream $SWRC_GIT_UPSTREAM $SWRC_GIT_BRANCH_WORKING'
alias gpfl="git push --force-with-lease"

# Branching
alias gco='git checkout'
alias gbd='git branch -d'
alias gbh='git branch -f $SWRC_GIT_BRANCH_WORKING HEAD'

alias gcb='git checkout -b'
alias gcb!='git_checkout_new_branch ""'

alias gcw='git checkout $SWRC_GIT_BRANCH_WORKING'
alias gcs='git checkout $SWRC_GIT_BRANCH_BASE'
alias gcr='git checkout $SWRC_GIT_BRANCH_RELEASE'
alias gcd='git checkout $SWRC_GIT_BRANCH_DEVELOP'

# Logs
alias gloga='git log --oneline --decorate --graph --all'
alias glg='git log'
alias grlg='git reflog'

# Rebasing
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

# Utilities
function git_checkout_new_branch () {
  export SWRC_GIT_BRANCH_WORKING=$1
  git checkout -b $1
}
