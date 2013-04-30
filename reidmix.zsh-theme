prompt_status() {
  RETVAL=$?
  local my_status="%{$fg_bold[magenta]%}❯"                             # default
  [[ $RETVAL -ne 0 ]] && my_status="%{$fg_bold[yellow]%}✖"             # error
  [[ $(jobs -l | wc -l) -gt 0 ]] && my_status="%{$fg_bold[yellow]%}⚙"  # jobs
  echo $my_status
}

prompt_context() {
  local user=`whoami`
  local host=`echo $HOST:l| cut -d\. -f1`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo "%{$fg_bold[yellow]%} $user@$host "
  fi
}

PROMPT='$(prompt_context)%{$fg_bold[magenta]%}$(prompt_status) %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}❯ %{$reset_color%}%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%} ⚡ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[magenta]%} %{$reset_color%}"
