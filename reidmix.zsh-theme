prompt_status() {
  RETVAL=$?
  local my_status="%{$fg_bold[magenta]%}❯"                       # default
  [[ $RETVAL -ne 0 ]] && my_status="%{%F{yellow}%}✖"             # error
  [[ $(jobs -l | wc -l) -gt 0 ]] && my_status="%{%F{yellow}%}⚙"  # jobs
  echo $my_status
}

prompt_context() {
  local user=`whoami`
  local host=`echo $HOST:l| cut -d\. -f1`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo "%{%F{yellow}%} $user@$host "
  fi
}

PROMPT='$(prompt_context)%{$fg_bold[magenta]%}$(prompt_status) %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[magenta]%}❯ %{$reset_color%}%{%F{red}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{yellow}%} ⚡ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{magenta}%} "
