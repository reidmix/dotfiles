autoload compinit && compinit
autoload colors && colors

watch=all

[[ -f $ZDOTDIR/.options ]] && . $ZDOTDIR/.options
[[ -f $ZDOTDIR/.exports ]] && . $ZDOTDIR/.exports
[[ -f $ZDOTDIR/.aliases ]] && . $ZDOTDIR/.aliases
