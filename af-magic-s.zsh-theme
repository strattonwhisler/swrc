# af-magic-s.zsh-theme
# My custom modification of af-magic
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

## main
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

eval prompt_reset="%{$reset_color%}"

## Primary prompt
PROMPT='$swrc_blue%~$prompt_reset${vcs_info_msg_0_} %(!.%F{red}#.${swrc_purple}») %f'

## Right prompt
# eval who='%n@%m'
eval who='%n@'

if type "virtualenv_prompt_info" > /dev/null
then
  RPROMPT='$(virtualenv_prompt_info)$swrc_lgray$who%f'
else
  RPROMPT='$swrc_gray$who%f'
fi

## Return code
print_return_code() {
  print -u2 -P "%(?..%F{red}↵ %?$prompt_reset\n)$swrc_gray${(r:$COLUMNS::─:)}%f"
}
precmd_functions+=(print_return_code)

## VCS
autoload -Uz vcs_info
precmd_functions+=(vcs_info vsc_git_ahead_behind)

zstyle ':vcs_info:*' check-for-changes true

eval bullet='%{∙%G%}'
eval up_arrow='%{↑%G%}'
eval down_arrow='%{↓%G%}'

eval vcs_prefix="$swrc_lblue\("
eval vcs_suffix="$swrc_lblue\)$prompt_reset"
eval vcs_separator="$swrc_gray:$prompt_reset"
eval vcs_backend="$swrc_gray%s"
eval vcs_branch="$swrc_green%b"
eval vcs_action="$swrc_lblue\[$swrc_green%a$swrc_lblue\]$prompt_reset"
eval vcs_staged_changes="$swrc_yellow$bullet"
eval vcs_unstaged_changes="$swrc_orange$bullet"
eval vcs_changed="$swrc_orange$bullet"
eval vcs_conficts="$swrc_red$bullet"
eval vcs_ahead="$swrc_orange$up_arrow"
eval vcs_behind="$swrc_red$down_arrow"

zstyle ':vcs_info:*' stagedstr "$vcs_staged_changes"
zstyle ':vcs_info:*' unstagedstr "$vcs_unstaged_changes"
zstyle ':vcs_info:*' aheadstr "$vcs_ahead"
zstyle ':vcs_info:*' behindstr "$vcs_behind"

zstyle ':vcs_info:git*' formats "$vcs_prefix$vcs_branch%m%c%u%A%B$vcs_suffix"
zstyle ':vcs_info:git*' actionformats "$vcs_prefix$vcs_branch%m%u%c%A%B$vcs_suffix$vcs_action"

function vsc_git_ahead_behind() {
  [[ $(git rev-parse --is-inside-git-dir 2> /dev/null) ]] || return 0

  local git_ahead_count git_behind_count tmp
  # local -i maxexports
  local -i i
  local -A hook_com
  
  hook_com=(
    ahead  ""
	behind ""
  )
    
  local local_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  
  if [[ -n "$local_branch" ]] && [[ "$local_branch" != "HEAD" ]]; then
    local upstream_branch=$(git rev-parse --abbrev-ref "@{upstream}" 2> /dev/null)
    [[ "$upstream_branch" = "@{upstream}" ]] && upstream_branch=''
    [[ -z "$upstream_branch" ]] && upstream_branch="origin/$local_branch"
  
    if [[ -n "$upstream_branch" ]]; then
      git_ahead_count=$(git rev-list --count ${upstream_branch}..${local_branch} 2> /dev/null)
      git_behind_count=$(git rev-list --count ${local_branch}..${upstream_branch} 2> /dev/null)
	  
      if [[ "$git_ahead_count" -gt 0 ]]; then
        zstyle -a ":vcs_info:git:${usercontext}:${rrn}" aheadstr tmp
		hook_com[ahead]=${tmp}
      fi
		  
      if [[ "$git_behind_count" -gt 0 ]]; then
        zstyle -a ":vcs_info:git:${usercontext}:${rrn}" behindstr tmp
		hook_com[behind]=${tmp}
      fi
    fi
  fi
  
  # zstyle -s ":vcs_info:${vcs}:${usercontext}:${rrn}" "max-exports" maxexports
  # for i in {0..$((maxexports - 1))} ; do
  for i in {0..0}; do
    zformat -f msg ${(P)${:-vcs_info_msg_${i}_}} \
        A:${hook_com[ahead]}   \
        B:${hook_com[behind]}
	typeset -g vcs_info_msg_${i}_=${msg}
  done
}
