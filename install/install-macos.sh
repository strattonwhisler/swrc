# MacOS Settings
defaults write com.apple.dock workspaces-auto-swoosh -bool NO 

# Utils
brew install bat
brew install colordiff
brew install httpie
brew install lsd
brew install neovim
brew install ripgrep
brew install thefuck
brew install tldr

# Virtualization
brew install qemu

# Networking
brew install nginx

# Databases
brew install redis
brew install mysql
brew install postgresql

# Ruby
brew install rbenv

# Node
brew install yarn
export NVM_DIR="$HOME/.nvm" && (                                                               stratton@MacBook-Pro
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

# Java 
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh

