if [[ "1" == $ZRCDEBUG ]]; then echo -n "Loading .zshenv "; fi

# paths
ZDOTDIR="$HOME/.zsh"

# shell env
watch=notme
fpath=($fpath $ZDOTDIR/.complete )
fignore=(.DS_STORE .bak .bin .gz)
cdpath=(. $cdpath)

# shell parameters
DIRSTACKSIZE=10
WORDCHARS="*?_-.[]~=&;!#$%^(){}<>" # default *?_-.[]~=/&;!#$%^(){}<>

# prompts
PROMPT="%m:%~ %#%2(L:[%L]:) "
RPROMPT="%(?::%{$fg[black]$bg[red]%}[%?]%{$reset_color%})"
WATCHFMT="%B%n%b%(a: has %a:) %(M:from %B%M%b :%Blocalhost%b )(tty%l)"

# history
HISTSIZE=1000
HISTFILE=$ZDOTDIR/.history
SAVEHIST=1000

