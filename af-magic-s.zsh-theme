# af-magic-s.zsh-theme
# My custom modification of af-magic
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

eval reset='%{$reset_color%}'

# main
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..$swrc_red%? ↵$reset)"

# local git_prompt="git_super_status"
local git_prompt="git_prompt_info"

# color vars
eval swrc_gray='$FG[240]'
eval swrc_lgray='$FG[242]'
eval swrc_red='$FG[215]'
eval swrc_green='$FG[078]'
eval swrc_blue='$FG[032]'
eval swrc_lblue='$FG[075]'
eval swrc_purple='$FG[063]'
eval swrc_orange='$FG[208]' #214
eval swrc_yellow='$FG[220]'

# primary prompt
PROMPT='$swrc_gray────────────────────────────────────────────────────────────$reset
$swrc_blue%~\
$($git_prompt) \
$swrc_purple%(!.#.»)$reset '
PROMPT2='$swrc_purple\ $reset'
RPS1='${return_code}'

# right prompt
eval who='%n@%m'

if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)$swrc_lgray$who$reset'
else
	RPROMPT='$swrc_gray$who$reset%'
fi

# git settings
eval swrc_bullet='%{∙%G%}'

# ZSH_THEME_GIT_PROMPT_PREFIX="$swrc_lblue("
# ZSH_THEME_GIT_PROMPT_SUFFIX="$swrc_lblue)$reset"
# ZSH_THEME_GIT_PROMPT_BRANCH="$swrc_green"
# ZSH_THEME_GIT_PROMPT_SEPARATOR=""
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_STAGED="$swrc_lblue$swrc_bullet"
# ZSH_THEME_GIT_PROMPT_CHANGED="$swrc_orange$swrc_bullet"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="$swrc_yellow$swrc_bullet"
# ZSH_THEME_GIT_PROMPT_CONFLICTS="$swrc_red$swrc_bullet"
# ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
# ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"

ZSH_THEME_GIT_PROMPT_PREFIX="$swrc_lblue($swrc_green"
ZSH_THEME_GIT_PROMPT_SUFFIX="$swrc_lblue)$reset"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$swrc_orange$swrc_bullet"
