if [[ "1" == $ZRCDEBUG ]]; then echo -n "Loading .zshenv "; fi

# paths
ZDOTDIR="$HOME/.zsh"

# shell variables
FIGNORE=".bak:.bin:.gz:~"
DIRSTACKSIZE=10

# prompts
PROMPT="%m:%~ %#%2(L:[%L]:) "
RPROMPT="%(?::%{$fg[black]$bg[red]%}[%?]%{$reset_color%})"
WATCHFMT="%B%n%b%(a: has %a:) %(M:from %B%M%b :%Blocalhost%b )(tty%l)"

# history
HISTFILE=$ZDOTDIR/.history
SAVEHIST=1000
