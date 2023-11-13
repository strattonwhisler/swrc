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

# Changes
alias grss='git restore --staged'
alias grs='git restore'

# Commits
alias gc='git commit'
alias gc!='git commit --amend'
alias grhl="git reset HEAD^"
alias gr!='git reset'

# Pre-formatted Commits
alias gctt="git commit -m $(cat $package_dir/temp.commit.txt)"
alias gctd="git commit -t $package_dir/drop.commit.txt"
alias gctr="git commit -t $package_dir/reword.commit.txt"
alias gcts="git commit -t $package_dir/squash.commit.txt"
alias gctf="git commit -t $package_dir/fixup.commit.txt"

# Stashing
alias gsta='git stash'
alias gstaa='git stash apply'
alias gstap='git stash pop'

# Pushing
alias gp='git push'
alias gpup='git push --set-upstream $SWRC_GIT_UPSTREAM $SWRC_GIT_BRANCH_WORKING'
alias gpfl="git push --force-with-lease"

# Branching
alias gco='git checkout'
alias gbd='git branch -d'
alias gbh='git branch -f $SWRC_GIT_BRANCH_WORKING HEAD'

alias gsc='git switch -c'
alias gswc='git_switch_new_branch ""'

alias gsw='git switch $SWRC_GIT_BRANCH_WORKING'
alias gss='git switch $SWRC_GIT_BRANCH_BASE'
alias gsr='git switch $SWRC_GIT_BRANCH_RELEASE'
alias gsd='git switch $SWRC_GIT_BRANCH_DEVELOP'

# Logs
alias gloga='git log --oneline --decorate --graph --all'
alias glg='git log'
alias grlg='git reflog'

# Rebasing
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
