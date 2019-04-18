# af-magic-s.zsh-theme
# My custom modification of af-magic
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

eval reset='%{$reset_color%}'

# main
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..$my_red%? ↵$reset)"

# local git_prompt="git_super_status"
local git_prompt="git_prompt_info"

# color vars
eval my_gray='$FG[240]'
eval my_lgray='$FG[242]'
eval my_red='$FG[215]'
eval my_green='$FG[078]'
eval my_blue='$FG[032]'
eval my_lblue='$FG[075]'
eval my_purple='$FG[063]'
eval my_orange='$FG[208]' #214
eval my_yellow='$FG[220]'

# primary prompt
PROMPT='$my_gray────────────────────────────────────────────────────────────$reset
$my_blue%~\
$($git_prompt) \
$my_purple%(!.#.»)$reset '
PROMPT2='$my_purple\ $reset'
RPS1='${return_code}'

# right prompt
eval who='%n@%m'

if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)$my_lgray$who$reset'
else
	RPROMPT='$my_gray$who$reset%'
fi

# git settings
eval my_bullet='%{∙%G%}'

# ZSH_THEME_GIT_PROMPT_PREFIX="$my_lblue("
# ZSH_THEME_GIT_PROMPT_SUFFIX="$my_lblue)$reset"
# ZSH_THEME_GIT_PROMPT_BRANCH="$my_green"
# ZSH_THEME_GIT_PROMPT_SEPARATOR=""
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_STAGED="$my_lblue$my_bullet"
# ZSH_THEME_GIT_PROMPT_CHANGED="$my_orange$my_bullet"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="$my_yellow$my_bullet"
# ZSH_THEME_GIT_PROMPT_CONFLICTS="$my_red$my_bullet"
# ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
# ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"

ZSH_THEME_GIT_PROMPT_PREFIX="$my_lblue($my_green"
ZSH_THEME_GIT_PROMPT_SUFFIX="$my_lblue)$reset"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange$my_bullet"
