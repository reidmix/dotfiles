if [[ "1" == $ZRCDEBUG ]]; then echo -n ".zshrc "; fi

autoload compinit && compinit
autoload colors && colors

if [[ -f $ZDOTDIR/.ohmyzsh ]]; then . $ZDOTDIR/.ohmyzsh; fi
if [[ -f $ZDOTDIR/.options ]]; then . $ZDOTDIR/.options; fi
if [[ -f $ZDOTDIR/.exports ]]; then . $ZDOTDIR/.exports; fi
if [[ -f $ZDOTDIR/.aliases ]]; then . $ZDOTDIR/.aliases; fi
if [[ -f $ZDOTDIR/.functns ]]; then . $ZDOTDIR/.functns; fi
if [[ -f $ZDOTDIR/.localrc ]]; then . $ZDOTDIR/.localrc; fi

if [[ "1" == $ZRCDEBUG ]]; then echo ; fi
