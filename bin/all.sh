# based on
# https://github.com/MatthewMueller/dots
# http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac

bindir="$HOME/.files/bin"

steps=(
	brew
	packages
	setup-zsh
  setup-git
  heroku
)

for step in "${steps[@]}"; do
	echo "\033[1;32mRunning ${step}...\033[0m"
	sh "$bindir/${step}.sh"
done

echo "\033[1;32mRunning link...\033[0m"
zsh "$bindir/link.sh"

