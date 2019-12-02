alias gpup='git push --set-upstream origin $(current_branch)'
alias gpfl="git push --force-with-lease"
alias gbd="git branch -d"
alias grhl="git reset HEAD^"

# Pre-formatted Commits
#alias gctt="git commit -t $plugin_dir/temp.commit.txt"
alias gctt="git commit -m $(cat $plugin_dir/temp.commit.txt)"
alias gctd="git commit -t $plugin_dir/drop.commit.txt"
alias gctr="git commit -t $plugin_dir/reword.commit.txt"
alias gcts="git commit -t $plugin_dir/squash.commit.txt"
alias gctf="git commit -t $plugin_dir/fixup.commit.txt"

# Utilities
alias gusr="ruby $plugin_dir/git_user.rb"