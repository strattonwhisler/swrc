echo -n 'Loading SWRC ... '

swrc_dir="$(dirname $0)"

## Path
export PATH=$HOME/bin:$PATH

## Aliases
alias q="exit"
alias clr="clear"
alias rrc="source ~/.zshrc"

## Editor
export EDITOR='nvim'

## Theme
source "$swrc_dir/af-magic-s.zsh-theme"

## Plugins
swrc_plugins=(
    diff
    git
    nvm
    xcode
    #jabba
    rbenv
)

loadPlugins() {
    for plugin ($swrc_plugins); do
        if [ -f "$swrc_dir/plugins/$plugin/_plugin.sh" ]; then
            plugin_dir="$swrc_dir/plugins/$plugin"
            source "$swrc_dir/plugins/$plugin/_plugin.sh"
        else
            echo "Plugin $plugin not found"
        fi
    done
}

loadPlugins

#TODO: Move android
## Android
export ANDROID_SDK_ROOT=/Users/swhisler/.android/my-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools

echo 'Done'
