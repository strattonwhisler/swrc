# A hash array for packages
typeset -gx -a swpkgs
swpkgs=()

# Root directory for swpkg
typeset -gx SWPKG_ROOT="$(dirname $0)"

# Load basic functions such as an __swpkg::source function
source "$SWPKG_ROOT/base/init.zsh"
# Load autoloader
source "$SWPKG_ROOT/autoload/init.zsh"

__swpkg::source "command/*"
